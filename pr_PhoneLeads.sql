USE [RentPath]
GO
/****** Object:  StoredProcedure [fact].[pr_PhoneLeads]    Script Date: 9/22/2017 8:16:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [fact].[pr_PhoneLeads] AS 
/******************************************************************************************
* Name:	Fact.pr_PhoneLeads
*
* Desc: Fact.pr_PhoneLeads
*
* Test:	EXEC Fact.pr_PhoneLeads
*
* Hist:	01	03/01/2016	Shetal Gandhi	Ticket 22238 - Initial Version. - Pull New Records to APS using SSIS "APS_RentPathPhoneLeads". 
*										Pull data into Staging.CallSourceAG2 then rename it to override the original pull from SSIS,
*										then merge the data using the union new + old data.
* Hist: 02	04/21/2016	Colleen Rocks	APS Project review; removed international fuzzy logic changing callerlocation from AG since Rent didn't perpetuate it;
*										also rewrote the CTAS at the end to be an INSERT INTO due to data volume in Fact.PhoneLeads
* Hist: 03	04/26/2016	Colleen Rocks	APS Project review; instead of update and insert, faster to delete and re-insert
* Hist: 04	05/23/2016	Colleen Rocks	APS Project; added update stats execute statement
* Hist: 05	05/31/2016	Colleen Rocks	Added CRTAS of last 7 days of leads and last 2 days of phonelookup back to warehouse
* Hist: 06	06/24/2016	Don Wert		Updated references to DurationInSeconds to DurationInSec, CallSource to Source
* Hist: 07	11/28/2016	Colleen Rocks	SFDC Case 01340213; added analyticsresult and analyticsmethod
* Hist: 08	02/08/2017	Kimbo Morrow	SFDC Case 01397668; Changed phone lead look back to 8 days
* Hist: 08	02/13/2017	Kimbo Morrow	SFDC Case 01397668; Removed case statement where we changed call status of 4 and 5 to 1
******************************************************************************************/
--------------------------------
/*Delete leads from the last 8 days*/
--------------------------------
DELETE  FROM RentPath.Fact.PhoneLeads
WHERE   YMDID >= CAST(CONVERT(VARCHAR(8),GETDATE() - 8,112) AS INT)

--------------------------------
/*Insert records from staging tables
into fact.phoneleads*/
--------------------------------
INSERT  INTO RentPath.Fact.PhoneLeads
        SELECT DISTINCT
                'AG' AS Website
               ,CAST(cs.ymdid AS INT) AS YMDID
               ,cs.CallID
               ,CAST(CAST(CAST(cs.ListingID AS INT) AS VARCHAR(255)) AS INT) AS ListingID
               ,NULL AS RentPropertyID
               ,NULL AS PropertyID
               ,CASE WHEN ph.FirstName IS NULL
                          AND ph.LastName IS NULL THEN cs.CallerName
                     ELSE ISNULL(ph.FirstName,'') + ' ' + ISNULL(ph.LastName,'')
                END AS CallerName
               ,CASE WHEN ISNUMERIC(cs.ClientNbr) = 0 THEN 'blocked'
                     ELSE RIGHT(cs.ClientNbr,10)
                END AS CallerPhoneNumber
               ,RIGHT(cs.TollFreeNbr,10) AS PublishedPhoneNumber
               ,RIGHT(cs.PropNBR,10) AS TargetPhoneNumber
               ,cs.CallDate AS CallStartDateTime
               ,DATEADD(SECOND,cs.DurationInSec,cs.CallDate) AS CallEndDateTime
               ,CAST(cs.[DurationInSec] AS INT) AS DurationInSeconds
               ,replace(cs.CallStatus,'.000','') as CallStatus
               ,CAST(cs.[Source] AS VARCHAR(2)) AS CallSource
               ,CAST(REPLACE(REPLACE(REPLACE(cs.var2,'_',''),'RENT-','RENT_'),'"','') AS VARCHAR(25)) AS CallType
               ,CAST(REPLACE(cs.AudioURL,'"','') AS VARCHAR(500)) AS AudioURL
               ,CAST(cs.CallLoadHour AS TINYINT) AS CallLoadHour
               ,CAST(cs.CallLoadYMDID AS INT) AS CallLoadYMDID
               ,DATEPART(HOUR,DATEADD(SECOND,cs.DurationInSec,cs.CallDate)) AS CallEndHour
               ,CAST(CONVERT(VARCHAR(8),GETDATE(),112) AS INT) AS DateAddedYMDID
               ,cs.CallerLocation
               ,NULL AS CallerIP
               ,cs.CallerAddress
               ,cs.CallerCity
               ,cs.CallerState
               ,cs.CallerZip
               ,cs.LinkName
               ,cs.LinkID
               ,cs.Population
               ,cs.AvgTravelTimeToWork
               ,cs.MedianHouseholdIncome
               ,cs.PerCapitaIncome
               ,cs.MedianEarnings
               ,cs.MedianContractRent
               ,cs.MedianRentAsked
               ,cs.MedianGrossRent
               ,cs.MedianPriceAsked
               ,cs.MedianRealEstateTaxes
               ,cs.Households
               ,cs.OwnerHouseholds
               ,cs.RenterHouseholds
               ,cs.CallerURL
               ,cs.CallerURLTrimSilence AS CallerTrimSilenceURL
               ,cs.ReceiverURL
			   ,CAST(cs.AudioDuration AS INT) AS ActualCallDuration
			   ,CAST(cs.[CallerTrimBeginning] AS INT) AS CallerTrimBeginning
			   ,CAST(cs.CallerTrimAll AS INT) AS TotalCallerTrimTalkTime
               ,NULL AS EurekaID
               ,CAST(CASE WHEN cs.CallerTrimAll = 0
                          AND (CASE WHEN replace(cs.CallStatus,'.000','') = 1
                                         OR (replace(cs.CallStatus,'.000','') IN (4,5)
                                             AND cs.DurationInSec > 0) THEN 1
                                    ELSE replace(cs.CallStatus,'.000','')
                               END) = 1 THEN 1
                     ELSE 0
                END AS INT) AS IsAbandoned
               ,(cs.AudioDuration - cs.CallerTrimBeginning) AS TimePriorToCallerSpeaking
               ,cs.MP3URL
               ,'N/A' AS BusinessModel
			   ,cs.AnalyticsResult
			   ,cs.AnalyticsMethod
        FROM    RentPath.Staging.CallSourceAG AS cs
        LEFT JOIN RentPath.Dimension.PhoneLookup AS ph
                ON cs.ClientNbr = ph.PhoneNumber
        UNION
        SELECT  'Rent' AS Website
               ,CAST(crsl.ymdid AS INT) AS YMDID
               ,crsl.CallID
               ,crsl.ListingID
               ,crsl.RentPropertyID
               ,crsl.PropertyID
               ,CASE WHEN ph.FirstName IS NULL
                          AND ph.LastName IS NULL THEN crsl.CallerName
                     ELSE ISNULL(ph.FirstName,'') + ' ' + ISNULL(ph.LastName,'')
                END AS CallerName
               ,CASE WHEN ISNUMERIC(crsl.ClientNbr) = 0 THEN 'blocked'
                     ELSE RIGHT(crsl.ClientNbr,10)
                END AS CallerPhoneNumber
               ,RIGHT(crsl.TollFreeNbr,10) AS PublishedPhoneNumber
               ,RIGHT(crsl.PropNbr,10) AS TargetPhoneNumber
               ,crsl.CallDate AS CallStartDateTime
               ,DATEADD(SECOND,DurationInSec,CallDate) AS CallEndDateTime
               ,CAST(crsl.[DurationInSec] AS INT) AS DurationInSeconds
               ,replace(crsl.CallStatus,'.000','')
               ,CAST(crsl.[Source] AS VARCHAR(2)) AS CallSource
               ,CAST(REPLACE(REPLACE(crsl.var2,'_',''),'"','') AS VARCHAR(25)) AS CallType
               ,CAST(REPLACE(crsl.AudioURL,'"','') AS VARCHAR(500)) AS AudioURL
               ,CAST(crsl.CallLoadHour AS TINYINT) AS CallLoadHour
               ,CAST(crsl.CallLoadYMDID AS INT) AS CallLoadYMDID
               ,DATEPART(HOUR,DATEADD(SECOND,crsl.DurationInSec,crsl.CallDate)) AS CallEndHour
               ,CAST(CONVERT(VARCHAR(8),GETDATE(),112) AS INT) AS DateAddedYMDID
               ,crsl.CallerLocation
               ,NULL AS CallerIP
               ,crsl.CallerAddress
               ,crsl.CallerCity
               ,crsl.CallerState
               ,crsl.CallerZip
               ,crsl.LinkName
               ,crsl.LinkID
               ,crsl.Population
               ,crsl.AvgTravelTimeToWork
               ,crsl.MedianHouseholdIncome
               ,crsl.PerCapitaIncome
               ,crsl.MedianEarnings
               ,crsl.MedianContractRent
               ,crsl.MedianRentAsked
               ,crsl.MedianGrossRent
               ,crsl.MedianPriceAsked
               ,crsl.MedianRealEstateTaxes
               ,crsl.Households
               ,crsl.OwnerHouseholds
               ,crsl.RenterHouseholds
               ,crsl.CallerURL
               ,crsl.CallerURLTrimSilence AS CallerTrimSilenceURL
               ,crsl.ReceiverURL
               ,CAST(crsl.AudioDuration AS INT) AS ActualCallDuration
			   ,CAST(crsl.[CallerTrimBeginning] AS INT) AS CallerTrimBeginning
			   ,CAST(crsl.CallerTrimAll AS INT) AS TotalCallerTrimTalkTime
               ,NULL AS EurekaID
               ,CAST(CASE WHEN crsl.CallerTrimAll = 0
                          AND (CASE WHEN replace(crsl.CallStatus,'.000','') = 1
                                         OR (replace(crsl.CallStatus,'.000','') IN (4,5)
                                             AND crsl.DurationInSec > 0) THEN 1
                                    ELSE replace(crsl.CallStatus,'.000','')
                               END) = 1 THEN 1
                     ELSE 0
                END AS INT) AS IsAbandoned
               ,(crsl.AudioDuration - crsl.CallerTrimBeginning) AS TimePriorToCallerSpeaking
               ,crsl.MP3URL
               ,CAST(crsl.BusinessModel AS VARCHAR(15)) AS BusinessModel
			   ,crsl.AnalyticsResult
			   ,crsl.AnalyticsMethod
        FROM    Staging.CallSourceRent AS crsl
        LEFT JOIN RentPath.Dimension.PhoneLookup AS ph
                ON crsl.ClientNbr = ph.PhoneNumber

--------------------------------
/*Update statistics*/
--------------------------------
EXEC dbo.pr_UpdateStats 'Fact', 'PhoneLeads'

----------------------------------
--/*CRTAS last 2 days of phonelookup 
--back to WHSE*/
----------------------------------
--CREATE REMOTE TABLE Staging.dbo.dimphonelookup_last2
--AT( 'Data Source = 172.28.34.4, 1433; User ID = biteam; Password = will our data be accurate?;' )
--AS
--SELECT  PhoneNumber					COLLATE SQL_Latin1_General_CP1_CI_AS		AS PhoneNumber			
--       ,PhoneType					COLLATE SQL_Latin1_General_CP1_CI_AS		AS PhoneType					
--       ,DID							COLLATE SQL_Latin1_General_CP1_CI_AS		AS DID					
--       ,RecordType					COLLATE SQL_Latin1_General_CP1_CI_AS		AS RecordType				
--       ,FirstDate																	
--       ,LastDate																	
--       ,TELCOName					COLLATE SQL_Latin1_General_CP1_CI_AS		AS TELCOName					
--       ,BusinessName				COLLATE SQL_Latin1_General_CP1_CI_AS		AS BusinessName				
--       ,FirstName					COLLATE SQL_Latin1_General_CP1_CI_AS		AS FirstName					
--       ,MiddleInitial				COLLATE SQL_Latin1_General_CP1_CI_AS		AS MiddleInitial				
--       ,LastName					COLLATE SQL_Latin1_General_CP1_CI_AS		AS LastName					
--       ,PrimaryStreetNumber			COLLATE SQL_Latin1_General_CP1_CI_AS		AS PrimaryStreetNumber		
--       ,PrimaryPredirAbbrev			COLLATE SQL_Latin1_General_CP1_CI_AS		AS PrimaryPredirAbbrev		
--       ,PrimaryStreetName			COLLATE SQL_Latin1_General_CP1_CI_AS		AS PrimaryStreetName			
--       ,PrimaryStreetSuffix			COLLATE SQL_Latin1_General_CP1_CI_AS		AS PrimaryStreetSuffix		
--       ,PrimaryPostdirAbbrev		COLLATE SQL_Latin1_General_CP1_CI_AS		AS PrimaryPostdirAbbrev		
--       ,SecondaryUnitType			COLLATE SQL_Latin1_General_CP1_CI_AS		AS SecondaryUnitType			
--       ,SecondaryUnitNBR			COLLATE SQL_Latin1_General_CP1_CI_AS		AS SecondaryUnitNBR			
--       ,City						COLLATE SQL_Latin1_General_CP1_CI_AS		AS City						
--       ,StateCode					COLLATE SQL_Latin1_General_CP1_CI_AS		AS StateCode					
--       ,Zip							COLLATE SQL_Latin1_General_CP1_CI_AS		AS Zip					
--       ,ZipExt						COLLATE SQL_Latin1_General_CP1_CI_AS		AS ZipExt					
--       ,DeliveryPointCode			COLLATE SQL_Latin1_General_CP1_CI_AS		AS DeliveryPointCode			
--       ,CarrierRoute				COLLATE SQL_Latin1_General_CP1_CI_AS		AS CarrierRoute				
--       ,CountyCode					COLLATE SQL_Latin1_General_CP1_CI_AS		AS CountyCode				
--       ,Zip4Type					COLLATE SQL_Latin1_General_CP1_CI_AS		AS Zip4Type					
--       ,DeliveryPointValidation		COLLATE SQL_Latin1_General_CP1_CI_AS		AS DeliveryPointValidation	
--       ,MailableFlag				COLLATE SQL_Latin1_General_CP1_CI_AS		AS MailableFlag				
--       ,AddressValidationDate														
--       ,Country						COLLATE SQL_Latin1_General_CP1_CI_AS		AS Country					
--       ,MCD							COLLATE SQL_Latin1_General_CP1_CI_AS		AS MCD						
--       ,DirectoryAssistance			COLLATE SQL_Latin1_General_CP1_CI_AS		AS DirectoryAssistance		
--       ,TelephoneConfidenceScore	COLLATE SQL_Latin1_General_CP1_CI_AS		AS TelephoneConfidenceScore	
--       ,LastUpdateDate														
--FROM    RentPath.dimension.PhoneLookUp
--WHERE	CAST(CONVERT(VARCHAR(8),LastUpdateDate,112) AS INT) >= CAST(CONVERT(VARCHAR(8),GETDATE()-1,112) AS INT)

----------------------------------
--/*CRTAS last 7 days of leads 
--back to WHSE*/
----------------------------------
--CREATE REMOTE TABLE Staging.Fact.phoneleads_last7
--AT( 'Data Source = 172.28.34.4, 1433; User ID = biteam; Password = will our data be accurate?;' )
--AS
--SELECT  Website						COLLATE SQL_Latin1_General_CP1_CI_AS		AS Website						
--	   ,YMDID																							
--	   ,CallID						COLLATE SQL_Latin1_General_CP1_CI_AS		AS CallID						
--	   ,ListingID																			
--	   ,RentPropertyID															
--	   ,PropertyID																
--	   ,CallerName 					COLLATE SQL_Latin1_General_CP1_CI_AS		AS CallerName 					
--	   ,CallerPhoneNumber			COLLATE SQL_Latin1_General_CP1_CI_AS		AS CallerPhoneNumber			
--	   ,PublishedPhoneNumber		COLLATE SQL_Latin1_General_CP1_CI_AS		AS PublishedPhoneNumber		
--	   ,TargetPhoneNumber			COLLATE SQL_Latin1_General_CP1_CI_AS		AS TargetPhoneNumber			
--	   ,CallStartDateTime																
--	   ,CallEndDateTime																	
--	   ,DurationInSeconds																
--	   ,CallStatus																		
--	   ,CallSource					COLLATE SQL_Latin1_General_CP1_CI_AS		AS CallSource					
--	   ,CallType					COLLATE SQL_Latin1_General_CP1_CI_AS		AS CallType					
--	   ,AudioURL					COLLATE SQL_Latin1_General_CP1_CI_AS		AS AudioURL					
--	   ,CallLoadHour																		
--	   ,CallLoadYMDID																			
--	   ,CallEndHour																				
--	   ,DateAddedYMDID																			
--	   ,CallerLocation				COLLATE SQL_Latin1_General_CP1_CI_AS		AS CallerLocation				
--	   ,CallerIP					COLLATE SQL_Latin1_General_CP1_CI_AS		AS CallerIP					
--	   ,CallerAddress				COLLATE SQL_Latin1_General_CP1_CI_AS		AS CallerAddress				
--	   ,CallerCity					COLLATE SQL_Latin1_General_CP1_CI_AS		AS CallerCity					
--	   ,CallerState					COLLATE SQL_Latin1_General_CP1_CI_AS		AS CallerState					
--	   ,CallerZip					COLLATE SQL_Latin1_General_CP1_CI_AS		AS CallerZip					
--	   ,LinkName					COLLATE SQL_Latin1_General_CP1_CI_AS		AS LinkName					
--	   ,LinkID						COLLATE SQL_Latin1_General_CP1_CI_AS		AS LinkID						
--	   ,[Population]				COLLATE SQL_Latin1_General_CP1_CI_AS		AS [Population]					
--	   ,AvgTravelTimeToWork			COLLATE SQL_Latin1_General_CP1_CI_AS		AS AvgTravelTimeToWork			
--	   ,MedianHouseholdIncome 		COLLATE SQL_Latin1_General_CP1_CI_AS		AS MedianHouseholdIncome 		
--	   ,PerCapitaIncome				COLLATE SQL_Latin1_General_CP1_CI_AS		AS PerCapitaIncome				
--	   ,MedianEarnings				COLLATE SQL_Latin1_General_CP1_CI_AS		AS MedianEarnings				
--	   ,MedianContractRent			COLLATE SQL_Latin1_General_CP1_CI_AS		AS MedianContractRent			
--	   ,MedianRentAsked				COLLATE SQL_Latin1_General_CP1_CI_AS		AS MedianRentAsked				
--	   ,MedianGrossRent				COLLATE SQL_Latin1_General_CP1_CI_AS		AS MedianGrossRent				
--	   ,MedianPriceAsked			COLLATE SQL_Latin1_General_CP1_CI_AS		AS MedianPriceAsked			
--	   ,MedianRealEstateTaxes 		COLLATE SQL_Latin1_General_CP1_CI_AS		AS MedianRealEstateTaxes 		
--	   ,Households					COLLATE SQL_Latin1_General_CP1_CI_AS		AS Households					
--	   ,OwnerHouseholds				COLLATE SQL_Latin1_General_CP1_CI_AS		AS OwnerHouseholds				
--	   ,RenterHouseholds			COLLATE SQL_Latin1_General_CP1_CI_AS		AS RenterHouseholds			
--	   ,CallerURL					COLLATE SQL_Latin1_General_CP1_CI_AS		AS CallerURL					
--	   ,CallerTrimSilenceURL		COLLATE SQL_Latin1_General_CP1_CI_AS		AS CallerTrimSilenceURL		
--	   ,ReceiverURL					COLLATE SQL_Latin1_General_CP1_CI_AS		AS ReceiverURL					
--	   ,ActualCallDuration															
--	   ,CallerTrimBeginning															
--	   ,TotalCallerTrimTalkTime														
--	   ,EurekaID 																	
--	   ,IsAbandoned																	
--	   ,TimePriorToCallerSpeaking													
--	   ,MP3URL						COLLATE SQL_Latin1_General_CP1_CI_AS		AS MP3URL						
--	   ,BusinessModel				COLLATE SQL_Latin1_General_CP1_CI_AS		AS BusinessModel				
--	   ,AnalyticsResult				COLLATE SQL_Latin1_General_CP1_CI_AS		AS AnalyticsResult	
--	   ,AnalyticsMethod				COLLATE SQL_Latin1_General_CP1_CI_AS		AS AnalyticsMethod	
--FROM RentPath.fact.PhoneLeads
--WHERE	YMDID >= CAST(CONVERT(VARCHAR(8),GETDATE()-8,112) AS INT)






USE [RentPath]
GO
/****** Object:  StoredProcedure [fact].[pr_EmailLeads]    Script Date: 9/22/2017 8:16:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [fact].[pr_EmailLeads] AS
/******************************************************************************************
* Name:	Fact.pr_EmailLeads
*
* Desc: Fact.pr_EmailLeads
*
* Test:	EXEC Fact.pr_EmailLeads
*
* Hist: 01	04/27/2016	Colleen Rocks	Initial version; APS project 
* Hist: 02	05/23/2016	Colleen Rocks	APS Project; added update stats execute statement
* Hist:	03	05/25/2016	Brian Trembley	added 3PL
* Hist: 04	05/31/2016	Colleen Rocks	Added CRTAS of last 7 days back to warehouse; added a feeds column
*										to make it easier to distinguish feed leads from others in WHSE views
* Hist:	05	06/29/2016	Brian Trembley	added 4 new email lead fields
* Hist: 06  07/18/2016  Richard Chen    add DbleadKey for cube
* Hist: 07	07/19/2016	Don Wert		Ticket 23620, add DBLeadKey  to the SELECT statement that INSERTS to fact.emailleads
* Hist: 08	07/25/2016	Colleen Rocks	Ticket 23676; no longer filtering by status in (1,4) for email lead to be inserted into APS,
*										but still only want valid leads going to warehouse, so added the filter to the CRTAS
* Hist: 09	02/08/2017	Kimbo Morrow	SFDC Case 01397668; Changed email lead look back to 8 days
******************************************************************************************/
--------------------------------
/*Delete leads from the last 8 days*/
--------------------------------
DECLARE @YMDID INT
SET @YMDID = CAST(CONVERT(VARCHAR(8),GETDATE() - 8,112) AS INT)

DELETE  FROM RentPath.Fact.EmailLeads
WHERE   YMDID >= @YMDID

--------------------------------
/*Insert records from staging tables
into fact.emailleads*/
--------------------------------
INSERT INTO RentPath.Fact.EmailLeads

SELECT DISTINCT 'AG' AS Website
	,0 AS FeedLead
	,NULL AS RentPropertyID
	,ag.LISTINGID AS ListingID
	,ag.YMDID
	,ag.WHEN_ENTERED AS WhenEntered
	,ag.LEADID AS LeadID
	,ag.LEADTYPEID AS LeadTypeID
	,ag.[STATUS] AS [Status]
	,ag.EMAIL AS Email
	,ag.FNAME AS FirstName
	,ag.LNAME AS LastName
	,ag.ADDRESS1 AS Address1
	,ag.ADDRESS2 AS Address2
	,ag.CITY AS City
	,ag.[STATE] AS [State]
	,ag.ZIP AS Zip
	,ag.DAY_PHONE AS DayPhone
	,ag.NIGHT_PHONE AS NightPhone
	,ag.FAX AS FaxNumber
	,ag.MOVEMONTH AS MoveMonth
	,ag.BEDROOMS AS Bedrooms
	,ag.BATHS AS Bathrooms
	,CAST(ag.COMMENTS AS VARCHAR(1000)) AS Comments
	,ag.LEASETERMS AS LeaseTerms
	,ag.LEADSCORE AS LeadScore
	,ag.SOURCE AS Source
	,ag.ZUTRON_USER_ID AS PersonalizationID
	,ag.CAMPAIGN_ID AS CampaignID
	,ag.EF_ID AS EF_ID
	,ag.EV_TRANS_ID AS EV_TRANS_ID
	,ag.SESSIONID AS SessionID
	,ag.REASON_FOR_MOVE AS reasonformove
	,ag.PRICE_RANGE AS pricerange
	,NULL AS BusinessModel
	,NULL AS CompanyID
	,ag.YMDID AS UpdateYMDID
	,ag.DEVICE AS Device
	,ag.PAGETYPE AS PageType
	,ag.CONTEXT AS Contract
	,ag.ENDECA_ID AS Endeca_ID
	,ag.UNITLAYOUTID AS UnitLayout_ID
	,ag.uzid AS UZID
	,ag.sortorder AS SortOrder
	,ag.refinements AS Refinements
	,ag.tvisit AS TVisit
	,null as DBLeadKey
FROM RentPath.Staging.EmailLeadsAG AS ag
UNION
SELECT DISTINCT 'Rent' AS Website
	,0 AS FeedLead
	,r.RENTPROPERTYID AS RentPropertyID
	,ISNULL(r.LISTINGID,0) AS ListingID		--This used to be NVL(ListingID, RentPropertyID) but I replaced with 0 since those are not the same IDs
	,r.YMDID
	,r.WHEN_ENTERED AS WhenEntered
	,r.LEADID AS LeadID
	,r.LEADTYPEID AS LeadTypeID
	,r.[STATUS] AS [Status]
	,r.EMAIL AS Email
	,r.FNAME AS FirstName
	,r.LNAME AS LastName
	,r.ADDRESS1 AS Address1
	,r.ADDRESS2 AS Address2
	,r.CITY AS City
	,r.[STATE] AS [State]
	,r.ZIP AS Zip
	,r.DAY_PHONE AS DayPhone
	,r.NIGHT_PHONE AS NightPhone
	,r.FAX AS FaxNumber
	,r.MOVEMONTH AS MoveMonth
	,r.BEDROOMS AS Bedrooms
	,r.BATHS AS Bathrooms
	,CAST(r.COMMENTS AS VARCHAR(1000)) AS Comments
	,r.LEASETERMS AS LeaseTerms
	,r.LEADSCORE AS LeadScore
	,r.SOURCE AS Source
	,r.ZUTRON_USER_ID AS PersonalizationID
	,r.CAMPAIGN_ID AS CampaignID
	,r.EF_ID AS EF_ID
	,r.EV_TRANS_ID AS EV_TRANS_ID
	,r.SESSIONID AS SessionID
	,r.REASON_FOR_MOVE AS reasonformove
	,r.PRICE_RANGE AS pricerange
	,r.BUSINESSMODEL AS BusinessModel
	,r.RENTCOMPANYID AS CompanyID
	,r.YMDID AS UpdateYMDID
	,r.DEVICE AS Device
	,r.PAGETYPE AS PageType
	,r.CONTEXT AS Contract
	,r.ENDECA_ID AS Endeca_ID
	,r.UNITLAYOUTID AS UnitLayout_ID
	,r.uzid AS UZID
	,r.sortorder AS SortOrder
	,r.refinements AS Refinements
	,r.tvisit AS TVisit
	,null as DBLeadKey
FROM RentPath.Staging.EmailLeadsRent AS r
UNION 
SELECT
	CASE WHEN Source = 'FEED_RDT_Rent' THEN 'Rent' ELSE 'AG' END AS Website
	,1 AS FeedLead
	,NULL AS RentPropertyID
	,ISNULL(t.[ListingID],0) AS ListingID		--This used to be NVL(ListingID, RentPropertyID) but I replaced with 0 since those are not the same IDs
	,t.YMDID
	,t.[WhenEntered] AS WhenEntered
	,t.[LeadID] AS LeadID
	,t.[LeadTypeID] AS LeadTypeID
	,t.[Status] AS [Status]
	,t.[Email] AS Email
	,t.[FirstName] AS FirstName
	,t.[LastName] AS LastName
	,t.[Address1] AS Address1
	,t.[Address2] AS Address2
	,t.[City] AS City
	,t.[State] AS [State]
	,t.[Zip] AS Zip
	,t.[DayPhone] AS DayPhone
	,t.[NightPhone] AS NightPhone
	,t.[FaxNumber] AS FaxNumber
	,t.[MoveMonth] AS MoveMonth
	,t.[Bedrooms] AS Bedrooms
	,t.[Bathrooms] AS Bathrooms
	,t.[Comments] AS Comments
	,t.[LeaseTerms] AS LeaseTerms
	,t.[LeadScore] AS LeadScore
	,t.[Source] AS Source
	,t.[PersonalizationID] AS PersonalizationID
	,t.[CampaignID] AS CampaignID
	,t.[EF_ID] AS EF_ID
	,t.[EV_TRANS_ID] AS EV_TRANS_ID
	,t.[SessionID] AS SessionID
	,t.[reasonformove] AS reasonformove
	,t.[pricerange] AS pricerange
	,NULL AS BusinessModel
	,NULL AS CompanyID
	,t.YMDID AS UpdateYMDID
	,NULL AS Device
	,NULL AS PageType
	,NULL AS Contract
	,NULL AS Endeca_ID
	,NULL AS UnitLayout_ID
	,NULL AS UZID
	,NULL AS SortOrder
	,NULL AS Refinements
	,NULL AS TVisit
	,NULL as DBLeadKey
FROM RentPath.[mart].[ThirdPartyLeads] t
WHERE t.YMDID >= @YMDID


--------------------------------
/*Update DBLeadKey*/
--------------------------------
update fact.emailLeads
  set dbleadKey=cast(cast(ymdid as varchar(8))
                     +case when website='AG' then '1' when website='Rent' then '2'  else '3' end 
                     +cast(Leadid as varchar(20)) as bigint)
where ymdid >=@YMDID and dbleadkey is null

--------------------------------
/*Update statistics*/
--------------------------------
EXEC dbo.pr_UpdateStats 'Fact', 'EmailLeads'

--------------------------------
/*CRTAS last 7 days back to WHSE*/
--------------------------------
--CREATE REMOTE TABLE Staging.Fact.emailleads_last7
--AT( 'Data Source = 172.24.214.35, 1433; User ID = biteam; Password = will our data be accurate?;' )
--AS
--SELECT  Website				COLLATE SQL_Latin1_General_CP1_CI_AS			AS Website
--	   ,FeedLead
--	   ,RentPropertyID			
--	   ,ListingID
--	   ,YMDID 
--	   ,WhenEntered
--	   ,LeadID
--	   ,LeadTypeID
--	   ,[Status]
--	   ,Email				COLLATE SQL_Latin1_General_CP1_CI_AS			AS Email				
--	   ,FirstName			COLLATE SQL_Latin1_General_CP1_CI_AS			AS FirstName			
--	   ,LastName			COLLATE SQL_Latin1_General_CP1_CI_AS			AS LastName			
--	   ,Address1			COLLATE SQL_Latin1_General_CP1_CI_AS			AS Address1			
--	   ,Address2			COLLATE SQL_Latin1_General_CP1_CI_AS			AS Address2			
--	   ,City				COLLATE SQL_Latin1_General_CP1_CI_AS 			AS City				
--	   ,[State]				COLLATE SQL_Latin1_General_CP1_CI_AS			AS [State]				
--	   ,Zip					COLLATE SQL_Latin1_General_CP1_CI_AS			AS Zip				
--	   ,DayPhone			COLLATE SQL_Latin1_General_CP1_CI_AS			AS DayPhone			
--	   ,NightPhone			COLLATE SQL_Latin1_General_CP1_CI_AS			AS NightPhone		
--	   ,FaxNumber			COLLATE SQL_Latin1_General_CP1_CI_AS			AS FaxNumber			
--	   ,MoveMonth			COLLATE SQL_Latin1_General_CP1_CI_AS			AS MoveMonth			
--	   ,Bedrooms			COLLATE SQL_Latin1_General_CP1_CI_AS			AS Bedrooms			
--	   ,Bathrooms			COLLATE SQL_Latin1_General_CP1_CI_AS			AS Bathrooms			
--	   ,Comments			COLLATE SQL_Latin1_General_CP1_CI_AS			AS Comments			
--	   ,LeaseTerms			COLLATE SQL_Latin1_General_CP1_CI_AS			AS LeaseTerms		
--	   ,LeadScore																
--	   ,[Source]			COLLATE SQL_Latin1_General_CP1_CI_AS			AS [Source]		
--	   ,PersonalizationID	COLLATE SQL_Latin1_General_CP1_CI_AS			AS PersonalizationID	
--	   ,CampaignID			COLLATE SQL_Latin1_General_CP1_CI_AS			AS CampaignID		
--	   ,EF_ID				COLLATE SQL_Latin1_General_CP1_CI_AS			AS EF_ID			
--	   ,EV_TRANS_ID			COLLATE SQL_Latin1_General_CP1_CI_AS			AS EV_TRANS_ID		
--	   ,SessionID			COLLATE SQL_Latin1_General_CP1_CI_AS			AS SessionID			
--	   ,reasonformove		COLLATE SQL_Latin1_General_CP1_CI_AS			AS reasonformove		
--	   ,pricerange			COLLATE SQL_Latin1_General_CP1_CI_AS			AS pricerange		
--	   ,BusinessModel		COLLATE SQL_Latin1_General_CP1_CI_AS			AS BusinessModel		
--	   ,CompanyID																
--	   ,UpdateYMDID															
--	   ,Device				COLLATE SQL_Latin1_General_CP1_CI_AS			AS Device			
--	   ,PageType			COLLATE SQL_Latin1_General_CP1_CI_AS			AS PageType			
--	   ,Context				COLLATE SQL_Latin1_General_CP1_CI_AS			AS Context			
--	   ,Endeca_ID			COLLATE SQL_Latin1_General_CP1_CI_AS			AS Endeca_ID			
--	   ,UnitLayout_ID
--	   	,UZID				COLLATE SQL_Latin1_General_CP1_CI_AS			AS UZID
--		,SortOrder			COLLATE SQL_Latin1_General_CP1_CI_AS			AS SortOrder
--		,Refinements		COLLATE SQL_Latin1_General_CP1_CI_AS			AS Refinements
--		,TVisit				COLLATE SQL_Latin1_General_CP1_CI_AS			AS 	TVisit						
--FROM RentPath.Fact.EmailLeads
--WHERE	YMDID >= CAST(CONVERT(VARCHAR(8),GETDATE()-8,112) AS INT)
--		AND [Status] IN (1,4)	--Ok to filter by this even though 3rd party leads are in this table as well b/c the status of 3rd party leads is hardcoded to 1






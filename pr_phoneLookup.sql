USE [RentPath]
GO
/****** Object:  StoredProcedure [dimension].[pr_PhoneLookup]    Script Date: 9/22/2017 8:15:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dimension].[pr_PhoneLookup] AS
/******************************************************************************************
* Name:	Dimension.pr_PhoneLookup
*
* Desc:	Dimension.pr_PhoneLookup
*
* Test:	EXEC Dimension.pr_PhoneLookup

* Hist:	01	02/29/2016	Shetal Gandhi	Ticket 22238 - Initial Version - Pull New Records from APS using SSIS "APS_RentpathPhoneLeads". 
*										Then this stored proc is also ran in APS to Update records and Insert new records into a staging table, 
*										then renaming the table.
* Hist: 02	04/18/2016	Colleen Rocks	APS Project; slight modifications made to code
* Hist: 03	05/23/2016	Colleen Rocks	APS Project; added update stats execute statement
******************************************************************************************/
		

UPDATE  dimension.PhoneLookUp
SET 
	dimension.PhoneLookUp.PhoneType 					= spl.[PHONE_TYPE]
  , dimension.PhoneLookUp.DID 						    = spl.[DID]
  , dimension.PhoneLookUp.RecordType 					= spl.[RECORD_TYPE]
  , dimension.PhoneLookUp.FirstDate 					= spl.[FIRSTDATE]
  , dimension.PhoneLookUp.LastDate 						= spl.[LASTDATE]
  , dimension.PhoneLookUp.TELCOName						= spl.[TELCONAME]	
  , dimension.PhoneLookUp.BusinessName					= spl.[BUSINESS_NAME]	
  , dimension.PhoneLookUp.FirstName						= spl.[FIRST_NAME]		
  , dimension.PhoneLookUp.MiddleInitial					= spl.[MIDDLE_INITIAL]		
  , dimension.PhoneLookUp.LastName						= spl.[LAST_NAME]	
  , dimension.PhoneLookUp.PrimaryStreetNumber			= spl.[PRIMARY_STREET_NUMBER]	
  , dimension.PhoneLookUp.PrimaryPredirAbbrev			= spl.[PRIMARY_PREDIR_ABBREV]
  , dimension.PhoneLookUp.PrimaryStreetName				= spl.[PRIMARY_STREET_NAME]	
  , dimension.PhoneLookUp.PrimaryStreetSuffix			= spl.[PRIMARY_STREET_SUFFIX]	
  , dimension.PhoneLookUp.PrimaryPostdirAbbrev			= spl.[PRIMARY_POSTDIR_ABBREV]
  , dimension.PhoneLookUp.SecondaryUnitType				= spl.[SECONDARY_UNIT_TYPE]	
  , dimension.PhoneLookUp.SecondaryUnitNBR				= spl.[SECONDARY_UNIT_NBR]	
  , dimension.PhoneLookUp.City							= spl.[CITY]				
  , dimension.PhoneLookUp.StateCode						= spl.[STATE]			
  , dimension.PhoneLookUp.Zip							= spl.[ZIP]					
  , dimension.PhoneLookUp.ZipExt						= spl.[ZIPEXT]				
  , dimension.PhoneLookUp.DeliveryPointCode				= spl.[DELIVERY_POINT_CODE]	
  , dimension.PhoneLookUp.CarrierRoute					= spl.[CARRIER_ROUTE]
  , dimension.PhoneLookUp.CountyCode					= spl.[COUNTY_CODE]
  , dimension.PhoneLookUp.Zip4Type						= spl.[ZIP4TYPE]
  , dimension.PhoneLookUp.DeliveryPointValidation		= spl.[DELIVERY_POINT_VALIDATION]
  , dimension.PhoneLookUp.MailableFlag					= spl.[MAILABLE_FLAG]
  , dimension.PhoneLookUp.AddressValidationDate			= spl.[ADDRESS_VALIDATION_DATE]
  , dimension.PhoneLookUp.Country						= spl.[COUNTRY]
  , dimension.PhoneLookUp.MCD							= spl.[MCD]
  , dimension.PhoneLookUp.DirectoryAssistance			= spl.[DIRECTORY_ASSISTANCE]
  , dimension.PhoneLookUp.TelephoneConfidenceScore		= spl.[TELEPHONE_CONFIDENCE_SCORE]
  , dimension.PhoneLookUp.LastUpdateDate				= spl.[LAST_UPDATE_DATE]
FROM [staging].[PhoneLookup] AS spl
WHERE spl.[PHONENUMBER] = dimension.PhoneLookUp.PhoneNumber ;

INSERT INTO dimension.PhoneLookUp
SELECT  [PHONENUMBER]
	   ,[PHONE_TYPE]
	   ,[DID]
	   ,[RECORD_TYPE]
	   ,[FIRSTDATE]
	   ,[LASTDATE]
	   ,[TELCONAME]	
	   ,[BUSINESS_NAME]	
	   ,[FIRST_NAME]		
	   ,[MIDDLE_INITIAL]		
	   ,[LAST_NAME]	
	   ,[PRIMARY_STREET_NUMBER]	
	   ,[PRIMARY_PREDIR_ABBREV]
	   ,[PRIMARY_STREET_NAME]	
	   ,[PRIMARY_STREET_SUFFIX]	
	   ,[PRIMARY_POSTDIR_ABBREV]
	   ,[SECONDARY_UNIT_TYPE]	
	   ,[SECONDARY_UNIT_NBR]	
	   ,[CITY]				
	   ,[STATE]			
	   ,[ZIP]					
	   ,[ZIPEXT]				
	   ,[DELIVERY_POINT_CODE]	
	   ,[CARRIER_ROUTE]
	   ,[COUNTY_CODE]
	   ,[ZIP4TYPE]
	   ,[DELIVERY_POINT_VALIDATION]
	   ,[MAILABLE_FLAG]
	   ,[ADDRESS_VALIDATION_DATE]
	   ,[COUNTRY]
	   ,[MCD]
	   ,[DIRECTORY_ASSISTANCE]
	   ,[TELEPHONE_CONFIDENCE_SCORE]
	   ,[LAST_UPDATE_DATE]
FROM [staging].[PhoneLookup] AS spl
WHERE spl.[PHONENUMBER] NOT IN (SELECT PhoneNumber FROM Dimension.PhoneLookUp)


--Drop table Dimension.PhoneLookUp
--Rename Object Dimension.PhoneLookUpInsert to PhoneLookUp

--------------------------------
/*Update statistics*/
--------------------------------
EXEC dbo.pr_UpdateStats 'Dimension', 'PhoneLookUp'
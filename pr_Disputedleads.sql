USE [RentPath]
GO
/****** Object:  StoredProcedure [fact].[pr_Disputedleads]    Script Date: 9/22/2017 8:15:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [fact].[pr_Disputedleads] AS
/*
* Name:	Fact.pr_Disputedleads
* ------------------------------------------------------------------------------------------
* Desc:	
* ------------------------------------------------------------------------------------------
* Test:	EXEC Fact.pr_Disputedleads
* ------------------------------------------------------------------------------------------
* Notes:
* ------------------------------------------------------------------------------------------
* Hist:	01	02/10/2017	Kimberley Morrow		Case #01384666 - Inital creation		
* ------------------------------------------------------------------------------------------
*/

BEGIN TRY
	-----------------------
	--Declare Error Handling Variables
	-----------------------
		DECLARE @ErrorMessage				NVARCHAR(4000)
			,@ErrorSeverity					INT
			,@ErrorState					INT
			,@ErrorDesc						VARCHAR(500)

	----------------------------------
	--Declare and Set Logging Variables
	----------------------------------
	 DECLARE @TrackDate DATETIME 
			,@LocalYMDID INT 
			,@YMDID INT
			,@LengthInSeconds INT 
			,@DatabaseName VARCHAR(128) 
			,@ProcedureName VARCHAR(128) 
			,@CommentLine VARCHAR (500)

	SET	@TrackDate = GETDATE();
	SET @LengthInSeconds = 0;
	SET @DatabaseName = DB_NAME()  ;      
	SET @ProcedureName = 'Fact.pr_Disputedleads';	
	SET @YMDID = CAST(CONVERT(VARCHAR(8),GETDATE()-1,112) AS INT);
	SET	@LocalYMDID = ISNULL(@YMDID,CAST(CONVERT(VARCHAR(8),GETDATE()-1,112) AS INT));
	

	----------------------------------
	--Start Logging
	----------------------------------	
	SET @LengthInSeconds = DATEDIFF(ss, @TrackDate,GETDATE())            
	EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName,
		@ProcName = @ProcedureName,
		@StepName = '1 - Start Procedure: Fact.pr_LeadsAndLeases',
		@VariableStates = @LocalYMDID,
		@LengthInSeconds = @LengthInSeconds,
		@Comments = 'Start Procedure';
	SET @TrackDate = GETDATE();

	----------------------------------
	-- Logging Staging Table is Empty
	----------------------------------	
	
	IF (SELECT COUNT(*) Records from Staging.Disputedleads) = 0 
	BEGIN
		SET @LengthInSeconds = DATEDIFF(ss, @TrackDate,GETDATE())            
		EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName,
			@ProcName = @ProcedureName,
			@StepName = '2 - ERROR WITH SOURCE - NO DATA - Procedure: Fact.pr_Disputedleads',
			@VariableStates = @LocalYMDID,
			@LengthInSeconds = @LengthInSeconds,
			@Comments = 'ERROR WITH SOURCE - NO DATA - Procedure: Fact.pr_Disputedleads';
		SET @TrackDate = GETDATE();

		RAISERROR ('Staging.Disputedleads has no data.', -- Message text.
            16, -- Severity.
            1 -- State.
            );
	END 


	----------------------------------------
	--Drop table fact.DisuptedLeads
	------------------------------------------

DROP TABLE  fact.Disputedleads;

	----------------------------------------
	--Recreate table fact.DisuptedLeads
	------------------------------------------

CREATE TABLE [fact].[Disputedleads] (
    [LISTINGID] int NULL
    ,[LEADMONTH] int NULL
    ,[LEADID] nvarchar(40)
    ,[LEADTYPE] nvarchar(5)
    ,[STATUS] nvarchar(20)
    ,[COMMENTS] nvarchar(500)
    ,[LASTUPDATED] date NULL
)
WITH (HEAP, DISTRIBUTION = HASH([LEADID]));

----------------------------------------
--Move Disputed leads from staging to fact
------------------------------------------

INSERT INTO Fact.Disputedleads
(
	 [LISTINGID]				
	,[LEADMONTH]	
	,[LEADID]		
	,[LEADTYPE]		
	,[STATUS]		
	,[COMMENTS]	
	,[LASTUPDATED]
)
SELECT 
	 CONVERT(INT, [LISTINGID]) [LISTINGID]
	,CONVERT(INT, [LEADMONTH]) [LEADMONTH]
	,[LEADID]
	,[LEADTYPE]	
	,[STATUS]
	,[COMMENTS]
	,[LASTUPDATED]
FROM staging.Disputedleads


--------------------------------
/*Create statistics*/
--------------------------------
EXEC dbo.pr_CreateStats 'fact' , 'Disputedleads'


END TRY
BEGIN CATCH
	SET @ErrorMessage		= ERROR_MESSAGE()
	SET @ErrorSeverity		= ERROR_SEVERITY()
	SET @ErrorState			= ERROR_STATE()
		
	SET @ErrorMessage = 'Error occured in loading Fact.Disputedleads for date ' + CONVERT(varchar(30),@ymdid) + '.   Error - ' + @ErrorMessage
	
	----------------------------------
	--Logging
	----------------------------------	
	SET @LengthInSeconds = DATEDIFF(ss, @TrackDate,GETDATE())            
	EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName,
		@ProcName = @ProcedureName,
		@StepName = 'Error Occured.',
		@VariableStates = @LocalYMDID,
		@LengthInSeconds = @LengthInSeconds,
		@Comments = @ErrorMessage;
	SET @TrackDate = GETDATE();

 --------------------------------------------- 
 --Use RAISERROR inside the CATCH block to return error information about the original error that caused
 --execution to jump to the CATCH block.  Without this, it does not print or actually raise the error.
 --------------------------------------------- 
    RAISERROR (@ErrorMessage, -- Message text.
               @ErrorSeverity, -- Severity.
               @ErrorState -- State.
               );
			   	   	
END CATCH							
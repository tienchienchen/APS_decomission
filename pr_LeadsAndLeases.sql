USE [RentPath]
GO
/****** Object:  StoredProcedure [mart].[pr_LeadsAndLeases]    Script Date: 9/22/2017 8:17:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [mart].[pr_LeadsAndLeases] AS
/*
* Name:	Mart.pr_LeadsAndLeases
* ------------------------------------------------------------------------------------------
* Desc:	
* ------------------------------------------------------------------------------------------
* Test:	EXEC Mart.pr_LeadsAndLeases 
* ------------------------------------------------------------------------------------------
* Notes:
* ------------------------------------------------------------------------------------------
* Hist:	01	01/12/2017	Jonathon Williams & Kimberley Morrow		Case # 01340208 - Initial Version.
* Hist:	02	01/24/2017	Kimberley Morrow							Case # 01385348 - Changed Error Handling to look at the right table.		
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
	SET @ProcedureName = 'Mart.pr_LeadsAndLeases';	
	SET @YMDID = CAST(CONVERT(VARCHAR(8),GETDATE()-1,112) AS INT);
	SET	@LocalYMDID = ISNULL(@YMDID,CAST(CONVERT(VARCHAR(8),GETDATE()-1,112) AS INT));
	



	----------------------------------
	--Start Logging
	----------------------------------	
	SET @LengthInSeconds = DATEDIFF(ss, @TrackDate,GETDATE())            
	EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName,
		@ProcName = @ProcedureName,
		@StepName = '1 - Start Procedure: Mart.pr_LeadsAndLeases',
		@VariableStates = @LocalYMDID,
		@LengthInSeconds = @LengthInSeconds,
		@Comments = 'Start Procedure';
	SET @TrackDate = GETDATE();

	----------------------------------
	-- Logging Staging Table is Empty
	----------------------------------	
	
	IF (SELECT COUNT(*) Records from Staging.LeadsandLeases) = 0 
	BEGIN
		SET @LengthInSeconds = DATEDIFF(ss, @TrackDate,GETDATE())            
		EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName,
			@ProcName = @ProcedureName,
			@StepName = '2 - ERROR WITH SOURCE - NO DATA - Procedure: Mart.pr_LeadsAndLeases',
			@VariableStates = @LocalYMDID,
			@LengthInSeconds = @LengthInSeconds,
			@Comments = 'ERROR WITH SOURCE - NO DATA - Procedure: Mart.pr_LeadsAndLeases';
		SET @TrackDate = GETDATE();

		RAISERROR ('Staging.LeadsandLeases has no data. Contact Nikhil Mehta for new ET file.', -- Message text.
            16, -- Severity.
            1 -- State.
            );
	END 


----------------------------------------
--TRUNCATE ALL OF YESTERDAYS DATA
------------------------------------------

DELETE FROM mart.LeadsAndLeases;


----------------------------------------
--Marting
------------------------------------------

INSERT INTO mart.LeadsAndLeases
(
	YMDID,
	[LISTINGID],
	[EMAILADDRESS],
	[RENTED_FLAG],
	[RENTEDDATE],
	[LEASE_STARTDATE],
	[LEASE_LENGTH] ,
	[LEASE_ENDDATE],
	[COMMENT_],
	[NORENT_INFO],
	[STOPPED_LOOKING]
)
SELECT 
	CONVERT(INT, REPLACE(LEFT([RENTEDDATE],10),'-','')) AS YMDID,
	CONVERT(INT, [LISTINGID]) [LISTINGID],
	[EMAILADDRESS],
	CASE [RENTED_FLAG] WHEN 'Y' THEN 1 WHEN 'N' THEN 0 END AS RENTED_FLAG,
	CONVERT(DATETIME2(3),[RENTEDDATE]) [RENTEDDATE],
	CONVERT(DATETIME,[LEASE_STARTDATE]) [LEASE_STARTDATE],
	[LEASE_LENGTH] ,
	CONVERT(DATETIME,[LEASE_ENDDATE]) [LEASE_ENDDATE],
	[COMMENT_],
	[NORENT_INFO],
	[STOPPED_LOOKING]
FROM staging.LeadsAndLeases


END TRY
BEGIN CATCH
	SET @ErrorMessage		= ERROR_MESSAGE()
	SET @ErrorSeverity		= ERROR_SEVERITY()
	SET @ErrorState			= ERROR_STATE()
		
	SET @ErrorMessage = 'Error occured in loading Mart.LeadsAndLeases for date ' + CONVERT(varchar(30),@ymdid) + '.   Error - ' + @ErrorMessage
	
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
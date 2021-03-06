USE [RentPath]
GO
/****** Object:  StoredProcedure [dbo].[pr_UpdateStats]    Script Date: 9/22/2017 8:14:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[pr_UpdateStats] @TableSchemaName [VARCHAR](35),@InputTableName [VARCHAR](255) AS
/*******************************************************************************************
* Name:	dbo.pr_UpdateStats
* ------------------------------------------------------------------------------------------
* Desc:	
* ------------------------------------------------------------------------------------------
* Test:	EXEC dbo.pr_UpdateStats 'dbo', 'ParsedDataPivot_WebMetric'
*		EXEC dbo.pr_UpdateStats_Test 'Conformed','Browser'
* ------------------------------------------------------------------------------------------
* Notes: 
* ------------------------------------------------------------------------------------------
* Hist:	01	03/23/2016	Sarah Mims and Julie DiPietro      Tickets 22184 et al. - Initial version
* Hist: 02	04/07/2016	Sarah Mims						   No ticket - changed from creating
*														   a table to just using the view only
* Hist: 03	08/11/2016	Don Wert						   Ticket 23872, add table schema and name to closing log entry
* Hist: 05	10/17/2016	Sarah Mims						   Ticket # 24464 - add error trapping and additional logging
********************************************************************************************/
BEGIN
BEGIN TRY

	----------------------------------
	--Declare and Set Logging Variables
	----------------------------------
	 DECLARE @TrackDate DATETIME 
			,@LocalYMDID INT 
			,@LengthInSeconds INT 
			,@VariableStates VARCHAR(500)
			,@Comments VARCHAR(500)
			,@DatabaseName VARCHAR(128) 
			,@ProcedureName VARCHAR(128)
			,@StepName VARCHAR(128)
			,@StepNumber INT


	SET	@TrackDate = GETDATE();
	SET	@LocalYMDID  =  CAST(CONVERT(VARCHAR(8),GETDATE(),112) AS INT)
	SET @LengthInSeconds = 0;
	SET @DatabaseName = DB_NAME()  ;      
	SET @ProcedureName = 'dbo.pr_UpdateStats';	

	----------------------------------
	--Start Logging
	----------------------------------	
	SET @LengthInSeconds = DATEDIFF(ss, @TrackDate,GETDATE())   
	SET @Comments = 'Start Procedure for ' + CASE WHEN @InputTableName IS NULL THEN (SELECT @TableSchemaName) + ' schema' ELSE (SELECT @TableSchemaName) + ' schema and ' + (SELECT @InputTableName) + ' table' END
			     
	EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName,
		@ProcName = @ProcedureName,
		@StepName = '1 - Start Procedure: dbo.pr_UpdateStats',
		@VariableStates = @LocalYMDID,
		@LengthInSeconds = @LengthInSeconds,
		@Comments = @Comments
	SET @TrackDate = GETDATE();
	--------------------------
	--Declare and set variables
	--------------------------
	DECLARE @SQL NVARCHAR(4000)
			,@StatName VARCHAR (75)
			,@StatsToProcess INT
			,@TableName VARCHAR(255)

	-------------------------
	--Get Stat Count
	-------------------------
	SET @StatsToProcess = (	SELECT COUNT(*) 
							FROM dbo.vReHydrateStats 
							WHERE TableSchemaName = @TableSchemaName
							AND TableName = CASE WHEN @InputTableName IS NULL THEN TableName ELSE @InputTableName END
						  )

	SET @StepNumber = 2
	-------------------------
	--Loop through stats
	-------------------------
	WHILE @StatsToProcess > 0

	BEGIN

		SET @TableSchemaName = (
								SELECT TableSchemaName
								FROM dbo.vReHydrateStats
								WHERE TableSchemaName = @TableSchemaName
								AND TableName = CASE WHEN @InputTableName IS NULL THEN TableName ELSE @InputTableName END 
								AND RowNumber = CASE WHEN @InputTableName IS NULL THEN RowNumber ELSE @StatsToProcess END
								AND TableSchemaRowNumber = CASE WHEN @InputTableName IS NULL THEN @StatsToProcess ELSE TableSchemaRowNumber END
								)
		SET @TableName =   (
						    SELECT TableName 								
						    FROM dbo.vReHydrateStats
						    WHERE TableSchemaName = @TableSchemaName
								AND TableName = CASE WHEN @InputTableName IS NULL THEN TableName ELSE @InputTableName END 
								AND RowNumber = CASE WHEN @InputTableName IS NULL THEN RowNumber ELSE @StatsToProcess END
								AND TableSchemaRowNumber = CASE WHEN @InputTableName IS NULL THEN @StatsToProcess ELSE TableSchemaRowNumber END
						    )
		SET @StatName = (
						 SELECT StatName 				    
						 FROM dbo.vReHydrateStats
						 WHERE TableSchemaName = @TableSchemaName
							AND TableName = CASE WHEN @InputTableName IS NULL THEN TableName ELSE @InputTableName END 
						    AND RowNumber = CASE WHEN @InputTableName IS NULL THEN RowNumber ELSE @StatsToProcess END
							AND TableSchemaRowNumber = CASE WHEN @InputTableName IS NULL THEN @StatsToProcess ELSE TableSchemaRowNumber END
							)


		--------------------
		--Log the updating of statistics
		--------------------
		SET @LengthInSeconds = DATEDIFF(ss, @TrackDate,GETDATE())            
		SET @Comments = 'Update statistic '+@StatName+' ON '+@TableSchemaName+'.'+@TableName+''
		SET @StepName = CAST(@StepNumber AS VARCHAR) + ' - Loop through each stat that exists and update it'
		EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName,
			@ProcName = @ProcedureName,
			@StepName = @StepName,
			@VariableStates = @LocalYMDID,
			@LengthInSeconds = @LengthInSeconds,
			@Comments = @Comments
		SET @TrackDate = GETDATE();


		SET @SQL = N'UPDATE STATISTICS '+@TableSchemaName+'.'+@TableName+'('+@StatName+') WITH RESAMPLE'

		EXECUTE sp_executesql @SQL

		--------------------
		--Log the completion of the update
		--------------------
		SET @LengthInSeconds = DATEDIFF(ss, @TrackDate,GETDATE())            
		SET @Comments = 'Finished updating statistic '+@StatName+' ON '+@TableSchemaName+'.'+@TableName+''
		SET @StepName = CAST(@StepNumber + 1 AS VARCHAR) + ' - Finished updating the statistic'
		EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName,
			@ProcName = @ProcedureName,
			@StepName = @StepName,
			@VariableStates = @LocalYMDID,
			@LengthInSeconds = @LengthInSeconds,
			@Comments = @Comments
		SET @TrackDate = GETDATE();

		--PRINT @SQL

		SET @StatsToProcess = @StatsToProcess - 1
		SET @StepNumber = @StepNumber + 2

	END

		--------------------
		--Log the actual creation of stats/end procedure
		--------------------
		SET @LengthInSeconds = DATEDIFF(ss, @TrackDate,GETDATE())            
		SET @Comments = 'End procedure for ' + CASE WHEN @InputTableName IS NULL THEN (SELECT @TableSchemaName) + ' schema' ELSE (SELECT @TableSchemaName) + ' schema and ' + (SELECT @InputTableName) + ' table' END
		SET @StepName = CAST(@StepNumber AS VARCHAR) + ' - End Procedure'

		EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName,
			@ProcName = @ProcedureName,
			@StepName = @StepName,
			@VariableStates = @LocalYMDID,
			@LengthInSeconds = @LengthInSeconds,
			@Comments = @Comments
		SET @TrackDate = GETDATE();

END TRY
BEGIN CATCH
		--------------------------------------------------------------
		--If the update of at least one statistic failed, capture the message and log it
		--------------------------------------------------------------
		SET @Comments = CAST(LEFT(ERROR_MESSAGE(),500) AS VARCHAR(500))

		SET @LengthInSeconds = DATEDIFF(ss, @TrackDate,GETDATE())            
		EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName,
			@ProcName = @ProcedureName,
			@StepName = 'Catch Update Statistics Failure',
			@VariableStates = @LocalYMDID,
			@LengthInSeconds = @LengthInSeconds,
			@Comments = @Comments;
		SET @TrackDate = GETDATE();

END CATCH	

END




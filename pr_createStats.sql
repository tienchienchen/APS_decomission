USE [RentPath]
GO
/****** Object:  StoredProcedure [dbo].[pr_CreateStats]    Script Date: 9/22/2017 8:13:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[pr_CreateStats] @TableSchemaName [VARCHAR](35),@TableName [VARCHAR](35) AS 
/*******************************************************************************************
* Name:	dbo.pr_CreateStats
* ------------------------------------------------------------------------------------------
* Desc:	
* ------------------------------------------------------------------------------------------
* Test:	EXEC dbo.pr_CreateStats 'Conformed','Profile'
* ------------------------------------------------------------------------------------------
* Notes: 
* ------------------------------------------------------------------------------------------
* Hist:	01	03/23/2016	Sarah Mims and Julie DiPietro		Tickets 22184 et al. - Initial version
* Hist: 02  04/14/2016  Richard Chen						Modify Code for column which as '.' in the middle.
															Example [wt.mc_id] will cause error
															Add [] to surrond data column
															take out "." in statistic name
* Hist: 03	10/03/2016	Don Wert							Ticket 24333, add error trapping and additional logging
********************************************************************************************/
BEGIN
BEGIN TRY	
	
	/*test 
	DECLARE @TableSchemaName [VARCHAR](35)
			,@TableName [VARCHAR](35)

	SET @TableSchemaName = 'staging'
	SET @TableName = 'ParsedPivot'
	*/
	
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


	SET	@TrackDate = GETDATE();
	SET	@LocalYMDID  = (SELECT TOP 1 YMDID FROM dbo.ParsedPivot) --(SELECT TOP 1 YMDID FROM dbo.ParsedDataPivot)
	SET @LengthInSeconds = 0;
	SET @DatabaseName = DB_NAME()  ;      
	SET @ProcedureName = 'dbo.pr_CreateStats';	

	----------------------------------
	--Start Logging
	----------------------------------	
	SET @LengthInSeconds = DATEDIFF(ss, @TrackDate,GETDATE())  
	SET @Comments = 'Start Procedure for ' + CASE WHEN @TableName IS NULL THEN (SELECT @TableSchemaName) + ' schema' ELSE (SELECT @TableSchemaName) + ' schema and ' + (SELECT @TableName) + ' table' END
			     
	EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName,
		@ProcName = @ProcedureName,
		@StepName = '1 - Start Procedure: dbo.pr_CreateStats',
		@VariableStates = @LocalYMDID ,
		@LengthInSeconds = @LengthInSeconds,
		@Comments = @Comments
	SET @TrackDate = GETDATE();


	--------------------------
	--Declare and set variables
	--------------------------

	DECLARE @SQL NVARCHAR(4000)
	,@ColumnName VARCHAR (35)
	,@StatsToProcess INT
    
    --Print '1'
	--Print @StatsToProcess
	-------------------------
	--Get Stat Count
	-------------------------
	SET @StatsToProcess = (
						   SELECT COUNT(*) 
						   FROM [dbo].[vStatisticsGenerateMissing] 
						   WHERE TableSchemaName = @TableSchemaName 
						   AND TableName = CASE WHEN @TableName IS NULL THEN TableName ELSE @TableName END
						   )

    --Print '2'
	--Print @StatsToProcess

	-------------------------
	--Loop through stats
	-------------------------
	WHILE @StatsToProcess > 0

	BEGIN

		SET @TableSchemaName = (
							    SELECT TableSchemaName 
								FROM dbo.vStatisticsGenerateMissing 
								WHERE TableSchemaName = @TableSchemaName
									AND TableName = CASE WHEN @TableName IS NULL THEN TableName ELSE @TableName END
									AND RowNumber = @StatsToProcess
								)

		SET @TableName = (
						  SELECT TableName 
						  FROM dbo.vStatisticsGenerateMissing 
						  WHERE TableSchemaName = @TableSchemaName
							AND TableName = CASE WHEN @TableName IS NULL THEN TableName ELSE @TableName END
							AND RowNumber = @StatsToProcess
						   )

		SET @ColumnName = (
						   SELECT ColumnName 						  
						   FROM dbo.vStatisticsGenerateMissing 
						   WHERE TableSchemaName = @TableSchemaName
							AND TableName = CASE WHEN @TableName IS NULL THEN TableName ELSE @TableName END
							AND RowNumber = @StatsToProcess
						   )
		
		SET @Comments = 'Creating statistics on '+@TableSchemaName+'_'+replace(@TableName,'.','')+'_'+replace(@ColumnName,'.','')+' ON '+@TableSchemaName+'.'+@TableName+'(['+@ColumnName+'])'
		
		SET @LengthInSeconds = DATEDIFF(ss, @TrackDate,GETDATE())            
		EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName,
			@ProcName = @ProcedureName,
			@StepName = '2 - Loop through each stat needed and create it',
			@VariableStates = @LocalYMDID,
			@LengthInSeconds = @LengthInSeconds,
			@Comments = @Comments;
		SET @TrackDate = GETDATE();

		SET @SQL = N'CREATE STATISTICS Stat_'+@TableSchemaName+'_'+replace(@TableName,'.','')+'_'+replace(@ColumnName,'.','')+' ON '+@TableSchemaName+'.'+@TableName+'(['+@ColumnName+'])'
        
		--actually create the statistics
		EXECUTE sp_executesql @SQL
	    --PRINT @SQL
        --print 'EXECUTE sp_executesql '+@SQL
        --Print 'Loop'
	    --Print @StatsToProcess

		SET @Comments = 'Created statistics on '+@TableSchemaName+'_'+replace(@TableName,'.','')+'_'+replace(@ColumnName,'.','')+' ON '+@TableSchemaName+'.'+@TableName+'(['+@ColumnName+'])'

		SET @LengthInSeconds = DATEDIFF(ss, @TrackDate,GETDATE())            
		EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName,
			@ProcName = @ProcedureName,
			@StepName = '2 - Loop through each stat needed and create it',
			@VariableStates = @LocalYMDID,
			@LengthInSeconds = @LengthInSeconds,
			@Comments = @Comments;
		SET @TrackDate = GETDATE();


		SET @StatsToProcess = @StatsToProcess - 1

	END

		--------------------
		--Log the actual creation of stats/end procedure
		--------------------
		SET @LengthInSeconds = DATEDIFF(ss, @TrackDate,GETDATE())            
		EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName,
			@ProcName = @ProcedureName,
			@StepName = '2 - Loop through each stat needed and create it',
			@VariableStates = @LocalYMDID,
			@LengthInSeconds = @LengthInSeconds,
			@Comments = 'End procedure';
		SET @TrackDate = GETDATE();
END TRY
BEGIN CATCH
		SET @Comments = CAST(LEFT(ERROR_MESSAGE(),500) AS VARCHAR(500))

		SET @LengthInSeconds = DATEDIFF(ss, @TrackDate,GETDATE())            
		EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName,
			@ProcName = @ProcedureName,
			@StepName = '2 - Loop through each stat needed and create it',
			@VariableStates = @LocalYMDID,
			@LengthInSeconds = @LengthInSeconds,
			@Comments = @Comments;
		SET @TrackDate = GETDATE();

END CATCH		


END


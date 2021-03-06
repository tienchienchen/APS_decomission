USE [RentPath]
GO
/****** Object:  StoredProcedure [dbo].[pr_Logging_StoredProcs]    Script Date: 9/22/2017 8:13:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[pr_Logging_StoredProcs] @DatabaseName [VARCHAR](128),@ProcName [varchar](128),@StepName [varchar](128),@VariableStates [varchar](500),@LengthInSeconds [INT],@Comments [varchar](500) AS 
BEGIN
--SET NOCOUNT ON

        INSERT INTO dbo.Logging_StoredProcs
               (ID,
                YMDID,
                TimeRecorded,
                DatabaseName,
                ProcName,
                StepName,
                VariableStates,
                LengthInSeconds,
                Comments)
        SELECT  row_number() over (order by DatabaseName) +y.MaxID
               ,CAST(CONVERT( VARCHAR(8),GETDATE(),112) AS INT)
               ,getdate()
               ,DatabaseName
               ,X.ProcName
               ,StepName
               ,VariableStates
               ,LengthInSeconds
               ,Comments
               
        FROM (
              SELECT @DatabaseName AS DatabaseName,
                     @ProcName AS ProcName,
                     @StepName AS StepName,
                     @VariableStates AS VariableStates,
                     @LengthInSeconds AS LengthInSeconds,
                     @Comments AS Comments
        ) X
        cross join
        (select isnull(max(id),0) MaxID from dbo.logging_storedProcs) y
        --LEFT JOIN (
        --        SELECT  @ProcName AS ProcName
        --               ,ls.cntr_value AS TempDBSizeTotal
        --               ,lu.cntr_value AS TempDBSizeUsed
        --               ,CAST(lu.cntr_value AS FLOAT) / CAST(ls.cntr_value AS FLOAT) AS TempDBUsedPercent
        --               ,CASE WHEN CAST(lu.cntr_value AS FLOAT) / CAST(ls.cntr_value AS FLOAT) > .5 
        --                     THEN 
        --                        CASE WHEN db.name = 'tempdb' AND log_reuse_wait_desc NOT IN ('CHECKPOINT','NOTHING') THEN 'WARNING'  
        --                             WHEN db.name <> 'tempdb' THEN 'WARNING' 
        --                             ELSE 'OK' END
        --                     ELSE 'OK'
        --                END AS TempDBLogStatus
        --        FROM sys.databases db
        --        JOIN sys.dm_os_performance_counters lu
        --        ON db.name = lu.instance_name
        --        JOIN sys.dm_os_performance_counters ls
        --        ON db.name = ls.instance_name
        --        WHERE lu.counter_name LIKE 'Log File(s) Used Size (KB)%'
        --        AND ls.counter_name LIKE 'Log File(s) Size (KB)%'
        --        AND name = 'tempdb'
        --) Y
        --ON X.ProcName = Y.ProcName

      --SET NOCOUNT OFF

END


USE [RentPath]
GO
/****** Object:  StoredProcedure [dbo].[pr_CopyParseDataByHourToParsedData]    Script Date: 9/22/2017 8:09:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[pr_CopyParseDataByHourToParsedData] @YMDID [INT] AS 
/************************************************************************************************************************
* Name:         dbo.[pr_CopyParseDataByHourToParsedData]
* Desc:         Move ParsedData Around for Daily and Archived Purpose
* Author:		Richard Chen
* Create date:  2016/01/27
* -----------------------------------------------------------------------------------------------------------------------
---- Note: this moves the data from the 
Workflows:
stagedb..ParsedDatabyhour  -> stagedb..ParsedData -->stagedb..ParsedDataArchived
-->StageDBArchived..ParsedDate-->StageDBArchive..ParsedDataArchived

Empty Partition older than 41 days

for marting purposes
* Run Proc: 
     exec dbo.[pr_CopyParseDataByHourToParsedData]  null
     exec dbo.[pr_CopyParseDataByHourToParsedData]  @ymdid=null
     exec dbo.[pr_CopyParseDataByHourToParsedData]  @ymdid=20160131
     exec dbo.[pr_CopyParseDataByHourToParsedData]  @ymdid=20160304
     exec dbo.[pr_CopyParseDataByHourToParsedData]  @ymdid=20150922
     exec dbo.[pr_CopyParseDataByHourToParsedData]  @ymdid=20160406
     exec dbo.[pr_CopyParseDataByHourToParsedData]  @ymdid=20170812
     View Log
     select * from dbo.logging_storedProcs order by id desc
     LogData is in dbo.logging_storedProcs
 -----------------------------------------------------------------------------------------------------------------------
* Hist:
*     01  02/17/2016   Richard Chen      Initial Version, SqlBackup take forever, move archivedData to StageDBArchived
*     02  03/07/2016   Richard Chen      Ticket  22277  Change measuretype from  Listing_source to page_category --temporary
*     03  03/11/2016   Richard Chen      Ticket 22365  Change Measuretype from unit_id to unitlayout_id
*     04  01/11/2017   Richard Chen      Case 01372922  dedupe duplicate (parseid,measuretype)
*     05  03/06/2017   Richard Chen      Case 01403336 discontinue the Stagedbarchived.dbo.ParsedDataArchived process 
*     06  03/13/2017   Richard Chen      Correct spring day light saving logic
************************************************************************************************************************/ 

BEGIN  --Begin Procedure
/*#############################################################################################
Declare variable facilate copy parsedDataByHour to ParsedData and ParsedDataArchived
#############################################################################################*/ 

        DECLARE @TrackDate DATETIME ,
            @LocalYMDID INT ,
            @ExitYMDID INT ,
            @LengthInSeconds INT ,
            @DatabaseName VARCHAR(128) ,
            @ProcedureName VARCHAR(128) ,
            @ParsedDataByHour_Hour_Count INT ,
            @ParsedDataByHourRecover_Hour_Count INT ,  --new
            
            @ByHourPartitionNumber INT ,
            @ByHourRecoverPartitionNumber INT ,        --new

            @ArchivedPartitionNumber INT ,
            @Archived_Hour_Count INT ,                 --new
            @PartitionSwitchSQL NVARCHAR(4000) ,
            @StagingParsedDataSQL NVARCHAR(4000),
            @ParsedDataSQL NVARCHAR(4000)

--            ,@YMDID int
--           set @Ymdid=null

        SET @TrackDate = GETDATE()
        SET @LengthInSeconds = 0
        SET @DatabaseName = DB_NAME()        
        SET @ProcedureName = 'dbo.pr_CopyParseDataByHourToParsedData'


/*#############################################################################################
Set up @LocalYMDID 
##############################################################################################*/
        IF @ymdid IS NULL 
            SET @LocalYMDID = CAST(CONVERT(VARCHAR(8), GETDATE() - 1, 112) AS INT)
        
        ELSE 
            SET @LocalYMDID = @YMDID

        SET @ExitYMDID = @LocalYMDID + 1

        PRINT 'LocalYMDID' + CAST(@LocalYMDID AS VARCHAR(10))
        PRINT 'ExitYMDID' + CAST(@exitYMDID AS VARCHAR(10))

/*#############################################################################################
Temporary code to update listins_source to page_category  untill all listins_source is gone
##############################################################################################*/
        
        --IF @LocalYMDID = CAST(CONVERT(VARCHAR(8), GETDATE() - 1, 112) AS INT)
        --begin
        --    begin try
        --    update dbo.ParsedDataByHour
        --    set measuretype='page_category'
        --    where measuretype='listing_source'
        --    and ymdid=@LocalYMDID

        --    update dbo.ParsedDataByHour
        --    set measuretype='unitlayout_id'
        --    where measuretype='unit_id'
        --    and ymdid=@LocalYMDID

        --    end try
        --    begin catch
        --    end Catch
        --end
        --else
        --begin
        --    begin try
        --    update dbo.ParsedDataByHourRecover
        --    set measuretype='page_category'
        --    where measuretype='listing_source'
        --    and ymdid=@LocalYMDID

        --    update dbo.ParsedDataByHourRecover
        --    set measuretype='unitlayout_id'
        --    where measuretype='unit_id'
        --    and ymdid=@LocalYMDID

        --    end try
        --    begin catch
        --    end Catch
        --end
/*#############################################################################################
Exit loop if @LocalYMDID is TODAY
    This while loop only execute once because @ExitYMDID= @localYMDID + 1
    As soon as @LocalYMDID incremented, it will hit while loop exit condition.
    Reason to use while loop is because "Return" , "GoTo" and "Exit" is not available in PDW
##############################################################################################*/
        SET @TrackDate = GETDATE()
        WHILE @localymdid < @ExitYMDID 
            BEGIN  --BEGIN WHILE LOOP
                IF @LocalYMDID = CAST(CONVERT(VARCHAR(8), GETDATE(), 112) AS INT) 
                    BEGIN
                         EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName,
                             @ProcName = @ProcedureName,
                             @StepName = 'Exit StoreProc.  YMDID Can Not Be The Current Date',
                             @VariableStates = @LocalYMDID,
                             @LengthInSeconds = @LengthInSeconds,
                             @Comments = 'Exit Procedure because YMDID is Today''s YMDID' -- varchar(500)
                         SET @TrackDate = GETDATE()

                        PRINT 'Exit';
                        throw  51000, 'Exit Procedure because YMDID is Today''s YMDID', 1;
                        BREAK;
                    END
                 SET @LengthInSeconds = DATEDIFF(ss, @TrackDate,GETDATE())            
                 EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName,
                     @ProcName = @ProcedureName,
                     @StepName = 'Start Proc Copy ParsedData. Set LocalYMDID',
                     @VariableStates = @LocalYMDID,
                     @LengthInSeconds = @LengthInSeconds,
                     @Comments = 'Start Procedure'
                 SET @TrackDate = GETDATE()
        --select * from dbo.logging_storedProcs order by id desc


/*#############################################################################################
Set up @LocalYMDID variable
##############################################################################################*/
  
                SET @ParsedDataByHour_Hour_Count = ISNULL(( SELECT COUNT(DISTINCT LEFT(parseid,10))
                                                     FROM   dbo.parsedDataByHour
                                                     WHERE  ymdid = @LocalYMDID
                                                   ),0)
                PRINT @ParsedDataByHour_Hour_Count

                SET @ParsedDataByHourRecover_Hour_Count = isnull(( SELECT COUNT(DISTINCT LEFT(parseid,10))
                                                     FROM   dbo.parsedDataByHourRecover 
                                                     WHERE  ymdid = @LocalYMDID
                                                   ),0)
                PRINT @ParsedDataByHourRecover_Hour_Count

                SET @ByHourPartitionNumber = ISNULL(( SELECT PartitionNumber
                                                 FROM dbo.vpartitionmetadata
                                                WHERE  tablename = 'ParsedDataByHour'
                                                  AND boundaryValue = @LocalYMDID
                                              ),0)
                PRINT @ByHourPartitionNumber

                SET @ByHourRecoverPartitionNumber = ISNULL(( SELECT PartitionNumber
                                                 FROM dbo.vpartitionmetadata
                                                WHERE  tablename = 'ParsedDataByHourRecover' 
                                                  AND boundaryValue = @LocalYMDID
                                              ),0)
                PRINT @ByHourRecoverPartitionNumber

                SET @ArchivedPartitionNumber = ISNULL(( SELECT PartitionNumber
                                                   FROM dbo.vpartitionmetadata
                                                  WHERE tablename = 'ParsedDataArchived'
                                                    AND boundaryValue = @LocalYMDID
                                               ),0)
                PRINT @ArchivedPartitionNumber

                        
/*#############################################################################################
1,  IF ParsedDataByHour has 24HOURS OF DATA:
    Create parsedData from ParsedDataByHour

2,  IF ParsedDatabyHour do not have the data for specific data and StageDBARchived.dbo.ParsedDataArchived 
    has 24 Hours of data for specific Date:
    Create ParsedData from StageDBArchived.dbo.ParsedDataArchived

3,  IF there is no data in both ParsedDataByHour and StageDBArchived.dbo.ParsedDataArchived:
    EXIT WHILE LOOP.  
4,  Add Dayligh Saving Logic
##############################################################################################*/
                        
                        IF @ParsedDataByHour_Hour_Count = 24
                          or --Day Ligh Saving may not be 24 hours
                          ( 
                               @localymdid=(SELECT CAST(CONVERT(VARCHAR(8),DATEADD(DAY,1,max(ymddate)),112) AS INT) AS FallYMDID
                                              FROM     Dimension.Dates
                                              WHERE    GMTOffset = -4 AND Year = DATEPART(YEAR,GETDATE()))
                           or
                               (@localYmdid=(SELECT   MIN(YMDID) as SpringYMDID
                                              FROM     Dimension.Dates
                                              WHERE    GMTOffset = -4
                                                AND Year = DATEPART(YEAR,GETDATE())
                                             )
                                 and @ParsedDataByHour_Hour_Count >= 23
                                )
                          )
                          or @ParsedDataByHourRecover_Hour_count = 24
                                BEGIN
                                 IF @ParsedDataByHour_Hour_Count in (23, 24)
                                    BEGIN
									    --case 01372922  dedupe
                                        SET @StagingParsedDataSQL = N'CREATE TABLE [staging].[ParsedData] WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([ParseID]),  PARTITION ([YMDID] RANGE LEFT FOR VALUES (0, '
                                            + CAST(@LocalYMDID AS VARCHAR(10))
                                            + ',  20991231))) as select ProfileKey,ParseID,YMDID, EventDate,MeasureType, Measure from (select ProfileKey,ParseID,YMDID, EventDate,MeasureType, Measure , row_number() over (partition by ProfileKey,ParseID,YMDID, EventDate,MeasureType order by measure) as rownum from dbo.parsedDataByHour where ymdid='
                                            + CAST(@localYMDID AS VARCHAR(10)) + ') v where rownum=1;'

                                        SET @ParsedDataSQL = N'CREATE TABLE [dbo].[ParsedData] WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([ParseID]),  PARTITION ([YMDID] RANGE LEFT FOR VALUES (0, '
                                            + CAST(@LocalYMDID AS VARCHAR(10))
                                            + ',  20991231))) as select isnull(ppp.profilekey,p.ProfileKey) as ProfileKey ,p.ParseID, p.YMDID, p.EventDate, P.MeasureType, P.Measure ' 
                                            +' from staging.parsedData p '
                                            +' left join staging.profilekeyParseIDPivot ppp '
                                            +' on p.parseID=ppp.parseID;'
                                    END
                                 ELSE IF @ParsedDataByHourRecover_Hour_Count in (23, 24)
                                    BEGIN
                                         SET @StagingParsedDataSQL = N'CREATE TABLE [staging].[ParsedDataRecover] WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([ParseID]),  PARTITION ([YMDID] RANGE LEFT FOR VALUES (0, '
                                            + CAST(@LocalYMDID AS VARCHAR(10))
											+ ',  20991231))) as select ProfileKey,ParseID,YMDID, EventDate,MeasureType, Measure from (select ProfileKey,ParseID,YMDID, EventDate,MeasureType, Measure , row_number() over (partition by ProfileKey,ParseID,YMDID, EventDate,MeasureType order by measure) as rownum from dbo.parsedDataByHourRecover where ymdid='
                                            + CAST(@localYMDID AS VARCHAR(10)) + ') v where rownum=1;'

                                        SET @ParsedDataSQL = N'CREATE TABLE [dbo].[ParsedDataRecover] WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([ParseID]),  PARTITION ([YMDID] RANGE LEFT FOR VALUES (0, '
                                            + CAST(@LocalYMDID AS VARCHAR(10))
                                            + ',  20991231))) as select isnull(ppp.profilekey,p.ProfileKey) as ProfileKey ,p.ParseID, p.YMDID, p.EventDate, P.MeasureType, P.Measure ' 
                                            +' from staging.parsedDataRecover p '
                                            +' left join staging.profilekeyParseIDPivotRecover ppp '
                                            +' on p.parseID=ppp.parseID;'

                                    END
                                END

                        ELSE IF  (@ParsedDataByHour_Hour_Count = 0) AND (( SELECT COUNT(DISTINCT LEFT(parseid,10))
                                                                             --FROM   dbo.HistoricalparsedData
																			 from dbo.ParsedDataArchived
                                                                            WHERE  ymdid = @LocalYMDID) in (23,24))
                                                                    AND (@ParsedDataByHourRECOVER_Hour_Count = 0)
                               BEGIN
                                SET @StagingParsedDataSQL = N'CREATE TABLE [staging].[ParsedDataRecover] WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([ParseID]),  PARTITION ([YMDID] RANGE LEFT FOR VALUES (0, '
                                    + CAST(@LocalYMDID AS VARCHAR(10))
                                    --+ ',  20991231))) as select * from dbo.HistoricalparsedData where ymdid='
									--+ ',  20991231))) as select * from dbo.HistoricalparsedData where ymdid='
									+ ',  20991231))) as select * from dbo.parsedDataArchived where ymdid='
                                    + CAST(@localYMDID AS VARCHAR(10)) + ';'

                                SET @ParsedDataSQL = N'CREATE TABLE [dbo].[ParsedDataRecover] WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([ParseID]),  PARTITION ([YMDID] RANGE LEFT FOR VALUES (0, '
                                            + CAST(@LocalYMDID AS VARCHAR(10))
                                            + ',  20991231))) as select isnull(ppp.profilekey,p.ProfileKey) as ProfileKey ,p.ParseID, p.YMDID, p.EventDate, P.MeasureType, P.Measure ' 
                                            +' from Staging.parsedDataRecover p '
                                            +' left join staging.profilekeyParseIDPivotRecover ppp '
                                            +' on p.parseID=ppp.parseID;'

                               END
                        ELSE
                            BEGIN
                             SET @LengthInSeconds = DATEDIFF(ss, @TrackDate,GETDATE())
                             EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName,
                                 @ProcName = @ProcedureName,
                                 @StepName = 'Exit StoreProc.  No data from ParsedDataByHour Nor dbo.ParsedDataArchived',
                                 @VariableStates = @LocalYMDID,
                                 @LengthInSeconds = @LengthInSeconds,
                                 @Comments = 'Exit Procedure because Not Enough data ByHour or Archived' -- varchar(500)
                             SET @TrackDate = GETDATE()

                            PRINT 'Exit Proocedure : Need to have 24 Hour of data in either ParsedDataByHour or dbo.ParsedDataArchived';
                            throw  51000, 'Failed Proocedure : Need to have 24 Hour of data in either ParsedDataByHour or dbo.ParsedDataArchived.  Check \\warehouseclu01\d$\ssis\weblog\processed drirectory have 24 hours log file for yesterday', 1;
                            BREAK;
                            END
/*#############################################################################################
First Drop staging.ParsedData , dbo.parsedData ==> Recreate staging.ParsedData, dbo.ParsedData
##############################################################################################*/
  
                        BEGIN TRY
                           IF @LocalYMDID = CAST(CONVERT(VARCHAR(8), GETDATE() - 1, 112) AS INT)
                           or @ParsedDataByHour_Hour_Count = 24
                            DROP TABLE staging.parsedData
                           ELSE
                            DROP table staging.parsedDataRecover

                        END TRY
                        BEGIN CATCH
                        END CATCH

                        BEGIN TRY
                           IF @LocalYMDID = CAST(CONVERT(VARCHAR(8), GETDATE() - 1, 112) AS INT)
                           or @ParsedDataByHour_Hour_Count = 24
                            DROP TABLE staging.ProfileKeyParseIDPivot
                           ELSE
                            DROP TABLE staging.ProfileKeyParseIDPivotRecover

                        END TRY
                        BEGIN CATCH
                        END CATCH


                        PRINT 'before create Staging.ParsedData'
                        PRINT @StagingParsedDataSQL

                        EXECUTE sp_executesql @StagingParsedDataSQL

                        PRINT 'Staging.ParsedData Created'

                         SET @LengthInSeconds = DATEDIFF(ss, @TrackDate,GETDATE())
                         EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName,
                             @ProcName = @ProcedureName,
                             @StepName = @StagingParsedDataSQL,
                             @VariableStates = @LocalYMDID,
                             @LengthInSeconds = @LengthInSeconds,
                             @Comments = @StagingParsedDataSQL
                         SET @TrackDate = GETDATE()

/*#############################################################################################
 Create stging.profileKeyParseIDPivot to find profileKey on all parseid
##############################################################################################*/

                        
                         IF @LocalYMDID = CAST(CONVERT(VARCHAR(8), GETDATE() - 1, 112) AS INT)
                         or @ParsedDataByHour_Hour_Count = 24
                               -- create stageing table with profilekey
                               BEGIN TRY
                                      create table staging.ProfileKeyParseIDPivot
                                        with (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([ParseID]))
                                          as
                                      select  pf.profilekey, pp.parseid
                                        from (select Parseid, [Profile], [SubProfile]
                                                from
                                                (select parseid,measuretype, measure from staging.parseddata where measuretype in ('profile','subprofile')) s
                                               pivot
                                                (min(measure) FOR measuretype in ([profile],[subprofile])) P
                                             ) pp
                                        join conformed.[profile] pf
                                          on pp.profile=pf.profilename and pp.subprofile=pf.subprofilename
                               END TRY
                               BEGIN CATCH
                               END CATCH
                            
                        ELSE
                            
                               -- create stageing table with profilekey
                               BEGIN TRY
                                      create table staging.ProfileKeyParseIDPivotRecover
                                        with (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([ParseID]))
                                          as
                                      select  pf.profilekey, pp.parseid
                                        from (select Parseid, [Profile], [SubProfile]
                                                from
                                                (select parseid,measuretype, measure from staging.parseddataRecover where measuretype in ('profile','subprofile')) s
                                               pivot
                                                (min(measure) FOR measuretype in ([profile],[subprofile])) P
                                             ) pp
                                        join conformed.[profile] pf
                                          on pp.profile=pf.profilename and pp.subprofile=pf.subprofilename
                               END TRY
                               BEGIN CATCH
                               END CATCH
/*#############################################################################################
 Create  dbo.ParsedData or dbo.ParsedDataRecover
##############################################################################################*/
                        BEGIN TRY
                           IF @LocalYMDID = CAST(CONVERT(VARCHAR(8), GETDATE() - 1, 112) AS INT)
                           or @ParsedDataByHour_Hour_Count = 24
                            DROP TABLE dbo.parsedData
                           ELSE
                            DROP table dbo.parsedDataRecover
                        END TRY
                        BEGIN CATCH
                        END CATCH


                        PRINT 'before create dbo.ParsedData'
                        PRINT @ParsedDataSQL

                        EXECUTE sp_executesql @ParsedDataSQL

                        PRINT 'dbo.ParsedData Created'

                         SET @LengthInSeconds = DATEDIFF(ss, @TrackDate,GETDATE())
                         EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName,
                             @ProcName = @ProcedureName,
                             @StepName = @ParsedDataSQL,
                             @VariableStates = @LocalYMDID,
                             @LengthInSeconds = @LengthInSeconds,
                             @Comments = @ParsedDataSQL
                          SET @TrackDate = GETDATE()
/*#############################################################################################
 Create Statistics on dbo.ParsedData or dbo.ParsedDataRecover
##############################################################################################*/
                        BEGIN TRY
                        IF @LocalYMDID = CAST(CONVERT(VARCHAR(8), GETDATE() - 1, 112) AS INT)
                           or @ParsedDataByHour_Hour_Count = 24
                            BEGIN
                                exec [dbo].[pr_CreateStats] 'dbo','ParsedData'
                            END
                        ELSE
                            BEGIN
                                exec [dbo].[pr_CreateStats] 'dbo','ParsedDataRecover'
                            END
                        END TRY
                        BEGIN CATCH
                        END CATCH
/*#############################################################################################
ParsedDataByHour do not have the profileKey.  Switch it out to stagedb.dbo.ParsedDataArchived 
Now, StageDB.dbo.ParsedData is the only table which has correct profileKey
Switch 24 Hours of ParsedDataByHour to ParsedDataArchived  
only if parsedDataByHour has 24 hr data and parsedDataArchived for boundary @LocalYMDID is empty
No Error handling switching partition.  It throw error to procedure
add Dayligh saving logic
##############################################################################################*/

                        IF ((@ParsedDataByHour_Hour_Count = 24 
                               or --Dayligh Saving Logic
                                      ( 
                                           @localymdid=(SELECT CAST(CONVERT(VARCHAR(8),DATEADD(DAY,1,max(ymddate)),112) AS INT) AS FallYMDID
                                                          FROM     Dimension.Dates
                                                          WHERE    GMTOffset = -4 AND Year = DATEPART(YEAR,GETDATE()))
                                       or
                                           (@localYmdid=(SELECT   MIN(YMDID) as SpringYMDID
                                                          FROM     Dimension.Dates
                                                          WHERE    GMTOffset = -4
                                                            AND Year = DATEPART(YEAR,GETDATE())
                                                         )
                                             and @ParsedDataByHour_Hour_Count >= 23
                                            )
                                      )
                             )
                            AND (( SELECT COUNT(DISTINCT LEFT(parseid,10))
                                     FROM   dbo.parsedDataArchived
                                    WHERE  ymdid = @LocalYMDID) = 0)
                           )
                           OR
                           (@ParsedDataByHourRecover_Hour_Count = 24 )

                        BEGIN  --@ParsedDataByHour_Hour_Count = 24
                            /*#############################################################################################
                            StageDB.dbo.ParsedDataArchived must be empty for the ymdid
                            Switch from StageDB.dbo.ParsedDataByhour to StageDB.dbo.ParsedDataArchived
                            ##############################################################################################*/
                            IF @ParsedDataByHour_Hour_Count in (23, 24)
                            SET @PartitionSwitchSQL = N'Alter table dbo.ParsedDataByhour switch partition '
                                + CAST(@ByHourPartitionNumber AS VARCHAR(20))
                                + ' to dbo.ParsedDataArchived partition '
                                + CAST(@ArchivedPartitionNumber AS VARCHAR(20))
                                + ';'
                            IF @ParsedDataByHourRecover_Hour_Count in (23, 24)
                            SET @PartitionSwitchSQL = N'Alter table dbo.ParsedDataByhourRecover switch partition '
                                + CAST(@ByHourRecoverPartitionNumber AS VARCHAR(20))
                                + ' to dbo.ParsedDataArchived partition '
                                + CAST(@ArchivedPartitionNumber AS VARCHAR(20))
                                + ';'
                            PRINT @PartitionSwitchSQL
                            /*#############################################################################################
                            --Move data from stageDB.dbo.parsedDataByHour to StageDB.dbo.ParsedDataArchived
                            ##############################################################################################*/
                             --20170908 RC  do not--  truncate table dbo.ParsedDataArchived
                             EXECUTE sp_executesql @PartitionSwitchSQL
    
                             SET @LengthInSeconds = DATEDIFF(ss, @TrackDate,
                                                                GETDATE())
                             EXEC dbo.pr_Logging_StoredProcs 
                                  @DatabaseName = @DatabaseName,
                                  @ProcName = @ProcedureName,
                                  @StepName = @PartitionSwitchSQL,
                                  @VariableStates = @LocalYMDID,
                                  @LengthInSeconds = @LengthInSeconds,
                                  @Comments = @PartitionSwitchSql
                             SET @TrackDate = GETDATE()

                            --/*#############################################################################################
                            --BackUp ParsedDAta to StageDBARchived.DBO.ParsedDataArchived.  No big table in StageDB.
                            --SqlBackup on StageDB is killing th box
                            --Backup data need to move to StageDBArchived
                            --##############################################################################################*/
                            --DECLARE
                            --@SPLITRangeSQL nvarchar(4000)
                            --/*#############################################################################################
                            ----Step Split Range ALTER TABLE StageDBArchived.dbo.ParsedDataArchived SPLIT RANGE @localymdid 
                            ----Prepare partition to load data into StageDBArchived.dbo.ParsedDataArchived
                            --##############################################################################################*/
                            --BEGIN TRY
                            --        SET @SPLITRangeSQL = N'ALTER TABLE StageDBArchived.dbo.ParsedDataArchived SPLIT RANGE ('+CAST(@LocalYMDID AS VARCHAR)+')'
                            --        --print @SPLITRangeSQL
	                           --     EXECUTE sp_executesql @SPLITRangeSQL
                        
                            --        SET @LengthInSeconds = DATEDIFF(ss, @TrackDate,GETDATE())
                            --        EXEC dbo.pr_Logging_StoredProcs 
                            --             @DatabaseName = @DatabaseName,
                            --             @ProcName = @ProcedureName,
                            --             @StepName = @SPLITRangeSQL,
                            --             @VariableStates = @LocalYMDID,
                            --             @LengthInSeconds = @LengthInSeconds,
                            --             @Comments = @SPLITRangeSQL
                            --        SET @TrackDate = GETDATE()
                            --END TRY
                            --BEGIN CATCH
                            --        SET @LengthInSeconds = DATEDIFF(ss, @TrackDate, GETDATE())
                            --        EXEC dbo.pr_Logging_StoredProcs 
                            --             @DatabaseName = @DatabaseName,
                            --             @ProcName = @ProcedureName,
                            --             @StepName = @SPLITRangeSQL,
                            --             @VariableStates = @LocalYMDID,
                            --             @LengthInSeconds = @LengthInSeconds,
                            --             @Comments = 'FAILED!!!  Split range StageDBArchived.dbo.ParsedDataArchived'
                            --        SET @TrackDate = GETDATE()

                            --END CATCH
                            /*#############################################################################################
                            --STEP   Drop StageDBArchived.[dbo].[ParsedData]. 
                            ##############################################################################################*/
                            --BEGIN TRY
                            --        --print 'Drop table StageDBArchived.[dbo].[ParsedData]'
                            --        IF @LocalYMDID = CAST(CONVERT(VARCHAR(8), GETDATE() - 1, 112) AS INT)
                            --        or @ParsedDataByHour_Hour_Count = 24
                            --            drop table StageDBArchived.[dbo].[ParsedData] 
                            --        ELSE
                            --            drop table StageDBArchived.[dbo].[ParsedDataRecover] 

                            --END TRY
                            --BEGIN CATCH
                            --END CATCH
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
/*#############################################################################################
This Section copy parsedData from 
IF Ymdid is Yesterday
StageDB..ParsedData --> StageDBArchived..ParsedData-->StageDBARchived..ParsedDataArchived
If YMDID is not Yesterday
StageDB..ParsedDataRecover --> StageDBArchived..ParsedDataRecover-->StageDBARchived..ParsedDataArchived
##############################################################################################*/

                           -- DECLARE @MaxCount INTEGER
                           -- DECLARE @Count INTEGER
                           -- DECLARE @Txt VARCHAR(8000)
                           -- DECLARE @partitionValues varchar(8000)
                           -- DECLARE @ArchivedPartitionNbr int
                           -- DECLARE @ParsedPartitionNbr int
                           -- DECLARE @ParsedRecoverPartitionNbr int
                           -- DECLARE @SwitchPartitionSQL  nvarchar(4000)
                           -- DECLARE @StageDBArchived_ParsedDataSQL NVARCHAR(4000)


                           -- SET @Count = 1
                           -- SET @MaxCount = (SELECT count(1) FROM stagedbArchived.dbo.vpartitionmetadata where tablename='parseddataarchived' and boundaryvalue is not null)		 
                           -- SET @Txt = ''
                           -- set @partitionValues=''

                           -- /*#############################################################################################
                           -- --STEP   Construct partitions range base on StageDBArchived.dbo.ParsedDataArchived
                           -- --       PartitionValues come from StageDBArchived.dbo.ParsedDataArchived
                           -- ##############################################################################################*/

                           -- WHILE @Count<=@MaxCount
                           --     BEGIN
                           --     IF @Txt!=''
                           --         SET @Txt=@Txt+',' + (select cast(boundaryvalue as varchar(10))
                           --                                from (SELECT boundaryvalue, rownum=row_number() over (order by boundaryvalue) FROM stagedbArchived.dbo.vpartitionmetadata where tablename='parseddataarchived' and boundaryvalue is not null) o  where rownum=@count)

                           --     ELSE
                           --         SET @Txt=(select cast(boundaryvalue as varchar(10))
                           --                    from (SELECT boundaryvalue, rownum=row_number() over (order by boundaryvalue) FROM stagedbArchived.dbo.vpartitionmetadata where tablename='parseddataarchived' and boundaryvalue is not null) o  where rownum=@count)
                           --     SET @Count=@Count+1
                           --     END

                           --     SET @PartitionValues = (SELECT @Txt)
                           -- --print @partitionvalues
                           -- /*#############################################################################################
                           -- --STEP   CTAS StageDBArchived.[dbo].[ParsedData] from StageDB.dbo.ParsedData (@LocalYMDID)
                           -- ##############################################################################################*/
                           -- -- Older version get data from StageDB..ParsedDataArchived
                           -- --SET @StageDBArchived_ParsedDataSQL = N'CREATE TABLE StageDBArchived.dbo.ParsedData WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([ParseID]),  PARTITION ([YMDID] RANGE LEFT FOR VALUES ('
                           -- --                        + @partitionvalues
                           -- --                        + '))) as select * from StageDB.dbo.parsedDataArchived where ymdid='
                           -- --                        + CAST(@LocalYMDID AS VARCHAR(10)) + ';'
                           -- --New Version get data from stagedb.dbo.ParsedData;
                           -- IF @ParsedDataByHour_Hour_Count = 24
                           -- SET @StageDBArchived_ParsedDataSQL = N'CREATE TABLE StageDBArchived.dbo.ParsedData WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([ParseID]),  PARTITION ([YMDID] RANGE LEFT FOR VALUES ('
                           --                         + @partitionvalues
                           --                         + '))) as select * from StageDB.dbo.parsedData;'
                           -- ELSE IF @ParsedDataByHourRecover_Hour_Count = 24
                           --  SET @StageDBArchived_ParsedDataSQL = N'CREATE TABLE StageDBArchived.dbo.ParsedDataRecover WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([ParseID]),  PARTITION ([YMDID] RANGE LEFT FOR VALUES ('
                           --                         + @partitionvalues
                           --                         + '))) as select * from StageDB.dbo.parsedDataRecover;'

                           -- print @StageDBArchived_ParsedDataSQL
                           -- EXECUTE sp_executesql @StageDBArchived_ParsedDataSQL
                            

                           -- --This partition should be empty
                           -- --What PartitionNumber to switch for StageDBArchived.dbo.ParsedDataArchived
                           -- SET @ArchivedPartitionNbr = ( SELECT Partitionnumber
                           --                                 FROM   StageDBArchived.dbo.vPartitionMetaData
                           --                                WHERE  tablename = 'ParsedDataArchived'
                           --                                  AND boundaryValue = @LocalYmdid
                           --                                            )
                           -- --This partition contain one day of parsedData for @localYMDID
                           -- --What PartitionNumber to switch for StageDBArchived.dbo.ParsedData
                           -- SET @ParsedPartitionNbr = ( SELECT Partitionnumber
                           --                               FROM   StageDBARchived.DBO.vPartitionMetaData
                           --                              WHERE  tablename = 'ParsedData'
                           --                                AND boundaryValue = @LocalYmdid
                           --                                            )
                           -- SET @ParsedRecoverPartitionNbr = ( SELECT Partitionnumber
                           --                               FROM   StageDBARchived.DBO.vPartitionMetaData
                           --                              WHERE  tablename = 'ParsedDataRecover' 
                           --                                AND boundaryValue = @LocalYmdid
                           --                                            )
                           -- /*#############################################################################################
                           -- --STEP   Partition Switch from  StageDBArchived.[dbo].[ParsedData] into StageDBArchived.dbo.ParsedDataArchived
                           -- ##############################################################################################*/
                           -- IF @ParsedDataByHour_Hour_Count = 24
                           -- SET @SwitchPartitionSQL = 'alter table StageDBArchived.dbo.ParsedData  switch partition '+ CAST(isnull(@ParsedPartitionNbr,0) AS VARCHAR(10))
                           --             + ' to StageDBArchived.dbo.ParsedDataArchived partition '+ CAST(isnull(@ArchivedPartitionNbr,0) AS VARCHAR(10)) +';'
                           -- ELSE IF @ParsedDataByHourRecover_Hour_Count = 24
                           -- SET @SwitchPartitionSQL = 'alter table StageDBArchived.dbo.ParsedDataRecover  switch partition '+ CAST(isnull(@ParsedRecoverPartitionNbr,0) AS VARCHAR(10))
                           --             + ' to StageDBArchived.dbo.ParsedDataArchived partition '+ CAST(isnull(@ArchivedPartitionNbr,0) AS VARCHAR(10)) +';'

                           -- DECLARE
                           --     @ParsedDataArchivedYMDIDCount  bigint
                           --    ,@MyEmptyTable NVARCHAR(4000) 
                           --    ,@SQLEmptyOutParsedDataArchived NVARCHAR(4000) 

                           -- SET @ParsedDataArchivedYMDIDCount=(SELECT COUNT(1) FROM StageDBArchived.DBO.ParsedDataArchived where ymdid=@localYMDID )
                           -- IF  @ParsedDataByHourRecover_Hour_Count = 24  -- @ParsedDataByHourRecover_Hour_Count
                           -- BEGIN
                           --    IF @ParsedDataArchivedYMDIDCount <> 0 and @ParsedDataByHourRecover_Hour_Count=24
                           --       BEGIN 
                           --                 SET @MyEmptyTable = ' CREATE TABLE StageDBArchived.[dbo].[ParsedDataArchivedEmpty]'
                           --                     + '  WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([ParseID]),  PARTITION ([YMDID] RANGE LEFT FOR VALUES (0, '
                           --                     + CAST(@LocalYmdid AS VARCHAR(10))
                           --                     + ', 29991231))) '
                           --                     + '  as select * FROM PARSEDdataArchived where 1=0;'
                                             
                           --                  BEGIN TRY
                           --                     DROP TABLE StageDBArchived.[dbo].[ParsedDataArchivedEmpty]
                           --                  END TRY
                           --                  BEGIN CATCH
                           --                  END CATCH
                           --                  EXECUTE sp_executesql @MyEmptyTable
                           --        /********************************************************************************************************
                           --        -- Empty out StageDBArchive.dbo.ParsedDataArchived for @localymdid
                           --        --Next is to switch empty partition(2) from ParsedDataArchivedEmpty to ParsedDataArchived
                           --        *********************************************************************************************************/
                           --        set @SQLEmptyOutParsedDataArchived ='alter table StageDBArchived.dbo.ParsedDataArchived switch partition '
                           --        +Cast(@ArchivedPartitionNbr as VARCHAR(10)) +'  to StageDBArchived.dbo.ParsedDataArchivedEmpty partition  2;' 
                                   
                           --        Print 'Data in ParsedDataArchive, using Partition switch to empty data for @localymdid'
                           --        EXECUTE sp_executesql @SQLEmptyOutParsedDataArchived
                           --       END
                               
                           -- END

                           --/********************************************************************************************************
                           --@SwitchPartitionSQL WAS SET TO = 'alter table StageDBArchived.dbo.ParsedData  switch partition '+ CAST(isnull(@ParsedPartitionNbr,0) AS VARCHAR(10))
                           --+ ' to StageDBArchived.dbo.ParsedDataArchived partition '+ CAST(isnull(@ArchivedPartitionNbr,0) AS VARCHAR(10)) +';'
                           --This step taking data from stageDBArchived.dbo.parsedData switch into ParsedDataArchived
                           --*********************************************************************************************************/
                           -- print 'Now StagedbArchived.dbo.ParsedDataArchived is empty for @localYMDID'
                           -- print 'Move data from stagedbarchived.dbo.parsedData to StagedbArchived.dbo.ParsedDataArchived using partition switch'
                           -- print @SwitchPartitionSQL
                           -- EXECUTE sp_executesql  @SwitchPartitionSQL
                           -- --set @ymd=dateadd(dd,1,@ymd)
                           -- --set @ymdid=cast(convert(varchar(8),@ymd,112) as int)

                                    
                            /*#############################################################################################
                            --STEP   Place Holder FOR truncate StageDB.dbo.ParsedDataArchived
                            ##############################################################################################*/
                            --DECLARE
                            --    @StageDBARchivedRowCount  BIGINT
                            --    ,@StageDBRowCount          BIGINT

                            --SET @StageDBARchivedRowCount = (select count_big(*) from stagedbarchived.dbo.parsedDataarchived where ymdid=@LocalYmdid )
                            --SET @StageDBRowCount = (select count_big(*) from stagedb.dbo.parsedDataarchived where ymdid=@LocalYmdid )
                            ----print @StageDBARchivedRowCount
                            ----print @StageDBRowCount

                            --IF (@StageDBARchivedRowCount > 50000000) and (@StageDBARchivedRowCount=@StageDBRowCount)
                            --BEGIN
                            --    PRINT 'Truncate Table StageDB.dbo.ParsedDataArchived'
                            --    Truncate table  StageDB.dbo.ParsedDataArchived
                            --    SET @LengthInSeconds = DATEDIFF(ss, @TrackDate, GETDATE())
                            --    EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName, -- varchar(128)
                            --        @ProcName = @ProcedureName,
                            --        @StepName = 'Try to Truncate Table StageDB.dbo.ParsedDataArchived',
                            --        @VariableStates = @LocalYMDID, 
                            --        @LengthInSeconds = @LengthInSeconds,
                            --        @Comments = 'SUCCESS!! RowCount between tow ParsedDataArchived are the same AND greater than 50000000'
                            --    SET @TrackDate = GETDATE()

                            --END
                            --ELSE
                            --BEGIN
                            --    PRINT 'RowCount between tow ParsedDataArchived are not the same  '
                            --    SET @LengthInSeconds = DATEDIFF(ss, @TrackDate, GETDATE())
                            --    EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName, -- varchar(128)
                            --        @ProcName = @ProcedureName,
                            --        @StepName = 'Try to Truncate Table StageDB.dbo.ParsedDataArchived',
                            --        @VariableStates = @LocalYMDID, 
                            --        @LengthInSeconds = @LengthInSeconds,
                            --        @Comments = 'FAILED!! RowCount between tow ParsedDataArchived are not the same '
                            --    SET @TrackDate = GETDATE()
                            --END


/*#############################################################################################
End Section  to copy data from StageDB to StageDBArchived.
##############################################################################################*/
--<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

                        END    --if @ParsedDataByHour_Hour_Count = 24
  

                SET @localYmdid = @localYMDID + 1
            END  -- END WHILE LOOP
/*#############################################################################################
Empty Out DATA WHICH IS OLDER THAN 40 DAYS IN ParsedDataArchived => where ymdid= getdate()-41
##############################################################################################*/
        --DECLARE @ToEmptyPartitionYmdid INT ,
        --    @ToDropArchivedPartitionNbr INT ,
        --    @SQLEmptyTable NVARCHAR(4000) ,
        --    @SQLSwitchEmptyPartition NVARCHAR(4000)
        --BEGIN
        --    --select CAST(CONVERT(VARCHAR(8), GETDATE()- 41, 112) AS INT)
        --    SET @ToEmptyPartitionYmdid = CAST(CONVERT(VARCHAR(8), GETDATE()- 41, 112) AS INT)

        --    PRINT @ToEmptyPartitionYmdid

        --    BEGIN TRY
        --        DROP TABLE StageDBArchived.dbo.[Empty]
        --    END TRY
        --    BEGIN CATCH
        --    END CATCH

        --    SET @SQLEmptyTable = ' CREATE TABLE StageDBArchived.[dbo].[Empty]'
        --        + '  WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([ParseID]),  PARTITION ([YMDID] RANGE LEFT FOR VALUES (0, '
        --        + CAST(@ToEmptyPartitionYmdid AS VARCHAR(10))
        --        + ', 29991231))) '
        --        + '  as select * FROM PARSEDdataArchived where 1=0;'
        --    PRINT @SQLEmptyTable
            
        --    BEGIN TRY
        --        EXECUTE sp_executesql @SQLEmptyTable
        --    END TRY
        --    BEGIN CATCH
        --        SET @LengthInSeconds = DATEDIFF(ss, @TrackDate, GETDATE())
        --        EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName, -- varchar(128)
        --            @ProcName = @ProcedureName,
        --            @StepName = 'CREATE StageDBArchived.DBO.EMPTY',
        --            @VariableStates = @LocalYMDID, 
        --            @LengthInSeconds = @LengthInSeconds,
        --            @Comments = 'FAILED!!'
        --        SET @TrackDate = GETDATE()

        --    END CATCH


        --    SET @ToDropArchivedPartitionNbr = ( SELECT Partitionnumber
        --                                         FROM   StageDBArchived.dbo.vPartitionMetaData
        --                                         WHERE  tablename = 'parsedDataArchived'
        --                                                AND boundaryValue = @ToEmptyPartitionYmdid
        --                                       )
            
        --    SET @SQLSwitchEmptyPartition = 'alter table StageDBArchived.dbo.ParsedDataArchived  switch partition '
        --        + CAST(@ToDropArchivedPartitionNbr AS VARCHAR(10))
        --        + ' to StageDBArchived.dbo.Empty partition 2;'

        --    IF @SQLSwitchEmptyPartition IS NOT NULL 
        --        BEGIN TRY
        --            PRINT @SQLSwitchEmptyPartition
        --            EXECUTE sp_executesql @SQLSwitchEmptyPartition
        --            PRINT 'Partition Switch Completed'
        --            drop table StageDBArchived.[dbo].[Empty]
        --            SET @LengthInSeconds = DATEDIFF(ss, @TrackDate, GETDATE())
        --            EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName, -- varchar(128)
        --                @ProcName = @ProcedureName,
        --                @StepName = 'PARTITION SWITCH BETWEEN StageDBArchived.dbo.PARSEDDATAARCHIVED AND StageDBArchived.DBO.EMPTY',
        --                @VariableStates = @ToEmptyPartitionYmdid, 
        --                @LengthInSeconds = @LengthInSeconds,
        --                @Comments = 'SUCCESS!'
        --            SET @TrackDate = GETDATE()
        --        END TRY
        --        BEGIN CATCH
        --            PRINT 'FAILED!  ' + @SQLSwitchEmptyPartition
        --            SET @LengthInSeconds = DATEDIFF(ss, @TrackDate, GETDATE())
        --            EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName, -- varchar(128)
        --                @ProcName = @ProcedureName,
        --                @StepName = 'PARTITION SWITCH BETWEEN StageDBArchived.dbo.PARSEDDATAARCHIVED AND StageDBArchived.DBO.EMPTY',
        --                @VariableStates = @ToEmptyPartitionYmdid, 
        --                @LengthInSeconds = @LengthInSeconds,
        --                @Comments = 'FAILED!'
        --            SET @TrackDate = GETDATE()
        --        END CATCH
        --    ELSE 
        --        BEGIN
        --        PRINT 'StageDBArchive.dbo.ParsedDataArchive BoundaryValue '
        --            + CAST(@ToEmptyPartitionYmdid AS VARCHAR(10))
        --            + ' does not exists'

        --            SET @LengthInSeconds = DATEDIFF(ss, @TrackDate, GETDATE())
        --            EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName, -- varchar(128)
        --                @ProcName = @ProcedureName,
        --                @StepName = 'PARTITION SWITCH BETWEEN StageDBArchived.dbo.PARSEDDATAARCHIVED AND StageDBArchived.DBO.EMPTY',
        --                @VariableStates = @ToEmptyPartitionYmdid, 
        --                @LengthInSeconds = @LengthInSeconds,
        --                @Comments = 'BOUNDARY VALUE DOES NOT EXISTS'
        --            SET @TrackDate = GETDATE()

        --        END

        --END

         SET @LengthInSeconds = DATEDIFF(ss, @TrackDate, GETDATE())
         EXEC dbo.pr_Logging_StoredProcs 
              @DatabaseName = @DatabaseName, -- varchar(128)
              @ProcName = @ProcedureName, -- varchar(128)
              @StepName = 'End Procedure Copy ParsedDataByHour', -- varchar(128)
              @VariableStates = @LocalYMDID, -- varchar(500)
              @LengthInSeconds = @LengthInSeconds, -- int
              @Comments = 'SUCCESS!!  End Procedure [pr_CopyParseDataByHourToParsedData]' -- varchar(500)

		 BEGIN TRY
              DROP INDEX [cidx_parseid] ON [dbo].[ParsedDataByHour];
			  SET @LengthInSeconds = DATEDIFF(ss, @TrackDate, GETDATE())
              EXEC dbo.pr_Logging_StoredProcs 
              @DatabaseName = @DatabaseName, -- varchar(128)
              @ProcName = @ProcedureName, -- varchar(128)
              @StepName = 'Drop index ParsedDataByHour', -- varchar(128)
              @VariableStates = @LocalYMDID, -- varchar(500)
              @LengthInSeconds = @LengthInSeconds, -- int
              @Comments = 'SUCCESS!!  Drop index ParsedDataByHour' -- varchar(500)

         END TRY
         BEGIN CATCH
         END CATCH
         BEGIN TRY
             CREATE CLUSTERED COLUMNSTORE INDEX [cidx_parseid] ON [dbo].[ParsedDataByHour] WITH (DROP_EXISTING = OFF);
			  SET @LengthInSeconds = DATEDIFF(ss, @TrackDate, GETDATE())
              EXEC dbo.pr_Logging_StoredProcs 
              @DatabaseName = @DatabaseName, -- varchar(128)
              @ProcName = @ProcedureName, -- varchar(128)
              @StepName = 'Recreate Column store index ParsedDataByHour', -- varchar(128)
              @VariableStates = @LocalYMDID, -- varchar(500)
              @LengthInSeconds = @LengthInSeconds, -- int
              @Comments = 'SUCCESS!!  Recreate index ParsedDataByHour' -- varchar(500)

         END TRY
         BEGIN CATCH
         END CATCH




END  --End Procedure








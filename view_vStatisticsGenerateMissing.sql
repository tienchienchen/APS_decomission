USE [RentPath]
GO

/****** Object:  View [dbo].[vStatisticsGenerateMissing]    Script Date: 9/22/2017 8:21:52 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vStatisticsGenerateMissing] AS WITH T
AS
(
SELECT  t.name              AS TableName
,		t.max_column_id_used
,		s.name              AS [Table_Schema_name]
,		c.name              AS [ColumnName]
,		c.column_id         AS [Column_ID]
,		t.object_ID         AS [Object_ID]
FROM sys.tables t
JOIN sys.schemas s ON t.Schema_ID = s.Schema_ID
JOIN sys.columns c ON t.Object_ID = c.Object_ID
LEFT JOIN sys.stats_columns l      ON  l.Object_ID = c.Object_ID
                                   AND l.Column_ID = c.Column_ID
								   AND l.stats_column_ID = 1
WHERE  l.object_ID IS NULL
)
SELECT Table_Schema_name AS TableSchemaName
,      TableName
,      ColumnName
,      Column_ID AS ColumnID
,      Object_ID AS ObjectID
,      'CREATE STATISTICS Stat_'+Table_Schema_name+'_'+TableName+'_'+ColumnName+' ON '+Table_Schema_name+'.'+TableName+'('+ColumnName+')' AS CreateStat
,      'CREATE STATISTICS Stat_'+Table_Schema_name+'_'+TableName+'_'+ColumnName+' ON '+Table_Schema_name+'.'+TableName+'('+ColumnName+') WITH FULLSCAN' AS CreateStatFull
,		ROW_NUMBER()OVER(PARTITION BY Table_Schema_Name,TableName ORDER BY TableName,ColumnName) AS RowNumber
FROM T;
GO



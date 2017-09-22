USE [RentPath]
GO

/****** Object:  View [dbo].[vReHydrateStats]    Script Date: 9/22/2017 8:21:14 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vReHydrateStats] AS WITH
M1 
AS
(
SELECT a.*
FROM 
    (
    SELECT a.Object_ID
    ,      a.name     AS StatName
    ,      a.Stats_ID
    ,      a.filter_definition
    FROM   sys.stats a 
    JOIN   sys.stats_columns l ON  a.Object_id = l.Object_ID 
          				       AND a.stats_id  = l.stats_ID
    GROUP BY a.Object_ID
    ,        a.name
    ,		 a.Stats_ID
    ,        a.filter_definition
    ) a                    --All Statistics Objects
LEFT JOIN  sys.indexes i       ON  a.Object_ID = i.Object_ID
                               AND a.StatName = i.name
WHERE i.Object_ID is NULL  --Not an Index Generated Stat
)
,M2 AS
(
SELECT  s.name AS TableSchemaName
,       t.name AS TableName
,       M1a.Object_ID
,		M1a.StatName
,       M1a.Stats_ID
,       '('+MAX(M1a.Column_1)+MAX(M1a.Column_2)+MAX(M1a.Column_3)+MAX(M1a.Column_4)+MAX(M1a.Column_5)+')' AS Stat_Columns
,       M1a.filter_definition
FROM    (
        SELECT a.Object_ID
        ,      a.StatName
        ,      a.stats_id
        ,      CASE WHEN l.Stats_Column_id = 1 THEN     c.name ELSE '' END as Column_1
        ,      CASE WHEN l.Stats_Column_id = 2 THEN ','+c.name ELSE '' END as Column_2
        ,      CASE WHEN l.Stats_Column_id = 3 THEN ','+c.name ELSE '' END as Column_3
        ,      CASE WHEN l.Stats_Column_id = 4 THEN ','+c.name ELSE '' END as Column_4
        ,      CASE WHEN l.Stats_Column_id = 5 THEN ','+c.name ELSE '' END as Column_5
        ,       a.filter_definition
        FROM M1 a 
        JOIN sys.stats_columns l ON  a.Object_id  = l.Object_ID 
        						 AND a.stats_id   = l.stats_ID
        JOIN sys.columns c       ON  l.object_ID  = c.object_ID
                                 AND l.column_Id  = c.column_ID
        ) M1a
JOIN	sys.tables t ON M1a.Object_ID = t.Object_ID
JOIN    sys.schemas s ON t.Schema_ID = s.Schema_ID
GROUP BY
        s.name
,       t.name 
,       M1a.Object_ID
,		M1a.StatName
,       M1a.Stats_ID
,       M1a.filter_definition
)
SELECT TableName
,TableSchemaName
,StatName
, 'CREATE STATISTICS '+StatName+' ON '+TableSchemaName+'.'+TableName+Stat_Columns+ISNULL(' WHERE '+[filter_definition],'')  AS CreateStats
,   'UPDATE STATISTICS '+TableSchemaName+'.'+TableName+'('+StatName+') WITH RESAMPLE' AS UpdateStats
,   'UPDATE STATISTICS '+TableSchemaName+'.'+TableName+'('+StatName+') WITH FULLSCAN' AS UpdateStatsFullscan
,   'DROP STATISTICS '+TableSchemaName+'.'+TableName+'.'+StatName AS DropStats
,	ROW_NUMBER()OVER(PARTITION BY TableSchemaName,TableName ORDER BY TableName,StatName) AS RowNumber
FROM M2;
GO



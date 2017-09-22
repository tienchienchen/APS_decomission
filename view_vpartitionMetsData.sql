USE [RentPath]
GO

/****** Object:  View [dbo].[vPartitionMetaData]    Script Date: 9/22/2017 8:19:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vPartitionMetaData] AS SELECT 	t.name AS TableName
, 		i.name										AS IndexName
, 		p.partition_number							AS PartitionNumber
,		p.partition_id								AS PartitionID
,		p.rows										AS Rows
,		i.data_space_id								AS DataSpaceID
,		f.function_id								AS FunctionID
,		f.type_desc									AS TypeDesc
,		f.boundary_value_on_right					AS BoundaryValueOnRight
,		r.boundary_id								AS BoundaryID
,		r.value										AS BoundaryValue
FROM sys.tables AS t
JOIN sys.indexes AS i						ON 	t.object_id = i.object_id
JOIN sys.partitions AS p					ON 	i.object_id = p.object_id 
											AND i.index_id = p.index_id 
JOIN  sys.partition_schemes AS s 			ON 	i.data_space_id = s.data_space_id
JOIN sys.partition_functions AS f 			ON 	s.function_id = f.function_id
LEFT JOIN sys.partition_range_values AS r 	ON 	f.function_id = r.function_id 
											AND r.boundary_id = p.partition_number
WHERE i.index_id <= 1;
GO



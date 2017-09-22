USE [RentPath]
GO

/****** Object:  View [dbo].[vPartitions_logical]    Script Date: 9/22/2017 8:20:34 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vPartitions_logical] AS SELECT 	t.[object_id]				AS Table_id
,		t.name						AS Table_Name
, 		i.name						AS Index_Name
,		i.index_id					AS Index_id
, 		p.partition_number
,		p.[partition_id]
,		p.[rows]
,		i.data_space_id
,		f.function_id
,		f.type_desc
,		f.boundary_value_on_right
,		CASE f.boundary_value_on_right
		WHEN 1 THEN 'RIGHT'
		WHEN 0 THEN 'LEFT'
		ELSE '%ERR%'
		END							AS Boundary_Value_on_Right_desc
,		r.boundary_id
,		r.value						AS Boundary_Value
,		pp.parameter_id
,		pp.system_type_id
,		pp.user_type_id
,		pp.max_length				AS param_max_length
,		pp.[precision]				AS param_precision	
,		pp.scale					AS param_scale
,		pp.collation_name			AS param_collation_name
,		y.name						AS datatype_name
,		y.max_length				AS datatype_max_length
,		y.[precision]				AS datatype_precision	
,		y.scale						AS datatype_scale
,		y.collation_name			AS datatype_collation_name
FROM sys.tables AS t
JOIN sys.indexes AS i						ON 	t.object_id = i.object_id
JOIN sys.partitions AS p					ON 	i.object_id = p.object_id 
											AND i.index_id = p.index_id 
LEFT JOIN sys.partition_schemes AS s 		ON 	i.data_space_id = s.data_space_id
LEFT JOIN sys.partition_functions AS f 		ON 	s.function_id = f.function_id
LEFT JOIN sys.partition_range_values AS r 	ON 	f.function_id = r.function_id 
											AND r.boundary_id = p.partition_number
lEFT JOIN sys.partition_parameters AS pp	ON	pp.function_id = s.function_id 
LEFT JOIN sys.types AS y					ON	y.user_type_id = pp.user_type_id 
WHERE i.type <= 1;
GO



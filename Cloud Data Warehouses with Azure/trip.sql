IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
	WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
	       FORMAT_OPTIONS (
			 FIELD_TERMINATOR = ',',
			 USE_TYPE_DEFAULT = FALSE
			))
GO

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'quangproject1_quangproject1_dfs_core_windows_net') 
	CREATE EXTERNAL DATA SOURCE [quangproject1_quangproject1_dfs_core_windows_net] 
	WITH (
		LOCATION = 'abfss://quangproject1@quangproject1.dfs.core.windows.net', 
		TYPE = HADOOP 
	)
GO

CREATE EXTERNAL TABLE dbo.staging_trip (
	[trip_id] nvarchar(500),
	[rideable_type] nvarchar(500),
	[start_at] varchar(50),
	[ended_at] varchar(50),
	[start_station_id] nvarchar(500),
	[end_station_id] nvarchar(500),
	[rider_id] bigint
	)
	WITH (
	LOCATION = 'publictrip.txt',
	DATA_SOURCE = [quangproject1_quangproject1_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO


SELECT TOP 100 * FROM dbo.staging_trip
GO
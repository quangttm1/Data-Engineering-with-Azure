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

CREATE EXTERNAL TABLE dbo.staging_rider (
	[rider_id] bigint,
	[first] nvarchar(500),
	[last] nvarchar(500),
	[address] nvarchar(500),
	[birthday] varchar(50),
	[account_start_date] varchar(50),
	[account_end_date] varchar(50),
	[is_member] bit
	)
	WITH (
	LOCATION = 'publicrider.txt',
	DATA_SOURCE = [quangproject1_quangproject1_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO


SELECT TOP 100 * FROM dbo.staging_rider
GO
CREATE TABLE [dbo].[GeoDistrict]
(
	[Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY, 
    [DistrictCode] VARCHAR(MAX) NULL, 
    [DistrictName] VARCHAR(MAX) NULL, 
    [StateCode] VARCHAR(MAX) NULL, 
    [BusinessCenter] VARCHAR(MAX) NULL,
	[CreatedTimeStamp][datetime] NOT NULL,
	[UpdatedTimeStamp][datetime] NOT NULL,
	[CreatedBy] [varchar](max) NULL,
	[UpdatedBy] [varchar](max) NULL,
	[IsActive][bit] NULL
)

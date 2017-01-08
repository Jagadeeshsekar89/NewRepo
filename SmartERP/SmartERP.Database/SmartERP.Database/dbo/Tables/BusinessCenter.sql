CREATE TABLE [dbo].[BusinessCenter]
(
	[Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY, 
    [BusinessCenterCode] VARCHAR(MAX) NULL, 
    [BusinessCenterName] VARCHAR(MAX) NULL, 
    [DistrictCode] VARCHAR(MAX) NULL,
	[CreatedTimeStamp][datetime] NOT NULL,
	[UpdatedTimeStamp][datetime] NOT NULL,
	[CreatedBy] [varchar](max) NULL,
	[UpdatedBy] [varchar](max) NULL,
	[IsActive][bit] NULL
)

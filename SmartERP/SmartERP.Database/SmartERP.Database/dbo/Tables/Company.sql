CREATE TABLE [dbo].[Company]
(
	[Id] INT  IDENTITY(1,1) NOT NULL PRIMARY KEY, 
    [CompanyCode] NVARCHAR(MAX) NOT NULL, 
    [CompanyName] NVARCHAR(MAX) NOT NULL, 
    [ShortName] NVARCHAR(MAX) NOT NULL, 
    [CountryCode] NVARCHAR(MAX) NOT NULL,
	[CreatedTimeStamp][datetime] NOT NULL,
	[UpdatedTimeStamp][datetime] NOT NULL,
	[CreatedBy] [varchar](max) NULL,
	[UpdatedBy] [varchar](max) NULL,
	[IsActive][bit] NULL,
)

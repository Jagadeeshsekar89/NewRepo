CREATE TABLE [dbo].[Country]
(
	[Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	CountryCode Nvarchar(MAX) NOT NULL,
	CountryName Nvarchar(MAX) NOT NULL,
	ShortName Nvarchar(MAX) NOT NULL,
	TimezoneCode Nvarchar(MAX) NOT NULL,
	DefaultLanguageCode	Nvarchar(MAX) NOT NULL,
	[CreatedTimeStamp][datetime] NOT NULL,
	[UpdatedTimeStamp][datetime] NOT NULL,
	[CreatedBy] [varchar](max) NULL,
	[UpdatedBy] [varchar](max) NULL,
	[IsActive][bit] NULL,
)

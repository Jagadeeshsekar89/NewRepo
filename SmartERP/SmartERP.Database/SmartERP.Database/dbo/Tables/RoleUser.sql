
CREATE TABLE [dbo].[RoleUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleCode] [varchar](max) NULL,
[UserCode] [varchar](max) NULL,
[CompanyFilter] [varchar](max) NULL,
[CompanyCodes] [varchar](max) NULL,
[SBUFilter] [varchar](max) NULL,
[SBUCodes] [varchar](max) NULL,
[DivisonFilter] [varchar](max) NULL,
[DivisionCodes] [varchar](max) NULL,
[ZoneFilter] [varchar](max) NULL,
[ZoneCodes] [varchar](max) NULL,
[BranchFilter] [varchar](max) NULL,
[BranchCodes] [varchar](max) NULL,
[CreatedTimeStamp][datetime] NOT NULL,
[UpdatedTimeStamp][datetime] NOT NULL,
[CreatedBy] [varchar](max) NULL,
[UpdatedBy] [varchar](max) NULL,
[IsActive][bit] NULL,


 CONSTRAINT [PK_dbo.RoleUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
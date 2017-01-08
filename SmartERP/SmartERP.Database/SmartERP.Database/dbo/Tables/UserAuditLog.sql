CREATE TABLE [dbo].[UserAuditLog]
(
[Id] [int] IDENTITY(1,1) NOT NULL,
[ActionType] [varchar](max) NOT NULL,
[ActionByUserCode] [int] NOT NULL,
[UserCode] [int] NOT NULL,
[RoleCode] [int] NULL,
[BranchCode] [int] NULL,
[CreatedTimeStamp][datetime] NOT NULL,
[UpdatedTimeStamp][datetime] NOT NULL,
[CreatedBy] [varchar](max) NULL,
[UpdatedBy] [varchar](max) NULL,
[IsActive][bit] NULL

 CONSTRAINT [PK_dbo.UserAuditLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
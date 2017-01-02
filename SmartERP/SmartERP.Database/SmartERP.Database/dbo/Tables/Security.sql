
CREATE TABLE [dbo].[Security](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MinLength][int] NULL,
[MaxLength][int] NULL,
[ExpiryDays][int] NULL,
[LockoutCount][int] NULL,
[SessionTimeoutWorkforce][int] NULL,
[SessionTimeoutOthers][int] NULL,
[IsAlphaMust] [bit] NULL, 
[IsNumericMust][bit] NULL,
[IsSplCharMust][bit] NULL,
[IsFirstPwdChange][bit] NULL,
[IsVirtualKeyboard][bit] NULL,
[IsIpRestricted][bit] NULL,
[IsCaptchaRequired][bit] NULL,
[IsForgotPassword][bit] NULL,
[IsCloseBrowser][bit] NULL,
[IsAutoLogout][bit] NULL,
[IpAddress] [varchar](max) NULL,
[RemoteAccess] [varchar](max) NULL,
[CreatedTimeStamp][datetime] NOT NULL,
[UpdatedTimeStamp][datetime] NOT NULL,
[CreatedBy] [varchar](max) NULL,
[UpdatedBy] [varchar](max) NULL,
[IsActive][bit] NULL,
 
    CONSTRAINT [PK_dbo.Security] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

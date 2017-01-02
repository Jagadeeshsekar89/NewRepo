CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
[UserCode] [varchar](max) NULL,
[FirstName] [varchar](max) NULL,
[LastName] [varchar](max) NULL,
[SSO] [varchar](max) NULL,
[Username] [varchar](max) NULL,
[Password] [varchar](max) NULL,
[PasswordExpiryDate] [datetime] NULL,
[IsDefaultPassword] [bit] NULL,
[EmployeeID] [varchar](max) NULL,
[EmailID] [varchar](max) NULL,
[CreatedTimeStamp][datetime] NOT NULL,
[UpdatedTimeStamp][datetime] NOT NULL,
[CreatedBy] [varchar](max) NULL,
[UpdatedBy] [varchar](max) NULL,
[IsActive][bit] NULL,

 [MobileNumber] VARCHAR(MAX) NULL, 
    [ImageUrl] VARCHAR(MAX) NULL, 
    [IsLocked] BIT NULL, 
    CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
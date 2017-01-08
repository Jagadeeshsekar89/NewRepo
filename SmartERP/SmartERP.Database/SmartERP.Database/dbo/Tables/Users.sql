CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[SSO] [bit] NOT NULL,
	[Username] [varchar](100) NULL,
	[Password] [varchar](64) NOT NULL,
	[EmployeeID] [varchar](50) NULL,
	[MobileNumber] [varchar](15) NULL,
	[EmailID] [varchar](100) NOT NULL,
	[PasswordExpiryDate] [datetime] NULL,
	[IsDefaultPassword] [bit] NULL,
	[CreatedTimeStamp][datetime] NOT NULL,
	[UpdatedTimeStamp][datetime] NOT NULL,
	[CreatedBy] [varchar](max) NULL,
	[UpdatedBy] [varchar](max) NULL,
	[IsActive][bit] NULL,
    [ImageUrl] VARCHAR(MAX) NULL, 
    [IsLocked] BIT NULL, 
    CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
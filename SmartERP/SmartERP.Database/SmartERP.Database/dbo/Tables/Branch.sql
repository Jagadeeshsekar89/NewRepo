CREATE TABLE [dbo].[Branch](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LedgerCode] [int] NOT NULL,
	[BranchName] [varchar](100) NOT NULL,
	[ShortName] [char](3) NOT NULL,
	[CompanyCode] [int] NOT NULL,
	[AddressCode] [int] NOT NULL,
	[DebitBillControlDays] [int] NOT NULL,
	[SalesControlDays] [int] NOT NULL,
	[TotalCreditLimitAllowed] [int] NOT NULL,
	[CharityApplicable] [bit] NOT NULL,
	[CharityPercentage] [numeric](18, 2) NOT NULL,
	[BarCodeStatus] [bit] NOT NULL,
	[ServiceUnit] [bit] NOT NULL,
	[PackingUnit] [bit] NOT NULL,
	[ItemCodePrinting] [bit] NOT NULL,
	[PrintSerialNumber] [bit] NOT NULL,
	[TotalOutstandingAmount] [numeric](18, 2) NOT NULL,
	[Customer_SalesAllowed] [bit] NOT NULL,
	[Customer_DiscountAllowed] [bit] NOT NULL,
	[CreatedTimeStamp][datetime] NOT NULL,
[UpdatedTimeStamp][datetime] NOT NULL,
[CreatedBy] [varchar](max) NULL,
[UpdatedBy] [varchar](max) NULL,
[IsActive][bit] NULL

 CONSTRAINT [PK_dbo.Branch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
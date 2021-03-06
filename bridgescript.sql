USE [BridgeDB_test]
GO
/****** Object:  Table [dbo].[AccountDocumentType]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountDocumentType](
	[DocumentTypeCode] [int] IDENTITY(1,1) NOT NULL,
	[DocumentTypeName] [varchar](100) NOT NULL,
	[TransactionCode] [char](3) NOT NULL,
	[AllowPreviousFYEntry] [char](1) NOT NULL,
	[Active] [char](1) NULL,
 CONSTRAINT [PK_AccountDocumentType] PRIMARY KEY CLUSTERED 
(
	[DocumentTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AccountDocumentTypeNumber]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountDocumentTypeNumber](
	[BranchCode] [int] NOT NULL,
	[DocumentTypeCode] [int] NOT NULL,
	[PeriodCode] [int] NOT NULL,
	[StartingNo] [int] NOT NULL,
	[LastNumber] [int] NOT NULL,
 CONSTRAINT [PK_AccountDocumentTypeNumber] PRIMARY KEY CLUSTERED 
(
	[BranchCode] ASC,
	[DocumentTypeCode] ASC,
	[PeriodCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AccountLedgerSummary]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountLedgerSummary](
	[BranchCode] [int] NOT NULL,
	[LedgerCode] [int] NOT NULL,
	[CurrentBalance] [numeric](18, 2) NOT NULL,
	[CurrentbalanceNature] [char](1) NULL,
	[CurrentAdvanceBalance] [numeric](18, 2) NOT NULL,
	[CurrentMPOAdvance] [numeric](18, 2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AccountPeriod]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountPeriod](
	[PeriodCode] [int] IDENTITY(1,1) NOT NULL,
	[CompanyCode] [int] NOT NULL,
	[PeriodFrom] [smalldatetime] NOT NULL,
	[PeriodTo] [smalldatetime] NOT NULL,
	[Active] [char](1) NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [smalldatetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_AccountPeriod] PRIMARY KEY CLUSTERED 
(
	[PeriodCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Address]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressCode] [int] IDENTITY(1,1) NOT NULL,
	[AddressType_LookupKeyCode] [int] NOT NULL,
	[Address1] [varchar](100) NOT NULL,
	[Address2] [varchar](100) NOT NULL,
	[Area] [varchar](100) NOT NULL,
	[CityCode] [int] NOT NULL,
	[OtherCityName] [varchar](100) NULL,
	[StateCode] [int] NOT NULL,
	[CountryCode] [int] NOT NULL,
	[PinCode] [varchar](6) NOT NULL,
	[ContactPerson] [varchar](100) NULL,
	[MobileNo] [varchar](10) NULL,
	[EmailID] [varchar](100) NULL,
	[Phone_STD] [varchar](10) NULL,
	[Phone_No] [varchar](10) NULL,
	[Active] [char](1) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[ModifiedDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BankList]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankList](
	[Bankcode] [int] IDENTITY(1,1) NOT NULL,
	[BankName] [varchar](100) NOT NULL,
	[BranchName] [varchar](100) NOT NULL,
	[AddressCode] [int] NOT NULL,
	[Active] [char](1) NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [smalldatetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_BankList] PRIMARY KEY CLUSTERED 
(
	[Bankcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Branch]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[BranchCode] [int] IDENTITY(1,1) NOT NULL,
	[LedgerCode] [int] NOT NULL,
	[BranchName] [varchar](100) NOT NULL,
	[ShortName] [char](3) NOT NULL,
	[CompanyCode] [int] NOT NULL,
	[AddressCode] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
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
	[Customer_DiscountAllowed] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BranchAccountPeriod]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BranchAccountPeriod](
	[PeriodCode] [int] NOT NULL,
	[BranchCode] [int] NOT NULL,
	[ClosureStatus] [char](1) NOT NULL,
	[CalendarTemplateCode] [int] NOT NULL,
 CONSTRAINT [PK_BranchAccountPeriod] PRIMARY KEY CLUSTERED 
(
	[PeriodCode] ASC,
	[BranchCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BranchBusinessCenter]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BranchBusinessCenter](
	[BranchCode] [int] NOT NULL,
	[BusinessCentrerCode] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BranchControls]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BranchControls](
	[BranchCode] [int] NOT NULL,
	[ProductClassificationCode] [int] NOT NULL,
	[CashDiscountApplicable] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BranchHolidayCalendarTemplate]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BranchHolidayCalendarTemplate](
	[CalendarTemplateCode] [int] IDENTITY(1,1) NOT NULL,
	[PeriodCode] [int] NOT NULL,
	[CalendarTemplateName] [varchar](100) NOT NULL,
	[Active] [char](1) NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [smalldatetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_BranchHolidayCalendarTemplate] PRIMARY KEY CLUSTERED 
(
	[CalendarTemplateCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BranchHolidayCalendarTemplateDates]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BranchHolidayCalendarTemplateDates](
	[CalendarTemplateDetailCode] [int] IDENTITY(1,1) NOT NULL,
	[CalendarTemplateCode] [int] NOT NULL,
	[CalendarDate] [smalldatetime] NOT NULL,
	[DayType] [char](1) NOT NULL,
 CONSTRAINT [PK_BranchHolidayCalendarTemplateDates] PRIMARY KEY CLUSTERED 
(
	[CalendarTemplateDetailCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BusinessCenter]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessCenter](
	[BusinessCenterCode] [int] IDENTITY(1,1) NOT NULL,
	[BusinessCenterName] [varchar](50) NOT NULL,
	[Active] [char](1) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[ModifiedDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_BusinessCenter] PRIMARY KEY CLUSTERED 
(
	[BusinessCenterCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BusinessCenterRegion]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessCenterRegion](
	[BusinessCenterCode] [int] NOT NULL,
	[RegionCode] [int] NOT NULL,
	[Active] [char](1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BusinessRegion]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessRegion](
	[RegionCode] [int] IDENTITY(1,1) NOT NULL,
	[RegionName] [varchar](50) NOT NULL,
	[ZoneCode] [int] NOT NULL,
	[Active] [char](1) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_BusinessRegion] PRIMARY KEY CLUSTERED 
(
	[RegionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BusinessZone]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessZone](
	[ZoneCode] [int] IDENTITY(1,1) NOT NULL,
	[ZoneName] [varchar](50) NOT NULL,
	[CompanyCode] [int] NOT NULL,
	[Active] [char](1) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_BusinessZone] PRIMARY KEY CLUSTERED 
(
	[ZoneCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[City]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityCode] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](50) NOT NULL,
	[StateCode] [smallint] NOT NULL,
	[Active] [char](1) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[ModifiedDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyCode] [smallint] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](100) NOT NULL,
	[ShortName] [varchar](10) NOT NULL,
	[CountryCode] [smallint] NOT NULL,
	[Active] [char](1) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[ModifiedDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryCode] [smallint] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](50) NOT NULL,
	[ShortName] [char](2) NOT NULL,
	[TimeZoneCode] [smallint] NOT NULL,
	[DefaultLanguageCode] [smallint] NOT NULL,
	[Active] [char](1) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Country_1] PRIMARY KEY CLUSTERED 
(
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Country] SET (LOCK_ESCALATION = AUTO)
GO
/****** Object:  Table [dbo].[CountryCurrency]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountryCurrency](
	[CountryCode] [smallint] NOT NULL,
	[CurrencyCode] [smallint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Currency]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currency](
	[CurrencyCode] [smallint] IDENTITY(1,1) NOT NULL,
	[CurrencySymbol] [char](3) NOT NULL,
	[Active] [char](1) NOT NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
(
	[CurrencyCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerCode] [int] IDENTITY(1,1) NOT NULL,
	[LedgerCode] [int] NOT NULL,
	[BranchCode] [int] NOT NULL,
	[CustomerName] [int] NOT NULL,
	[AddressCode] [int] NOT NULL,
	[EmailID] [varchar](100) NULL,
	[VATNo] [varchar](20) NULL,
	[TaxTypeCode] [int] NOT NULL,
	[TaxSubTypeCodes] [int] NOT NULL,
	[Active] [char](1) NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [smalldatetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dealer]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dealer](
	[DealerCode] [int] IDENTITY(1,1) NOT NULL,
	[LedgerCode] [int] NOT NULL,
	[BranchCode] [int] NOT NULL,
	[BusinessCenterCode] [int] NOT NULL,
	[PartyType] [char](1) NOT NULL,
	[DealerCategoryCode] [int] NOT NULL,
	[WofklowStatusCode] [int] NOT NULL,
	[DepositLegerCode] [int] NOT NULL,
	[DealerName] [varchar](100) NOT NULL,
	[AddressCode] [int] NOT NULL,
	[PropName] [varchar](100) NULL,
	[EmailID] [varchar](100) NULL,
	[VATNo] [varchar](20) NULL,
	[CSTNo] [varchar](20) NULL,
	[CSTDate] [smalldatetime] NULL,
	[CentralExciseNo] [varchar](20) NULL,
	[CentralExciseDate] [smalldatetime] NULL,
	[TransportCodes] [varchar](256) NOT NULL,
	[TaxTypeCode] [smallint] NOT NULL,
	[TaxSubTypeCodes] [smallint] NOT NULL,
	[OnlinePaymentOnly] [char](1) NOT NULL,
	[ECMS_VirtualAccountNo] [char](15) NULL,
	[MaxChequeValuePerDay] [numeric](18, 2) NOT NULL,
	[ManagerVistDate] [smalldatetime] NULL,
	[BankCodes] [varchar](256) NULL,
	[DealerDiscountControls_ProductClassificationType] [smallint] NOT NULL,
	[Active] [char](1) NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [smalldatetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_Dealer] PRIMARY KEY CLUSTERED 
(
	[DealerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DealerAddress]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DealerAddress](
	[DealerAddressCode] [int] IDENTITY(1,1) NOT NULL,
	[DealerCode] [int] NOT NULL,
	[AddressCode] [int] NOT NULL,
	[AddressName] [varchar](100) NOT NULL,
	[PrimaryRecord] [char](1) NULL,
	[Active] [char](1) NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[CreatedBy] [int] NULL,
	[LastModifiedDate] [smalldatetime] NOT NULL,
	[LastModifiedBy] [int] NULL,
 CONSTRAINT [PK_DealerAddress] PRIMARY KEY CLUSTERED 
(
	[DealerAddressCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DealerCategory]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DealerCategory](
	[DealerCategoryCode] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Image] [varchar](100) NOT NULL,
	[PeriodCode] [int] NOT NULL,
	[LYTurnoverFrom] [int] NOT NULL,
	[LYTurnOverTo] [int] NOT NULL,
	[Active] [char](1) NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [smalldatetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_DealerCategory] PRIMARY KEY CLUSTERED 
(
	[DealerCategoryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DealerCategoryTracking]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DealerCategoryTracking](
	[Dealercode] [int] NOT NULL,
	[PeriodCode] [int] NOT NULL,
	[DealerCategoryCode] [int] NOT NULL,
 CONSTRAINT [PK_DealerCategoryTracking] PRIMARY KEY CLUSTERED 
(
	[Dealercode] ASC,
	[PeriodCode] ASC,
	[DealerCategoryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DealerControls]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DealerControls](
	[DealerCode] [int] NOT NULL,
	[ProductClassificationCode] [int] NOT NULL,
	[SalesAllowed] [char](1) NOT NULL,
	[TargetDeposit] [numeric](18, 2) NOT NULL,
	[TargetDateToCollect] [smalldatetime] NULL,
	[ReceivedDepositAmount] [numeric](18, 2) NOT NULL,
	[CreditDaysTemplateCode] [int] NOT NULL,
	[FixedMCL] [numeric](18, 2) NOT NULL,
	[AvailableMCL] [numeric](18, 2) NOT NULL,
	[TargetSecuirtyValue] [numeric](18, 2) NOT NULL,
	[TargetCollectionDate] [smalldatetime] NULL,
	[ChequeReturnCount] [int] NOT NULL,
	[SalesLockedCount] [int] NOT NULL,
	[MCLLockedCount] [int] NOT NULL,
	[MCL_BM_Quota_Percentage] [numeric](18, 2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DealerDiscountGrade]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DealerDiscountGrade](
	[GradeCode] [int] IDENTITY(1,1) NOT NULL,
	[GradeName] [varchar](100) NOT NULL,
	[Active] [char](1) NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [smalldatetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_DealerDiscountGrade] PRIMARY KEY CLUSTERED 
(
	[GradeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DealerDiscountsControls]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DealerDiscountsControls](
	[DealerCode] [int] NOT NULL,
	[ProductClassificationCode] [int] NOT NULL,
	[DiscountCode] [int] NOT NULL,
	[GradeCode] [int] NOT NULL,
	[Enable] [char](1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DealerMCLSecurity]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DealerMCLSecurity](
	[DealerCode] [int] NOT NULL,
	[ReceveivedSecurityType] [char](1) NOT NULL,
	[ReceivedSecurityReferenceNo] [varchar](20) NOT NULL,
	[ReceivedSecurityReferenceDate] [smalldatetime] NULL,
	[ReceivedSecurityValue] [numeric](18, 2) NOT NULL,
	[SecurityExpiryDate] [smalldatetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DealerTracking]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DealerTracking](
	[OldDealercode] [int] NOT NULL,
	[NewDealerCode] [int] NOT NULL,
	[UpdatedDate] [smalldatetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DelaerFlexiTradeDiscountDetails]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DelaerFlexiTradeDiscountDetails](
	[DetailCode] [int] IDENTITY(1,1) NOT NULL,
	[HeaderCode] [int] NOT NULL,
	[ProductClassificationCode] [int] NOT NULL,
	[FlexiDiscountPercentage] [numeric](18, 2) NOT NULL,
	[ExipryDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_DelaerFlexiTradeDiscountDetails] PRIMARY KEY CLUSTERED 
(
	[DetailCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DelaerFlexiTradeDiscountHeader]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DelaerFlexiTradeDiscountHeader](
	[HeaderCode] [int] IDENTITY(1,1) NOT NULL,
	[DealerCode] [int] NOT NULL,
	[ProductClassificationTypeCode] [int] NOT NULL,
	[WorkFlowStatusCode] [int] NOT NULL,
	[CurrentRecord] [tinyint] NOT NULL,
	[Active] [char](1) NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [smalldatetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_DelaerFlexiTradeDiscountHeader] PRIMARY KEY CLUSTERED 
(
	[HeaderCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Discount_DataModel_ProductRegistration_Transaction]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount_DataModel_ProductRegistration_Transaction](
	[ItemCode] [int] NOT NULL,
	[SerialNo] [varchar](100) NOT NULL,
	[DealerCode] [int] NOT NULL,
	[RegisteredOn] [smalldatetime] NOT NULL,
	[IsDiscountAllowed] [char](1) NOT NULL,
	[BllNo] [int] NULL,
	[BillDate] [smalldatetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiscountDealerTarget]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountDealerTarget](
	[Dealercode] [int] NOT NULL,
	[TargetGroupCode] [int] NOT NULL,
	[ProductClassificationCode] [int] NOT NULL,
	[PeriodCode] [int] NOT NULL,
	[MonthCode] [int] NOT NULL,
	[Qty] [numeric](18, 3) NOT NULL,
	[BillValue] [numeric](18, 2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiscountDealerTargetGroup]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountDealerTargetGroup](
	[TargetGroupCode] [int] IDENTITY(1,1) NOT NULL,
	[TargetType] [char](1) NOT NULL,
	[TargetSubType] [char](1) NOT NULL,
	[PeriodCode] [int] NOT NULL,
	[BranchCode] [int] NOT NULL,
	[PeriodTypeCode] [int] NOT NULL,
	[ProductClassificationCode] [int] NULL,
 CONSTRAINT [PK_DealerTargetGroup] PRIMARY KEY CLUSTERED 
(
	[TargetGroupCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiscountDealerTargetMinimum]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountDealerTargetMinimum](
	[TargetGroupCode] [int] NULL,
	[ProductClassificationCode] [int] NULL,
	[Minvalue] [numeric](18, 2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiscountDealerTargetSlab]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountDealerTargetSlab](
	[TargetSlabCode] [int] IDENTITY(1,1) NOT NULL,
	[TargetGroupCode] [int] NOT NULL,
	[ProductClassificationCode] [int] NOT NULL,
	[ExecutionOrder] [int] NOT NULL,
	[AchievementPercentageFrom] [numeric](18, 2) NOT NULL,
	[AchievementPercentageTo] [numeric](18, 2) NOT NULL,
	[DiscountPercentage] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_DealerTargetSlab] PRIMARY KEY CLUSTERED 
(
	[TargetSlabCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiscountFilterMaster]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountFilterMaster](
	[FilterTableCode] [int] IDENTITY(1,1) NOT NULL,
	[FilterTableName] [varchar](100) NOT NULL,
	[QueryObjName] [varchar](100) NOT NULL,
	[QueryObjType] [char](1) NOT NULL,
 CONSTRAINT [PK_DiscountFilterMaster] PRIMARY KEY CLUSTERED 
(
	[FilterTableCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiscountPeriodMonth]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountPeriodMonth](
	[MonthCode] [int] IDENTITY(1,1) NOT NULL,
	[MonthName] [varchar](100) NOT NULL,
	[FromDate] [smalldatetime] NOT NULL,
	[ToDate] [smalldatetime] NOT NULL,
	[Active] [char](1) NOT NULL,
	[PeriodTypeCode] [int] NOT NULL,
 CONSTRAINT [PK_DiscountPeriodMonth] PRIMARY KEY CLUSTERED 
(
	[MonthCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiscountPeriodType]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountPeriodType](
	[PeriodTypeCode] [tinyint] IDENTITY(1,1) NOT NULL,
	[PeriodType] [varchar](100) NOT NULL,
	[Active] [char](10) NOT NULL,
 CONSTRAINT [PK_DiscountPeriodType] PRIMARY KEY CLUSTERED 
(
	[PeriodTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[DisountCode] [int] IDENTITY(1,1) NOT NULL,
	[DiscountName] [varchar](100) NOT NULL,
	[DiscountPriority] [int] NOT NULL,
	[ConsiderProfitEarning] [char](1) NOT NULL,
	[DefaultLedgerCode] [int] NULL,
	[SchemeType] [char](1) NOT NULL,
	[DiscountPercentageModel] [smallint] NOT NULL,
	[SlabModelExecutionCode] [smallint] NULL,
	[SingleDataModelExecutionCode] [smallint] NULL,
	[DiscountApplyOn] [char](1) NULL,
	[ConsiderQtyValueFrom] [char](1) NULL,
	[Active] [char](1) NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [smalldatetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_Discounts] PRIMARY KEY CLUSTERED 
(
	[DisountCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiscountScheme]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountScheme](
	[DiscountSchemeCode] [int] IDENTITY(1,1) NOT NULL,
	[DisountCode] [int] NOT NULL,
	[SchemeDescription] [varchar](100) NOT NULL,
	[DiscountNarration] [varchar](100) NOT NULL,
	[LedgerCode] [int] NOT NULL,
	[Remarks] [varchar](500) NULL,
	[SMSText] [varchar](1000) NULL,
	[StartDate] [smalldatetime] NOT NULL,
	[EndDate] [smalldatetime] NOT NULL,
	[ActualEndDate] [smalldatetime] NULL,
	[SchemeStatus] [char](1) NOT NULL,
	[ClosedBy] [int] NULL,
	[ClosedOn] [smalldatetime] NULL,
	[PeriodTypeCode] [tinyint] NULL,
	[CumulativeDiscount] [char](1) NOT NULL,
	[AdvanceRequired] [char](1) NOT NULL,
	[DistountApply] [char](1) NOT NULL,
	[DiscountExecutionDays] [int] NOT NULL,
	[isconsideredforProfitEarning] [char](1) NOT NULL,
	[Active] [char](1) NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [smalldatetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_DiscountScheme] PRIMARY KEY CLUSTERED 
(
	[DiscountSchemeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiscountSchemeFilterHeader]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountSchemeFilterHeader](
	[DiscountSchemeFHeaderCode] [int] IDENTITY(1,1) NOT NULL,
	[DiscountSchemeCode] [int] NOT NULL,
	[FilterTableCode] [int] NOT NULL,
	[FilterOrder] [int] NOT NULL,
 CONSTRAINT [PK_DiscountSchemeFilterHeader] PRIMARY KEY CLUSTERED 
(
	[DiscountSchemeFHeaderCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiscountSchemeFilterValue]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountSchemeFilterValue](
	[DiscountSchemeCode] [int] IDENTITY(1,1) NOT NULL,
	[FilterTableCode] [int] NOT NULL,
	[FilterValue] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiscountSchemePercentage_DataModel]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountSchemePercentage_DataModel](
	[SchemeDataModelCode] [int] IDENTITY(1,1) NOT NULL,
	[DiscountSchemeCode] [int] NOT NULL,
	[DataModel_KeyCode] [int] NOT NULL,
	[DiscountPercentage] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_DiscountSchemePercentage_DataModel] PRIMARY KEY CLUSTERED 
(
	[SchemeDataModelCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiscountSchemePercentage_Direct]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountSchemePercentage_Direct](
	[DiscountSchemeCode] [int] IDENTITY(1,1) NOT NULL,
	[DiscountPercentage] [numeric](18, 2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiscountSchemePercentage_SlabModel]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountSchemePercentage_SlabModel](
	[SchemeSlabModelCode] [int] IDENTITY(1,1) NOT NULL,
	[DiscountSchemeCode] [int] NOT NULL,
	[GradeCode] [int] NULL,
	[SlabNo] [int] NOT NULL,
	[StartValue] [int] NOT NULL,
	[EndValue] [int] NOT NULL,
	[DiscountPercentage] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_DiscountSchemePercentage_SlabModel] PRIMARY KEY CLUSTERED 
(
	[SchemeSlabModelCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Item]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ItemCode] [int] IDENTITY(1,1) NOT NULL,
	[ItemSalecode] [char](5) NOT NULL,
	[ItemName] [varchar](100) NOT NULL,
	[ProductClassificationCode] [int] NOT NULL,
	[ItemHeading_LookupKeyCode] [int] NOT NULL,
	[MfgListPrice] [numeric](18, 3) NOT NULL,
	[IPPriceProcesspending] [char](1) NOT NULL,
	[UOM] [varchar](25) NOT NULL,
	[ItemSource_LookupKeyCode] [int] NOT NULL,
	[ItemType_LookpKeyCode] [int] NOT NULL,
	[Serviceable] [char](1) NOT NULL,
	[SerialNumberItem] [char](1) NOT NULL,
	[DependentItemCount] [smallint] NOT NULL,
	[ItemClassificationCode] [smallint] NOT NULL,
	[BarCodeApplicable] [char](1) NOT NULL,
	[TariffNo] [varchar](20) NOT NULL,
	[CharityApplicable] [char](1) NOT NULL,
	[QtyInPacket] [int] NOT NULL,
	[WarrantyType_LookupKeyCode] [int] NOT NULL,
	[Active] [char](1) NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[ModifiedDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ItemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemBOM]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemBOM](
	[ItemCode] [int] NOT NULL,
	[ChildItemCode] [int] NOT NULL,
	[Qty] [int] NOT NULL,
	[Active] [char](1) NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[LastModifiedDate] [smalldatetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemBranch]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemBranch](
	[BranchCode] [int] NOT NULL,
	[ItemCode] [int] NOT NULL,
	[AllowTransaction] [char](1) NOT NULL,
	[AllowIRF] [char](1) NOT NULL,
	[AllowStockTransfer] [char](1) NOT NULL,
	[AllowSales] [char](1) NOT NULL,
	[ListRate] [numeric](18, 2) NOT NULL,
	[StockTransferRate] [numeric](18, 2) NOT NULL,
	[ReimbursementRate] [numeric](18, 2) NOT NULL,
	[ServiceRate] [numeric](18, 2) NOT NULL,
	[ServiceStationRate] [numeric](18, 2) NOT NULL,
	[StockOrderModel] [char](1) NOT NULL,
	[ReOrderLevelQty] [numeric](18, 3) NOT NULL,
	[EconomicOrderQty] [numeric](18, 3) NOT NULL,
	[WarrantyPeriod] [int] NOT NULL,
	[ExtendedWarrantyPeriod] [int] NOT NULL,
	[NonMovingDays] [int] NOT NULL,
	[PostHandlingCharges] [numeric](18, 2) NOT NULL,
	[OtherCharges] [numeric](18, 2) NOT NULL,
	[AllowReplacementAtBranchLevel] [char](1) NOT NULL,
	[RepalcementDays] [int] NOT NULL,
	[TradeDiscountHCode] [int] NULL,
 CONSTRAINT [PK_ItemBranch] PRIMARY KEY CLUSTERED 
(
	[BranchCode] ASC,
	[ItemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemBranchStockOrderTypeSummary]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemBranchStockOrderTypeSummary](
	[BranchCode] [int] NOT NULL,
	[ItemCode] [int] NOT NULL,
	[OrderTypeCode] [tinyint] NOT NULL,
	[Stock] [numeric](18, 3) NOT NULL,
	[AllotedStock] [numeric](18, 3) NOT NULL,
	[ReserveredStock] [numeric](18, 3) NOT NULL,
	[TBB_Stock] [numeric](18, 3) NOT NULL,
	[TobePackedQty] [numeric](18, 3) NOT NULL,
	[ReserveredForPacking] [numeric](18, 3) NOT NULL,
	[ReserveredForBranchManagerAllocation] [numeric](18, 3) NOT NULL,
 CONSTRAINT [PK_ItemBranchStockOrderTypeSummary] PRIMARY KEY CLUSTERED 
(
	[BranchCode] ASC,
	[ItemCode] ASC,
	[OrderTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemBranchStockSummary]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemBranchStockSummary](
	[BranchCode] [int] NOT NULL,
	[ItemCode] [int] NOT NULL,
	[CurrentGoodStock] [numeric](18, 3) NOT NULL,
	[CurrentDefetiveStock] [numeric](18, 3) NOT NULL,
	[ReserverdGoodStock] [numeric](18, 3) NOT NULL,
	[ReserveredDefectiveStock] [numeric](18, 3) NOT NULL,
	[PartyCurrentGoodStock] [numeric](18, 3) NOT NULL,
	[PartyCurrentDefectiveStock] [numeric](18, 3) NOT NULL,
	[PendingMRMQTY] [numeric](18, 3) NOT NULL,
	[PacketQty] [numeric](18, 3) NOT NULL,
	[UnpackedQty] [numeric](18, 3) NOT NULL,
	[TobePackedQty] [numeric](18, 3) NOT NULL,
	[AvgRate] [numeric](18, 2) NOT NULL,
	[StockValueBasedonAvgRate] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_ItemBranchStockSummary] PRIMARY KEY CLUSTERED 
(
	[BranchCode] ASC,
	[ItemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemClassification]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemClassification](
	[ItemClassificationCode] [smallint] IDENTITY(1,1) NOT NULL,
	[ItemClassification] [varchar](50) NOT NULL,
	[ShortName] [char](3) NOT NULL,
	[Active] [char](1) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_ItemClassification] PRIMARY KEY CLUSTERED 
(
	[ItemClassificationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemCodeTracking]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemCodeTracking](
	[OldItemcode] [int] NOT NULL,
	[OldSaleItemCode] [varchar](5) NOT NULL,
	[NewItemcode] [int] NOT NULL,
	[NewSaletIemCode] [char](5) NOT NULL,
	[ConversionApplicable] [char](1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemDependent]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemDependent](
	[ItemCode] [int] NOT NULL,
	[ChildItemCode] [int] NOT NULL,
	[Qty] [int] NOT NULL,
	[Active] [char](1) NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[LastModifiedDate] [smalldatetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemOrderType]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemOrderType](
	[ItemCode] [int] NOT NULL,
	[OrderTypeCode] [tinyint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemTax]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemTax](
	[ItemCode] [int] NOT NULL,
	[BranchCode] [int] NOT NULL,
	[TaxSubTypeCode] [int] NOT NULL,
	[TaxTemplateCode] [int] NOT NULL,
 CONSTRAINT [PK_ItemTax] PRIMARY KEY CLUSTERED 
(
	[ItemCode] ASC,
	[BranchCode] ASC,
	[TaxSubTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemTradeDiscountDetail]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemTradeDiscountDetail](
	[TradeDiscountDCode] [int] IDENTITY(1,1) NOT NULL,
	[TradeDiscountHCode] [int] NOT NULL,
	[GradeCode] [int] NOT NULL,
	[HODiscountPercentage] [numeric](18, 2) NOT NULL,
	[BranchDiscountPercentage] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_ItemTradeDiscountDetail] PRIMARY KEY CLUSTERED 
(
	[TradeDiscountDCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemTradeDiscountHeader]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemTradeDiscountHeader](
	[TradeDiscountHCode] [int] IDENTITY(1,1) NOT NULL,
	[BranchCode] [int] NOT NULL,
	[ProductClassificationCode] [int] NOT NULL,
 CONSTRAINT [PK_ItemTradeDiscountHeader] PRIMARY KEY CLUSTERED 
(
	[TradeDiscountHCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemVendor]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemVendor](
	[ItemCode] [int] NOT NULL,
	[BranchCode] [int] NOT NULL,
	[SupplierCode] [int] NOT NULL,
	[VendorPrice] [numeric](18, 2) NOT NULL,
	[PrimaryVendor] [char](1) NOT NULL,
 CONSTRAINT [PK_ItemVendor] PRIMARY KEY CLUSTERED 
(
	[ItemCode] ASC,
	[BranchCode] ASC,
	[SupplierCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LookupTable]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LookupTable](
	[LookupTableCode] [int] NOT NULL,
	[LookupTableName] [varchar](100) NOT NULL,
	[Active] [char](1) NOT NULL,
 CONSTRAINT [PK_LookupTable] PRIMARY KEY CLUSTERED 
(
	[LookupTableCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LookupTableValues]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LookupTableValues](
	[LookupKeyCode] [int] IDENTITY(1,1) NOT NULL,
	[LookupKeyName] [varchar](100) NOT NULL,
	[LookupTableCode] [int] NOT NULL,
	[Active] [char](1) NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [smalldatetime] NULL,
	[LastModifiedBy] [int] NULL,
	[LastModifiedDate] [smalldatetime] NULL,
 CONSTRAINT [PK_LookupTableValues] PRIMARY KEY CLUSTERED 
(
	[LookupKeyCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ManufacturingUnits]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManufacturingUnits](
	[UnitCode] [smallint] IDENTITY(1,1) NOT NULL,
	[UnitName] [varchar](100) NOT NULL,
	[ShortName] [varchar](10) NOT NULL,
	[CompanyCode] [smallint] NOT NULL,
	[LedgerCode] [int] NOT NULL,
	[AddressCode] [int] NOT NULL,
	[LST_Number] [varchar](50) NOT NULL,
	[LST_Date] [smalldatetime] NOT NULL,
	[CST_Number] [varchar](50) NOT NULL,
	[CST_Date] [smalldatetime] NOT NULL,
	[ExciseRegistrationNo] [varchar](50) NOT NULL,
	[ExciseRegistrationDate] [smalldatetime] NOT NULL,
	[Active] [char](1) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_ManufacturingUnits] PRIMARY KEY CLUSTERED 
(
	[UnitCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[MenuCode] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [varchar](100) NOT NULL,
	[MenuURL] [varchar](200) NOT NULL,
	[ParentMenucode] [int] NULL,
	[MenuType] [varchar](50) NOT NULL,
	[IsActive] [char](1) NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[MenuCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderPolicyDetail]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderPolicyDetail](
	[PolicyDCode] [int] IDENTITY(1,1) NOT NULL,
	[PolicyCode] [int] NOT NULL,
	[BranchCode] [int] NOT NULL,
	[ProductClassificationCode] [int] NULL,
	[OrderType] [tinyint] NULL,
	[ItemClassificationCode] [tinyint] NULL,
	[Value] [numeric](18, 2) NULL,
	[UOM] [int] NOT NULL,
	[StartDay] [int] NULL,
	[EndDay] [int] NULL,
	[DeliveryPriority] [char](1) NULL,
	[MonthSchedue] [int] NULL,
	[Distance] [char](1) NULL,
 CONSTRAINT [PK_OrderPolicyDetail] PRIMARY KEY CLUSTERED 
(
	[PolicyDCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderPolicyHeader]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderPolicyHeader](
	[PolicyCode] [int] IDENTITY(1,1) NOT NULL,
	[PolicyName] [varchar](100) NOT NULL,
	[EffectiveFrom] [smalldatetime] NOT NULL,
	[PolciyConditionOn] [tinyint] NOT NULL,
	[ProductClassificationTypeCode] [int] NOT NULL,
	[DateRangeApplicable] [char](1) NOT NULL,
	[PolicyType] [tinyint] NOT NULL,
	[Active] [char](1) NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [smalldatetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_OrderPolicyHeader] PRIMARY KEY CLUSTERED 
(
	[PolicyCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderType]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderType](
	[OrderTypeCode] [tinyint] NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[OrderType] [char](3) NOT NULL,
	[Active] [char](1) NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[ModifiedDate] [smalldatetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductClassification]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductClassification](
	[ProductClassificationCode] [int] NOT NULL,
	[ProductClassificationName] [varchar](100) NOT NULL,
	[ProductClassificationTypeCode] [tinyint] NOT NULL,
	[ParentProductClassificationCode] [tinyint] NULL,
	[ProductType] [char](1) NULL,
	[ConsiderForClosingStock] [char](1) NULL,
	[Active] [char](1) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_ProductClassification] PRIMARY KEY CLUSTERED 
(
	[ProductClassificationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductClassificationType]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductClassificationType](
	[ProductClassificationTypeCode] [tinyint] NOT NULL,
	[ProductClassificationType] [varchar](100) NOT NULL,
	[DisplayOrder] [tinyint] NOT NULL,
	[Active] [char](1) NOT NULL,
 CONSTRAINT [PK_ProductClassificationType] PRIMARY KEY CLUSTERED 
(
	[ProductClassificationTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleCode] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](100) NOT NULL,
	[BaseControl] [char](1) NOT NULL,
	[RoleGroupCode] [int] NOT NULL,
	[IsActive] [char](1) NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoleGroup]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleGroup](
	[RoleGroupCode] [int] IDENTITY(1,1) NOT NULL,
	[RoleGroupName] [varchar](50) NOT NULL,
	[IsActive] [char](1) NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_RoleGroup] PRIMARY KEY CLUSTERED 
(
	[RoleGroupCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoleUser]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleCode] [int] NOT NULL,
	[UserCode] [int] NOT NULL,
	[BranchCode] [int] NOT NULL,
	[Active] [char](1) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_dbo.RoleUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SaleOrderItemPriority]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleOrderItemPriority](
	[PriorityCode] [int] IDENTITY(1,1) NOT NULL,
	[OrderNo] [int] NOT NULL,
	[orderTypeCode] [smallint] NOT NULL,
	[Itemcode] [int] NOT NULL,
	[AlottedQty] [numeric](18, 3) NOT NULL,
	[RemainingQty] [numeric](18, 3) NOT NULL,
	[PriorityNo] [int] NOT NULL,
	[AllotedDate] [smalldatetime] NOT NULL,
	[TBBQty] [numeric](18, 3) NOT NULL,
	[NoofTimeAlotted] [int] NOT NULL,
 CONSTRAINT [PK_SaleOrderItemPriority] PRIMARY KEY CLUSTERED 
(
	[PriorityCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SaleOrderItems]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleOrderItems](
	[OrderDcode] [int] IDENTITY(1,1) NOT NULL,
	[OrderNo] [int] NOT NULL,
	[ItemCode] [int] NOT NULL,
	[OrderedQuantity] [numeric](18, 2) NOT NULL,
	[ListRate] [numeric](18, 2) NOT NULL,
	[TradeDiscount] [numeric](18, 2) NOT NULL,
	[FlexiTradeDiscount] [numeric](18, 2) NOT NULL,
	[Rate] [numeric](18, 2) NOT NULL,
	[BillValue] [numeric](18, 2) NOT NULL,
	[TaxSubTypeCode] [int] NOT NULL,
	[TaxTemplateCode] [int] NOT NULL,
	[TotalCancelledQuantity] [numeric](18, 3) NOT NULL,
	[ReasonforCancellation] [numeric](18, 3) NOT NULL,
	[LastCancelledQuantity] [numeric](18, 3) NOT NULL,
	[HandlingCharges] [numeric](18, 2) NOT NULL,
	[Charity] [numeric](18, 2) NOT NULL,
	[ExpiryDate] [smalldatetime] NULL,
	[BilledQuantity] [numeric](18, 3) NOT NULL,
 CONSTRAINT [PK_SaleOrderItems] PRIMARY KEY CLUSTERED 
(
	[OrderDcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalePickListDetails]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalePickListDetails](
	[PickListHeaderCode] [int] NOT NULL,
	[ItemCode] [int] NOT NULL,
	[PickListQuantity] [numeric](18, 3) NOT NULL,
	[ispackedItem] [char](1) NOT NULL,
	[Iscancelled] [char](1) NOT NULL,
	[CancelledReason] [varchar](256) NULL,
	[CancelledDate] [smalldatetime] NULL,
	[CancelledBy] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalePickListHeader]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalePickListHeader](
	[PickListHeaderCode] [int] IDENTITY(1,1) NOT NULL,
	[Type] [char](1) NOT NULL,
	[OrderNo] [int] NULL,
	[StockTransferCode] [int] NULL,
	[BarCodeEnabled] [char](1) NOT NULL,
	[Transportcode] [int] NULL,
	[BookingPlace] [varchar](256) NULL,
	[InvoiceStatus] [char](1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesInvoice]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesInvoice](
	[InvoiceNo] [int] IDENTITY(1,1) NOT NULL,
	[BranchCode] [int] NOT NULL,
	[DocumentTypeCode] [int] NOT NULL,
	[DocumentNumber] [int] NOT NULL,
	[DocumentDate] [smalldatetime] NOT NULL,
	[orderno] [int] NOT NULL,
	[orderdate] [smalldatetime] NOT NULL,
	[DealerCode] [int] NOT NULL,
	[TaxSubTypeCode] [int] NOT NULL,
	[IsThroughAdvance] [char](1) NOT NULL,
	[TransportCode] [int] NOT NULL,
	[DestinationAddressCode] [int] NOT NULL,
	[LRRRNumber] [varchar](20) NULL,
	[LRRRDate] [smalldatetime] NULL,
	[PackageCount] [int] NOT NULL,
	[VehicleNumber] [varchar](20) NULL,
	[FormType] [int] NOT NULL,
	[FormNumber] [varchar](20) NULL,
	[FormDate] [smalldatetime] NULL,
	[TotalValue] [numeric](18, 2) NOT NULL,
	[GCD] [int] NOT NULL,
	[ICD] [int] NOT NULL,
	[BCD] [int] NOT NULL,
	[PrintCount] [tinyint] NOT NULL,
	[IsCancelled] [char](1) NOT NULL,
	[CancelledUser] [int] NULL,
	[CancelledDate] [smalldatetime] NULL,
	[CancellationRemarks] [varchar](200) NULL,
	[IsFullyReturned] [char](1) NOT NULL,
	[ProductTotal] [int] NOT NULL,
	[SettledDate] [smalldatetime] NULL,
	[BusinessCenterCode] [int] NOT NULL,
	[RepresentativeCode] [int] NULL,
	[AdditionalPrintApprovalStatus] [char](1) NULL,
	[AdditionalPrintApprovedby] [int] NULL,
	[DeviatedTransportCode] [int] NULL,
 CONSTRAINT [PK_SalesInvoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesInvoiceDiscounts]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesInvoiceDiscounts](
	[InvoiceDiscountCode] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNo] [int] NOT NULL,
	[DiscountCode] [int] NOT NULL,
	[Amount] [numeric](18, 2) NOT NULL,
	[ReturnedAmount] [numeric](18, 2) NOT NULL,
	[DiscountApply] [char](1) NOT NULL,
	[DiscountPercentage] [numeric](18, 2) NOT NULL,
	[IsConsideredForPE] [char](1) NOT NULL,
 CONSTRAINT [PK_SalesInvoiceDiscounts] PRIMARY KEY CLUSTERED 
(
	[InvoiceDiscountCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesInvoiceItem]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesInvoiceItem](
	[InvoiceItemCode] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNo] [int] NOT NULL,
	[ItemCode] [int] NOT NULL,
	[IssuedQuantity] [numeric](18, 3) NOT NULL,
	[ReturnedQuantity] [numeric](18, 3) NOT NULL,
	[BlockedQuantity] [numeric](18, 3) NOT NULL,
	[Rate] [numeric](18, 2) NOT NULL,
	[WarrantyExpiryDate] [smalldatetime] NULL,
	[ExtendedWarrantyExpiryDate] [smalldatetime] NULL,
	[ProductSubGroupCode] [int] NOT NULL,
	[PERate] [numeric](18, 2) NOT NULL,
	[PackageDescription] [varchar](100) NULL,
 CONSTRAINT [PK_SalesInvoiceItem] PRIMARY KEY CLUSTERED 
(
	[InvoiceItemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesInvoiceSerialNumber]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesInvoiceSerialNumber](
	[InvoiceSNCode] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNo] [int] NOT NULL,
	[ItemCode] [int] NOT NULL,
	[SerialNumber] [varchar](100) NOT NULL,
	[IsReturned] [char](1) NOT NULL,
	[IsReserved] [char](1) NOT NULL,
 CONSTRAINT [PK_SalesInvoiceSerialNumber] PRIMARY KEY CLUSTERED 
(
	[InvoiceSNCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesInvoiceTax]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesInvoiceTax](
	[InvoiceNo] [int] NOT NULL,
	[TaxCode] [int] NOT NULL,
	[LedgerCode] [int] NOT NULL,
	[PriorityOrder] [int] NOT NULL,
	[Amount] [numeric](18, 2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesOrder]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesOrder](
	[OrderNo] [int] IDENTITY(1,1) NOT NULL,
	[BranchCode] [int] NOT NULL,
	[DMSOrderNo] [int] NOT NULL,
	[DMSOrderDate] [smalldatetime] NOT NULL,
	[DealerCode] [int] NOT NULL,
	[TransportCode] [int] NOT NULL,
	[BookingPlace] [varchar](250) NULL,
	[ExpiryDate] [smalldatetime] NOT NULL,
	[ReconfirmationFlag] [char](1) NOT NULL,
	[ReconfirmationCount] [tinyint] NOT NULL,
	[LastReconfirmedDate] [smalldatetime] NULL,
	[CommittedDeliveryDate] [smalldatetime] NULL,
	[IsCancelled] [char](1) NOT NULL,
	[CancelledBy] [int] NULL,
	[CancellationRemarks] [varchar](100) NULL,
	[IsOrderClosed] [char](1) NOT NULL,
	[OrderTypeCode] [smallint] NULL,
	[IRFRaisedFlag] [char](1) NOT NULL,
	[IRFDate] [smalldatetime] NULL,
	[OrderSoruce] [char](1) NOT NULL,
	[PriorityType] [char](1) NOT NULL,
	[BillingValue] [numeric](18, 2) NOT NULL,
	[MPOAdvance] [numeric](18, 2) NULL,
	[LastMPOAdavnceDate] [smalldatetime] NULL,
	[MPADiscount] [char](1) NOT NULL,
	[UsedMPOAdvance] [numeric](18, 2) NULL,
	[Active] [char](1) NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[LastModifiedDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_SalesOrder] PRIMARY KEY CLUSTERED 
(
	[OrderNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesOrderItemPriorityTracking]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesOrderItemPriorityTracking](
	[PriorityCode] [int] NOT NULL,
	[AllocatedDate] [smalldatetime] NOT NULL,
	[AllocatedQty] [numeric](18, 3) NOT NULL,
	[ExpiryDate] [smalldatetime] NULL,
	[Expired] [char](1) NULL,
 CONSTRAINT [PK_SalesOrderItemPriorityTracking] PRIMARY KEY CLUSTERED 
(
	[PriorityCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Security]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Security](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MinLength] [int] NULL,
	[MaxLength] [int] NULL,
	[ExpiryDays] [int] NULL,
	[LockoutCount] [int] NULL,
	[SessionTimeoutWorkforce] [int] NULL,
	[SessionTimeoutOthers] [int] NULL,
	[IsAlphaMust] [bit] NULL,
	[IsNumericMust] [bit] NULL,
	[IsSplCharMust] [bit] NULL,
	[IsFirstPwdChange] [bit] NULL,
	[IsVirtualKeyboard] [bit] NULL,
	[IsIpRestricted] [bit] NULL,
	[IsCaptchaRequired] [bit] NULL,
	[IsForgotPassword] [bit] NULL,
	[IsCloseBrowser] [bit] NULL,
	[IsAutoLogout] [bit] NULL,
	[IpAddress] [varchar](max) NULL,
	[RemoteAccess] [varchar](max) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_dbo.Security] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SerialNumberMaster]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SerialNumberMaster](
	[SNCode] [int] IDENTITY(1,1) NOT NULL,
	[ItemCode] [int] NOT NULL,
	[SerialNumber] [varchar](100) NOT NULL,
	[Type] [char](1) NOT NULL,
	[SequenceNo] [int] NOT NULL,
	[NoOfPack] [int] NOT NULL,
	[ExciseDuty] [numeric](18, 2) NULL,
	[Cess] [numeric](18, 2) NULL,
	[EDCess] [numeric](18, 2) NULL,
	[TariffNo] [numeric](18, 2) NULL,
	[GROSS_WT] [numeric](18, 2) NULL,
	[NETT_WT] [numeric](18, 2) NULL,
 CONSTRAINT [PK_SerialNumberMaster] PRIMARY KEY CLUSTERED 
(
	[SNCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SerialNumberTransaction]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SerialNumberTransaction](
	[SNTransactionCode] [int] IDENTITY(1,1) NOT NULL,
	[ItemCode] [int] NOT NULL,
	[SerialNumber] [varchar](100) NOT NULL,
	[DocumentTypeCode] [int] NULL,
	[DocumentNumber] [int] NULL,
	[DocumentDate] [smalldatetime] NULL,
	[BranchCode] [int] NOT NULL,
	[Rate] [numeric](18, 2) NULL,
	[StatusOfGoods] [char](1) NOT NULL,
	[Salable] [char](1) NOT NULL,
	[IsReserved] [char](1) NOT NULL,
	[CurrentRecord] [bit] NULL,
	[createdDate] [smalldatetime] NULL,
 CONSTRAINT [PK_SerialNumberTransaction] PRIMARY KEY CLUSTERED 
(
	[SNTransactionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Session]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SessionID] [uniqueidentifier] NOT NULL,
	[UserCode] [int] NOT NULL,
	[RoleCode] [int] NOT NULL,
	[LoginTime] [datetime] NOT NULL,
	[LastAccessedTime] [datetime] NOT NULL,
	[Ipaddress] [char](15) NOT NULL,
	[Deviceinfo] [varchar](300) NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SessionArchive]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SessionArchive](
	[SessionID] [uniqueidentifier] NOT NULL,
	[UserCode] [int] NOT NULL,
	[LoginTime] [datetime] NOT NULL,
	[LogoutTime] [datetime] NOT NULL,
	[Ipaddress] [char](15) NOT NULL,
	[Deviceinfo] [varchar](300) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SessionsUsageTracking]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SessionsUsageTracking](
	[SessionId] [uniqueidentifier] NOT NULL,
	[UserCode] [int] NOT NULL,
	[RoleCode] [int] NOT NULL,
	[MenuCode] [int] NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[State]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[StateCode] [smallint] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](50) NOT NULL,
	[CountryCode] [smallint] NOT NULL,
	[Active] [char](1) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[StateCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockItemOpening]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockItemOpening](
	[ItemCode] [int] NOT NULL,
	[BranchCode] [int] NOT NULL,
	[FY_Periodcode] [smallint] NOT NULL,
	[CurrentGoodStock] [numeric](18, 3) NOT NULL,
	[CurrentDefetiveStock] [numeric](18, 3) NOT NULL,
	[ReserverdGoodStock] [numeric](18, 3) NOT NULL,
	[ReserveredDefectiveStock] [numeric](18, 3) NOT NULL,
	[PartyCurrentGoodStock] [numeric](18, 3) NOT NULL,
	[PartyCurrentDefectiveStock] [numeric](18, 3) NOT NULL,
	[Rate_stockValue] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_StockItemOpening] PRIMARY KEY CLUSTERED 
(
	[ItemCode] ASC,
	[BranchCode] ASC,
	[FY_Periodcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierCode] [int] IDENTITY(1,1) NOT NULL,
	[LedgerCode] [int] NOT NULL,
	[SupplierType] [int] NOT NULL,
	[WofklowStatusCode] [int] NOT NULL,
	[MaterialTransferLedgerCode] [int] NULL,
	[SupplierName] [varchar](100) NOT NULL,
	[AddressCode] [int] NOT NULL,
	[MaterialTransferAddressCode] [int] NULL,
	[PropName] [varchar](100) NULL,
	[EmailID] [varchar](100) NULL,
	[VATNo] [varchar](18) NULL,
	[CSTNo] [varchar](18) NULL,
	[CSTDate] [smalldatetime] NULL,
	[CentralExciseNo] [varchar](18) NULL,
	[CentralExciseDate] [smalldatetime] NULL,
	[TransportCodes] [varchar](256) NOT NULL,
	[TaxTypeCode] [int] NOT NULL,
	[TaxSubTypeCodes] [int] NOT NULL,
	[PurchaseAllowed] [char](1) NOT NULL,
	[PayableDays] [int] NOT NULL,
	[Active] [char](1) NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [smalldatetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SupplierBranch]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierBranch](
	[BranchCode] [int] NOT NULL,
	[SupplierCode] [int] NOT NULL,
	[PurchaseAllowed] [char](1) NOT NULL,
 CONSTRAINT [PK_SupplierBranch] PRIMARY KEY CLUSTERED 
(
	[BranchCode] ASC,
	[SupplierCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaxMaster]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxMaster](
	[TaxCode] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Active] [char](1) NOT NULL,
	[PrimaryRecord] [char](1) NOT NULL,
	[LedgerCode] [int] NOT NULL,
	[TaxSubTypeCode] [int] NULL,
	[FormulaApplicable] [char](1) NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[CreatedBy] [int] NULL,
	[LastModifiedDate] [smalldatetime] NOT NULL,
	[LastModifiedBy] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaxSubType]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxSubType](
	[TaxSubTypeCode] [smallint] IDENTITY(1,1) NOT NULL,
	[TaxTypeCode] [int] NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Active] [char](1) NOT NULL,
	[SalePurchaseFlag] [char](1) NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[LastModifiedDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_TaxSubType] PRIMARY KEY CLUSTERED 
(
	[TaxSubTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaxTemplateDetails]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxTemplateDetails](
	[DetailCode] [int] IDENTITY(1,1) NOT NULL,
	[TaxTemplateCode] [int] NOT NULL,
	[TaxCode] [int] NOT NULL,
	[Formula] [varchar](256) NOT NULL,
	[PriorityOrder] [int] NOT NULL,
	[TaxPercentage] [numeric](18, 2) NULL,
 CONSTRAINT [PK_TaxTemplateDetails] PRIMARY KEY CLUSTERED 
(
	[DetailCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaxTemplateHeader]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxTemplateHeader](
	[TaxTemplateCode] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[TaxSubTypeCode] [int] NOT NULL,
	[BranchCode] [int] NOT NULL,
	[PostingLedgerCode] [int] NOT NULL,
	[Active] [char](1) NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastModifiedDate] [smalldatetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_TaxTemplateHeader] PRIMARY KEY CLUSTERED 
(
	[TaxTemplateCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaxType]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxType](
	[TaxTypeCode] [smallint] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Active] [char](1) NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[LastModifiedDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_TaxType] PRIMARY KEY CLUSTERED 
(
	[TaxTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserMenu]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMenu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserCode] [int] NOT NULL,
	[RoleCode] [int] NOT NULL,
	[MenuCode] [int] NOT NULL,
	[Active] [char](1) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_dbo.UserMenu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[SSO] [bit] NOT NULL,
	[Username] [varchar](100) NULL,
	[Password] [varchar](64) NOT NULL,
	[EmployeeID] [varchar](50) NULL,
	[MobileNumber] [varchar](15) NULL,
	[EmailID] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [smalldatetime] NOT NULL,
	[IsLocked] [bit] NOT NULL,
	[ImageURL] [varchar](200) NULL,
	[PasswordExpiryDate] [smalldatetime] NULL,
	[IsDefaultPassword] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkflowApprovals]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkflowApprovals](
	[WFApprovalCode] [int] IDENTITY(1,1) NOT NULL,
	[FormCode] [int] NOT NULL,
	[RoleCode] [int] NOT NULL,
	[WorkflowOrder] [int] NOT NULL,
	[CreatorApprovalType] [char](1) NOT NULL,
	[DefaultMoveToNextLevel] [char](1) NOT NULL,
	[ExecuteRule_SP] [varchar](250) NULL,
	[True_GotoWFOrder] [int] NULL,
	[False_GotoWFOrder] [int] NULL,
	[EnableSendBackOption] [bit] NOT NULL,
	[EnableFormEditOption] [bit] NOT NULL,
	[EnableApproveOption] [bit] NOT NULL,
	[EnableRejectOption] [bit] NOT NULL,
	[EnableHoldOption] [bit] NOT NULL,
	[CanDelegate] [char](1) NOT NULL,
	[MailtoNextLevelContent] [text] NULL,
	[NotifyStakeHolders_RoleCode] [varchar](256) NULL,
	[NotifyStakeHolderEmail] [text] NULL,
	[Reminder] [char](1) NOT NULL,
	[ReminderDays] [tinyint] NULL,
	[ReminderMailContent] [text] NULL,
	[SkipOption] [char](1) NOT NULL,
	[SkipDays] [tinyint] NULL,
	[SkipMailContent] [text] NULL,
	[AutoApproval] [char](1) NOT NULL,
	[AutoApprovalDays] [tinyint] NULL,
	[NotifyToPreviousStakeHolder] [char](1) NOT NULL,
	[NotifyToPreviousStakeHolder_Content] [text] NULL,
	[NotifyToAllPreviousStakeHolder] [char](1) NULL,
	[NotifyToAllPreviousStakeHolder_Content] [text] NULL,
 CONSTRAINT [PK_WorkflowApprovals] PRIMARY KEY CLUSTERED 
(
	[WFApprovalCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkFlowDetails]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkFlowDetails](
	[WFDCode] [int] IDENTITY(1,1) NOT NULL,
	[WFHCode] [int] NOT NULL,
	[WFApprovalCode] [int] NOT NULL,
	[FormReceivedBy] [int] NOT NULL,
	[FormReceviedOn] [smalldatetime] NOT NULL,
	[FormSubmittedDate] [smalldatetime] NULL,
	[FormSubmittedByType] [char](1) NULL,
	[FormSubmittedBy] [int] NULL,
	[StatusCode] [int] NULL,
	[FormXML] [text] NULL,
	[Reason] [varchar](256) NULL,
	[ReminderCount] [tinyint] NULL,
	[Next_Reminder_Date] [smalldatetime] NULL,
 CONSTRAINT [PK_WorkFlowDetails] PRIMARY KEY CLUSTERED 
(
	[WFDCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkFlowForm]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkFlowForm](
	[FormCode] [int] IDENTITY(1,1) NOT NULL,
	[FormName] [varchar](100) NOT NULL,
	[Active] [char](1) NOT NULL,
 CONSTRAINT [PK_WorkFlowForm] PRIMARY KEY CLUSTERED 
(
	[FormCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkFlowHeader]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkFlowHeader](
	[WFHCode] [int] IDENTITY(1,1) NOT NULL,
	[FormCode] [int] NOT NULL,
	[FormKeyCode] [int] NOT NULL,
	[WFSCode] [int] NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[FinalApprovedRejectedDate] [smalldatetime] NULL,
 CONSTRAINT [PK_WorkFlowHeader] PRIMARY KEY CLUSTERED 
(
	[WFHCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkflowStatus]    Script Date: 07-01-2017 16:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkflowStatus](
	[StatusCode] [int] IDENTITY(1,1) NOT NULL,
	[FormCode] [int] NOT NULL,
	[Status] [varchar](100) NOT NULL,
	[Active] [char](1) NOT NULL,
	[isLastStatus] [char](1) NOT NULL,
 CONSTRAINT [PK_WorkflowStatus] PRIMARY KEY CLUSTERED 
(
	[StatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Role]  WITH CHECK ADD  CONSTRAINT [FK_Role_RoleGroup] FOREIGN KEY([RoleGroupCode])
REFERENCES [dbo].[RoleGroup] ([RoleGroupCode])
GO
ALTER TABLE [dbo].[Role] CHECK CONSTRAINT [FK_Role_RoleGroup]
GO
ALTER TABLE [dbo].[RoleUser]  WITH CHECK ADD  CONSTRAINT [FK_RoleUser_Role] FOREIGN KEY([RoleCode])
REFERENCES [dbo].[Role] ([RoleCode])
GO
ALTER TABLE [dbo].[RoleUser] CHECK CONSTRAINT [FK_RoleUser_Role]
GO
ALTER TABLE [dbo].[RoleUser]  WITH CHECK ADD  CONSTRAINT [FK_RoleUser_Users] FOREIGN KEY([UserCode])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[RoleUser] CHECK CONSTRAINT [FK_RoleUser_Users]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Users] FOREIGN KEY([UserCode])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Users]
GO
ALTER TABLE [dbo].[SessionsUsageTracking]  WITH CHECK ADD  CONSTRAINT [FK_SessionsUsageTracking_Session] FOREIGN KEY([SessionId])
REFERENCES [dbo].[Session] ([SessionID])
GO
ALTER TABLE [dbo].[SessionsUsageTracking] CHECK CONSTRAINT [FK_SessionsUsageTracking_Session]
GO
ALTER TABLE [dbo].[UserMenu]  WITH CHECK ADD  CONSTRAINT [FK_UserMenu_Menu] FOREIGN KEY([MenuCode])
REFERENCES [dbo].[Menu] ([MenuCode])
GO
ALTER TABLE [dbo].[UserMenu] CHECK CONSTRAINT [FK_UserMenu_Menu]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Single Sign on Required or Not' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'SSO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Applicable when SSO is enabled' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'Username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sha 256 Algorithm' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Y or N' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'IsActive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Reachd Max. no. of Password Attempt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'IsLocked'
GO

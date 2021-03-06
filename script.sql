USE [BridgeDB_test]
GO
/****** Object:  Table [dbo].[Discount_DataModel_ProductRegistration_Transaction]    Script Date: 18-01-2017 00:20:33 ******/
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
/****** Object:  Table [dbo].[DiscountDealerTarget]    Script Date: 18-01-2017 00:20:33 ******/
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
/****** Object:  Table [dbo].[DiscountDealerTargetGroup]    Script Date: 18-01-2017 00:20:33 ******/
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
/****** Object:  Table [dbo].[DiscountDealerTargetMinimum]    Script Date: 18-01-2017 00:20:33 ******/
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
/****** Object:  Table [dbo].[DiscountDealerTargetSlab]    Script Date: 18-01-2017 00:20:33 ******/
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
/****** Object:  Table [dbo].[DiscountFilterMaster]    Script Date: 18-01-2017 00:20:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountFilterMaster](
	[FilterTableCode] [int] IDENTITY(1,1) NOT NULL,
	[FilterTableName] [varchar](100) NOT NULL,
	[QueryObjName] [varchar](100) NOT NULL,
	[QueryObjType] [char](1) NOT NULL,
	[DataModel] [bit] NOT NULL,
	[FlterModel] [bit] NOT NULL,
 CONSTRAINT [PK_DiscountFilterMaster] PRIMARY KEY CLUSTERED 
(
	[FilterTableCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiscountPercentageModel]    Script Date: 18-01-2017 00:20:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountPercentageModel](
	[Id] [int] NOT NULL,
	[DiscountPercentageModel] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiscountPeriodMonth]    Script Date: 18-01-2017 00:20:33 ******/
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
/****** Object:  Table [dbo].[DiscountPeriodType]    Script Date: 18-01-2017 00:20:33 ******/
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
/****** Object:  Table [dbo].[Discounts]    Script Date: 18-01-2017 00:20:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[DiscountCode] [int] IDENTITY(1,1) NOT NULL,
	[DiscountName] [varchar](100) NOT NULL,
	[DiscountPriority] [int] NOT NULL,
	[DiscountPercentageModel] [smallint] NULL,
	[FilterRequired] [bit] NOT NULL,
	[DataModelTableCode] [int] NULL,
	[ConsiderProfitEarning] [char](1) NULL,
	[DefaultLedgerCode] [int] NULL,
	[SchemeType] [char](1) NULL,
	[SlabModelExecutionCode] [smallint] NULL,
	[SingleDataModelExecutionCode] [smallint] NULL,
	[DiscountApplyOn] [char](1) NULL,
	[ConsiderQtyValueFrom] [char](1) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedTimeStamp] [datetime] NOT NULL,
	[UpdatedTimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_Discounts] PRIMARY KEY CLUSTERED 
(
	[DiscountCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiscountScheme]    Script Date: 18-01-2017 00:20:33 ******/
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
	[CumulativeDiscount] [char](1) NULL,
	[AdvanceRequired] [char](1) NULL,
	[DistountApply] [char](1) NULL,
	[DiscountExecutionDays] [int] NULL,
	[isconsideredforProfitEarning] [char](1) NULL,
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
/****** Object:  Table [dbo].[DiscountSchemeFilterHeader]    Script Date: 18-01-2017 00:20:33 ******/
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
/****** Object:  Table [dbo].[DiscountSchemeFilterValue]    Script Date: 18-01-2017 00:20:33 ******/
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
/****** Object:  Table [dbo].[DiscountSchemePercentage_DataModel]    Script Date: 18-01-2017 00:20:33 ******/
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
/****** Object:  Table [dbo].[DiscountSchemePercentage_Direct]    Script Date: 18-01-2017 00:20:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountSchemePercentage_Direct](
	[DiscountSchemeCode] [int] IDENTITY(1,1) NOT NULL,
	[DiscountPercentage] [numeric](18, 2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiscountSchemePercentage_SlabModel]    Script Date: 18-01-2017 00:20:33 ******/
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
SET IDENTITY_INSERT [dbo].[DiscountFilterMaster] ON 

INSERT [dbo].[DiscountFilterMaster] ([FilterTableCode], [FilterTableName], [QueryObjName], [QueryObjType], [DataModel], [FlterModel]) VALUES (3, N'Product Group Sector ', N'ViewSector', N'V', 1, 1)
INSERT [dbo].[DiscountFilterMaster] ([FilterTableCode], [FilterTableName], [QueryObjName], [QueryObjType], [DataModel], [FlterModel]) VALUES (6, N'Product Group ', N'ViewProductGroup', N'V', 1, 1)
INSERT [dbo].[DiscountFilterMaster] ([FilterTableCode], [FilterTableName], [QueryObjName], [QueryObjType], [DataModel], [FlterModel]) VALUES (7, N'Product Sub Group', N'ViewProductSubGroup', N'V', 1, 1)
INSERT [dbo].[DiscountFilterMaster] ([FilterTableCode], [FilterTableName], [QueryObjName], [QueryObjType], [DataModel], [FlterModel]) VALUES (8, N'Item Classification', N'ViewItemClassification', N'V', 1, 1)
INSERT [dbo].[DiscountFilterMaster] ([FilterTableCode], [FilterTableName], [QueryObjName], [QueryObjType], [DataModel], [FlterModel]) VALUES (9, N'Dealer', N'ViewDealer', N'V', 0, 1)
INSERT [dbo].[DiscountFilterMaster] ([FilterTableCode], [FilterTableName], [QueryObjName], [QueryObjType], [DataModel], [FlterModel]) VALUES (10, N'Item', N'ViewItem', N'V', 0, 1)
INSERT [dbo].[DiscountFilterMaster] ([FilterTableCode], [FilterTableName], [QueryObjName], [QueryObjType], [DataModel], [FlterModel]) VALUES (11, N'Branch', N'ViewBranch', N'V', 0, 1)
INSERT [dbo].[DiscountFilterMaster] ([FilterTableCode], [FilterTableName], [QueryObjName], [QueryObjType], [DataModel], [FlterModel]) VALUES (12, N'Order Type', N'ViewOrderType', N'V', 1, 1)
INSERT [dbo].[DiscountFilterMaster] ([FilterTableCode], [FilterTableName], [QueryObjName], [QueryObjType], [DataModel], [FlterModel]) VALUES (13, N'Serial Number', N'ViewSerialNumber', N'V', 0, 1)
INSERT [dbo].[DiscountFilterMaster] ([FilterTableCode], [FilterTableName], [QueryObjName], [QueryObjType], [DataModel], [FlterModel]) VALUES (14, N'Business Center', N'VewBusinessCenter', N'V', 0, 1)
INSERT [dbo].[DiscountFilterMaster] ([FilterTableCode], [FilterTableName], [QueryObjName], [QueryObjType], [DataModel], [FlterModel]) VALUES (15, N'Dealer Grade', N'ViewDealerGrade', N'V', 1, 1)
INSERT [dbo].[DiscountFilterMaster] ([FilterTableCode], [FilterTableName], [QueryObjName], [QueryObjType], [DataModel], [FlterModel]) VALUES (16, N'Order Soruce', N'ViewOrderSoruce', N'V', 1, 1)
SET IDENTITY_INSERT [dbo].[DiscountFilterMaster] OFF
INSERT [dbo].[DiscountPercentageModel] ([Id], [DiscountPercentageModel]) VALUES (1, N'Slab With Gradewise Discount Percentage')
INSERT [dbo].[DiscountPercentageModel] ([Id], [DiscountPercentageModel]) VALUES (2, N'Slab wise Discount Percentage')
INSERT [dbo].[DiscountPercentageModel] ([Id], [DiscountPercentageModel]) VALUES (3, N'Gradewise Discount Percentage')
INSERT [dbo].[DiscountPercentageModel] ([Id], [DiscountPercentageModel]) VALUES (4, N'Direct Discount')
INSERT [dbo].[DiscountPercentageModel] ([Id], [DiscountPercentageModel]) VALUES (5, N'Data Table Based Discount Percentage')
SET IDENTITY_INSERT [dbo].[Discounts] ON 

INSERT [dbo].[Discounts] ([DiscountCode], [DiscountName], [DiscountPriority], [DiscountPercentageModel], [FilterRequired], [DataModelTableCode], [ConsiderProfitEarning], [DefaultLedgerCode], [SchemeType], [SlabModelExecutionCode], [SingleDataModelExecutionCode], [DiscountApplyOn], [ConsiderQtyValueFrom], [IsActive], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (1, N'MPA + CASH DISCOUNT', 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2014-08-12T09:40:00.000' AS DateTime), CAST(N'2014-08-12T09:40:00.000' AS DateTime))
INSERT [dbo].[Discounts] ([DiscountCode], [DiscountName], [DiscountPriority], [DiscountPercentageModel], [FilterRequired], [DataModelTableCode], [ConsiderProfitEarning], [DefaultLedgerCode], [SchemeType], [SlabModelExecutionCode], [SingleDataModelExecutionCode], [DiscountApplyOn], [ConsiderQtyValueFrom], [IsActive], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (2, N'MPO Discount', 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2008-07-03T00:00:00.000' AS DateTime), CAST(N'2008-07-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Discounts] ([DiscountCode], [DiscountName], [DiscountPriority], [DiscountPercentageModel], [FilterRequired], [DataModelTableCode], [ConsiderProfitEarning], [DefaultLedgerCode], [SchemeType], [SlabModelExecutionCode], [SingleDataModelExecutionCode], [DiscountApplyOn], [ConsiderQtyValueFrom], [IsActive], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (3, N'Addl.Discount-Portal', 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2008-08-19T00:00:00.000' AS DateTime), CAST(N'2008-08-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Discounts] ([DiscountCode], [DiscountName], [DiscountPriority], [DiscountPercentageModel], [FilterRequired], [DataModelTableCode], [ConsiderProfitEarning], [DefaultLedgerCode], [SchemeType], [SlabModelExecutionCode], [SingleDataModelExecutionCode], [DiscountApplyOn], [ConsiderQtyValueFrom], [IsActive], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (4, N'(S.O) Special Discount', 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2008-07-03T00:00:00.000' AS DateTime), CAST(N'2008-07-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Discounts] ([DiscountCode], [DiscountName], [DiscountPriority], [DiscountPercentageModel], [FilterRequired], [DataModelTableCode], [ConsiderProfitEarning], [DefaultLedgerCode], [SchemeType], [SlabModelExecutionCode], [SingleDataModelExecutionCode], [DiscountApplyOn], [ConsiderQtyValueFrom], [IsActive], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (5, N'ADDITIONAL DISCOUNT', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2004-08-31T00:00:00.000' AS DateTime), CAST(N'2004-08-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Discounts] ([DiscountCode], [DiscountName], [DiscountPriority], [DiscountPercentageModel], [FilterRequired], [DataModelTableCode], [ConsiderProfitEarning], [DefaultLedgerCode], [SchemeType], [SlabModelExecutionCode], [SingleDataModelExecutionCode], [DiscountApplyOn], [ConsiderQtyValueFrom], [IsActive], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (6, N'CASH DISCOUNT', 7, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2004-08-31T00:00:00.000' AS DateTime), CAST(N'2004-08-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Discounts] ([DiscountCode], [DiscountName], [DiscountPriority], [DiscountPercentageModel], [FilterRequired], [DataModelTableCode], [ConsiderProfitEarning], [DefaultLedgerCode], [SchemeType], [SlabModelExecutionCode], [SingleDataModelExecutionCode], [DiscountApplyOn], [ConsiderQtyValueFrom], [IsActive], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (7, N'SERIAL NUMBER BASED DISCOUNT', 6, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2004-08-31T00:00:00.000' AS DateTime), CAST(N'2004-08-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Discounts] ([DiscountCode], [DiscountName], [DiscountPriority], [DiscountPercentageModel], [FilterRequired], [DataModelTableCode], [ConsiderProfitEarning], [DefaultLedgerCode], [SchemeType], [SlabModelExecutionCode], [SingleDataModelExecutionCode], [DiscountApplyOn], [ConsiderQtyValueFrom], [IsActive], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (8, N'GROWTH BASED DISCOUNT(based on Qty)', 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2013-08-31T15:22:00.000' AS DateTime), CAST(N'2013-08-31T15:22:00.000' AS DateTime))
INSERT [dbo].[Discounts] ([DiscountCode], [DiscountName], [DiscountPriority], [DiscountPercentageModel], [FilterRequired], [DataModelTableCode], [ConsiderProfitEarning], [DefaultLedgerCode], [SchemeType], [SlabModelExecutionCode], [SingleDataModelExecutionCode], [DiscountApplyOn], [ConsiderQtyValueFrom], [IsActive], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (9, N'GROWTH BASED DISCOUNT(based on Value)', 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2015-10-03T15:01:00.000' AS DateTime), CAST(N'2015-10-03T15:01:00.000' AS DateTime))
INSERT [dbo].[Discounts] ([DiscountCode], [DiscountName], [DiscountPriority], [DiscountPercentageModel], [FilterRequired], [DataModelTableCode], [ConsiderProfitEarning], [DefaultLedgerCode], [SchemeType], [SlabModelExecutionCode], [SingleDataModelExecutionCode], [DiscountApplyOn], [ConsiderQtyValueFrom], [IsActive], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (10, N'MPO CUMULATIVE DISCOUNT', 3, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2009-11-17T13:27:00.000' AS DateTime), CAST(N'2009-11-17T13:27:00.000' AS DateTime))
INSERT [dbo].[Discounts] ([DiscountCode], [DiscountName], [DiscountPriority], [DiscountPercentageModel], [FilterRequired], [DataModelTableCode], [ConsiderProfitEarning], [DefaultLedgerCode], [SchemeType], [SlabModelExecutionCode], [SingleDataModelExecutionCode], [DiscountApplyOn], [ConsiderQtyValueFrom], [IsActive], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (11, N'ADD ON DISCOUNT', 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2009-09-12T11:39:00.000' AS DateTime), CAST(N'2009-09-12T11:39:00.000' AS DateTime))
INSERT [dbo].[Discounts] ([DiscountCode], [DiscountName], [DiscountPriority], [DiscountPercentageModel], [FilterRequired], [DataModelTableCode], [ConsiderProfitEarning], [DefaultLedgerCode], [SchemeType], [SlabModelExecutionCode], [SingleDataModelExecutionCode], [DiscountApplyOn], [ConsiderQtyValueFrom], [IsActive], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (12, N'OFFSEASON DISCOUNT', 2, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2004-08-31T00:00:00.000' AS DateTime), CAST(N'2004-08-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Discounts] ([DiscountCode], [DiscountName], [DiscountPriority], [DiscountPercentageModel], [FilterRequired], [DataModelTableCode], [ConsiderProfitEarning], [DefaultLedgerCode], [SchemeType], [SlabModelExecutionCode], [SingleDataModelExecutionCode], [DiscountApplyOn], [ConsiderQtyValueFrom], [IsActive], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (13, N'DISCOUNT FOR PRODUCT WARRANTY REGISTERED', 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2014-09-22T10:58:00.000' AS DateTime), CAST(N'2014-09-22T10:58:00.000' AS DateTime))
INSERT [dbo].[Discounts] ([DiscountCode], [DiscountName], [DiscountPriority], [DiscountPercentageModel], [FilterRequired], [DataModelTableCode], [ConsiderProfitEarning], [DefaultLedgerCode], [SchemeType], [SlabModelExecutionCode], [SingleDataModelExecutionCode], [DiscountApplyOn], [ConsiderQtyValueFrom], [IsActive], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (14, N'QUANTITY DISCOUNT', 3, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2004-08-31T00:00:00.000' AS DateTime), CAST(N'2004-08-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Discounts] ([DiscountCode], [DiscountName], [DiscountPriority], [DiscountPercentageModel], [FilterRequired], [DataModelTableCode], [ConsiderProfitEarning], [DefaultLedgerCode], [SchemeType], [SlabModelExecutionCode], [SingleDataModelExecutionCode], [DiscountApplyOn], [ConsiderQtyValueFrom], [IsActive], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (15, N'SERVICE DISCOUNT', 4, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2004-08-31T00:00:00.000' AS DateTime), CAST(N'2004-08-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Discounts] ([DiscountCode], [DiscountName], [DiscountPriority], [DiscountPercentageModel], [FilterRequired], [DataModelTableCode], [ConsiderProfitEarning], [DefaultLedgerCode], [SchemeType], [SlabModelExecutionCode], [SingleDataModelExecutionCode], [DiscountApplyOn], [ConsiderQtyValueFrom], [IsActive], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (16, N'TARGET DISCOUNT', 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2004-08-31T00:00:00.000' AS DateTime), CAST(N'2004-08-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Discounts] ([DiscountCode], [DiscountName], [DiscountPriority], [DiscountPercentageModel], [FilterRequired], [DataModelTableCode], [ConsiderProfitEarning], [DefaultLedgerCode], [SchemeType], [SlabModelExecutionCode], [SingleDataModelExecutionCode], [DiscountApplyOn], [ConsiderQtyValueFrom], [IsActive], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (17, N'TURNOVER DISCOUNT', 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2004-08-31T00:00:00.000' AS DateTime), CAST(N'2004-08-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Discounts] ([DiscountCode], [DiscountName], [DiscountPriority], [DiscountPercentageModel], [FilterRequired], [DataModelTableCode], [ConsiderProfitEarning], [DefaultLedgerCode], [SchemeType], [SlabModelExecutionCode], [SingleDataModelExecutionCode], [DiscountApplyOn], [ConsiderQtyValueFrom], [IsActive], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (18, N'VALUE BASED DISCOUNT', 5, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2004-08-31T00:00:00.000' AS DateTime), CAST(N'2004-08-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Discounts] ([DiscountCode], [DiscountName], [DiscountPriority], [DiscountPercentageModel], [FilterRequired], [DataModelTableCode], [ConsiderProfitEarning], [DefaultLedgerCode], [SchemeType], [SlabModelExecutionCode], [SingleDataModelExecutionCode], [DiscountApplyOn], [ConsiderQtyValueFrom], [IsActive], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (19, N'MPO CUMULATIVE VALUE DISCOUNT', 3, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2013-06-17T12:01:00.000' AS DateTime), CAST(N'2013-06-17T12:01:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Discounts] OFF
ALTER TABLE [dbo].[DiscountFilterMaster] ADD  CONSTRAINT [DF_DiscountFilterMaster_DataModel]  DEFAULT ((0)) FOR [DataModel]
GO
ALTER TABLE [dbo].[DiscountFilterMaster] ADD  CONSTRAINT [DF_DiscountFilterMaster_FlterModel]  DEFAULT ((1)) FOR [FlterModel]
GO
ALTER TABLE [dbo].[Discounts] ADD  CONSTRAINT [DF_Discounts_FilterRequired]  DEFAULT ((1)) FOR [FilterRequired]
GO

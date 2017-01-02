USE [SmartERP.database]
GO
IF NOT EXISTS( SELECT TOP 1 * FROM MENU) 
BEGIN 
INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'Dashboard', N'Dashboard', N'home,index', N'', N'Module', CAST(N'2016-12-11 23:40:11.097' AS DateTime), CAST(N'2016-12-11 23:40:11.097' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'Users', N'Users', N'', N'', N'Module', CAST(N'2016-12-11 23:40:11.097' AS DateTime), CAST(N'2016-12-11 23:40:11.097' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'Transporter', N'Transporter', N'', N'', N'Module', CAST(N'2016-12-11 23:40:11.097' AS DateTime), CAST(N'2016-12-11 23:40:11.097' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'Bank', N'Bank', N'', N'', N'Module', CAST(N'2016-12-11 23:40:11.097' AS DateTime), CAST(N'2016-12-11 23:40:11.097' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'Customer', N'Customer', N'', N'', N'Module', CAST(N'2016-12-11 23:40:11.097' AS DateTime), CAST(N'2016-12-11 23:40:11.097' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'Settings', N'Settings', N'', N'', N'Module', CAST(N'2016-12-11 23:40:11.100' AS DateTime), CAST(N'2016-12-11 23:40:11.100' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'Company', N'Company', N'', N'', N'Module', CAST(N'2016-12-11 23:40:11.100' AS DateTime), CAST(N'2016-12-11 23:40:11.100' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'BranchControls', N'Bracnch Controls', N'', N'', N'Module', CAST(N'2016-12-11 23:40:11.100' AS DateTime), CAST(N'2016-12-11 23:40:11.100' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'AccountsMaster', N'Accounts Master', N'', N'', N'Module', CAST(N'2016-12-11 23:40:11.100' AS DateTime), CAST(N'2016-12-11 23:40:11.100' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'Dealer', N'Dealer ', N'', N'', N'Module', CAST(N'2016-12-11 23:40:11.100' AS DateTime), CAST(N'2016-12-11 23:40:11.100' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'ServiceStation', N'Service Station', N'', N'', N'Module', CAST(N'2016-12-11 23:40:11.100' AS DateTime), CAST(N'2016-12-11 23:40:11.100' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'OutsideSupplier', N'Outside Supplier', N'', N'', N'Module', CAST(N'2016-12-11 23:40:11.100' AS DateTime), CAST(N'2016-12-11 23:40:11.100' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'Staff', N'Staff', N'', N'', N'Module', CAST(N'2016-12-11 23:40:11.100' AS DateTime), CAST(N'2016-12-11 23:40:11.100' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'PrivacyPolicy', N'Privacy & Policy', N'misc,privacypolicy', N'Settings', N'Menu', CAST(N'2016-12-11 23:40:11.100' AS DateTime), CAST(N'2016-12-11 23:40:11.100' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'Roles', N'Roles', N'misc,roles', N'Settings', N'Menu', CAST(N'2016-12-11 23:40:11.100' AS DateTime), CAST(N'2016-12-11 23:40:11.100' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'Preference', N'Preference', N'', N'Settings', N'Menu', CAST(N'2016-12-11 23:40:11.100' AS DateTime), CAST(N'2016-12-11 23:40:11.100' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'HeadOffice', N'Head Office', N'', N'Company', N'Menu', CAST(N'2016-12-11 23:40:11.100' AS DateTime), CAST(N'2016-12-11 23:40:11.100' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'HoUnit', N'HO Unit', N'', N'Company', N'Menu', CAST(N'2016-12-11 23:40:11.100' AS DateTime), CAST(N'2016-12-11 23:40:11.100' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'SalesPoint', N'Sales Point', N'', N'Company', N'Menu', CAST(N'2016-12-11 23:40:11.100' AS DateTime), CAST(N'2016-12-11 23:40:11.100' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'CommonCustomer', N'Common Customer', N'', N'BranchControls', N'Menu', CAST(N'2016-12-11 23:40:11.103' AS DateTime), CAST(N'2016-12-11 23:40:11.103' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'CustomerControls', N'Customer Controls', N'', N'BranchControls', N'Menu', CAST(N'2016-12-11 23:40:11.103' AS DateTime), CAST(N'2016-12-11 23:40:11.103' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'ServiceCharge', N'Service Charge', N'', N'BranchControls', N'Menu', CAST(N'2016-12-11 23:40:11.103' AS DateTime), CAST(N'2016-12-11 23:40:11.103' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'GraceDays', N'Grace Days', N'', N'BranchControls', N'Menu', CAST(N'2016-12-11 23:40:11.103' AS DateTime), CAST(N'2016-12-11 23:40:11.103' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'CreditDays', N'Credit Days', N'', N'BranchControls', N'Menu', CAST(N'2016-12-11 23:40:11.103' AS DateTime), CAST(N'2016-12-11 23:40:11.103' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'DebitNote', N'Debit Note BCD Days', N'', N'BranchControls', N'Menu', CAST(N'2016-12-11 23:40:11.103' AS DateTime), CAST(N'2016-12-11 23:40:11.103' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'BranchMaster', N'Branch Master', N'', N'BranchControls', N'Menu', CAST(N'2016-12-11 23:40:11.103' AS DateTime), CAST(N'2016-12-11 23:40:11.103' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'CompanyMaster', N'Company Master', N'', N'BranchControls', N'Menu', CAST(N'2016-12-11 23:40:11.103' AS DateTime), CAST(N'2016-12-11 23:40:11.103' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'DocumentMaster', N'Document Master', N'', N'BranchControls', N'Menu', CAST(N'2016-12-11 23:40:11.107' AS DateTime), CAST(N'2016-12-11 23:40:11.107' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'AccountGroup', N'Account Group', N'', N'AccountsMaster', N'Menu', CAST(N'2016-12-11 23:40:11.107' AS DateTime), CAST(N'2016-12-11 23:40:11.107' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'BankLedger', N'Bank Ledger', N'', N'AccountsMaster', N'Menu', CAST(N'2016-12-11 23:40:11.107' AS DateTime), CAST(N'2016-12-11 23:40:11.107' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'BankChallanType', N'SBank Challan Type', N'', N'AccountsMaster', N'Menu', CAST(N'2016-12-11 23:40:11.107' AS DateTime), CAST(N'2016-12-11 23:40:11.107' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'GeneralLedger', N'General Ledger', N'', N'AccountsMaster', N'Menu', CAST(N'2016-12-11 23:40:11.107' AS DateTime), CAST(N'2016-12-11 23:40:11.107' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'OutsideSupplier', N'Outside Supplier', N'', N'AccountsMaster', N'Menu', CAST(N'2016-12-11 23:40:11.110' AS DateTime), CAST(N'2016-12-11 23:40:11.110' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'ExpenditureLedger', N'Expenditure Ledger', N'', N'AccountsMaster', N'Menu', CAST(N'2016-12-11 23:40:11.110' AS DateTime), CAST(N'2016-12-11 23:40:11.110' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'ExpenditureBreakup', N'Expenditure Breakup', N'', N'AccountsMaster', N'Menu', CAST(N'2016-12-11 23:40:11.110' AS DateTime), CAST(N'2016-12-11 23:40:11.110' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'NarrationsList', N'Narrations List', N'', N'AccountsMaster', N'Menu', CAST(N'2016-12-11 23:40:11.110' AS DateTime), CAST(N'2016-12-11 23:40:11.110' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'GJVControl', N'GJV Control', N'', N'AccountsMaster', N'Menu', CAST(N'2016-12-11 23:40:11.110' AS DateTime), CAST(N'2016-12-11 23:40:11.110' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'SalesAccount', N'Sales Account', N'', N'Dealer', N'Menu', CAST(N'2016-12-11 23:40:11.110' AS DateTime), CAST(N'2016-12-11 23:40:11.110' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'DepositAccount', N'Deposit Account', N'', N'Dealer', N'Menu', CAST(N'2016-12-11 23:40:11.113' AS DateTime), CAST(N'2016-12-11 23:40:11.113' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'ECMSVirtual', N'ECMS Virtual A/c No entry', N'', N'Dealer', N'Menu', CAST(N'2016-12-11 23:40:11.113' AS DateTime), CAST(N'2016-12-11 23:40:11.113' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'SalesAccount', N'Sales Account', N'', N'ServiceStation', N'Menu', CAST(N'2016-12-11 23:40:11.113' AS DateTime), CAST(N'2016-12-11 23:40:11.113' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'DepositAccount', N'Deposit Account', N'', N'ServiceStation', N'Menu', CAST(N'2016-12-11 23:40:11.113' AS DateTime), CAST(N'2016-12-11 23:40:11.113' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'ECMSVirtual', N'ECMS Virtual A/c No entry', N'', N'ServiceStation', N'Menu', CAST(N'2016-12-11 23:40:11.117' AS DateTime), CAST(N'2016-12-11 23:40:11.117' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'MaterialTransferAccount', N'Material Transfer Account', N'', N'ServiceStation', N'Menu', CAST(N'2016-12-11 23:40:11.117' AS DateTime), CAST(N'2016-12-11 23:40:11.117' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'ServiceBillAccount', N'Service Bill Account', N'', N'ServiceStation', N'Menu', CAST(N'2016-12-11 23:40:11.117' AS DateTime), CAST(N'2016-12-11 23:40:11.117' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'Purchase Account', N'Purchase Account', N'', N'OutsideSupplier', N'Menu', CAST(N'2016-12-11 23:40:11.117' AS DateTime), CAST(N'2016-12-11 23:40:11.117' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'DepositAccount', N'Deposit Account', N'', N'OutsideSupplier', N'Menu', CAST(N'2016-12-11 23:40:11.117' AS DateTime), CAST(N'2016-12-11 23:40:11.117' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'MaterialTransferAccount', N'Material Transfer Account', N'', N'OutsideSupplier', N'Menu', CAST(N'2016-12-11 23:40:11.117' AS DateTime), CAST(N'2016-12-11 23:40:11.117' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'MainAccount', N'Main Account', N'', N'Staff', N'Menu', CAST(N'2016-12-11 23:40:11.117' AS DateTime), CAST(N'2016-12-11 23:40:11.117' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'AdvanceTransferAccount', N'Advance Transfer Account', N'', N'Staff', N'Menu', CAST(N'2016-12-11 23:40:11.117' AS DateTime), CAST(N'2016-12-11 23:40:11.117' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'ECMSVirtual', N'ECMS Virtual A/c No entry', N'', N'Staff', N'Menu', CAST(N'2016-12-11 23:40:11.117' AS DateTime), CAST(N'2016-12-11 23:40:11.117' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'MaterialTransferAccount', N'Material Transfer Account', N'', N'Staff', N'Menu', CAST(N'2016-12-11 23:40:11.120' AS DateTime), CAST(N'2016-12-11 23:40:11.120' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'ServiceBillAccount', N'Service Bill Account', N'', N'Staff', N'Menu', CAST(N'2016-12-11 23:40:11.120' AS DateTime), CAST(N'2016-12-11 23:40:11.120' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'LockedUsers', N'Locked Users', N'account,unlockusers', N'Users', N'Menu', CAST(N'2016-12-11 23:40:11.120' AS DateTime), CAST(N'2016-12-11 23:40:11.120' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Menu] ([MenuCode], [MenuName], [MenuURL], [ParentMenucode], [MenuType], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'ManageUsers', N'Manage Users', N'account,users', N'Users', N'Menu', CAST(N'2016-12-11 23:40:11.120' AS DateTime), CAST(N'2016-12-11 23:40:11.120' AS DateTime), N'admin', N'admin', 1)


INSERT [dbo].[Role] ([RoleCode], [RoleName], [RoleMenu], [BaseControl], [RoleGroup], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'CRIR001', N'HO Admin', N'Fixed', N'Branch', N'Technical', CAST(N'2016-12-15 22:48:46.810' AS DateTime), CAST(N'2016-12-15 22:48:46.810' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Role] ([RoleCode], [RoleName], [RoleMenu], [BaseControl], [RoleGroup], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'CRIR002', N'Branch Admin', N'Dynamic', N'Branch', N'Technical', CAST(N'2016-12-15 22:48:46.830' AS DateTime), CAST(N'2016-12-15 22:48:46.830' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[Role] ([RoleCode], [RoleName], [RoleMenu], [BaseControl], [RoleGroup], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'CRIR003', N'Branch Operations', N'Dynamic', N'Branch', N'Technical', CAST(N'2016-12-15 22:48:46.830' AS DateTime), CAST(N'2016-12-15 22:48:46.830' AS DateTime), N'admin', N'admin', 1)


INSERT [dbo].[RoleGroup] ([RoleGroupCode], [RoleGroupValue], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'Finance', N'Finance', CAST(N'2016-12-15 22:48:54.560' AS DateTime), CAST(N'2016-12-15 22:48:54.560' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[RoleGroup] ([RoleGroupCode], [RoleGroupValue], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'Marketing', N'Marketing', CAST(N'2016-12-15 22:48:54.593' AS DateTime), CAST(N'2016-12-15 22:48:54.593' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[RoleGroup] ([RoleGroupCode], [RoleGroupValue], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'Operations', N'Operations', CAST(N'2016-12-15 22:48:54.667' AS DateTime), CAST(N'2016-12-15 22:48:54.667' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[RoleGroup] ([RoleGroupCode], [RoleGroupValue], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'Zone', N'Zone', CAST(N'2016-12-15 22:48:54.670' AS DateTime), CAST(N'2016-12-15 22:48:54.670' AS DateTime), N'admin', N'admin', 1)

INSERT [dbo].[RoleGroup] ([RoleGroupCode], [RoleGroupValue], [CreatedTimeStamp], [UpdatedTimeStamp], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (N'Technical', N'Technical', CAST(N'2016-12-15 22:48:54.670' AS DateTime), CAST(N'2016-12-15 22:48:54.670' AS DateTime), N'admin', N'admin', 1)


END
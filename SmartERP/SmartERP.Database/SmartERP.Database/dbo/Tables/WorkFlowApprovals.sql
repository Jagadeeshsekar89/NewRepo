CREATE TABLE [dbo].[WorkFlowApprovals]
(
	[Id] INT  IDENTITY(1,1) NOT NULL PRIMARY KEY, 
	[ApprovalLevelCode] INT NOT NULL ,
    [FormCode] NVARCHAR(MAX) NOT NULL, 
    [RoleCode] NVARCHAR(MAX) NOT NULL, 
    [Type] NVARCHAR(MAX) NOT NULL, 
	[DefaultMoveToNextLevel] NVARCHAR(MAX) NOT NULL, 
    [ExecuteRule_SP] NVARCHAR(MAX) NOT NULL,
	[True_ApprovalLevelCode] INT NOT NULL,
	[False_ApprovalLevelCode] INT NOT NULL,
	[EnableSendBackOption] NVARCHAR(MAX) NOT NULL,
	[CreatedTimeStamp][datetime] NOT NULL,
	[UpdatedTimeStamp][datetime] NOT NULL,
	[CreatedBy] [varchar](max) NULL,
	[UpdatedBy] [varchar](max) NULL,
	[IsActive][bit] NULL,
)

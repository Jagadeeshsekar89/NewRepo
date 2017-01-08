CREATE TABLE [dbo].[WorkFlowForm]
(
	[Id] INT  IDENTITY(1,1) NOT NULL PRIMARY KEY, 
    [FormCode] NVARCHAR(MAX) NOT NULL, 
    [FormName] NVARCHAR(MAX) NOT NULL, 
    [DynamicForm] NVARCHAR(MAX) NOT NULL, 
	[TableName] NVARCHAR(MAX) NOT NULL, 
    [OnSubmitJSScript] NVARCHAR(MAX) NOT NULL,
	[CreatedTimeStamp][datetime] NOT NULL,
	[UpdatedTimeStamp][datetime] NOT NULL,
	[CreatedBy] [varchar](max) NULL,
	[UpdatedBy] [varchar](max) NULL,
	[IsActive][bit] NULL,
)

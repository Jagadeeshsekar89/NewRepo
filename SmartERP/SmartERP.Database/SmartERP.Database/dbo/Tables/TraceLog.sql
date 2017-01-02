CREATE TABLE [dbo].[TraceLog]
(
	[Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY, 
    [AuditID] UNIQUEIDENTIFIER NULL, 
    [UserName] VARCHAR(MAX) NULL, 
    [IPAddress] VARCHAR(MAX) NULL, 
    [AreaAccessed] VARCHAR(MAX) NULL, 
    [Message] VARCHAR(MAX) NULL, 
    [ControllerName] VARCHAR(MAX) NULL, 
    [ActionName] VARCHAR(MAX) NULL, 
    [CreatedTimeStamp] DATETIME NOT NULL, 
    [UpdatedTimeStamp] DATETIME NOT NULL, 
    [CreatedBy] VARCHAR(MAX) NULL, 
    [UpdatedBy] VARCHAR(MAX) NULL, 
    [IsActive] BIT NOT NULL
)

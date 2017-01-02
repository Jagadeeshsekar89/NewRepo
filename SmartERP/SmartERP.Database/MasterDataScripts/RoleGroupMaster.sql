USE [SMARTDB]
GO

INSERT INTO [dbo].[RoleGroup]
           ([RoleGroupCode]
           ,[RoleGroupValue]
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive])
     VALUES
           ('Finance','Finance',GETDATE(), GETDATE(), 'admin','admin',1)
GO		   
INSERT INTO [dbo].[RoleGroup]
           ([RoleGroupCode]
           ,[RoleGroupValue]
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive])
     VALUES
           ('Marketing','Marketing',GETDATE(), GETDATE(), 'admin','admin',1)

GO

INSERT INTO [dbo].[RoleGroup]
           ([RoleGroupCode]
           ,[RoleGroupValue]
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive])
     VALUES
           ('Operations','Operations',GETDATE(), GETDATE(), 'admin','admin',1)
		   GO

INSERT INTO [dbo].[RoleGroup]
           ([RoleGroupCode]
           ,[RoleGroupValue]
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive])
     VALUES
           ('Zone','Zone',GETDATE(), GETDATE(), 'admin','admin',1)
		   GO
		   INSERT INTO [dbo].[RoleGroup]
           ([RoleGroupCode]
           ,[RoleGroupValue]
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive])
     VALUES
           ('Technical','Technical',GETDATE(), GETDATE(), 'admin','admin',1)
		   GO
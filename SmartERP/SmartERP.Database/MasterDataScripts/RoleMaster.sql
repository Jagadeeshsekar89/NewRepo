USE [SMARTDB]
GO

INSERT INTO [dbo].[Role]
           ([RoleCode]
           ,[RoleName]
           ,[RoleMenu]
           ,[BaseControl]
           ,[RoleGroup]
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive])
     VALUES
           ('Admin', 'Admin', 'Fixed', 'Branch', 'Technical', GETDATE(), getdate(), 'admin', 'admin', 1)
GO
INSERT INTO [dbo].[Role]
           ([RoleCode]
           ,[RoleName]
           ,[RoleMenu]
           ,[BaseControl]
           ,[RoleGroup]
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive])
     VALUES
           ('Manager', 'Manager', 'Fixed', 'Branch', 'Technical', GETDATE(), getdate(), 'admin', 'admin', 1)
GO
INSERT INTO [dbo].[Role]
           ([RoleCode]
           ,[RoleName]
           ,[RoleMenu]
           ,[BaseControl]
           ,[RoleGroup]
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive])
     VALUES
           ('Audit', 'Audit', 'Fixed', 'Branch', 'Technical', GETDATE(), getdate(), 'admin', 'admin', 1)
GO


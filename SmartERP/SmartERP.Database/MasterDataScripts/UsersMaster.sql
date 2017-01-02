USE [SMARTDB]
GO

INSERT INTO [dbo].[User]
           ([UserCode]
           ,[FirstName]
           ,[LastName]
           ,[SSO]
           ,[Username]
           ,[Password]
           ,[EmployeeID]
           ,[EmailID]
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive])
     VALUES
           ('CRI0001', 'test1','testlast','','adminuser','admin','11111','admin@cri.com',GETDATE(),getdate(),'admin','admin',1)
GO
INSERT INTO [dbo].[User]
           ([UserCode]
           ,[FirstName]
           ,[LastName]
           ,[SSO]
           ,[Username]
           ,[Password]
           ,[EmployeeID]
           ,[EmailID]
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive])
     VALUES
           ('CRI0002', 'test2','testlast','','manageruser','manager','22222','manager@cri.com',GETDATE(),getdate(),'admin','admin',1)
GO
INSERT INTO [dbo].[User]
           ([UserCode]
           ,[FirstName]
           ,[LastName]
           ,[SSO]
           ,[Username]
           ,[Password]
           ,[EmployeeID]
           ,[EmailID]
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive])
     VALUES
           ('CRI0003', 'test3','testlast','','audituser','audit','33333','audit@cri.com',GETDATE(),getdate(),'admin','admin',1)
GO


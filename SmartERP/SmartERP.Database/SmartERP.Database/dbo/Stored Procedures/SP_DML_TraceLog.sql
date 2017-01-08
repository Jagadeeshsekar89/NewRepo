CREATE PROCEDURE [dbo].[SP_DML_TraceLog]
@Action VARCHAR(10) ='UPDATE',
@Id int = 0,
@AuditID UNIQUEIDENTIFIER  =null,
@UserName int  =0,
@IPAddress varchar(max)  =null,
@AreaAccessed varchar(max)  =null, 
@Message varchar(max)  =null, 
@ControllerName varchar(max)  =null, 
@ActionName varchar(max)  =null,
@CreatedTimeStamp datetime = null,
@UpdatedTimeStamp datetime = null,
@CreatedBy varchar(max)=null ,
@UpdatedBy varchar(max) =null,
@IsActive bit =1
AS
BEGIN
SET @CreatedTimeStamp  = GETUTCDATE();
SET @UpdatedTimeStamp  = GETUTCDATE();
  
    IF ( @Id=0 and  @Action='UPDATE' ) SET  @Action = 'INSERT' 

	IF @Action = 'INSERT' 
	BEGIN
	
	INSERT INTO [dbo].TraceLog
           ([AuditID] 
			,[UserName] 
			,[IPAddress]  
		   , [AreaAccessed]  
			,[Message]  
			,[ControllerName] 
			,[ActionName]     
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive])
     VALUES (
			@AuditID ,
			@UserName  ,
			@IPAddress ,
			@AreaAccessed ,
			@Message  ,
			@ControllerName  ,
			@ActionName  ,			
			GETUTCDATE(),
			GETUTCDATE(),
			@CreatedBy ,
			@UpdatedBy,
			@IsActive);

		SET @Id= @@IDENTITY ;
		SELECT @id ;
	END 
	ELSE IF  @Action = 'UPDATE' 
	BEGIN 
	  UPDATE TraceLog SET
           [AuditID] = @AuditID
			,[UserName] = @UserName
			,[IPAddress]  = @IPAddress
		   , [AreaAccessed] = @AreaAccessed
			,[Message]  = @Message
			,[ControllerName] = @ControllerName
			,[ActionName]    = @ActionName 
           ,[UpdatedTimeStamp]=GETUTCDATE()          
           ,[UpdatedBy]=@UpdatedBy
           ,[IsActive]=@IsActive
            WHERE Id = @Id ;

			SELECT @id ;
	END 
	ELSE IF @Action = 'DELETE' 
	BEGIN
	DELETE FROM TraceLog
             WHERE Id = @Id ;
			SELECT @id ;
	END
	ELSE IF @Action = 'SELECT' 
	BEGIN
	SELECT * FROM TraceLog 
             WHERE Id = @Id ;
			
	END
	ELSE IF @Action = 'SELECTALL' 
	BEGIN
	SELECT  [id]
			,[AuditID] 
			,[UserName] 
			,[IPAddress]  
		    ,[AreaAccessed] 
			,[Message]  
			,[ControllerName] 
			,[ActionName]  
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive] FROM TraceLog ;
			
	END
	ELSE IF @Action = 'DROPDOWN' 
	BEGIN
	SELECT  [id] 
           ,[ControllerName] + [ActionName] AS DisplayValue
            FROM TraceLog 
			WHERE IsActive =1 ;
			
	END
END




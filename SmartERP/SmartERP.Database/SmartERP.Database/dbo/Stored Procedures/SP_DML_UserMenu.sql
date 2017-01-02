CREATE PROCEDURE [dbo].[SP_DML_UserMenu]
@Action VARCHAR(10) ='UPDATE',
@Id int = 0,
@UserCode varchar(max)  =null,
@MenuCode varchar(max) =null ,
@RoleCode varchar(max) =null ,
@CreatedTimeStamp datetime = null,
@UpdatedTimeStamp datetime = null,
@CreatedBy varchar(max)=null ,
@UpdatedBy varchar(max) =null,
@IsActive bit =1
AS
BEGIN
SET @CreatedTimeStamp  = GETUTCDATE()
SET @UpdatedTimeStamp  = GETUTCDATE()
    
    IF ( @Id=0 and  @Action='UPDATE' ) SET  @Action = 'INSERT' 

	IF @Action = 'INSERT' 
	BEGIN
	
	INSERT INTO [dbo].[UserMenu]
           ([UserCode]
           ,[MenuCode]
		   ,[RoleCode]
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive])
     VALUES(
			@UserCode,
			@MenuCode,
			@RoleCode,	
			GETUTCDATE(),
			GETUTCDATE(),
			@CreatedBy,
			@UpdatedBy,
			@IsActive);

		SET @Id= @@IDENTITY ;
		SELECT @id ;
	END 
	ELSE IF  @Action = 'UPDATE' 
	BEGIN 
	 UPDATE [dbo].[UserMenu]
   SET [UserCode] = @UserCode
      ,[MenuCode] = @MenuCode
	  ,[RoleCode] = @RoleCode     
      ,[UpdatedTimeStamp] = GETUTCDATE()  
      ,[UpdatedBy] = @UpdatedBy
      ,[IsActive] = @IsActive
            WHERE Id = @Id ;
			SELECT @id ;
	END 
	ELSE IF @Action = 'DELETE' 
	BEGIN
	DELETE FROM [dbo].[UserMenu]
             WHERE Id = @Id ;
			SELECT @id ;
	END
	ELSE IF @Action = 'SELECT' 
	BEGIN
	SELECT * FROM [dbo].[UserMenu]
             WHERE Id = @Id ;
			
	END
	ELSE IF @Action = 'SELECTALL' 
	BEGIN
	SELECT * FROM [dbo].[UserMenu]
             
			
	END
END






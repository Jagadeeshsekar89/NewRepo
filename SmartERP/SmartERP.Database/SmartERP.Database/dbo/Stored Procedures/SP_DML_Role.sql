CREATE PROCEDURE [dbo].[SP_DML_Role]
@Action VARCHAR(10) ='UPDATE',
@Id int = 0,
@RoleName varchar(max) =null ,
@BaseControl varchar(max) =null,
@RoleGroupCode int =0 ,
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
	
INSERT INTO [dbo].[Role]
           ([RoleName]
           ,[BaseControl]
           ,[RoleGroupCode]
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive])
     VALUES(
			@RoleName  ,
			@BaseControl ,
			@RoleGroupCode ,
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
	 UPDATE [dbo].[Role] SET
      [RoleName] = @RoleName
      ,[BaseControl] = @BaseControl
      ,[RoleGroupCode] = @RoleGroupCode     
      ,[UpdatedTimeStamp] = GETUTCDATE()     
      ,[UpdatedBy] = @UpdatedBy
      ,[IsActive] = @IsActive
		WHERE Id = @Id ;

		SELECT @id ;
	END 
	ELSE IF @Action = 'DELETE' 
	BEGIN
	DELETE FROM [Role]
             WHERE Id = @Id ;
			SELECT @id ;
	END
	ELSE IF @Action = 'SELECT' 
	BEGIN
	SELECT * FROM [Role]
             WHERE Id = @Id ;
			
	END
	ELSE IF @Action = 'SELECTALL' 
	BEGIN
	SELECT * FROM [Role]
             
			
	END
END




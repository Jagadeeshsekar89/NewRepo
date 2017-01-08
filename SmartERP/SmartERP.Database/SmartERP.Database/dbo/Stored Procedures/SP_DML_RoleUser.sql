CREATE PROCEDURE [dbo].[SP_DML_RoleUser]
@Action VARCHAR(10) ='UPDATE',
@Id int = 0,
@RoleCode int  =0,
@UserCode int  =0,
@BranchCode int  =0,
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
	
	INSERT INTO [dbo].[RoleUser]
           ([RoleCode]
           ,[UserCode]
           ,[BranchCode]
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive])
     VALUES(
			@RoleCode,
			@UserCode  ,
			@BranchCode   ,
			GETUTCDATE(),
			GETUTCDATE() ,
			@CreatedBy ,
			@UpdatedBy  ,
			@IsActive);

		SET @Id= @@IDENTITY ;
		
		EXECUTE SP_DML_UserAuditLog 'INSERT',0,'Role Activated to User', @CreatedBy, @UserCode,@RoleCode,@BranchCode,null,null,@CreatedBy,@UpdatedBy,1

		SELECT @id ;

	END 
	ELSE IF  @Action = 'UPDATE' 
	BEGIN 
	 
	 DECLARE @oldbranch int
	 SELECT @oldbranch = BranchCode from [dbo].[RoleUser] WHERE id = @id

	 IF @oldbranch <> @BranchCode
	 BEGIN
	 EXECUTE SP_DML_UserAuditLog 'INSERT',0,'Branch Removed to User', @UpdatedBy, @UserCode,@RoleCode,@oldbranch,null,null,@UpdatedBy,@UpdatedBy,1
	 EXECUTE SP_DML_UserAuditLog 'INSERT',0,'Branch Assigned to User',@UpdatedBy, @UserCode,@RoleCode,@BranchCode,null,null,@UpdatedBy,@UpdatedBy,1
	 END

	 UPDATE [dbo].[RoleUser]
   SET [RoleCode] = @RoleCode
      ,[UserCode] = @UserCode
      ,[BranchCode] = @BranchCode   
      ,[UpdatedTimeStamp] =    GETUTCDATE()
      ,[UpdatedBy] = @UpdatedBy
      ,[IsActive] = @IsActive
            WHERE Id = @Id ;

			IF @IsActive = 0
			BEGIN
			EXECUTE SP_DML_UserAuditLog 'INSERT',0,'Role Deactivated to User',@UpdatedBy, @UserCode,@RoleCode,@BranchCode,null,null,@UpdatedBy,@UpdatedBy,1
			END

			SELECT @id ;
	END 
	ELSE IF @Action = 'DELETE' 
	BEGIN
	DELETE FROM [RoleUser]
             WHERE Id = @Id ;
			SELECT @id ;
	END
	ELSE IF @Action = 'SELECT' 
	BEGIN
	SELECT * FROM [RoleUser]
             WHERE Id = @Id and IsActive = @IsActive;
			
	END
	ELSE IF @Action = 'SELECTALL' 
	BEGIN
	SELECT * FROM [RoleUser] WHERE IsActive = @IsActive
             
			
	END
END





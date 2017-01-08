CREATE PROCEDURE [dbo].[SP_DML_UserAuditLog]
@Action VARCHAR(10) ='INSERT',
@Id int = 0,
@ActionType varchar(max) NULL,
@ActionByUserCode int NULL,
@UserCode int NULL,
@RoleCode int NULL,
@BranchCode int NULL,
@CreatedTimeStamp datetime = null,
@UpdatedTimeStamp datetime = null,
@CreatedBy varchar(max)=null ,
@UpdatedBy varchar(max) =null,
@IsActive bit =1
AS
BEGIN
SET @CreatedTimeStamp  = GETUTCDATE()
SET @UpdatedTimeStamp  = GETUTCDATE()

    IF @Action = 'INSERT' 
	BEGIN
	
INSERT INTO [dbo].[UserAuditLog]
           ([ActionType]
			,[ActionByUserCode]
			,[UserCode]
			,[RoleCode]
			,[BranchCode]
            ,[CreatedTimeStamp]
            ,[UpdatedTimeStamp]
            ,[CreatedBy]
            ,[UpdatedBy]
            ,[IsActive])
     VALUES(
			@ActionType,
			@ActionByUserCode,
			@UserCode,
			@RoleCode,
			@BranchCode,
			GETUTCDATE(),
			GETUTCDATE(),
			@CreatedBy ,
			@UpdatedBy,
			@IsActive);

		SET @Id= @@IDENTITY ;
		SELECT @id ;
	END 
END




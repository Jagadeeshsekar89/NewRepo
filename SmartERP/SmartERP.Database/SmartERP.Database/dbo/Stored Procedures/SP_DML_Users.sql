CREATE PROCEDURE [dbo].[SP_DML_Users]
@Action VARCHAR(10) ='UPDATE',
@Id int = 0,
@UserCode varchar(max)  =null,
@FirstName varchar(max) =null ,
@LastName varchar(max) =null,
@SSO varchar(max) =null,
@Username varchar(max) =null ,
@Password varchar(max) =null ,
@EmployeeID varchar(max)=null ,
@EmailID varchar(max)=null ,
@MobileNumber varchar(max)=null ,
@ImageUrl varchar(max)=null ,
@CreatedTimeStamp datetime = null,
@UpdatedTimeStamp datetime = null,
@CreatedBy varchar(max)=null ,
@UpdatedBy varchar(max) =null,
@IsActive bit =1,
@IsDefaultPassword bit=1,
@IsLocked bit=1,
@PasswordExpiryDate datetime = null
AS
BEGIN
SET @CreatedTimeStamp  = GETUTCDATE();
SET @UpdatedTimeStamp  = GETUTCDATE();
  
    IF ( @Id=0 and  @Action='UPDATE' ) SET  @Action = 'INSERT' 

	IF @Action = 'INSERT' 
	BEGIN
	
	INSERT INTO [dbo].[Users]
           ([UserCode]
           ,[FirstName]
           ,[LastName]
           ,[SSO]
           ,[Username]
           ,[Password]
           ,[EmployeeID]
           ,[EmailID]
		   ,[MobileNumber]
		   ,[ImageUrl]
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive]
		   ,[IsDefaultPassword]
		   ,[IsLocked]
		   ,[PasswordExpiryDate])
     VALUES (
			@UserCode ,
			@FirstName  ,
			@LastName ,
			@SSO ,
			@Username  ,
			@Password  ,
			@EmployeeID  ,
			@EmailID  ,
			@MobileNumber,
			@ImageUrl,
			GETUTCDATE(),
			GETUTCDATE(),
			@CreatedBy ,
			@UpdatedBy,
			@IsActive,
			@IsDefaultPassword,
			@IsLocked,
			@PasswordExpiryDate);

		SET @Id= @@IDENTITY ;
		SELECT @id ;
	END 
	ELSE IF  @Action = 'UPDATE' 
	BEGIN 
	  UPDATE [Users] SET
            [UserCode] =@UserCode
           ,[FirstName]=@FirstName
           ,[LastName]=@LastName
           ,[SSO]=@SSO
           ,[Username]=@Username
           ,[Password]=@Password
           ,[EmployeeID]=@EmployeeID
           ,[EmailID]=@EmailID
		   ,[MobileNumber]=@MobileNumber
		   ,[ImageUrl]=@ImageUrl
           --,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]=GETUTCDATE()
           --,[CreatedBy]
           ,[UpdatedBy]=@UpdatedBy
           ,[IsActive]=@IsActive
		   ,[IsDefaultPassword]=@IsDefaultPassword
		   ,[IsLocked]=@IsLocked
		   ,[PasswordExpiryDate]=@PasswordExpiryDate
            WHERE Id = @Id ;

			SELECT @id ;
	END 
	ELSE IF @Action = 'DELETE' 
	BEGIN
	DELETE FROM [Users]
             WHERE Id = @Id ;
			SELECT @id ;
	END
	ELSE IF @Action = 'SELECT' 
	BEGIN
	SELECT * FROM [Users] 
             WHERE Id = @Id ;
			
	END
	ELSE IF @Action = 'SELECTALL' 
	BEGIN
	SELECT  [id]
			,[UserCode]
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
           ,[IsActive] 
		   ,[IsDefaultPassword]
           ,[IsLocked]
		   ,[PasswordExpiryDate] FROM [Users] ;
			
	END
	ELSE IF @Action = 'DROPDOWN' 
	BEGIN
	SELECT  [id] 
           ,[FirstName] + [LastName] AS DisplayValue
            FROM [Users] 
			WHERE ISNULL(IsActive,0) =1 ;
			
	END
END




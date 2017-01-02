CREATE PROCEDURE [dbo].[SP_DML_Security]
@Action VARCHAR(10) ='UPDATE',
@Id int = 0,
@MinLength int  = null,
@MaxLength int =null ,
@ExpiryDays int =null,
@LockoutCount int =null,
@SessionTimeoutWorkforce int = null,
@SessionTimeoutOthers int = null,
@IsAlphaMust bit = 0 ,
@IsNumericMust bit = 0 ,
@IsSplCharMust bit = 0 ,
@IsFirstPwdChange bit = 0 ,
@IsVirtualKeyboard bit = 0 ,
@IsIpRestricted bit = 0 ,
@IsCaptchaRequired bit = 0 ,
@IsForgotPassword bit = 0 ,
@IsCloseBrowser bit = 0,
@IsAutoLogout bit = 0 ,
@RemoteAccess varchar(max)=null ,
@IpAddress varchar(max) =null,
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
	
	INSERT INTO [dbo].[Security]
           ([MinLength]
           ,[MaxLength]
           ,[ExpiryDays]
           ,[LockoutCount]
		   ,[SessionTimeoutWorkforce]
		   ,[SessionTimeoutOthers]
           ,[IsAlphaMust]
           ,[IsNumericMust]
           ,[IsSplCharMust]
           ,[IsFirstPwdChange]
           ,[IsVirtualKeyboard]
           ,[IsIpRestricted]
           ,[IsCaptchaRequired]
           ,[IsForgotPassword]
		   ,[IsCloseBrowser]
		   ,[IsAutoLogout]
           ,[IpAddress]
           ,[RemoteAccess]
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive])
     VALUES
           (
		   @MinLength,
		   @MaxLength,
		   @ExpiryDays,
		   @LockoutCount,
		   @SessionTimeoutWorkforce,
		   @SessionTimeoutOthers,
		   @IsAlphaMust,
		   @IsNumericMust,
		   @IsSplCharMust,
		   @IsFirstPwdChange,
		   @IsVirtualKeyboard,
		   @IsIpRestricted,
		   @IsCaptchaRequired,
		   @IsForgotPassword,
		   @IsCloseBrowser,
		   @IsAutoLogout,
		   @IpAddress,
		   @RemoteAccess,
           GETUTCDATE(),
			GETUTCDATE(),
			@CreatedBy ,
			@UpdatedBy,
			@IsActive)

		SET @Id= @@IDENTITY ;
		SELECT @id ;
	END 
	ELSE IF  @Action = 'UPDATE' 
	BEGIN 
	  UPDATE [dbo].[Security]
   SET [MinLength] = @MinLength
      ,[MaxLength] = @MaxLength
      ,[ExpiryDays] = @ExpiryDays
      ,[LockoutCount] = @LockoutCount
	  ,[SessionTimeoutWorkforce] = @SessionTimeoutWorkforce
	  ,[SessionTimeoutOthers] = @SessionTimeoutOthers
      ,[IsAlphaMust] = @IsAlphaMust
      ,[IsNumericMust] = @IsNumericMust
      ,[IsSplCharMust] = @IsSplCharMust
      ,[IsFirstPwdChange] = @IsFirstPwdChange
      ,[IsVirtualKeyboard] = @IsVirtualKeyboard
      ,[IsIpRestricted] = @IsIpRestricted
      ,[IsCaptchaRequired] = @IsCaptchaRequired
      ,[IsForgotPassword] = @IsForgotPassword
	  ,[IsCloseBrowser] = @IsCloseBrowser
	  ,[IsAutoLogout] = @IsAutoLogout
      ,[IpAddress] = @IpAddress
      ,[RemoteAccess] = @RemoteAccess
           ,[UpdatedTimeStamp]=GETUTCDATE()
           ,[UpdatedBy]=@UpdatedBy
           ,[IsActive]=@IsActive
            WHERE Id = @Id ;
			SELECT @id ;
	END 
	ELSE IF @Action = 'DELETE' 
	BEGIN
	DELETE FROM [USER]
             WHERE Id = @Id ;
			SELECT @id ;
	END
	ELSE IF @Action = 'SELECT' 
	BEGIN
	SELECT * FROM [Security] 
             WHERE Id = @Id ;
			
	END
	ELSE IF @Action = 'SELECTALL' 
	BEGIN
	SELECT  [id]
		   ,[MinLength]
           ,[MaxLength]
           ,[ExpiryDays]
           ,[LockoutCount]
		   ,[SessionTimeoutWorkforce]
		   ,[SessionTimeoutOthers]
           ,[IsAlphaMust]
           ,[IsNumericMust]
           ,[IsSplCharMust]
           ,[IsFirstPwdChange]
           ,[IsVirtualKeyboard]
           ,[IsIpRestricted]
           ,[IsCaptchaRequired]
           ,[IsForgotPassword]
		   ,[IsCloseBrowser]
		   ,[IsAutoLogout]
           ,[IpAddress]
           ,[RemoteAccess]
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive] FROM [Security]
	END
END
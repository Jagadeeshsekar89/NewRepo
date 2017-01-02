CREATE PROCEDURE [dbo].[SP_DML_Country]
@Action VARCHAR(10) ='UPDATE',
@Id int = 0,
@CountryCode NVARCHAR(MAX) = null ,
@CountryName NVARCHAR(MAX) = null, 
@ShortName NVARCHAR(MAX) = null, 
@TimezoneCode NVARCHAR(MAX) = null, 
@DefaultLanguageCode	NVARCHAR(MAX) = null, 
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
	
	INSERT INTO [dbo].[Country]
           ([CountryCode] 
			,[CountryName]
			,[ShortName]
			,[TimezoneCode]
			,[DefaultLanguageCode]
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive]
		   )
     VALUES (
			@CountryCode ,
			@CountryName , 
			@ShortName , 
			@TimezoneCode ,
			@DefaultLanguageCode,
			GETUTCDATE(),
			GETUTCDATE(),
			@CreatedBy ,
			@UpdatedBy,
			@IsActive
			);

		SET @Id= @@IDENTITY ;
		SELECT @id ;
	END 
	ELSE IF  @Action = 'UPDATE' 
	BEGIN 
	  UPDATE [Country] SET
             [CountryCode]	= @CountryCode 
			,[CountryName]	= @CountryName 
			,[ShortName]	= @ShortName 
			,[TimezoneCode]=@TimezoneCode 
			,[DefaultLanguageCode]=@DefaultLanguageCode
           --,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]=GETUTCDATE()
           --,[CreatedBy]
           ,[UpdatedBy]=@UpdatedBy
           ,[IsActive]=@IsActive
		
            WHERE Id = @Id ;

			SELECT @id ;
	END 
	ELSE IF @Action = 'DELETE' 
	BEGIN
	DELETE FROM [Country]
             WHERE Id = @Id ;
			SELECT @id ;
	END
	ELSE IF @Action = 'SELECT' 
	BEGIN
	SELECT  [id]
			,[CountryCode] 
			,[CountryName]
			,[ShortName]
			,[TimezoneCode]
			,[DefaultLanguageCode]
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive] FROM [Country]
             WHERE Id = @Id ;
			
	END
	ELSE IF @Action = 'SELECTALL' 
	BEGIN
	SELECT  [id]
			,[CountryCode] 
			,[CountryName]
			,[ShortName]
			,[TimezoneCode]
			,[DefaultLanguageCode]
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive] 
		    FROM [Country] ;
			
	END
	ELSE IF @Action = 'DROPDOWN' 
	BEGIN
	SELECT  [CountryCode] as Id
           ,[ShortName] + [CountryName] AS DisplayValue
            FROM [Country] 
			WHERE ISNULL(IsActive,0) =1 ;
			
	END
END




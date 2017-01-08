CREATE PROCEDURE [dbo].[SP_DML_Company]
@Action VARCHAR(10) ='UPDATE',
@Id int = 0,
@CompanyCode NVARCHAR(MAX)='' ,
@CompanyName NVARCHAR(MAX) = '', 
@ShortName NVARCHAR(MAX) = '', 
@CountryCode NVARCHAR(MAX) = '',
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
	declare @MaxVal int
	select @MaxVal  = Max(Id) from [dbo].[Company]

	SET @CompanyCode = 'CMP' + CAST(@MaxVal AS VARCHAR)
	 
	INSERT INTO [dbo].[Company]
           ([CompanyCode] 
			,[CompanyName]
			,[ShortName]
			,[CountryCode]
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive]
		   )
     VALUES (
			@CompanyCode ,
			@CompanyName , 
			@ShortName , 
			@CountryCode ,
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
	  UPDATE [Company] SET
             [CompanyCode]	= @CompanyCode 
			,[CompanyName]	= @CompanyName 
			,[ShortName]	= @ShortName 
			,[CountryCode]	= @CountryCode 
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
	DELETE FROM [Company]
             WHERE Id = @Id ;
			SELECT @id ;
	END
	ELSE IF @Action = 'SELECT' 
	BEGIN
	SELECT [id]
			,[CompanyCode] 
			,[CompanyName]
			,[ShortName]
			,[CountryCode]
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive]  FROM [Company]
             WHERE Id = @Id ;
			
	END
	ELSE IF @Action = 'SELECTALL' 
	BEGIN
	SELECT  [id]
			,[CompanyCode] 
			,[CompanyName]
			,[ShortName]
			,[CountryCode]
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive] 
		    FROM [Company] ;
			
	END
	ELSE IF @Action = 'DROPDOWN' 
	BEGIN
	SELECT  [CompanyCode] as Id
           ,[ShortName] +' '+ [CompanyName] AS DisplayValue
            FROM [Company] 
			WHERE ISNULL(IsActive,0) = 1 ;
			
	END
END




CREATE PROCEDURE [dbo].[SP_DML_GeoDistrict]
@Action VARCHAR(10) ='UPDATE',
@Id int = 0,
@DistrictCode NVARCHAR(MAX)='' ,
@DistrictName NVARCHAR(MAX) = '', 
@StateCode NVARCHAR(MAX) = '', 
@BusinessCenter NVARCHAR(MAX) = '',
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
	
	INSERT INTO [dbo].[GeoDistrict]
           (DistrictCode 
			,DistrictName
			,StateCode
			,BusinessCenter
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive]
		   )
     VALUES (
			@DistrictCode ,
			@DistrictName , 
			@StateCode , 
			@BusinessCenter ,
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
	  UPDATE [GeoDistrict] SET
             DistrictCode	= @DistrictCode 
			,DistrictName	= @DistrictName 
			,StateCode	= @StateCode 
			,BusinessCenter	= @BusinessCenter 
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
	DELETE FROM [GeoDistrict]
             WHERE Id = @Id ;
			SELECT @id ;
	END
	ELSE IF @Action = 'SELECT' 
	BEGIN
	SELECT [id]
			,DistrictCode 
			,DistrictName
			,StateCode
			,BusinessCenter
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive]  FROM [GeoDistrict]
             WHERE Id = @Id ;
			
	END
	ELSE IF @Action = 'SELECTALL' 
	BEGIN
	SELECT  [id]
			,DistrictCode 
			,DistrictName
			,StateCode
			,BusinessCenter
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive] 
		    FROM [GeoDistrict] ;
			
	END
	ELSE IF @Action = 'DROPDOWN' 
	BEGIN
	SELECT  DistrictCode as Id
           ,DistrictName AS DisplayValue
            FROM [GeoDistrict] 
			WHERE ISNULL(IsActive,0) =1 ;
			
	END
END




CREATE PROCEDURE [dbo].[SP_DML_BusinessCenter]
@Action VARCHAR(10) ='UPDATE',
@Id int = 0,
@BusinessCenterCode NVARCHAR(MAX)='' ,
@BusinessCenterName NVARCHAR(MAX) = '', 
@DistrictCode NVARCHAR(MAX) = '', 

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
	
	INSERT INTO [dbo].[BusinessCenter]
           ([BusinessCenterCode] 
			,[BusinessCenterName]
			,[DistrictCode]			
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive]
		   )
     VALUES (
			@BusinessCenterCode ,
			@BusinessCenterName , 
			@DistrictCode , 			
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
	  UPDATE [dbo].[BusinessCenter] SET
             BusinessCenterCode	= @BusinessCenterCode 
			,BusinessCenterName	= @BusinessCenterName 
			,DistrictCode	= @DistrictCode 			
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
	DELETE FROM [dbo].[BusinessCenter]
             WHERE Id = @Id ;
			SELECT @id ;
	END
	ELSE IF @Action = 'SELECT' 
	BEGIN
	SELECT [id]
			,BusinessCenterCode 
			,BusinessCenterName
			,DistrictCode			
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive]  FROM [dbo].[BusinessCenter]
             WHERE Id = @Id ;
			
	END
	ELSE IF @Action = 'SELECTALL' 
	BEGIN
	SELECT  [id]
			,BusinessCenterCode 
			,BusinessCenterName
			,DistrictCode	
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive] 
		    FROM [dbo].[BusinessCenter] ;
			
	END
	ELSE IF @Action = 'DROPDOWN' 
	BEGIN
	SELECT  BusinessCenterCode as Id
           ,BusinessCenterName AS DisplayValue
            FROM [dbo].[BusinessCenter] 
			WHERE ISNULL(IsActive,0) =1 ;
			
	END
END




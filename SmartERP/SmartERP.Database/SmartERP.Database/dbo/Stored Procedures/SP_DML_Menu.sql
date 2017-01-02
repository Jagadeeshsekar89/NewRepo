CREATE PROCEDURE [dbo].[SP_DML_Menu]
@Action VARCHAR(10) ='UPDATE',
@Id int = 0,
@MenuCode varchar(max)  =null,
@MenuName varchar(max) =null ,
@MenuUrl varchar(max) =null,
@ParentMenuCode varchar(max) =null,
@MenuType varchar(max) =null ,
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
	
	INSERT INTO [dbo].[Menu]
           ([MenuCode]
           ,[MenuName]
           ,[MenuURL]
           ,[ParentMenucode]
           ,[MenuType]
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive])
     VALUES(
			@MenuCode ,
			@MenuName  ,
			@MenuUrl ,
			@ParentMenuCode ,
			@MenuType ,
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
	  UPDATE [Menu] SET
       [MenuCode] = @MenuCode
      ,[MenuName] = @MenuName
      ,[MenuURL] = @MenuUrl
      ,[ParentMenucode] = @ParentMenuCode
      ,[MenuType] = @MenuType
      ,[UpdatedTimeStamp] = GETUTCDATE()      
      ,[UpdatedBy] = @UpdatedBy
      ,[IsActive] = @IsActive
            WHERE Id = @Id ;

			SELECT @id ;
	END 
	ELSE IF @Action = 'DELETE' 
	BEGIN
	DELETE FROM [Menu]
             WHERE Id = @Id ;
			SELECT @id ;
	END
	ELSE IF @Action = 'SELECT' 
	BEGIN
	SELECT * FROM [Menu]
             WHERE Id = @Id ;
			
	END
	ELSE IF @Action = 'SELECTALL' 
	BEGIN
	SELECT * FROM [Menu]
             
			
	END
END




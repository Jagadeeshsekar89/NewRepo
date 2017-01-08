CREATE PROCEDURE [dbo].[SP_DML_WorkFlowForm]
@Action VARCHAR(10) ='UPDATE',
@Id int = 0,
@FormCode NVARCHAR(MAX) = null ,
@FormName NVARCHAR(MAX) = NULL, 
@DynamicForm NVARCHAR(MAX) = NULL, 
@TableName NVARCHAR(MAX) = NULL, 
@OnSubmitJSScript NVARCHAR(MAX) = NULL,
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
	
	INSERT INTO [dbo].[WorkFlowForm]
           ([FormCode] 
			,[FormName] 
			,[DynamicForm]
			,[TableName] 
			,[OnSubmitJSScript]
			 ,[CreatedTimeStamp]
			 ,[UpdatedTimeStamp]
			 ,[CreatedBy]
			 ,[UpdatedBy]
			 ,[IsActive]
		   )
     VALUES (
			@FormCode,
			@FormName,
			@DynamicForm,
			@TableName,
			@OnSubmitJSScript,
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
	  UPDATE [WorkFlowForm] SET
			 [FormCode] = @FormCode
            ,[FormName] = @FormName
			,[DynamicForm] = @DynamicForm
			,[TableName] = @TableName
			,[OnSubmitJSScript] = @OnSubmitJSScript
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
	DELETE FROM [WorkFlowForm]
             WHERE Id = @Id ;
			SELECT @id ;
	END
	ELSE IF @Action = 'SELECT' 
	BEGIN
	SELECT  [id]
			[FormCode] 
			,[FormName] 
			,[DynamicForm]
			,[TableName] 
			,[OnSubmitJSScript]
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive] FROM [WorkFlowForm]
             WHERE Id = @Id ;
			
	END
	ELSE IF @Action = 'SELECTALL' 
	BEGIN
	SELECT  [id]
		[FormCode] 
			,[FormName] 
			,[DynamicForm]
			,[TableName] 
			,[OnSubmitJSScript]
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive] 
		    FROM  [WorkFlowForm] ;
			
	END
	ELSE IF @Action = 'DROPDOWN' 
	BEGIN
	SELECT  [FormCode] as Id
           ,[FormName] AS DisplayValue
            FROM  [WorkFlowForm]
			WHERE ISNULL(IsActive,0) =1 ;
			
	END
END




CREATE PROCEDURE [dbo].[SP_DML_WorkFlowApprovals]
@Action VARCHAR(10) ='UPDATE',
@Id int = 0,
@ApprovalLevelCode INT =0,
@FormCode NVARCHAR(MAX) = NULL, 
@RoleCode NVARCHAR(MAX) = NULL, 
@Type NVARCHAR(MAX) = NULL, 
@DefaultMoveToNextLevel NVARCHAR(MAX) = NULL, 
@ExecuteRule_SP NVARCHAR(MAX) = NULL,
@True_ApprovalLevelCode INT= 0,
@False_ApprovalLevelCode INT =0,
@EnableSendBackOption NVARCHAR(MAX) = NULL,
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
	
	INSERT INTO [dbo].[WorkFlowApprovals]
           ( [ApprovalLevelCode]
		   ,[FormCode] 
			,[RoleCode]
			,[Type] 
			,[DefaultMoveToNextLevel]
			,[ExecuteRule_SP] 
			,[True_ApprovalLevelCode] 
			,[False_ApprovalLevelCode] 
			,[EnableSendBackOption] 
			,[CreatedTimeStamp]
			 ,[UpdatedTimeStamp]
			 ,[CreatedBy]
			 ,[UpdatedBy]
			 ,[IsActive]
		   )
     VALUES (
			@ApprovalLevelCode,
			@FormCode,
			@RoleCode,
			@Type,
			@DefaultMoveToNextLevel,
			@ExecuteRule_SP,
			@True_ApprovalLevelCode,
			@False_ApprovalLevelCode,
			@EnableSendBackOption,
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
	  UPDATE [WorkFlowApprovals] SET
	  [ApprovalLevelCode] = @ApprovalLevelCode
			 ,[FormCode] = @FormCode
 ,[RoleCode] =@RoleCode
			,[Type] =@Type
			,[DefaultMoveToNextLevel] =@DefaultMoveToNextLevel
			,[ExecuteRule_SP] =@ExecuteRule_SP
			,[True_ApprovalLevelCode] =@True_ApprovalLevelCode
			,[False_ApprovalLevelCode] =@False_ApprovalLevelCode
			,[EnableSendBackOption] =@EnableSendBackOption
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
	DELETE FROM [WorkFlowApprovals]
             WHERE Id = @Id ;
			SELECT @id ;
	END
	ELSE IF @Action = 'SELECT' 
	BEGIN
	SELECT  [id]
			,[ApprovalLevelCode]
			,[FormCode] 
			,[RoleCode]
			,[Type] 
			,[DefaultMoveToNextLevel]
			,[ExecuteRule_SP] 
			,[True_ApprovalLevelCode] 
			,[False_ApprovalLevelCode] 
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive] FROM [WorkFlowApprovals]
             WHERE Id = @Id ;
			
	END
	ELSE IF @Action = 'SELECTALL' 
	BEGIN
	SELECT  [id]
	,[ApprovalLevelCode]	
	,[FormCode] 
			,[RoleCode]
			,[Type] 
			,[DefaultMoveToNextLevel]
			,[ExecuteRule_SP] 
			,[True_ApprovalLevelCode] 
			,[False_ApprovalLevelCode] 
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive] 
		    FROM  [WorkFlowApprovals] ;
			
	END
	ELSE IF @Action = 'DROPDOWN' 
	BEGIN
	SELECT  [ApprovalLevelCode] as Id
           ,[FormCode] + ' '+ [RoleCode] AS DisplayValue
            FROM  [WorkFlowApprovals]
			WHERE ISNULL(IsActive,0) =1 ;
			
	END
END




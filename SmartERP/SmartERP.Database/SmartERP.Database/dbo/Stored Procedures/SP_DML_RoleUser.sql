CREATE PROCEDURE [dbo].[SP_DML_RoleUser]
@Action VARCHAR(10) ='UPDATE',
@Id int = 0,
@RoleCode varchar(max)  =null,
@UserCode varchar(max) =null ,
@CompanyFilter varchar(max)  =null,
@CompanyCodes varchar(max) =null ,
@SBUFilter varchar(max) =null ,
@SBUCodes varchar(max) =null ,
@DivisonFilter varchar(max) =null ,
@DivisionCodes varchar(max) =null ,
@ZoneFilter varchar(max) =null ,
@ZoneCodes varchar(max) =null ,
@BranchFilter varchar(max) =null ,
@BranchCodes varchar(max) =null ,
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
	
	INSERT INTO [dbo].[RoleUser]
           ([RoleCode]
           ,[UserCode]
           ,[CompanyFilter]
           ,[CompanyCodes]
           ,[SBUFilter]
           ,[SBUCodes]
           ,[DivisonFilter]
           ,[DivisionCodes]
           ,[ZoneFilter]
           ,[ZoneCodes]
           ,[BranchFilter]
           ,[BranchCodes]
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive])
     VALUES(
			@RoleCode,
			@UserCode  ,
			@CompanyFilter ,
			@CompanyCodes   ,
			@SBUFilter   ,
			@SBUCodes   ,
			@DivisonFilter   ,
			@DivisionCodes   ,
			@ZoneFilter   ,
			@ZoneCodes   ,
			@BranchFilter   ,
			@BranchCodes   ,
			GETUTCDATE(),
			GETUTCDATE() ,
			@CreatedBy ,
			@UpdatedBy  ,
			@IsActive);

		SET @Id= @@IDENTITY ;
		SELECT @id ;
	END 
	ELSE IF  @Action = 'UPDATE' 
	BEGIN 
	 UPDATE [dbo].[RoleUser]
   SET [RoleCode] = @RoleCode
      ,[UserCode] = @UserCode
      ,[CompanyFilter] = @CompanyFilter
      ,[CompanyCodes] = @CompanyCodes
      ,[SBUFilter] = @SBUFilter
      ,[SBUCodes] = @SBUCodes
      ,[DivisonFilter] = @DivisonFilter
      ,[DivisionCodes] = @DivisionCodes
      ,[ZoneFilter] = @ZoneFilter
      ,[ZoneCodes] = @ZoneCodes
      ,[BranchFilter] = @BranchFilter
      ,[BranchCodes] = @BranchCodes    
      ,[UpdatedTimeStamp] =    GETUTCDATE()
      ,[UpdatedBy] = @UpdatedBy
      ,[IsActive] = @IsActive
            WHERE Id = @Id ;

			SELECT @id ;
	END 
	ELSE IF @Action = 'DELETE' 
	BEGIN
	DELETE FROM [RoleUser]
             WHERE Id = @Id ;
			SELECT @id ;
	END
	ELSE IF @Action = 'SELECT' 
	BEGIN
	SELECT * FROM [RoleUser]
             WHERE Id = @Id ;
			
	END
	ELSE IF @Action = 'SELECTALL' 
	BEGIN
	SELECT * FROM [RoleUser]
             
			
	END
END





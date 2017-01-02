CREATE PROCEDURE [dbo].[SP_DML_Notification]
@Action VARCHAR(10) ='UPDATE',
@Id int = 0,
@UserCode varchar(max)  =null,
@RoleCode varchar(max) =null ,
@KeyCode varchar(max) =null,
@LinkCode varchar(max) =null,
@LinkURL varchar(max) =null ,
@LinkName varchar(max) =null ,
@NotificationType varchar(max) =null,
@NotificationLink varchar(max) =null,
@Message varchar(max)=null ,
@ActionStatus varchar(max)=null ,
@PushNotificationStatus varchar(max)=null ,
@PushNotificationDeliveredDate datetime = null,
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
	
	INSERT INTO [dbo].[Notification]
           ([UserCode]
		   ,[RoleCode]
		   ,[KeyCode]
		   ,[LinkCode]
		   ,[LinkName]
		   ,[LinkURL]
		   ,[NotificationType]
		   ,[NotificationLink]
		   ,[Message]
		   ,[ActionStatus]
		   ,[PushNotificationStatus]
		   ,[PushNotificationDeliveredDate]
           ,[CreatedTimeStamp]
           ,[UpdatedTimeStamp]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsActive])
     VALUES (
			@UserCode ,
			@RoleCode  ,
			@KeyCode ,
			@LinkCode ,
			@LinkName  ,
			@LinkURL  ,
			@NotificationType  ,
			@NotificationLink  ,
			@Message,
			@ActionStatus,
			@PushNotificationStatus,
			@PushNotificationDeliveredDate,
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
	  UPDATE [Notification] SET
            [UserCode] =@UserCode
		   ,[RoleCode] =@RoleCode
		   ,[KeyCode] =@KeyCode
		   ,[LinkCode] =@LinkCode
		   ,[LinkName] =@LinkName
		   ,[LinkURL] =@LinkURL
		   ,[NotificationType] =@NotificationType
		   ,[NotificationLink] =@NotificationLink
		   ,[Message] =@Message
		   ,[ActionStatus] =@ActionStatus
		   ,[PushNotificationStatus] =@PushNotificationStatus
		   ,[PushNotificationDeliveredDate] =@PushNotificationDeliveredDate
           ,[UpdatedTimeStamp] = GETUTCDATE()
           ,[UpdatedBy]=@UpdatedBy
           ,[IsActive]=@IsActive
            WHERE Id = @Id ;

			SELECT @id ;
	END 
	ELSE IF @Action = 'DELETE' 
	BEGIN
	DELETE FROM [Notification]
             WHERE Id = @Id ;
			SELECT @id ;
	END
	ELSE IF @Action = 'SELECT' 
	BEGIN
	SELECT * FROM [Notification] 
             WHERE Id = @Id ;
			
	END
	ELSE IF @Action = 'SELECTALL' 
	BEGIN
	SELECT  * FROM [Notification] ;
			
	END
END





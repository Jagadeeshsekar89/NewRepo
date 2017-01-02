CREATE TABLE [dbo].[Notification]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [UserCode] VARCHAR(MAX) NULL, 
    [RoleCode] VARCHAR(MAX) NULL, 
    [NotificationType] VARCHAR(50) NULL, 
    [Message] VARCHAR(MAX) NULL, 
    [KeyCode] VARCHAR(MAX) NULL, 
    [LinkCode] VARCHAR(MAX) NULL, 
    [ActionStatus] VARCHAR(MAX) NULL, 
    [PushNotificationStatus] VARCHAR(MAX) NULL, 
    [NotificationLink] VARCHAR(MAX) NULL, 
    [LinkURL] VARCHAR(MAX) NULL, 
    [LinkName] VARCHAR(MAX) NULL, 
    [PushNotificationDeliveredDate] DATETIME NULL, 
    [CreatedTimeStamp] DATETIME NOT NULL, 
    [UpdatedTimeStamp] DATETIME NOT NULL, 
    [CreatedBy] VARCHAR(MAX) NULL, 
    [UpdatedBy] VARCHAR(MAX) NULL, 
    [IsActive] BIT NULL
)

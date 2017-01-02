CREATE PROCEDURE [dbo].[SP_GetUsers]
	@id int =0
AS
BEGIN
	
	SET NOCOUNT ON;
	IF @id = 0 
	BEGIN
 
SELECT [Id]
      ,[UserCode]
      ,[FirstName]
      ,[LastName]
      ,[SSO]
      ,[Username]
      ,[Password]
      ,[EmployeeID]
      ,[EmailID]
      ,[CreatedTimeStamp]
      ,[UpdatedTimeStamp]
      ,[CreatedBy]
      ,[UpdatedBy]
      ,[IsActive]
  FROM [dbo].[User]

  END 
  ELSE
  BEGIN
  SELECT [Id]
      ,[UserCode]
      ,[FirstName]
      ,[LastName]
      ,[SSO]
      ,[Username]
      ,[Password]
      ,[EmployeeID]
      ,[EmailID]
      ,[CreatedTimeStamp]
      ,[UpdatedTimeStamp]
      ,[CreatedBy]
      ,[UpdatedBy]
      ,[IsActive]
  FROM [dbo].[User] WHERE [Id] = @id
  END

END
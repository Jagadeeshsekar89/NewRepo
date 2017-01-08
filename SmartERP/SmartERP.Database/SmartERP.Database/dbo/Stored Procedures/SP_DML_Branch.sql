CREATE PROCEDURE [dbo].[SP_DML_Branch]
@Action VARCHAR(10) ='SELECT',
@Id int = 0

AS
BEGIN
	
	IF @Action = 'SELECT' 
	BEGIN
	SELECT * FROM [Branch]
             WHERE Id = @Id and IsActive = 1;
			
	END
	ELSE IF @Action = 'SELECTALL' 
	BEGIN
	SELECT * FROM [Branch]
			 WHERE IsActive = 1;
		
	END
END




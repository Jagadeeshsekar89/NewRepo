CREATE PROCEDURE [dbo].[SP_DML_ConfiguredRoleMenus]
	@RoleCode int  = 0
AS
BEGIN
SET NOCOUNT ON;

--declare @tmptable table
--(RoleCode varchar(max),
--RoleName varchar(max),
--MenuCode varchar(max),
--UserCode varchar(max))

	
	IF @RoleCode = 0
	BEGIN
	SELECT * from RoleUser
	END
	ELSE
	BEGIN
	 
	
	--insert into @tmptable(RoleCode, RoleName, MenuCode,  UserCode )
	--	select r.RoleCode, r.RoleName, rm.MenuCode , u.UserCode 
	--	FROM USERS U
	--INNER JOIN RoleUser RU ON RU.UserCode = U.UserCode
	--INNER JOIN ROLE R ON R.RoleCode = RU.RoleCode
	--inner JOIN ROLEMENU RM ON RM.RoleCode = R.RoleCode
	--where ru.RoleCode = @RoleCode


	--SELECT distinct 
	-- RoleCode,
	-- RoleName,  
	-- STUFF((SELECT ',' + a.MenuCode FROM  (SELECT distinct menucode from @tmptable)a  FOR XML PATH('')) ,1,1,'') AS MenuCode,
	--STUFF((SELECT ',' + b.UserCode FROM  (SELECT distinct usercode from @tmptable)b FOR XML PATH('')) ,1,1,'') AS UserCode
	--FROM @tmptable
	SELECT * from RoleUser where RoleCode = @RoleCode
	END
	END
	
GO






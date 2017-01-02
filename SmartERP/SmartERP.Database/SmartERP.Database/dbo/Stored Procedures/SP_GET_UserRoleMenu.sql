CREATE PROCEDURE [dbo].[SP_GET_UserRoleMenu]
@UserCode varchar(max)  =null
AS
BEGIN

	IF @UserCode is not null
	BEGIN
	
	Select distinct * from (select u.UserCode, u.FirstName, u.LastName, rm.MenuCode, r.RoleCode, r.RoleName, r.RoleMenu, M.MenuURL, M.MenuName, M.ParentMenucode, ru.BranchCodes  FROM USERS U
INNER JOIN RoleUser RU ON RU.UserCode = U.UserCode
INNER JOIN ROLE R ON R.RoleCode = RU.RoleCode
inner JOIN ROLEMENU RM ON RM.RoleCode = R.RoleCode
inner JOIN Menu M ON M.MenuCode = RM.MenuCode
where u.UserCode = @UserCode) tbl order by tbl.RoleCode

END 
--IF @RoleCode is not null
--	BEGIN
	
--	select u.UserCode, u.FirstName, u.LastName, rm.MenuCode,  r.RoleCode, r.RoleName, r.RoleMenu, ru.BranchCodes  FROM USERS U
--INNER JOIN RoleUser RU ON RU.UserCode = U.UserCode
--INNER JOIN ROLE R ON R.RoleCode = RU.RoleCode
--inner JOIN ROLEMENU RM ON RM.RoleCode = R.RoleCode
--where r.RoleCode = @RoleCode
--END 
--union 

--select u.UserCode, u.FirstName, u.LastName, um.MenuCode, null as RoleCode, null as RoleName, null as RoleMenu, null as BranchCodes FROM USERS U
--inner join UserMenu um on u.UserCode = um.UserCode
--where u.UserCode = @UserCode

	
	
END

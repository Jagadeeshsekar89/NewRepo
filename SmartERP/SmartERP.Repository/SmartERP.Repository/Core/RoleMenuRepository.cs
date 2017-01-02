using Dapper;
using SmartERP.Entity.Interface;
using SmartERP.Entity.Interface.User;
using SmartERP.Entity.Model.User;

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartERP.Repository.Core
{
    public class RoleMenuRepository : GenericRepository<RoleMenu>, IRoleMenu
    {
        public RoleMenuRepository(string table) : base(table)
        {
        }
        public RoleMenuRepository() : base()
        {
        }

        public IEnumerable<dynamic> GetUserRoleMenus(string userCode)
        {
            using (SqlConnection conn = ConnectionMangement.GetOpenConnection())
            {
                IEnumerable<dynamic> results = null;
                results = conn.Query<dynamic>("SP_GET_UserRoleMenu", new { @UserCode = userCode }, commandType: System.Data.CommandType.StoredProcedure).ToList();
                ConnectionMangement.CloseConnection(conn);
                return results;
            }
        }
    }
}

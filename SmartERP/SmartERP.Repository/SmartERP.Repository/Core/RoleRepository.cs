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
    public class RoleRepository : GenericRepository<Role>, IRole
    {
        public RoleRepository(string table) : base(table)
        {
        }
        public RoleRepository() : base()
        {
        }

        public IEnumerable<dynamic> GetAllConfiguredRoleMenus(string roleCode)
        {
            using (SqlConnection conn = ConnectionMangement.GetOpenConnection())
            {
                IEnumerable<dynamic> results = null;
                results = conn.Query<dynamic>("SP_DML_ConfiguredRoleMenus", new { @RoleCode = roleCode }, commandType: System.Data.CommandType.StoredProcedure).ToList();
                ConnectionMangement.CloseConnection(conn);
                return results;
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using SmartERP.Entity;
using SmartERP.Entity.Interface;
using Dapper;
using SmartERP.Entity.Model.User;
using SmartERP.Entity.Interface.User;
using System.Data;

namespace SmartERP.Repository.Core
{
    public class SecurityRepository : GenericRepository<Security> , ISecurity
    {
        public SecurityRepository(string table) : base(table)
        {
        }

        public SecurityRepository() : base()
        {
        }

        public Security CheckUserOptions( Users usr)
        {
            return new Security() { IsForgotPassword = true, IsVirtualKeyboard = true };

        }

        public Security CheckLoginOptions()
        {
            using (SqlConnection cn = ConnectionMangement.GetOpenConnection())
            {
                Security security = cn.Query<Security>("SP_DML_Security", null, commandType: System.Data.CommandType.StoredProcedure).FirstOrDefault();
                ConnectionMangement.CloseConnection(cn);
                return security;
            }
        }
    }
}



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
    public class UsersRepository : GenericRepository<Users> , IUsers
    {
        public UsersRepository(string table) : base(table)
        {
        }

        public UsersRepository() : base()
        {
        }

        public Users GetByEmail(string email)
        {
            using (SqlConnection cn = ConnectionMangement.GetOpenConnection())
            {
                Users Users = cn.Query<Users>("SP_GetUserByEmail", new { id = email }, commandType: System.Data.CommandType.StoredProcedure).FirstOrDefault();
                ConnectionMangement.CloseConnection(cn);
                return Users;
            }
        }
        public List<Users> GetLockedUsers()
        {
            using (SqlConnection cn = ConnectionMangement.GetOpenConnection())
            {
                List<Users> Users = cn.Query<Users>("SP_GetLockedUsers", null, commandType: System.Data.CommandType.StoredProcedure).ToList();
                ConnectionMangement.CloseConnection(cn);
                return Users;
            }
        }
    }
}



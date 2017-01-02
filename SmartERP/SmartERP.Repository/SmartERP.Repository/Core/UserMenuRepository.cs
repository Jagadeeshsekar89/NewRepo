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
    public class UserMenuRepository : GenericRepository<UserMenu>, IUserMenu
    {
        public UserMenuRepository(string table) : base(table)
        {
        }
        public UserMenuRepository() : base()
        {
        }
    }
}

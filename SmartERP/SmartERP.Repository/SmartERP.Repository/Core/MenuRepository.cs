using Dapper;
using SmartERP.Entity.Interface;
using SmartERP.Entity.Interface.User;
using SmartERP.Entity.Model.User;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartERP.Repository.Core
{
    public class MenuRepository : GenericRepository<Menu>, IMenu
    {
        public MenuRepository(string table) : base(table)
        {
        }
        public MenuRepository() : base()
        {
        }
    }
}

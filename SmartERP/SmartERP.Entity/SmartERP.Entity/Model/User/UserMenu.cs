using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SmartERP.Entity.Model.Base;

namespace SmartERP.Entity.Model.User
{
    public class UserMenu: BaseEntity
    {
        public string UserCode { get; set; }
        public string MenuCode { get; set; }
        public string RoleCode { get; set; }
    }
}

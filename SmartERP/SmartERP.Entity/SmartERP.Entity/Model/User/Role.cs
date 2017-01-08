using SmartERP.Entity.Model.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartERP.Entity.Model.User
{
    public class Role : BaseEntity
    {
        public string RoleName { get; set; }
        public string BaseControl { get; set; }
        public int RoleGroupCode { get; set; }

    }
}

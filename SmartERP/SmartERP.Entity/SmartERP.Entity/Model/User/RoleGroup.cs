using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SmartERP.Entity.Model.Base;

namespace SmartERP.Entity.Model.User
{
    public class RoleGroup: BaseEntity
    {
        public string RoleGroupCode { get; set; }
        public string RoleGroupValue { get; set; }

    }
}

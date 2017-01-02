using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SmartERP.Entity.Model.Base;

namespace SmartERP.Entity.Model.User
{
    public class Session:BaseEntity
    {
        public DateTime LoginTime { get; set; }
        public DateTime LogoutTime { get; set; }
        public string Ipaddress { get; set; }
        public string Deviceinfo { get; set; }
        public bool IsMultisessionAllowed { get; set; }

    }
}

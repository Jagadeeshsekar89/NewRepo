using SmartERP.Entity.Model.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartERP.Entity.Model.User
{
    public class Menu :BaseEntity
    {
        public string MenuCode { get; set; }
        public string MenuName { get; set; }
        public string MenuURL { get; set; }
        public string ParentMenucode { get; set; }        
        public string MenuType { get; set; }

    }
}
                                                                                
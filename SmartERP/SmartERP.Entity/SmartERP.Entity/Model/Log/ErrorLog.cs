using SmartERP.Entity.Model.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartERP.Entity.Model.Log
{
    public class ErrorLog: BaseEntity
    {
        public string Application { get; set; }
        public string Message { get; set; }
        public string UserId { get; set; }
    }
}

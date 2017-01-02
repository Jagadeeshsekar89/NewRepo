using SmartERP.Entity.Model.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartERP.Entity.Model.Configuration
{
    public class SBU : BaseEntity
    {
        public string CompanyCode { get; set; }
        public string SBUCode { get; set; }
        public string SBUName { get; set; }
        
        
    }
}

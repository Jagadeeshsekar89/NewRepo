using SmartERP.Entity.Model.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartERP.Entity.Model.Configuration
{
    public class Company : BaseEntity
    {
        public string CompanyCode { get; set; }
        public string CompanyName { get; set; }
        public string ShortName { get; set; }
        public string CountryCode { get; set; }
        
    }
}

using SmartERP.Entity.Model.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartERP.Entity.Model.Configuration
{
    public class Country : BaseEntity
    {
        public string CountryCode { get; set; }
        public string CountryName { get; set; }
        public string ShortName { get; set; }
        public string TimezoneCode { get; set; }
        public string DefaultLanguageCode { get; set; }
    }
}

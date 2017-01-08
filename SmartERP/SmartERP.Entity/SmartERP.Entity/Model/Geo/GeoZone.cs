using SmartERP.Entity.Model.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartERP.Entity.Model.Geo
{
    public class GeoZone : BaseEntity
    {
        public string ZoneCode { get; set;}
        public string ZoneName { get; set; }
        public string CountryCode { get; set; }
        public string CompanyCode { get; set; }

    }
}

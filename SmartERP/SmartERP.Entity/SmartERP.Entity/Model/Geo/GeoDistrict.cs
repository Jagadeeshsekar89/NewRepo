using SmartERP.Entity.Model.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartERP.Entity.Model.Geo
{
    public class GeoDistrict : BaseEntity
    {
        public string DistrictCode { get; set;}
        public string DistrictName { get; set; }
        public string StateCode { get; set; }
        public string BusinessCenter { get; set; }

    }
}

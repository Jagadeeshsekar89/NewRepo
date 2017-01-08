using SmartERP.Entity.Model.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartERP.Entity.Model.Geo
{
    public class GeoRegion : BaseEntity
    {
        public string RegionCode { get; set;}
        public string RegionName { get; set; }
        public string ZoneCode { get; set; }
        

    }
}

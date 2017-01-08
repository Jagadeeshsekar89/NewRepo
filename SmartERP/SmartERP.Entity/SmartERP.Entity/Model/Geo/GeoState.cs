using SmartERP.Entity.Model.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartERP.Entity.Model.Geo
{
    public class GeoState : BaseEntity
    {
        public string StateCode { get; set;}
        public string StateName { get; set; }
        public string RegionCode { get; set; }        

    }
}

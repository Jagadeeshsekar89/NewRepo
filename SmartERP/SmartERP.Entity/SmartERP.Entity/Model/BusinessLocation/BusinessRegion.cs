using SmartERP.Entity.Model.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartERP.Entity.Model.BusinessLocation
{
    public class BusinessRegion : BaseEntity
    {
        public string BURegionCode { get; set; }
        public string BURegionName { get; set; }
        public string BUZoneCode { get; set; }
        public string SBUCode { get; set; }
    }
}

using SmartERP.Entity.Model.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartERP.Entity.Model.BusinessLocation
{
    public class BusinessZone : BaseEntity
    {
        public string BUZoneCode { get; set; }
        public string BUZoneName { get; set; }
        public string CompanyCode { get; set; }
    }
}

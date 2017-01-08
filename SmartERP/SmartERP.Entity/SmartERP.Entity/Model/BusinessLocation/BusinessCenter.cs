using SmartERP.Entity.Model.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartERP.Entity.Model.BusinessLocation
{
    public class BusinessCenter : BaseEntity
    {
        public string BusinessCenterCode { get; set; }
        public string BusinessCenterName { get; set; }
        public string DistrictCode { get; set; }
    }
}

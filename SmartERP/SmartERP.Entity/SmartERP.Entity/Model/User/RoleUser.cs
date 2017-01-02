using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SmartERP.Entity.Model.Base;

namespace SmartERP.Entity.Model.User
{
    public class RoleUser : BaseEntity
    {
        public string RoleCode { get; set; }
        public string UserCode { get; set; }
        public string CompanyFilter { get; set; }
        public string CompanyCodes { get; set; }
        public string SBUFilter { get; set; }
        public string SBUCodes { get; set; }
        public string DivisonFilter { get; set; }
        public string DivisionCodes { get; set; }
        public string ZoneFilter { get; set; }
        public string ZoneCodes { get; set; }
        public string BranchFilter { get; set; }
        public string BranchCodes { get; set; }

    }
}

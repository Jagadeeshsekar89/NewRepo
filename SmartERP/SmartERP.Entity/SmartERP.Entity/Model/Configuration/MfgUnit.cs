using SmartERP.Entity.Model.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartERP.Entity.Model.Configuration
{
    public class MfgUnit : BaseEntity
    {
        public string Unitcode { get; set; }
        public string CompanyCode { get; set; }
        public string UnitName { get; set; }
        public string Address { get; set; }

        public int LSTNumber { get; set; }
        public DateTime LSTDate { get; set; }
        public int CSTNuber { get; set; }
        public string CSTDate { get; set; }

        public int ExciseRegistrationNo { get; set; }
        public DateTime ExciseRegistrationDate { get; set; }

        

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SmartERP.Entity.Model.Base;

namespace SmartERP.Entity.Model.Configuration
{
    public class Branch : BaseEntity
    {
        public bool CharityApplicable { get; set; }
        public int CharityPercentage { get; set; }
        public bool BarCodeStatus { get; set; }
        public int LedgerCode { get; set; }
        public string BranchName { get; set; }
        public string ShartName { get; set; }
        public int CompanyCode { get; set; }
        public int AddressCode { get; set; }
        public int DebitBillControlDays { get; set; }
        public int SalesControlDays { get; set; }
        public int TotalCreditLimitAllowed { get; set; }
        public bool ServiceUnit { get; set; }
        public bool PackingUnit { get; set; }
        public bool ItemCodePrinting { get; set; }
        public bool PrintSerialNumber { get; set; }
        public int TotalOutstandingAmount { get; set; }
        public bool Customer_SalesAllowed { get; set; }
        public bool Customer_DiscountAllowed { get; set; }
    }
}

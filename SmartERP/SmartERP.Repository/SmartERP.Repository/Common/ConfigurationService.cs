using SmartERP.Entity.Model;
using SmartERP.Repository.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartERP.Repository.Common
{
    public class ConfigurationService
    {
        public BranchRepository BranchRepo { get; set; }
        public CompanyRepository CompanyRepo { get; set; }
        public CountryRepository CountryRepo { get; set; }
        public WorkFlowFormRepository WorkFlowFormRepo { get; set; }
        public WorkFlowApprovalsRepository WorkFlowApprovalsRepo { get; set; }



        public ConfigurationService()
        {
            CreateOrExtends();
        }
        public void CreateOrExtends()
        {
            this.BranchRepo = this.BranchRepo ?? new BranchRepository();
            this.CompanyRepo = this.CompanyRepo ?? new CompanyRepository();
            this.CountryRepo = this.CountryRepo ?? new CountryRepository();
            this.WorkFlowFormRepo = this.WorkFlowFormRepo ?? new WorkFlowFormRepository();
            this.WorkFlowApprovalsRepo = this.WorkFlowApprovalsRepo ?? new WorkFlowApprovalsRepository();

            //do something 

        }
        //make you logic ... and carry on... and avoid multiple instance of repostory in controller...
        public string Validation()
        {

            return string.Empty;
        }


    }

}





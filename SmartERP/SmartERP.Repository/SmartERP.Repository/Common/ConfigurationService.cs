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

        public  CompanyRepository CompanyRepo { get; set; }
        public  CountryRepository CountryRepo { get; set; }
       
        public ConfigurationService()
        {
            CreateOrExtends();
        }
        public void CreateOrExtends()
        {

            this.CompanyRepo = this.CompanyRepo ?? new CompanyRepository();
            this.CountryRepo = this.CountryRepo ?? new CountryRepository();
           
            //do something 

        }
        //make you logic ... and carry on... and avoid multiple instance of repostory in controller...
        public string Validation()
        {

            return string.Empty;
        }
        

    }

}





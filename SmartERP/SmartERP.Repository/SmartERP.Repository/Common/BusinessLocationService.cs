using SmartERP.Entity.Model;
using SmartERP.Repository.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartERP.Repository.Common
{
    public class BusinessLocationService
    {

        public  BusinessCenterRepository BusinessCenterRepo { get; set; }
        public  BusinessRegionRepository BusinessRegionRepo { get; set; }
        public BusinessRegionBCRepository BusinessRegionBcRepo { get; set; }
        public BusinessZoneRepository BusinessZoneRepo { get; set; }

        public BusinessLocationService()
        {
            CreateOrExtends();
        }
        public void CreateOrExtends()
        {

            this.BusinessCenterRepo = this.BusinessCenterRepo ?? new BusinessCenterRepository();
            this.BusinessRegionRepo = this.BusinessRegionRepo ?? new BusinessRegionRepository();
            this.BusinessRegionBcRepo = this.BusinessRegionBcRepo ?? new BusinessRegionBCRepository();
            this.BusinessZoneRepo = this.BusinessZoneRepo ?? new BusinessZoneRepository();

            //do something 

        }
        //make you logic ... and carry on... and avoid multiple instance of repostory in controller...
        public string Validation()
        {

            return string.Empty;
        }
        

    }

}





using SmartERP.Entity.Model;
using SmartERP.Repository.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartERP.Repository.Common
{
    public class GeoService
    {

        public  GeoDistrictRepository GeoDistrictRepo { get; set; }
        public  GeoStateRepository GeoStateRepo { get; set; }
        public GeoZoneRepository GeoZoneRepo { get; set; }
        public GeoRegionRepository GeoRegionRepo { get; set; }

        public GeoService()
        {
            CreateOrExtends();
        }
        public void CreateOrExtends()
        {

            this.GeoDistrictRepo = this.GeoDistrictRepo ?? new GeoDistrictRepository();
            this.GeoStateRepo = this.GeoStateRepo ?? new GeoStateRepository();
            this.GeoZoneRepo = this.GeoZoneRepo ?? new GeoZoneRepository();
            this.GeoRegionRepo = this.GeoRegionRepo ?? new GeoRegionRepository();

            //do something 

        }
        //make you logic ... and carry on... and avoid multiple instance of repostory in controller...
        public string Validation()
        {

            return string.Empty;
        }
        

    }

}





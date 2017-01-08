using Dapper;
using SmartERP.Entity.Interface;
using SmartERP.Entity.Interface.User;
using SmartERP.Entity.Model.BusinessLocation;
using SmartERP.Entity.Model.User;

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartERP.Repository.Core
{
    public class BusinessLocationRepository 
    {
        public BusinessLocationRepository()
        {
            BusinessRegionRepository br = new BusinessRegionRepository("BusinessRegion");
            businessRegion = br.GetAll();

            BusinessRegionBCRepository brbc = new BusinessRegionBCRepository("BusinessRegionBC");
            businessRegionBC = brbc.GetAll();

            BusinessCenterRepository bc = new BusinessCenterRepository("BusinessCenter");
            businessCenter = bc.GetAll();

            BusinessZoneRepository bz = new BusinessZoneRepository("BusinessZone");
            businessZone = bz.GetAll();
        }

        public List<BusinessRegion> businessRegion { get; set; }
        public List<BusinessRegionBC> businessRegionBC { get; set; }
        public List<BusinessCenter> businessCenter { get; set; }
        public List<BusinessZone> businessZone { get; set; }

    }

    public class BusinessRegionRepository : GenericRepository<BusinessRegion>
    {
        public BusinessRegionRepository(string table) : base(table)
        {
        }
        public BusinessRegionRepository() : base()
        {
        }
    }

    public class BusinessRegionBCRepository : GenericRepository<BusinessRegionBC>
    {
        public BusinessRegionBCRepository(string table) : base(table)
        {
        }
        public BusinessRegionBCRepository() : base()
        {
        }
    }

    public class BusinessCenterRepository : GenericRepository<BusinessCenter>
    {
        public BusinessCenterRepository(string table) : base(table)
        {
        }
        public BusinessCenterRepository() : base()
        {
        }
    }

    public class BusinessZoneRepository : GenericRepository<BusinessZone>
    {
        public BusinessZoneRepository(string table) : base(table)
        {
        }
        public BusinessZoneRepository() : base()
        {
        }
    }
}

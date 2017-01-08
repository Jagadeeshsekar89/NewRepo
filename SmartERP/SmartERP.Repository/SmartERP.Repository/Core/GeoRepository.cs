using Dapper;
using SmartERP.Entity.Interface;
using SmartERP.Entity.Interface.User;
using SmartERP.Entity.Model.BusinessLocation;
using SmartERP.Entity.Model.Geo;
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
    public class GeoRepository
    {
        public GeoRepository()
        {
            GeoDistrictRepository dist = new GeoDistrictRepository("GeoDistrict");
            geoDistrict = dist.GetAll();

            GeoRegionRepository region= new GeoRegionRepository("GeoRegion");
            geoRegion = region.GetAll();

            GeoStateRepository state = new GeoStateRepository("GeoState");
            geoState = state.GetAll();

            GeoZoneRepository zone = new GeoZoneRepository("GeoZone");
            geoZone = zone.GetAll();
        }

        public List<GeoDistrict> geoDistrict { get; set; }
        public List<GeoRegion> geoRegion { get; set; }
        public List<GeoState> geoState { get; set; }
        public List<GeoZone> geoZone { get; set; }

    }

    public class GeoDistrictRepository : GenericRepository<GeoDistrict>
    {
        public GeoDistrictRepository(string table) : base(table)
        {
        }
        public GeoDistrictRepository() : base()
        {
        }
    }

    public class GeoRegionRepository : GenericRepository<GeoRegion>
    {
        public GeoRegionRepository(string table) : base(table)
        {
        }
        public GeoRegionRepository() : base()
        {
        }
    }

    public class GeoStateRepository : GenericRepository<GeoState>
    {
        public GeoStateRepository(string table) : base(table)
        {
        }
        public GeoStateRepository() : base()
        {
        }
    }

    public class GeoZoneRepository : GenericRepository<GeoZone>
    {
        public GeoZoneRepository(string table) : base(table)
        {
        }
        public GeoZoneRepository() : base()
        {
        }
    }
}

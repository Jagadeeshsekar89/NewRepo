using SmartERP.Entity.Model.Configuration;

namespace SmartERP.Repository.Core
{
    public class CountryRepository : GenericRepository<Country>
    {
        public CountryRepository(string table) : base(table)
        {
        }

        public CountryRepository() : base()
        {
        }
        
    }
}



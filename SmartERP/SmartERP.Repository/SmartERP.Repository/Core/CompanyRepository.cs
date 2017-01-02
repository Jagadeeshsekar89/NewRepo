using SmartERP.Entity.Model.Configuration;

namespace SmartERP.Repository.Core
{
    public class CompanyRepository : GenericRepository<Company>
    {
        public CompanyRepository(string table) : base(table)
        {
        }

        public CompanyRepository() : base()
        {
        }
        
    }
}



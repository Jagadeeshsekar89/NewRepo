using SmartERP.Entity.Model.Configuration;

namespace SmartERP.Repository.Core
{
    public class BranchRepository : GenericRepository<Branch>
    {
        public BranchRepository(string table) : base(table)
        {
        }
        public BranchRepository() : base()
        {
        }
    }
}

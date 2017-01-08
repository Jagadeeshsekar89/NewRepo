using SmartERP.Entity.Model.Configuration;

namespace SmartERP.Repository.Core
{
    public class WorkFlowApprovalsRepository : GenericRepository<WorkFlowApprovals>
    {
        public WorkFlowApprovalsRepository(string table) : base(table)
        {
        }

        public WorkFlowApprovalsRepository() : base()
        {
        }
        
    }
}



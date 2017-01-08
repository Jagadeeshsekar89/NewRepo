using SmartERP.Entity.Model.Configuration;

namespace SmartERP.Repository.Core
{
    public class WorkFlowFormRepository : GenericRepository<WorkFlowForm>
    {
        public WorkFlowFormRepository(string table) : base(table)
        {
        }

        public WorkFlowFormRepository() : base()
        {
        }
        
    }
}



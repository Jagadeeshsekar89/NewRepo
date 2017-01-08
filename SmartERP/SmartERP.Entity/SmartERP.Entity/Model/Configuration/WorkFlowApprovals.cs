using SmartERP.Entity.Model.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartERP.Entity.Model.Configuration
{
    public class WorkFlowApprovals : BaseEntity
    {
        public int ApprovalLevelCode { get; set; }
        public string FormCode { get; set; }
        public string RoleCode { get; set; }
        public string Type { get; set; }
        public string DefaultMoveToNextLevel { get; set; }
        public string ExecuteRule_SP { get; set; }
        public int True_ApprovalLevelCode { get; set; }
        public int False_ApprovalLevelCode { get; set; }
        public string EnableSendBackOption { get; set; }
        
    }

}

using SmartERP.Entity.Model.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartERP.Entity.Model.Configuration
{
    public class WorkFlowForm : BaseEntity
    {
        public string FormCode { get; set; }
        public string FormName { get; set; }
        public string DynamicForm { get; set; }
        public string TableName { get; set; }
        public string OnSubmitJSScript { get; set; }
    }
}

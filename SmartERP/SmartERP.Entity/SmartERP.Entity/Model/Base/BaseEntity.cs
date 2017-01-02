using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartERP.Entity.Model.Base
{
    public class BaseEntity
    {
        public long Id { get; set; }
        public DateTime? CreatedTimeStamp { get; set; }
        public DateTime? UpdatedTimeStamp { get; set; }
        public String CreatedBy { get; set; }
        public String UpdatedBy { get; set; }
        public bool IsActive { get; set; }
    }
}

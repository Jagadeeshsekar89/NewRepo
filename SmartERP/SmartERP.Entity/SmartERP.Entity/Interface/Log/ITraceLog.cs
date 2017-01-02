using SmartERP.Entity.Model.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SmartERP.Entity.Model.Log;

namespace SmartERP.Entity.Interface.Log
{
    public interface ITraceLog
    {
        List<TraceLog> GetByUserCode(string userCode);
    }
}

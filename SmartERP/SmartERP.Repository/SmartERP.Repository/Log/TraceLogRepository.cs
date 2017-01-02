using Dapper;
using SmartERP.Entity.Interface;
using SmartERP.Entity.Interface.User;
using SmartERP.Entity.Model.Log;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SmartERP.Entity.Interface.Log;

namespace SmartERP.Repository.Core
{
    public class TraceLogRepository : GenericRepository<TraceLog>, ITraceLog
    {
        public TraceLogRepository(string table) : base(table)
        {
        }
        public TraceLogRepository() : base()
        {
        }

        public List<TraceLog> GetByUserCode(string userCode)
        {
            List<TraceLog> log = new List<TraceLog>();
            List<TraceLog> traceLog = GetAll();
            traceLog = traceLog.Where(i => i.UserName == userCode).ToList();
            if (traceLog != null && traceLog.Any())
            {
                log = traceLog.Where(i => string.Compare(i.ActionName, "login", StringComparison.OrdinalIgnoreCase) == 0).OrderByDescending(i => i.CreatedTimeStamp).ToList();
            }
            return log;
        }
    }
}

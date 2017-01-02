using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using SmartERP.Entity.Model.Log;
using SmartERP.Web.Models;
using SmartERP.Web.Utilities;
using SmartERP.Repository.Core;

namespace SmartERP.Web.Repository
{
    public class LoggingRepository
    {
       const string APPLICATION = "Smart ERP";

        // Returns the LogId
        public long LogException(Exception ex)
        {
            var sb = new StringBuilder();

            var exceptionType = ex.GetType().ToString();
            var exceptionTypeSplit = exceptionType.Split('.');
            exceptionType = exceptionTypeSplit[exceptionTypeSplit.Length - 1];

            sb.Append(exceptionType).Append(": ").Append(ex.Message);
            sb.Append(ex.StackTrace);

            var innerException = ex.InnerException;
            if (innerException != null)
            {
                var innerExType = innerException.GetType().ToString();
                var innerExTypeTypeSplit = innerExType.Split('.');
                innerExType = innerExTypeTypeSplit[innerExTypeTypeSplit.Length - 1];

                sb.Append("\r\nINNER EXCEPTION: ").Append(innerExType).Append(": ")
                    .Append(innerException.Message).Append(innerException.StackTrace);
            }
            var context = HttpContext.Current;
            var logEntity = new Log()
            {
                Application = APPLICATION + " " + context.Session.SessionID,
                LogType = "Exception",
                Message = sb.ToString(),
                UserId = string.IsNullOrEmpty(context.User.Identity.Name) ? "" : context.User.Identity.Name,
                CreatedDate = DateTime.Now,
            };

            try
            {
                //Add loging to Database
                return logEntity.LogId;
            }
            catch
            {
                // TODO: if Logging fails, provide an alternate mechanism for
                // documentation of that fact than through the logging mechanism.
            }
            return -1;
        }

        public bool LogTrace(TraceLog traceLog)
        {
            var contextUser = HttpContext.Current.User as CustomPrincipal;

            if (contextUser != null)
            {

                traceLog.AuditID = Guid.NewGuid();
                traceLog.Message = traceLog.Message;
                traceLog.UserName = contextUser != null && string.IsNullOrEmpty(contextUser.UserCode) ? "" : contextUser.UserCode;
               
                traceLog.CreatedBy = contextUser != null && string.IsNullOrEmpty(contextUser.UserCode) ? "" : contextUser.UserCode;
                traceLog.IPAddress = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] ?? HttpContext.Current.Request.UserHostAddress;
                traceLog.AreaAccessed = HttpContext.Current.Request.RawUrl;
               
            }
            else
            {
                traceLog.AuditID = Guid.NewGuid();
                traceLog.Message = traceLog.Message;
                traceLog.UserName = "";
               
                traceLog.CreatedBy = "";
                traceLog.IPAddress = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] ?? HttpContext.Current.Request.UserHostAddress;
                traceLog.AreaAccessed = HttpContext.Current.Request.RawUrl;
            }

            try
            {
                TraceLogRepository traceLogRep = new TraceLogRepository();
                traceLogRep.Insert(traceLog);
                return true;
            }
            catch (Exception ex)
            {
                // TODO: if Logging fails, provide an alternate mechanism for
                // documentation of that fact than through the logging mechanism.
            }
            return false;
        }
    }
}
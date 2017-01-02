using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SmartERP.Web.Repository;

namespace SmartERP.Web.Filters
{
    public class GeneralExceptionHandlerAttribute : FilterAttribute, IExceptionFilter
    {
        public void OnException(ExceptionContext filterContext)
        {
            if (!filterContext.ExceptionHandled)
            {
                var logRepository = new LoggingRepository();
                var logID = logRepository.LogException(filterContext.Exception);

                if (logID > 0)
                    filterContext.ExceptionHandled = true;
                else
                    filterContext.ExceptionHandled = false;
            }
        }
    }
}
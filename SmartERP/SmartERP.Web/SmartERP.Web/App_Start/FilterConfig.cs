#region Using

using System.Web.Mvc;
using SmartERP.Web.Filters;

#endregion

namespace SmartERP.Web
{
    public static class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new GeneralExceptionHandlerAttribute());
            //filters.Add(new HandleErrorAttribute());
            filters.Add(new LogActionRequestAttribute());
        }
    }
}
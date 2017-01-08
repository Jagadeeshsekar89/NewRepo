using SmartERP.Web.Utilities;
using System.Web.Mvc;
using System;
using System.Web;
using System.Threading;
using SmartERP.Repository.Core;
using SmartERP.Entity.Model.User;
using System.Collections.Generic;
using SmartERP.Repository.Common;
using SmartERP.Entity.Model.BusinessLocation;
using SmartERP.Entity.Model.Configuration;

namespace SmartERP.Web.Controllers
{
   
    public class BaseController : Controller
    {
        public UserManagmentService _userManagmentService = new UserManagmentService();

        public SecurityRepository _securityRepository = new SecurityRepository();
        public NotificationRepository _notificationRepository = new NotificationRepository();
        public TraceLogRepository _traceLogRepository = new TraceLogRepository();

        public ConfigurationService _configurationService = new ConfigurationService();
        public BusinessLocationService _businessLocationService = new BusinessLocationService();
        public GeoService _geoService = new GeoService();

        protected virtual new CustomPrincipal User
        {
            get { return HttpContext.User as CustomPrincipal; }
        }

        protected override IAsyncResult BeginExecuteCore(AsyncCallback callback, object state)
        {
            string cultureName = null;

            // Attempt to read the culture cookie from Request
            HttpCookie cultureCookie = Request.Cookies["_culture"];
            if (cultureCookie != null)
                cultureName = cultureCookie.Value;
            else
                cultureName = Request.UserLanguages != null && Request.UserLanguages.Length > 0 ?
                        Request.UserLanguages[0] :  // obtain it from HTTP header AcceptLanguages
                        null;
            // Validate culture name
            cultureName = CultureHelper.GetImplementedCulture(cultureName); // This is safe

            // Modify current thread's cultures            
            Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo(cultureName);
            Thread.CurrentThread.CurrentUICulture = Thread.CurrentThread.CurrentCulture;

            return base.BeginExecuteCore(callback, state);
        }

        public ActionResult SetCulture(string culture)
        {
            // Validate input
            culture = CultureHelper.GetImplementedCulture(culture);
            // Save culture in a cookie
            HttpCookie cookie = Request.Cookies["_culture"];
            if (cookie != null)
                cookie.Value = culture;   // update cookie value
            else
            {
                cookie = new HttpCookie("_culture");
                cookie.Value = culture;
                cookie.Expires = DateTime.Now.AddYears(1);
            }
            Response.Cookies.Add(cookie);
            string url = Request.UrlReferrer.AbsolutePath;
            return Redirect(url);
        }
    }
}
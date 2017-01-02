using SmartERP.Web.Utilities;
using System.Web.Mvc;
using System;
using System.Web;
using System.Threading;
using SmartERP.Repository.Core;
using SmartERP.Entity.Model.User;
using System.Collections.Generic;
using SmartERP.Repository.Common;

namespace SmartERP.Web.Controllers
{
   
    public class BaseController : Controller
    {
        public UsersRepository _userRepository = new UsersRepository();
        public MenuRepository _menuRepository = new MenuRepository();
        public RoleRepository _roleRepository = new RoleRepository();
        public RoleMenuRepository _roleMenuRepository = new RoleMenuRepository();
        public SecurityRepository _securityRepository = new SecurityRepository();
        public NotificationRepository _notificationRepository = new NotificationRepository();
        public TraceLogRepository _traceLogRepository = new TraceLogRepository();

        public ConfigurationService _configurationService = new ConfigurationService();

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

        protected List<Menu> GetAllMenu()
        {
            List<Menu> data = new List<Menu>();
            data = _menuRepository.GetAll();
            return data;

        }

        protected List<Users> GetAllUsers()
        {
            List<Users> allUsers = new List<Users>();
            allUsers = _userRepository.GetAll();
            return allUsers;

        }

        protected List<Role> GetAllRole()
        {
            List<Role> data = new List<Role>();
            data = _roleRepository.GetAll();
            return data;

        }

        protected Users GetUserById(int id)
        {
            Users user = new Users();
            user = _userRepository.Get(id);
            return user;
        }
    }
}
#region Using

using SmartERP.Web.Repository;
using System.Web.Mvc;
using SmartERP.Entity.Model.User;
using System.Collections.Generic;
using SmartERP.Web.Utilities;
using SmartERP.Web.Models;
using System.Linq;
using SmartERP.Entity.Model.Log;
using System;

#endregion

namespace SmartERP.Web.Controllers
{
    [AuthorizeUser]
    public class HomeController : BaseController
    {
        // GET: home/index
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult DynamicMenu(string roleCode)
        {
            List<DynamicMenuViewModel> dynamicMenuList = new List<DynamicMenuViewModel>();
            if (((CustomPrincipal)HttpContext.User) != null)
            {
                var userCode = ((CustomPrincipal)HttpContext.User).UserCode;
                var dynamicMenus = _roleMenuRepository.GetUserRoleMenus(userCode);
                if (dynamicMenus != null && dynamicMenus.Any())
                {
                    if (!string.IsNullOrEmpty(roleCode))
                        dynamicMenus = dynamicMenus.Where(i => i.RoleCode == roleCode).ToList();

                    foreach (var item in dynamicMenus)
                    {
                        dynamicMenuList.Add(new DynamicMenuViewModel() { MenuCode = item.MenuCode, MenuName = item.MenuName, MenuURL = item.MenuURL, ParentMenucode = item.ParentMenucode });
                    }
                }
                else
                {
                    var menuList = GetAllMenu();
                    if (menuList != null && menuList.Any())
                    {
                        foreach (var item in menuList)
                        {
                            dynamicMenuList.Add(new DynamicMenuViewModel() { MenuCode = item.MenuCode, MenuName = item.MenuName, MenuURL = item.MenuURL, ParentMenucode = item.ParentMenucode });
                        }
                    }
                }
            }
            return PartialView("_DynamicMenu", dynamicMenuList);
        }

        public PartialViewResult _Footer()
        {
            ViewBag.LastActivity = "About 1 Day Ago";
            if (((CustomPrincipal)HttpContext.User) != null)
            {
                List<TraceLog> log = _traceLogRepository.GetByUserCode(((CustomPrincipal)HttpContext.User).UserCode);
                if (log != null && log.Any() && log.Count >= 2)
                {
                    var timedifference = DateTime.UtcNow - log.ElementAt(1).CreatedTimeStamp;
                    ViewBag.LastActivity = "About " + Convert.ToInt32(timedifference.GetValueOrDefault().TotalHours).ToString() + " hours ago";
                }
            }
            return PartialView("_Footer");
        }
    }
}
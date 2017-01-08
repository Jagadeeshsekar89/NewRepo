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

        public PartialViewResult DynamicMenu(int? roleCode)
        {
            List<DynamicMenuViewModel> dynamicMenuList = new List<DynamicMenuViewModel>();
            if (((CustomPrincipal)HttpContext.User) != null)
            {
                var userCode = ((CustomPrincipal)HttpContext.User).UserId;
                if (roleCode != null && roleCode.GetValueOrDefault() != 0)
                {
                    var dynamicMenus = _userManagmentService.RoleMenuRepo.GetAll();
                    if (dynamicMenus != null && dynamicMenus.Any())
                    {
                        dynamicMenus = dynamicMenus.Where(i => i.RoleCode == roleCode).ToList();

                        foreach (var item in dynamicMenus)
                        {
                            var menuItem = _userManagmentService.MenuRepo.Get(item.MenuCode);
                            dynamicMenuList.Add(new DynamicMenuViewModel() { Id = menuItem.Id, MenuName = menuItem.MenuName, MenuURL = menuItem.MenuURL, ParentMenucode = menuItem.ParentMenucode });
                        }
                    }
                }
                else
                {
                    var menuList = _userManagmentService.MenuRepo.GetAll();
                    if (menuList != null && menuList.Any())
                    {
                        foreach (var item in menuList)
                        {
                            dynamicMenuList.Add(new DynamicMenuViewModel() { Id = item.Id, MenuName = item.MenuName, MenuURL = item.MenuURL, ParentMenucode = item.ParentMenucode });
                        }
                    }
                }
            }
            return PartialView("_DynamicMenu", dynamicMenuList);
        }

        public PartialViewResult _Footer()
        {
            ViewBag.LastActivity = "Last Login Date: " + DateTime.UtcNow.AddDays(-1).ToString("d");
            if (((CustomPrincipal)HttpContext.User) != null)
            {
                List<TraceLog> log = _traceLogRepository.GetByUserCode(((CustomPrincipal)HttpContext.User).UserId);
                if (log != null && log.Any() && log.Count >= 2)
                {
                    ViewBag.LastActivity = "Last Login Date: " + log.ElementAt(1).CreatedTimeStamp.GetValueOrDefault().ToString("d");
                }
            }
            return PartialView("_Footer");
        }
    }
}
#region Using

using SmartERP.Entity.Model.User;
using SmartERP.Repository.Core;
using SmartERP.Web.Models;
using System.Collections.Generic;
using System.Web.Mvc;
using System;
using System.Linq;
using SmartERP.Web.Utilities;

#endregion

namespace SmartERP.Web.Controllers
{
    [Authorize]
    public class MiscController : BaseController
    {
        // GET: /misc/error404
        public ActionResult Error404()
        {
            return View();
        }

        // GET: /misc/error500
        public ActionResult Error500()
        {
            return View();
        }
        
        // GET: /misc/role
        public ActionResult Role(string roleCode)
        {
            var roleView = new RolesViewModel();
            if (!string.IsNullOrEmpty(roleCode))
            {
                var configuredRoles = _roleRepository.GetAllConfiguredRoleMenus(roleCode);
                if (configuredRoles != null && configuredRoles.Any())
                {
                    foreach (var element in configuredRoles)
                    {
                        roleView.RoleCode = element.RoleCode;
                        roleView.MenuCode = element.MenuCode;
                        roleView.UserCode = element.UserCode;
                    }
                }
            }

            List<Users> userList = GetAllUsers();
            if (userList != null && userList.Any())
            {
                roleView.UserList = userList.ToList();
            }

            List<Role> roleList = GetAllRole();
            if (roleList != null && roleList.Any())
            {
                roleView.RoleList = roleList.Select(x => new SelectListItem()
                {
                    Value = x.RoleCode.ToString(),
                    Text = x.RoleName
                }).OrderBy(x => x.Value).ToList();
            }

            List<Menu> menuList = GetAllMenu();
            if (menuList != null && menuList.Any())
            {
                roleView.MenuList = menuList.ToList();
            }

            return View(roleView);
        }

        // POST: /misc/AddRoleUserMenu
        public ActionResult AddRoleUserMenu(RolesViewModel roleViewModel)
        {
            RoleMenuRepository roleMenuRep = new RoleMenuRepository("RoleMenu");
            RoleUserRepository roleUserRep = new RoleUserRepository("RoleUser");
            //UserMenuRepository userMenuRep = new UserMenuRepository("UserMenu");

            if (!string.IsNullOrEmpty(roleViewModel.RoleCode))
            {
                if (!string.IsNullOrEmpty(roleViewModel.MenuCode) && roleViewModel.MenuCode.Split(',').Any())
                {
                    foreach (var menuId in roleViewModel.MenuCode.Split(','))
                    {
                        if (!string.IsNullOrEmpty(menuId))
                        {
                            RoleMenu rolemenu = new RoleMenu { RoleCode = roleViewModel.RoleCode, MenuCode = menuId };
                            roleMenuRep.Insert(rolemenu);
                        }
                    }
                }
                if (!string.IsNullOrEmpty(roleViewModel.UserCode) && roleViewModel.UserCode.Split(',').Any())
                {
                    foreach (var userId in roleViewModel.UserCode.Split(','))
                    {
                        if (!string.IsNullOrEmpty(userId))
                        {
                            //UserMenu userMenu = new UserMenu { UserCode = userId, MenuCode = menuId, RoleCode = roleViewModel.RoleCode };
                            //userMenuRep.Insert(userMenu);

                            RoleUser roleUser = new RoleUser { RoleCode = roleViewModel.RoleCode, UserCode = userId };
                            if (!string.IsNullOrEmpty(roleViewModel.selectedBranchIds))
                            {
                                roleUser.BranchCodes = roleViewModel.selectedBranchIds;
                            }
                            roleUserRep.Insert(roleUser);
                        }
                    }
                }
            }

            List<Role> roleList = GetAllRole();
            if (roleList != null && roleList.Any())
            {
                roleViewModel.RoleList = roleList.Select(x => new SelectListItem()
                {
                    Value = x.RoleCode.ToString(),
                    Text = x.RoleName
                }).OrderBy(x => x.Value).ToList();
            }

            List<Menu> menuList = GetAllMenu();
            if (menuList != null && menuList.Any())
            {
                roleViewModel.MenuList = menuList.ToList();
            }

            List<Users> userList = GetAllUsers();
            if (userList != null && userList.Any())
            {
                roleViewModel.UserList = userList.ToList();
            }

            return RedirectToAction("Roles", "Misc");
        }

        // GET: /misc/roles
        public ActionResult Roles()
        {
            List<RoleMenuViewModel> roleMenuList = new List<RoleMenuViewModel>();
            List<Role> roleList = GetAllRole();
            if (roleList != null && roleList.Any())
            {
                foreach (var role in roleList)
                {
                    var configuredRoles = _roleRepository.GetAllConfiguredRoleMenus(role.RoleCode);
                    if (configuredRoles != null && configuredRoles.Any())
                    {
                        foreach (var element in configuredRoles)
                        {
                            roleMenuList.Add(new RoleMenuViewModel() { RoleCode = element.RoleCode, MenuCode = element.MenuCode, RoleName = element.RoleName, UserCode = element.UserCode });
                        }
                    }
                }
            }
            return View(roleMenuList);
        }

        // GET: /misc/privacypolicy
        public ActionResult PrivacyPolicy()
        {
            var PrivacyPolicy = new PrivacyPolicyViewModel();

            List<Users> userList = GetAllUsers();
            if (userList != null && userList.Any())
            {
                PrivacyPolicy.UserList = userList.Select(x => new SelectListItem()
                {
                    Value = x.Id.ToString(),
                    Text = x.FirstName + " " + x.LastName
                }).OrderBy(x => x.Value).ToList();
            }

            if (_securityRepository.GetAll() != null && _securityRepository.GetAll().Any())
            {
                PrivacyPolicy.security = _securityRepository.GetAll().FirstOrDefault();
            }

            return View(PrivacyPolicy);
        }

        // POST: /misc/Update privacypolicy
        public ActionResult Insert(PrivacyPolicyViewModel model)
        {
            SecurityRepository rep = new SecurityRepository("Security");

            List<Users> userList = GetAllUsers();
            if (userList != null && userList.Any())
            {
                model.UserList = userList.Select(x => new SelectListItem()
                {
                    Value = x.Id.ToString(),
                    Text = x.FirstName + " " + x.LastName
                })
                                              .OrderBy(x => x.Value)
                                              .ToList();
            }
            rep.Insert(model.security);
            return View("PrivacyPolicy", model);
        }

        public PartialViewResult Notification()
        {
            List<Notification> notifications = GetNotifications("Notification");
            return PartialView("_AjaxNotification", notifications);
        }

        public PartialViewResult Message()
        {
            List<Notification> messages = GetNotifications("Message");
            return PartialView("_AjaxMessage", messages);
        }

        private List<Notification> GetNotifications(string type)
        {
            List<Notification> notifications = new List<Notification>();
            var userEmail = ((CustomPrincipal)HttpContext.User).EmailId;
            var user = _userRepository.GetByEmail(userEmail.Trim());
            if (user != null)
            {
                notifications = _notificationRepository.GetAll();
                if (notifications != null && notifications.Any())
                {
                    notifications = notifications.Where(i => i.UserCode == user.UserCode
                    && string.Compare(i.ActionStatus, "Pending", StringComparison.OrdinalIgnoreCase) == 0
                    && string.Compare(i.NotificationType, type, StringComparison.OrdinalIgnoreCase) == 0).ToList();
                }
            }
            return notifications;
        }
    }
}
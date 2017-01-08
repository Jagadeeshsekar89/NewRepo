#region Using

using SmartERP.Entity.Model.User;
using SmartERP.Repository.Core;
using SmartERP.Web.Models;
using System.Collections.Generic;
using System.Web.Mvc;
using System;
using System.Linq;
using SmartERP.Web.Utilities;
using SmartERP.Entity.Model.BusinessLocation;
using AutoMapper;
using SmartERP.Entity.Model.Configuration;

#endregion

namespace SmartERP.Web.Controllers
{
    [AuthorizeUser]
    public class MiscController : BaseController
    {
        public MiscController()
        {
            Mapper.Initialize(cfg =>
            {
                cfg.CreateMap<RoleUser, RoleUserViewModel>();
                cfg.CreateMap<RoleUserViewModel, RoleUser>();
            });
        }
        [AllowAnonymous]
        // GET: /misc/error404
        public ActionResult Error404()
        {
            return View();
        }

        [AllowAnonymous]
        // GET: /misc/error500
        public ActionResult Error500()
        {
            return View();
        }

        // GET: /misc/role
        public ActionResult Role(int? id)
        {
            var roleView = new RoleUserViewModel();
            if (id != null)
            {
                roleView = (id.GetValueOrDefault(0) == 0) ? new RoleUserViewModel() : Mapper.Map<RoleUser, RoleUserViewModel>(_userManagmentService.RoleUserRepo.Get(id.GetValueOrDefault()));
            }

            List<Users> userList = _userManagmentService.UserRepo.GetAll();
            if (userList != null && userList.Any())
            {
                roleView.UserList = userList.Select(x => new SelectListItem()
                {
                    Value = x.Id.ToString(),
                    Text = x.Username
                }).OrderBy(x => x.Value).ToList();
            }

            List<Role> roleList = _userManagmentService.RoleRepo.GetAll();
            if (roleList != null && roleList.Any())
            {
                roleView.RoleList = roleList.Select(x => new SelectListItem()
                {
                    Value = x.Id.ToString(),
                    Text = x.RoleName
                }).OrderBy(x => x.Value).ToList();
            }

            List<Branch> branchList = _configurationService.BranchRepo.GetAll();
            if (branchList != null && branchList.Any())
            {
                roleView.BranchList = branchList.Select(x => new SelectListItem()
                {
                    Value = x.Id.ToString(),
                    Text = x.BranchName
                }).OrderBy(x => x.Value).ToList();
            }

            return View(roleView);
        }

        // POST: /misc/AddRoleUserMenu
        public ActionResult AddRoleUserMenu(RoleUserViewModel roleViewModel)
        {
            var data = Mapper.Map<RoleUserViewModel, RoleUser>(roleViewModel);

            if (roleViewModel.Id > 0)
            {
                data.UpdatedBy = User.UserId.ToString();
                _userManagmentService.RoleUserRepo.Update(data);
            }
            else
            {
                data.CreatedBy = User.UserId.ToString();
                _userManagmentService.RoleUserRepo.Insert(data);
            }

            return RedirectToAction("Roles", "Misc");
        }

        // GET: /misc/roles
        public ActionResult Roles()
        {
            List<RoleUserViewModel> roleMenuList = new List<RoleUserViewModel>();

            var configuredRoles = _userManagmentService.RoleUserRepo.GetAll();
            roleMenuList = Mapper.Map<List<RoleUser>, List<RoleUserViewModel>>(configuredRoles);

            return View(roleMenuList);
        }

        // GET: /misc/privacypolicy
        public ActionResult PrivacyPolicy()
        {
            var PrivacyPolicy = new PrivacyPolicyViewModel();

            List<Users> userList = _userManagmentService.UserRepo.GetAll();
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

            List<Users> userList = _userManagmentService.UserRepo.GetAll();
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
            var user = _userManagmentService.UserRepo.GetByEmail(userEmail.Trim());
            if (user != null)
            {
                notifications = _notificationRepository.GetAll();
                if (notifications != null && notifications.Any())
                {
                    notifications = notifications.Where(i => Convert.ToUInt32(i.UserCode) == user.Id
                    && string.Compare(i.ActionStatus, "Pending", StringComparison.OrdinalIgnoreCase) == 0
                    && string.Compare(i.NotificationType, type, StringComparison.OrdinalIgnoreCase) == 0).ToList();
                }
            }
            return notifications;
        }
    }
}
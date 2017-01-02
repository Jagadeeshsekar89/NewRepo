#region Using

using System;
using System.Data.Entity.Validation;
using System.Linq;
using System.Security.Principal;
using System.Threading.Tasks;
using System.Web.Mvc;
using System.Web.Security;
using Microsoft.Ajax.Utilities;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using SmartERP.Web.Models;
using SmartERP.Entity.Model.User;
using SmartERP.Repository.Core;
using SmartERP.Entity.Model.Log;
using SmartERP.Entity.Interface;
using System.Collections.Generic;
using SmartERP.Web.Utilities;
using System.Web;
using Newtonsoft.Json;
using CaptchaMvc.HtmlHelpers;
using System.IO;


#endregion

namespace SmartERP.Web.Controllers
{
    [AuthorizeUser]
    public class AccountController : BaseController
    {

        // GET: /account/forgotpassword
        [AllowAnonymous]
        public ActionResult ForgotPassword()
        {
            // We do not want to use any existing identity information
            EnsureLoggedOut();
            return View();
        }
        // POST: /account/register
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult ForgotPassword(AccountForgotPasswordModel viewModel)
        {
            // Ensure we have a valid viewModel to work with
            if (!ModelState.IsValid)
                return View(viewModel);

            // Try to update a user with the given email 
            try
            {
                UsersRepository rep = new UsersRepository("User");
                var user = FindByEmail(viewModel.Email);
                if(user != null)
                {
                    //user.Password = "TheBridge";//default password
                    //var result = rep.Update(user);
                    SendChangePasswordEmail(user);
                    //Successfully email sent message to be shown
                }

                return View(viewModel);               
                
            }
            catch (DbEntityValidationException ex)
            {
                // Add all errors to the page so they can be used to display what went wrong
                AddErrors(ex);
                return View(viewModel);
            }
        }
        // GET: /account/login
        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            // We do not want to use any existing identity information
            EnsureLoggedOut();

            var security = GetLoginSettings().FirstOrDefault();

            // Store the originating URL so we can attach it to a form field
            var viewModel = new AccountLoginModel { ReturnUrl = returnUrl };
            if (security != null)
            {
                viewModel.ForgotPassword = security.IsForgotPassword;
                viewModel.VirtualKeyboard = security.IsVirtualKeyboard;
                viewModel.IsCaptchaEnabled = security.IsCaptchaRequired;
                viewModel.LoginAttempt = security.LockoutCount;
            }
            return View(viewModel);
        }

        // POST: /account/login
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult Login(AccountLoginModel viewModel)
        {
            // Ensure we have a valid viewModel to work with
            if (!ModelState.IsValid)
                return View(viewModel);

            bool validateUser = viewModel.IsCaptchaEnabled ? this.IsCaptchaValid("Captcha is not valid") : true;

            if (validateUser)
            {
                // Verify if a user exists with the provided identity information
                var user = FindByEmail(viewModel.Email);
                int loginAttemptCount = 0;

                loginAttemptCount = Session["LoginAttempts"] == null ? 0 : (int)Session["LoginAttempts"];

                // If a user was found
                if (user != null)
                {
                    string hashpwd = SecurityHelper.GetSHA256Hashing(user.EmailID, user.Password);
                    string inputHash = SecurityHelper.GetSHA256Hashing(viewModel.Email, viewModel.Password);

                    if (Session["LoginAttempts"] != null)
                    {
                        if ((int)Session["LoginAttempts"] == viewModel.LoginAttempt)
                        {
                            ModelState.AddModelError("", "Account is Locked out.");
                            return View(viewModel);
                        }
                    }

                    if (user.PasswordExpiryDate <= DateTime.Now)
                    {
                        ModelState.AddModelError("", "Password Expired.");
                        return RedirectToAction("ChangePassword", new { userId = user.Id });
                    }

                    if (user.IsDefaultPassword)
                    {
                        return RedirectToAction("ChangePassword", new { userId = user.Id });
                    }


                    if (hashpwd == inputHash)
                    {
                        // Then create an identity for it and sign it in
                        SignIn(user, viewModel.RememberMe);

                        //Get User Notifications if any

                        Session["Notification"] = GetAllNotifications(user.UserCode);

                        // If the user came from a specific page, redirect back to it
                        return RedirectToLocal(viewModel.ReturnUrl);
                    }
                    else
                    {

                        Session["LoginAttempts"] = loginAttemptCount + 1;
                        ModelState.AddModelError("", "Incorrect Password Entered.");
                    }

                }
                else
                {
                    // No existing user was found that matched the given criteria
                    ModelState.AddModelError("", "User Does not exists.");
                }
            }
            else
            {
                ModelState.AddModelError("", "Error: captcha is not valid.");
            }

            // If we got this far, something failed, redisplay form
            return View(viewModel);
        }

        // GET: /account/error
        [AllowAnonymous]
        public ActionResult Error()
        {
            EnsureLoggedOut();
            return View();
        }

        // POST: /account/Logout
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Logout()
        {
            // First we clean the authentication ticket like always
            FormsAuthentication.SignOut();
            Web.Settings.CurrentTheme = "smart-style-4";           
            HttpContext.User = new GenericPrincipal(new GenericIdentity(string.Empty), null);            
            return RedirectToLocal();
        }

        // GET: /account/lock
        [AllowAnonymous]
        public ActionResult Lock()
        {
            return View();
        }

        // GET: /account/Settings
        public ActionResult Settings()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ChangeSettings()
        {
            Web.Settings.CurrentTheme = Request.Form["skin"] + " " + Request.Form["menuPosition"];
            Session["PrimaryRoleCode"] = Request.Form["roleCode"];
            return RedirectToAction("Index", "Home");
        }

        private ActionResult RedirectToLocal(string returnUrl = "")
        {
            // If the return url starts with a slash "/" we assume it belongs to our site
            // so we will redirect to this "action"
            if (!returnUrl.IsNullOrWhiteSpace() && Url.IsLocalUrl(returnUrl))
                return Redirect(returnUrl);

            // If we cannot verify if the url is local to our host we redirect to a default location
            return RedirectToAction("index", "home");
        }

        private void AddErrors(DbEntityValidationException exc)
        {
            foreach (var error in exc.EntityValidationErrors.SelectMany(validationErrors => validationErrors.ValidationErrors.Select(validationError => validationError.ErrorMessage)))
            {
                ModelState.AddModelError("", error);
            }
        }

        private void AddErrors(IdentityResult result)
        {
            // Add all errors that were returned to the page error collection
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        private void EnsureLoggedOut()
        {
            // If the request is (still) marked as authenticated we send the user to the logout action
            if (Request.IsAuthenticated)
                Logout();
        }

        private void SignIn(Users user, bool isPersistent)
        {
            // Clear any lingering authencation data
            FormsAuthentication.SignOut();

            CustomPrincipalSerializeModel serializeModel = new CustomPrincipalSerializeModel();
            serializeModel.UserId = user.Id;
            serializeModel.UserCode = user.UserCode;
            serializeModel.FirstName = user.FirstName;
            serializeModel.LastName = user.LastName;
            serializeModel.EmailId = user.EmailID;
            List<string> roleList = new List<string>();

            var dynamicMenus = _roleMenuRepository.GetUserRoleMenus(user.UserCode);
            if (dynamicMenus != null && dynamicMenus.Any())
            {
                foreach (var item in dynamicMenus)
                {
                    string role = item.RoleCode + "," + item.RoleName;
                    if (!roleList.Contains(role))
                        roleList.Add(role);
                }
                Session["PrimaryRoleCode"] = dynamicMenus.FirstOrDefault().RoleCode;
            }

            serializeModel.roles = roleList.ToArray();

            string userData = JsonConvert.SerializeObject(serializeModel);
            FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket(
                                                    1,
                                                    user.UserCode,
                                                    DateTime.Now,
                                                    DateTime.Now.AddMinutes(15),
                                                    false,
                                                    userData);

            string encTicket = FormsAuthentication.Encrypt(authTicket);
            HttpCookie faCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encTicket);
            Response.Cookies.Add(faCookie);
        }

        private Users FindByEmail(string email)
        {
            UsersRepository rep = new UsersRepository("Users");
            var user = rep.GetByEmail(email);

            //var list1 = DropdownBuilder.GetSelectListItems(rep.GetDropDownList("FirstName"));
            return user;
        }

        private List<Security> GetSecurityValues()
        {
            var user = _securityRepository.GetAll();
            return user;
        }

        // GET: /Account/users
        public ActionResult Users()
        {
            var userView = new UserViewModel();
            List<Users> userList = GetAllUsers();
            if (userList != null && userList.Any())
            {
                userView = new UserViewModel(userList.ToArray());
            }
            return View(userView);
        }

        // GET: /Account/addedituser
        public ActionResult AddEditUser(int? userId)
        {
            var userView = new UserViewModel();
            if (userId != null && userId.GetValueOrDefault() > 0)
            {
                Users user = GetUserById(userId.GetValueOrDefault());
                if (user != null)
                {
                    userView = new UserViewModel(user);
                }
            }
            return View(userView);
        }

        // POST: /Account/SubmitUser
        [HttpPost]
        public ActionResult SubmitUser(UserViewModel userView, HttpPostedFileBase upload)
        {
            if (userView != null)
            {
                if (upload != null && upload.ContentLength > 0)
                {
                    var fileName = System.IO.Path.GetFileName(upload.FileName);
                    var path = System.IO.Path.Combine(Server.MapPath("~/Content/UserPhoto"), fileName);

                    userView.user.ImageUrl = "/Content/UserPhoto/" + fileName;
                    upload.SaveAs(path);
                }

                if (userView.user != null && userView.user.Id > 0)
                    _userRepository.Update(userView.user);
                else
                    _userRepository.Insert(userView.user);
            }
            return RedirectToAction("Users", "Account");
        }

        // GET: /Account/ChangePassword
        public ActionResult ChangePassword(int userId)
        {
            var changePassword = new AccountChangePasswordModel();
            if (userId > 0)
            {
                changePassword.UserId = userId;
            }
            return View(changePassword);
            //return View();
        }

        // POST: /Account/ChangePassword
        [HttpPost]
        public ActionResult ChangePassword(AccountChangePasswordModel changePasswordModel)
        {
            if (!ModelState.IsValid)
                return View(changePasswordModel);

            if (changePasswordModel != null)
            {
                Users user = GetUserById(changePasswordModel.UserId);

                if (user != null)
                {
                    if (changePasswordModel.CurrentPassword == user.Password)
                    {
                        var hashedPassword = SecurityHelper.GetSHA256Hashing(user.EmailID, changePasswordModel.NewPassword);
                        user.Password = changePasswordModel.NewPassword;
                        _userRepository.Update(user);
                    }
                    else
                    {
                        ModelState.AddModelError("", "Incorrect Password Entered.");
                        return View(changePasswordModel);
                    }

                }
            }
            return RedirectToAction("Users", "Account");
        }

        // GET: /Account/UnlockUsers
        public ActionResult UnlockUsers()
        {
            var userViewModel = new UserViewModel();
            List<Users> lockedUsers = GetLockedUsers();
            if (lockedUsers != null && lockedUsers.Count() > 0)
            {
                //Set IsLocked as false for displaying it as a checkbox (as a reverse case)
                lockedUsers = lockedUsers.Select(x => { x.IsLocked = false; return x; }).ToList();
                userViewModel.users = lockedUsers.ToArray();
            }
            return View(userViewModel);
        }

        // POST: /Account/UnlockUsers
        [HttpPost]
        public ActionResult UnlockUsers(UserViewModel userViewModel)
        {
            // Need to implement select all
            if (!ModelState.IsValid)
                return View(userViewModel);
            if (userViewModel.users != null && userViewModel.users.Count() > 0)
            {
                //Get only the selected records
                List<Users> usersToBeUnlocked = userViewModel.users.Where(x => x.IsLocked == true).ToList();
                foreach (var user in usersToBeUnlocked)
                {
                    Users userToUpdate = _userRepository.Get(Convert.ToInt32(user.Id));
                    if (userToUpdate != null)
                    {
                        //Unlock user by setting this flag as false
                        userToUpdate.IsLocked = false;
                        userToUpdate.UpdatedTimeStamp = DateTime.Now;

                        _userRepository.Update(userToUpdate);
                    }
                }
            }
            return RedirectToAction("UnlockUsers", "Account");
        }

        // GET: /Account/UsageReport
        public ActionResult UsageReport()
        {
            var traceLogModel = new TraceLogModel();
            List<TraceLog> traceLogsList = new List<TraceLog>();
            if (traceLogsList != null && traceLogsList.Count() > 0)
            {
                traceLogModel.TraceLogs = traceLogsList.ToArray();
            }
            return View(traceLogModel);
        }

        // POST: /Account/UsageReport
        [HttpPost]
        public ActionResult UsageReport(TraceLogModel traceLogModel)
        {
            if (!ModelState.IsValid)
                return View(traceLogModel);

            traceLogModel.FromDate = DateTime.Now.AddDays(-1);
            traceLogModel.ToDate = DateTime.Now;

            List<TraceLog> traceLogsList = GetTraceLogByDateRange(traceLogModel.FromDate, traceLogModel.ToDate);
            if (traceLogsList != null && traceLogsList.Count() > 0)
            {
                traceLogModel.TraceLogs = traceLogsList.ToArray();
            }
            return View(traceLogModel);
        }

        private List<Notification> GetAllNotifications(string userCode)
        {
            List<Notification> allNotifications = new List<Notification>();
            allNotifications = _notificationRepository.GetAll();
            return allNotifications.Where(i => i.UserCode == userCode && string.Compare(i.ActionStatus, "Pending", StringComparison.OrdinalIgnoreCase) == 0).ToList();
        }

        private List<TraceLog> GetTraceLogByDateRange(DateTime fromDate, DateTime toDate)
        {
            List<TraceLog> resultList = new List<TraceLog>();
            resultList = _traceLogRepository.GetAll();
            return resultList.Where(i => i.CreatedTimeStamp >= fromDate && i.CreatedTimeStamp <= toDate && i.ActionName == "login").ToList();
        }

        private List<Security> GetLoginSettings()
        {
            SecurityRepository rep = new SecurityRepository("Security");
            var security = rep.GetAll();
            return security;
        }

        private List<Users> GetLockedUsers()
        {
            List<Users> lockedUsers = new List<Users>();
            lockedUsers = _userRepository.GetLockedUsers();
            return lockedUsers;
        }

        private void SendChangePasswordEmail(Users user)
        {
            string url = "";
            string body = string.Empty;
            body = System.IO.File.ReadAllText(System.Web.HttpContext.Current.Server.MapPath("~/EmailTemplates/ChangePassword.html"));
            body = body.Replace("{UserName}", user.Username);           
            body = body.Replace("{ChangePasswordUrl}", url);
            EmailModel email = new EmailModel();
            email.FromEmail = "test@cri.com";
            email.ToEmail = user.EmailID;
            email.Subject = "CRI PUMPS : Change Password Link";
            email.Body = body;
            email.Host = "";
            email.Port = 0;
            email.EnableSsl = true;
            email.UserName = "networkcredentil username";
            email.Password = "password";
            //Utility.SendHtmlFormattedEmail(email);
        }
    }
}
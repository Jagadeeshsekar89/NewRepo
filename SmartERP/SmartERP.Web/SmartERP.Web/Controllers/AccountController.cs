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

        #region ForgotPassword
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
                if (user != null)
                {
                    //user.Password = "TheBridge";//default password
                    //var result = rep.Update(user);
                    SendChangePasswordEmail(user);
                    //Successfully email sent message to be shown
                }
                ModelState.AddModelError("", "Mail has been sent to your emil to reset password. Kindly follow the instructions given in the mail");
                viewModel.Email = "";
                return View(viewModel);

            }
            catch (DbEntityValidationException ex)
            {
                // Add all errors to the page so they can be used to display what went wrong
                AddErrors(ex);
                return View(viewModel);
            }
        }
        #endregion

        #region Login
        // GET: /account/login
        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            // We do not want to use any existing identity information
            EnsureLoggedOut();

            var security = GetLoginSettings().FirstOrDefault();

            Session["SecuritySettings"] = security;

            // Store the originating URL so we can attach it to a form field
            var viewModel = new AccountLoginModel { ReturnUrl = returnUrl };
            if (security != null)
            {
                viewModel.ForgotPassword = security.IsForgotPassword;
                viewModel.VirtualKeyboard = security.IsVirtualKeyboard;
                viewModel.IsCaptchaEnabled = security.IsCaptchaRequired;
                viewModel.LoginAttempt = security.LockoutCount;
                viewModel.IsFirstPasswordChangeRequired = security.IsFirstPwdChange;
            }
            if (security.IsIpRestricted && !string.IsNullOrEmpty(security.IpAddress))
            {
                var userIp = GetUserIP();
                var allowedIp = security.IpAddress.Split(',');
                if (allowedIp.Contains(userIp))
                {
                    return View(viewModel);
                }
                else
                {
                    return RedirectToAction("Error500", "Misc");
                }
            }
            return View(viewModel);
        }


        private string GetUserIP()
        {
            string ipList = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if (!string.IsNullOrEmpty(ipList))
            {
                return ipList.Split(',')[0];
            }

            return Request.ServerVariables["REMOTE_ADDR"];
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
                    //string hashpwd = SecurityHelper.GetSHA256Hashing(user.EmailID, user.Password);
                    string hashpwd = user.Password;
                    string inputHash = SecurityHelper.GetSHA256Hashing(viewModel.Email, viewModel.Password);

                    if (user.IsLocked)
                    {
                        ModelState.AddModelError("", "Account is Locked out.");
                        viewModel.Password = "";
                        return View(viewModel);
                    }

                    if (Session["LoginAttempts"] != null)
                    {
                        if ((int)Session["LoginAttempts"] == viewModel.LoginAttempt)
                        {
                            user.IsLocked = true;
                            _userManagmentService.UserRepo.Update(user);
                            ModelState.AddModelError("", "Account is Locked out.");
                            return View(viewModel);
                        }
                    }

                    if (user.PasswordExpiryDate <= DateTime.Now)
                    {
                        ModelState.AddModelError("", "Password Expired.");
                        return RedirectToAction("ChangePassword", new { userId = user.Id });
                    }

                    if (user.IsDefaultPassword && viewModel.IsFirstPasswordChangeRequired)
                    {
                        return RedirectToAction("ChangePassword", new { userId = user.Id });
                    }


                    if (hashpwd == inputHash)
                    {
                        // Then create an identity for it and sign it in
                        SignIn(user, viewModel.RememberMe);

                        //Get User Notifications if any

                        Session["Notification"] = GetAllNotifications(user.Id);

                        // If the user came from a specific page, redirect back to it
                        return RedirectToLocal(viewModel.ReturnUrl);
                    }
                    else
                    {

                        Session["LoginAttempts"] = loginAttemptCount + 1;
                        viewModel.Password = "";
                        ModelState.AddModelError("", "Incorrect Password Entered.");
                    }

                }
                else
                {
                    viewModel.Password = "";
                    // No existing user was found that matched the given criteria
                    ModelState.AddModelError("", "User Does not exists.");
                }
            }
            else
            {
                viewModel.Password = "";
                ModelState.AddModelError("", "Error: captcha is not valid.");
            }

            // If we got this far, something failed, redisplay form
            return View(viewModel);
        } 
        #endregion

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
            var skin = string.IsNullOrEmpty(Request.Form["skin"]) ? "smart-style-4" : Request.Form["skin"];
            var menuPosition = string.IsNullOrEmpty(Request.Form["menuPosition"]) ? "" : Request.Form["menuPosition"];

            Web.Settings.CurrentTheme = skin + " " + menuPosition;
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

        #region Private Methods
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
            serializeModel.ImageUrl = !string.IsNullOrEmpty(user.ImageUrl) ? user.ImageUrl : "/content/img/avatars/indian.png";
            serializeModel.FirstName = user.FirstName;
            serializeModel.LastName = user.LastName;
            serializeModel.EmailId = user.EmailID;
            List<int> roleList = new List<int>();

            var dynamicMenus = _userManagmentService.RoleUserRepo.GetAll();
            if (dynamicMenus != null && dynamicMenus.Any())
            {
                dynamicMenus = dynamicMenus.Where(i => i.UserCode == user.Id).ToList();
                foreach (var item in dynamicMenus)
                {
                    int role = item.RoleCode;
                    if (!roleList.Contains(role))
                        roleList.Add(role);
                }
                Session["PrimaryRoleCode"] = dynamicMenus.FirstOrDefault().RoleCode;
            }

            serializeModel.roles = roleList.ToArray();

            string userData = JsonConvert.SerializeObject(serializeModel);
            FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket(
                                                    1,
                                                    user.Id.ToString(),
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
        #endregion

        // GET: /Account/users
        public ActionResult Users()
        {
            var userView = new UserViewModel();
            List<Users> userList = _userManagmentService.UserRepo.GetAll();
            if (userList != null && userList.Any())
            {
                userView = new UserViewModel(userList.ToArray());
            }
            return View(userView);
        }

        // GET: /Account/addedituser
        [AllowAnonymous]
        public ActionResult AddEditUser(int? userId)
        {
            var userView = new UserViewModel();
            if (userId != null && userId.GetValueOrDefault() > 0)
            {
                Users user = _userManagmentService.UserRepo.Get(userId.GetValueOrDefault());
                if (user != null)
                {
                    userView = new UserViewModel(user);
                }
            }
            return View(userView);
        }

        // POST: /Account/SubmitUser
        [AllowAnonymous]
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

                if (userView.user != null)
                {
                    if (userView.user.Id > 0)
                    {
                        userView.user.IsDefaultPassword = false;
                        userView.user.UpdatedBy = User != null ? User.UserId.ToString():"0";
                        _userManagmentService.UserRepo.Update(userView.user);
                    }
                    else {
                        userView.user.Password = SecurityHelper.GetSHA256Hashing(userView.user.EmailID, userView.user.Password);
                        userView.user.Username = userView.user.EmailID.Split('@')[0];
                        userView.user.IsDefaultPassword = true;
                        userView.user.IsActive = true;
                        userView.user.CreatedBy = User != null ? User.UserId.ToString() : "0";
                        _userManagmentService.UserRepo.Insert(userView.user);
                    }
                }                       
                
            }
            return RedirectToAction("Users", "Account");
        }

        [AllowAnonymous]
        // GET: /Account/ChangePassword
        public ActionResult ChangePassword(int Id)
        {
            var changePassword = new AccountChangePasswordModel();
            if (Id > 0)
            {
                changePassword.Id = Id;
            }
            return View(changePassword);
            //return View();
        }

        // POST: /Account/ChangePassword
        [AllowAnonymous]
        [HttpPost]
        public ActionResult ChangePassword(AccountChangePasswordModel changePasswordModel)
        {
            if (!ModelState.IsValid)
                return View(changePasswordModel);
            Security sec = new Security();
            if (changePasswordModel != null)
            {
                Users user = _userManagmentService.UserRepo.Get(changePasswordModel.Id);

                if (user != null)
                {
                    string inputHash = SecurityHelper.GetSHA256Hashing(user.EmailID, changePasswordModel.CurrentPassword);
                    if (inputHash == user.Password)
                    {
                        var hashedPassword = SecurityHelper.GetSHA256Hashing(user.EmailID, changePasswordModel.NewPassword);
                        user.Password = hashedPassword;
                        if (Session["SecuritySettings"] != null)
                        {
                            sec = Session["SecuritySettings"] as Security;
                        }
                        else
                        {
                            sec = GetLoginSettings().FirstOrDefault();
                        }
                        if (sec != null)
                        {
                            if (sec.MinLength > 0 && changePasswordModel.NewPassword.Length < sec.MinLength)
                            {
                                ModelState.AddModelError("", "Minimum characters "+ sec.MinLength + " required for Password.");
                                return View(changePasswordModel);
                            }
                            if (sec.MaxLength > 0 && changePasswordModel.NewPassword.Length > sec.MaxLength)
                            {
                                ModelState.AddModelError("", "Maximum " + sec.MaxLength + " characters allowed for Password.");
                                return View(changePasswordModel);
                            }
                            if (sec.IsAlphaMust && changePasswordModel.NewPassword.Any(x => !char.IsLetter(x)))
                            {
                                ModelState.AddModelError("", "Alphabets required for Password.");
                                return View(changePasswordModel);
                            }
                            if (sec.IsNumericMust && changePasswordModel.NewPassword.Any(x => !char.IsNumber(x)))
                            {
                                ModelState.AddModelError("", "Numbers required for Password.");
                                return View(changePasswordModel);
                            }
                            if (sec.IsSplCharMust && !changePasswordModel.NewPassword.Any(x => !char.IsLetterOrDigit(x)))
                            {
                                ModelState.AddModelError("", "Special characters required for Password.");
                                return View(changePasswordModel);
                            }
                        }
                        user.PasswordExpiryDate = DateTime.Today.AddDays(sec.ExpiryDays);
                        user.IsDefaultPassword = false;
                        _userManagmentService.UserRepo.Update(user);
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
            List<Users> lockedUsers = _userManagmentService.UserRepo.GetLockedUsers();
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
                    Users userToUpdate = _userManagmentService.UserRepo.Get(Convert.ToInt32(user.Id));
                    if (userToUpdate != null)
                    {
                        //Unlock user by setting this flag as false
                        userToUpdate.IsLocked = false;
                        userToUpdate.UpdatedTimeStamp = DateTime.Now;

                        _userManagmentService.UserRepo.Update(userToUpdate);
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

        private List<Notification> GetAllNotifications(int userCode)
        {
            List<Notification> allNotifications = new List<Notification>();
            allNotifications = _notificationRepository.GetAll();
            return allNotifications.Where(i => Convert.ToInt32(i.UserCode) == userCode && string.Compare(i.ActionStatus, "Pending", StringComparison.OrdinalIgnoreCase) == 0).ToList();
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

        private void SendChangePasswordEmail(Users user)
        {
            string url = ""; //TO DO ChangePassword url
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
            email.UserName = "networkcredentil username"; //TO DO
            email.Password = "password"; //TO DO
            //Utility.SendHtmlFormattedEmail(email); //TO Do uncomment this when host is provided 
        }

        public bool IsUserExists(string empId, string username, string emailId)
        {
            var users = _userManagmentService.UserRepo.GetAll();
            if (!string.IsNullOrEmpty(empId))
            {
               var user = users.Where(x => x.EmployeeID == empId);
               return user != null ? true : false;
            }
            if (!string.IsNullOrEmpty(username))
            {
                var user = users.Where(x => x.Username == username);
                return user != null ? true : false;
            }
            if (!string.IsNullOrEmpty(emailId))
            {
                var user = users.Where(x => x.EmailID == emailId);
                return user != null ? true : false;
            }
            return false;
        }

       
    }
}
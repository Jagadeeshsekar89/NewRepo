#region Using

using SmartERP.Entity.Model.User;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;
using System.Web.Mvc;
using SmartERP.Entity.Model.Log;
using System;

#endregion

namespace SmartERP.Web.Models
{
    public class AccountLoginModel
    {
        [Display(Name = "Email", ResourceType = typeof(Resource))]
        [Required]
        [EmailAddress]
        public string Email { get; set; }

        [Display(Name = "Password", ResourceType = typeof(Resource))]
        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        public string ReturnUrl { get; set; }
        [Display(Name = "RememberMe", ResourceType = typeof(Resource))]
        public bool RememberMe { get; set; }

        public bool ForgotPassword { get; set; }
        public bool VirtualKeyboard { get; set; }
        public int LoginAttempt { get; set; }
        public bool IsFirstPasswordChangeRequired { get; set; }
        public bool IsCaptchaEnabled { get; set; }
    }

    public class AccountForgotPasswordModel
    {
        [Required]
        [EmailAddress]
        public string Email { get; set; }

    }

    public class AccountResetPasswordModel
    {
        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [System.ComponentModel.DataAnnotations.Compare("Password")]
        public string PasswordConfirm { get; set; }
    }

    public class AccountChangePasswordModel
    {
        public int Id { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Current Password")]
        public string CurrentPassword { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "New Password")]
        public string NewPassword { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [System.ComponentModel.DataAnnotations.Compare("NewPassword")]
        [Display(Name = "ReEnter New Password")]
        public string NewPasswordConfirm { get; set; }
    }

    public class AccountRegistrationModel
    {
        public string Username { get; set; }

        [Required]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        [EmailAddress]
        [System.ComponentModel.DataAnnotations.Compare("Email")]
        public string EmailConfirm { get; set; }

        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [System.ComponentModel.DataAnnotations.Compare("Password")]
        public string PasswordConfirm { get; set; }
    }

    public class PrivacyPolicyViewModel
    {
        public PrivacyPolicyViewModel()
        {
        }

        public PrivacyPolicyViewModel(Security securityModel)
        {
            security = securityModel;
        }

        public IEnumerable<SelectListItem> UserList { get; set; }
        public Security security { get; set; }
    }

    public class TraceLogModel
    {
        public TraceLogModel()
        {
        }

        public TraceLogModel(TraceLog traceLog)
        {
            traceLog = TraceLog;
        }

        public TraceLogModel(TraceLog[] traceLogs)
        {
            traceLogs = TraceLogs;
        }

        public TraceLog[] TraceLogs { get; set; }
        public TraceLog TraceLog { get; set; }

        [Required]
        public DateTime FromDate { get; set; }

        [Required]
        public DateTime ToDate { get; set; }
    }

}
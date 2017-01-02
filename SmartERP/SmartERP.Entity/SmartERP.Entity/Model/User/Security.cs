using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SmartERP.Entity.Model.Base;

namespace SmartERP.Entity.Model.User
{
    public class Security: BaseEntity
    {
        public int MinLength { get; set; }
        public int MaxLength { get; set; }
        public bool IsAlphaMust { get; set; }
        public bool IsNumericMust { get; set; }
        public bool IsSplCharMust { get; set; }

        public int ExpiryDays { get; set; }
        public int LockoutCount { get; set; }
        public bool IsFirstPwdChange { get; set; }
        public bool IsVirtualKeyboard { get; set; }
        public bool IsIpRestricted { get; set; }
        public string IpAddress { get; set; }
        public string RemoteAccess { get; set; }
        public bool IsCaptchaRequired { get; set; }
        public bool IsForgotPassword { get; set; }

        public int SessionTimeoutWorkforce { get; set; }
        public int SessionTimeoutOthers { get; set; }
        public bool IsCloseBrowser { get; set; }
        public bool IsAutoLogout { get; set; }


    }
}

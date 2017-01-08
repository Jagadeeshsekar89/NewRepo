using System;
using System.Web;
using System.Web.Mvc;

namespace SmartERP.Web.Utilities
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, Inherited = true, AllowMultiple = true)]
    public class AuthorizeUserAttribute : AuthorizeAttribute
    {
        protected virtual CustomPrincipal CurrentUser
        {
            get { return HttpContext.Current.User as CustomPrincipal; }
        }

        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            if (CurrentUser == null)
            {
                base.OnAuthorization(filterContext); //returns to login url
            }
        }
    }
}
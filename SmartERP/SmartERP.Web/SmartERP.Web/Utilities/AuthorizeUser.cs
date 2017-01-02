﻿using System;
using System.Configuration;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace SmartERP.Web.Utilities
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, Inherited = true, AllowMultiple = true)]
    public class AuthorizeUserAttribute : AuthorizeAttribute
    {

        public string UsersConfigKey { get; set; }
        public string RolesConfigKey { get; set; }

        //public AuthorizeUserAttribute(params string[] roles)
        //{
        //    Roles = String.Join(",", roles.SelectMany(role => ConfigurationManager.AppSettings[role].Split(',')));
        //}

        protected virtual CustomPrincipal CurrentUser
        {
            get { return HttpContext.Current.User as CustomPrincipal; }
        }

        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            if (filterContext.HttpContext.Request.IsAuthenticated)
            {
                //var authorizedUsers = ConfigurationManager.AppSettings[UsersConfigKey];
                var authorizedRoles = ConfigurationManager.AppSettings[RolesConfigKey];

                //Users = String.IsNullOrEmpty(Users) ? authorizedUsers : Users;
                Roles = string.IsNullOrEmpty(Roles) ? authorizedRoles : Roles;

                if (!string.IsNullOrEmpty(Roles))
                {
                    if (!CurrentUser.IsInRole(Roles))
                    {
                        filterContext.Result = new RedirectToRouteResult(new
                                               RouteValueDictionary(new { controller = "Account", action = "AccessDenied" }));

                        base.OnAuthorization(filterContext); //returns to login url
                    }
                }
            }

            if(CurrentUser == null)
            {
                base.OnAuthorization(filterContext); //returns to login url
            }
            
        }

    }
}
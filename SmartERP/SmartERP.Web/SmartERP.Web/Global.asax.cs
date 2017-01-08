#region Using

using Newtonsoft.Json;
using SmartERP.Web.Models;
using SmartERP.Web.Utilities;
using System;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;

#endregion

namespace SmartERP.Web
{
    public class MvcApplication : HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            IdentityConfig.RegisterIdentities();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        protected void Application_PostAuthenticateRequest(Object sender, EventArgs e)
        {
            if (FormsAuthentication.CookiesSupported == true)
            {
                if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                {
                    try
                    {
                        HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];
                        FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie.Value);

                        CustomPrincipalSerializeModel serializeModel = JsonConvert.DeserializeObject<CustomPrincipalSerializeModel>(authTicket.UserData);
                        CustomPrincipal newUser = new CustomPrincipal(authTicket.Name);
                        newUser.UserId = serializeModel.UserId;
                        newUser.ImageUrl = serializeModel.ImageUrl;
                        newUser.FirstName = serializeModel.FirstName;
                        newUser.LastName = serializeModel.LastName;                      
                        newUser.EmailId = serializeModel.EmailId;
                        newUser.roles = serializeModel.roles;

                        HttpContext.Current.User = newUser;
                    }
                    catch (Exception)
                    {
                        //somehting went wrong
                    }
                }
            }
        }
    }
}
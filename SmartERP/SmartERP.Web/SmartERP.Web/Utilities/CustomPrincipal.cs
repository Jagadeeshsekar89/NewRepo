using System;
using System.Linq;
using System.Security.Principal;

namespace SmartERP.Web.Utilities
{
    public class CustomPrincipal: IPrincipal
    {
        public IIdentity Identity { get; private set; }

        public bool IsInRole(string role)
        {
            if (roles.Any(r => Convert.ToInt32(role) == r))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public CustomPrincipal(string Username)
        {
            Identity = new GenericIdentity(Username);
        }
        public int UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string EmailId { get; set; }
        public string ImageUrl { get; set; }
        public int[] roles { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SmartERP.Entity.Model.Base;


namespace SmartERP.Entity.Model.User
{

    public class Users : BaseEntity
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public bool SSO { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public DateTime? PasswordExpiryDate { get; set; }
        public bool IsDefaultPassword { get; set; }
        public string EmployeeID { get; set; }
        public string EmailID { get; set; }
        public string MobileNumber { get; set; }
        public string ImageUrl { get; set; }
        public bool IsLocked { get; set; }
    }
}

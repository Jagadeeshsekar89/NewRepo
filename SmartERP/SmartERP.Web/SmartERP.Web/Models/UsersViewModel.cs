using SmartERP.Entity.Model.Log;
using SmartERP.Entity.Model.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SmartERP.Entity.Model.BusinessLocation;

namespace SmartERP.Web.Models
{
    public class UsersViewModel
    {
        public Users user { get; set; }
        public UserMenu userMenu { get; set; }
        public RoleUser roleUser { get; set; }
        public RoleMenu roleMenu { get; set; }
        public TraceLog traceLog { get; set; }
    }

    public class UserViewModel
    {
        public UserViewModel()
        {
        }

        public UserViewModel(Users userModel)
        {
            user = userModel;
        }

        public UserViewModel(Users[] usersModel)
        {
            users = usersModel;
        }

        public Users[] users { get; set; }
        public Users user { get; set; }
    }

    public class RoleUserViewModel: RoleUser
    {
        public RoleUserViewModel()
        {
        }

        public IEnumerable<SelectListItem> UserList { get; set; }
        public IEnumerable<SelectListItem> RoleList { get; set; }
        public IEnumerable<SelectListItem> BranchList { get; set; }
    }

    public class CustomPrincipalSerializeModel
    {
        public int UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string EmailId { get; set; }
        public string ImageUrl { get; set; }
        public int[] roles { get; set; }
    }

    public class DynamicMenuViewModel
    {
        public int Id { get; set; }
        public string MenuName { get; set; }
        public string MenuURL { get; set; }
        public int ParentMenucode { get; set; }
    }
}
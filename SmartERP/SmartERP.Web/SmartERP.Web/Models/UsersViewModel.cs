using SmartERP.Entity.Model.Log;
using SmartERP.Entity.Model.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

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

    public class RolesViewModel
    {
        public RolesViewModel()
        {
        }

        public IEnumerable<Users> UserList { get; set; }
        public IEnumerable<SelectListItem> RoleList { get; set; }
        public IEnumerable<Menu> MenuList { get; set; }

        public string RoleCode { get; set; }
        public string UserCode { get; set; }
        public string MenuCode { get; set; }

        public string selectedBranchIds { get; set; }
    }

    public class RoleMenuViewModel
    {
        public string RoleCode { get; set; }
        public string RoleName { get; set; }
        public string MenuCode { get; set; }
        public string UserCode { get; set; }
    }

    public class CustomPrincipalSerializeModel
    {
        public long UserId { get; set; }
        public string UserCode { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string EmailId { get; set; }
        public string[] roles { get; set; }
    }

    public class DynamicMenuViewModel
    {
        public string MenuCode { get; set; }
        public string MenuName { get; set; }
        public string MenuURL { get; set; }
        public string ParentMenucode { get; set; }
    }
}
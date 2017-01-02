using SmartERP.Entity.Model;
using SmartERP.Repository.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartERP.Repository.Common
{
    public class UserManagmentService
    {
        
        public UsersRepository UserRepo { get; set; }
        public RoleMenuRepository RoleMenuRepo { get; set; }
        public RoleUserRepository RoleUserRepo { get; set; }
        public UserMenuRepository UserMenuRepo { get; set; }
        public RoleRepository RoleRepo { get; set; }
        public UserManagmentService()
        {
            CreateOrExtends();
        }
        public void CreateOrExtends()
        {

            this.UserRepo = this.UserRepo ?? new UsersRepository();
            this.RoleMenuRepo = this.RoleMenuRepo ?? new RoleMenuRepository();
            this.RoleUserRepo = this.RoleUserRepo ?? new RoleUserRepository();
            this.UserMenuRepo = this.UserMenuRepo ?? new UserMenuRepository();
            this.RoleRepo = this.RoleRepo ?? new RoleRepository();
            //do something 

        }
        //make you logic ... and carry on... and avoid multiple instance of repostory in controller...
        
        

    }

}





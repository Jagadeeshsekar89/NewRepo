using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SmartERP.Entity.Model.User;

namespace SmartERP.Entity.Interface.User
{
    public interface IUsers
    {
        Users GetByEmail(string email);
    }
}

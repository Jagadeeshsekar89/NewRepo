using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using SmartERP.Repository;
using SmartERP.Entity.Model.User;
using SmartERP.Repository.Core;

namespace SmartERP.API.Controllers
{
    public class UserController : ApiController
    {
        // GET api/values
        UsersRepository _userRepo = new UsersRepository("User");
        public IEnumerable<Users> Get()
        {

            var userList = _userRepo.GetAll();
            return userList;
        }

        // GET api/values/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/values
        public void Post([FromBody]string value)
        {

        }

        // PUT api/values/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        public void Delete(int id)
        {
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartERP.Web.Models
{
    public class EmailModel
    {
        public string FromEmail { get; set; }

        public string ToEmail { get; set; }

        public string Subject { get; set; }

        public string Body { get; set; }

        public string Host { get; set; }

        public bool EnableSsl { get; set; }

        public string UserName { get; set; }

        public string Password { get; set; }

        public int Port { get; set; }

    }
}
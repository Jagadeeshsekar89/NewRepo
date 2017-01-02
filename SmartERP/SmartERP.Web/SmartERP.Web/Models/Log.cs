using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SmartERP.Web.Models
{
    public class Log
    {
        [Key]
        public int LogId { get; set; }
        public string Application { get; set; }
        public string LogType { get; set; }
        public string Message { get; set; }
        public string UserId { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
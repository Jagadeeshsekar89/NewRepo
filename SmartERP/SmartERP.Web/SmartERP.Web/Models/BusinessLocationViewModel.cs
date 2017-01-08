using SmartERP.Entity.Model.BusinessLocation;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SmartERP.Web.Models
{
    public class BusinessLocationViewModel
    {
        [Display(Name = "Code", ResourceType = typeof(Resource))]
        [Required]

        public string Code { get; set; }

        [Display(Name = "Name", ResourceType = typeof(Resource))]
        [Required]
        [DataType(DataType.Password)]
        public string Name { get; set; }

        public string ReturnUrl { get; set; }
        [Display(Name = "Short Name", ResourceType = typeof(Resource))]
        public bool ShortName { get; set; }

        public bool IsActive { get; set; }
    }

    public class BusinessCenterViewModel : BusinessCenter
    {
        public BusinessCenterViewModel()
        {

        }

        public string ReturnUrl { get; set; }
        public IEnumerable<SelectListItem> DistrictCodes { get; set; }
        public string DistrictName { get; set; }
    }
}
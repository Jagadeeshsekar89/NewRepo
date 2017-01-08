using SmartERP.Entity.Model.Configuration;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace SmartERP.Web.Models
{


    public class ConfigurationViewModel
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

    public class CompanyViewModel : Company
    {
        public CompanyViewModel()  {
            
        }

        public string ReturnUrl { get; set; }
        public IEnumerable<SelectListItem> Countries { get; set; }
        public string CountryName  { get; set; }
    }

    public class WorkFlowViewModel 
    {
        public WorkFlowViewModel()
        {

        }

        public string ReturnUrl { get; set; }
        public WorkFlowForm  WorkFlowMaster { get; set; }
        public List<WorkFlowApprovalsViewModel> WorkFlowDetail { get; set; }
        public string Mode { get; set; }
    }


    public class WorkFlowApprovalsViewModel : WorkFlowApprovals
    {
        public WorkFlowApprovalsViewModel()
        {

        }
  
        public string UniqueId { get; set; } //unique id for a line
     
    }
}
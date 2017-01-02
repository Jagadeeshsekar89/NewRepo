#region Using

using SmartERP.Entity.Model.User;
using SmartERP.Repository.Core;
using SmartERP.Web.Models;
using System.Collections.Generic;
using System.Web.Mvc;
using System;
using System.Linq;
using SmartERP.Web.Utilities;
using SmartERP.Entity.Model.Configuration;
using AutoMapper;
using System.Data.Entity.Validation;
#endregion

namespace SmartERP.Web.Controllers
{
    [Authorize]
    public class ConfigurationController : BaseController
    {
        // GET: /Configurtaion/country
        public ConfigurationController()
        {

            Mapper.Initialize(cfg =>
            {
                cfg.CreateMap<Company, CompanyViewModel>();
                cfg.CreateMap<CompanyViewModel, Company>();
                

            });
        }
      
        public ActionResult Country()
        {
            return View();
        }

        public ActionResult index()
        {
            return View();
        }

        #region "company"
        // GET: /Configurtaion/company
        public ActionResult Companies()
        {
            ViewBag.Title = "Configure Companies";
            ViewBag.PageHeader = "Company";
            List<CompanyViewModel> Model = new List<CompanyViewModel>();
            List<Company> companylist = _configurationService.CompanyRepo.GetAll();

            Model = Mapper.Map<List<Company>, List<CompanyViewModel>>(companylist);

            return View(Model);
        }
        public ActionResult Company(int? id)
        {
            ViewBag.Title = "Configure Companies";
            ViewBag.PageHeader = "Company";
            var countries = DropdownBuilder.GetSelectListItems(_configurationService.CountryRepo.GetDropDownList());
          
            
            CompanyViewModel submitModel = (id.GetValueOrDefault(0) == 0) ? new CompanyViewModel() : Mapper.Map<Company, CompanyViewModel>( _configurationService.CompanyRepo.Get(id.GetValueOrDefault(0)) );
            submitModel.Countries = countries;
            return View(submitModel);
        }

        [HttpPost]
        public ActionResult Company(CompanyViewModel viewModel) //when submits
        {

            var countries = DropdownBuilder.GetSelectListItems(_configurationService.CountryRepo.GetDropDownList());
            viewModel.Countries = countries;
            // Ensure we have a valid viewModel to work with
            if (!ModelState.IsValid)
                return View(viewModel);
            
            // Try to create a company/update a company  with the given values
            try
            {
               
                var company = Mapper.Map<CompanyViewModel, Company>(viewModel);
                if (viewModel.Id == 0) //INSERT
                {
                     var result = _configurationService.CompanyRepo.Insert(company);
                    // If the user could not be created /updated
                    if (result <= 0)
                    {
                        return View(viewModel);
                    }
                }
                else
                {
                    var result = _configurationService.CompanyRepo.Update(company);
                    // If the user could not be created /updated
                    if (!result)
                    {
                        return View(viewModel);
                    }
                }


                // If the entry was able to be submited we can redirect to list page

                return RedirectToAction("Companies");
            }
            catch (Exception ex)
            {
                // Add all errors to the page so they can be used to display what went wrong
                // Log errors
                
                return View(viewModel);
            }
        }
        #endregion


        #region "WorkFlow"
        // GET: /Configurtaion/workflow
        public ActionResult WorkFlows()
        {
            ViewBag.Title = "Configure WorkFlows";
            ViewBag.PageHeader = "WorkFlow";
            List<WorkFlowViewModel> Model = new List<WorkFlowViewModel>();
            Model.Add(new WorkFlowViewModel() {
               WorkFlowMaster = new WorkFlowMasterViewModel() { },
               WorkFlowDetail =  new List<WorkFlowDetailViewModel>() 
            });

            return View(Model);
        }
        public ActionResult WorkFlowMasterDetail(int? id)
        {
            ViewBag.Title = "Configure Workflows";
            ViewBag.PageHeader = "WorkFlow";

            WorkFlowViewModel submitModel = new WorkFlowViewModel();
            submitModel.Mode = "ADD";
            submitModel.WorkFlowMaster = new WorkFlowMasterViewModel();
            submitModel.WorkFlowDetail = new List<WorkFlowDetailViewModel>();
            submitModel.WorkFlowDetail.Add(new WorkFlowDetailViewModel() { Id=0 , UniqueId = (Guid.NewGuid()).ToString() });
            return View(submitModel);
        }

        [HttpPost]
        public ActionResult WorkFlowMasterDetail(WorkFlowViewModel viewModel) //when submits
        {
            ViewBag.Title = "Configure Workflows";
            ViewBag.PageHeader = "WorkFlow";
            //add a new row every time submit 
            if (viewModel.Mode == "ADDLINE")
            {
                
                viewModel.WorkFlowDetail.Add(new WorkFlowDetailViewModel() { Id=0, UniqueId = (Guid.NewGuid()).ToString() });
                return View(viewModel);
            }
            else if (viewModel.Mode.Length > 10 )
            {
                //delete only model when we add a new entry
                var tobeDeleted = viewModel.WorkFlowDetail.Find(a => a.UniqueId == viewModel.Mode);
                if (tobeDeleted!=null)
                viewModel.WorkFlowDetail.Remove(tobeDeleted);
                //delete both model and database


                //save the entire model and redirect to main page
                return View(viewModel);

            }
            else //SAVE ALL
            {
                //save the entire model and redirect to main page


            }
            return View(viewModel);
        }
        #endregion

    }
}
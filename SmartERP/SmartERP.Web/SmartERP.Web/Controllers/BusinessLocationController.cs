using AutoMapper;
using SmartERP.Entity.Model.BusinessLocation;
using SmartERP.Web.Models;
using SmartERP.Web.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SmartERP.Web.Controllers
{
    [AuthorizeUser]
    public class BusinessLocationController : BaseController
    {
        public BusinessLocationController()
        {

            Mapper.Initialize(cfg =>
            {
                cfg.CreateMap<BusinessCenter, BusinessCenterViewModel>();
                cfg.CreateMap<BusinessCenterViewModel, BusinessCenter>();

            });
        }

        #region "Business center"
        // GET: /Configurtaion/company
        public ActionResult BusinessCenters()
        {
            ViewBag.Title = "Configure Business Center";
            ViewBag.PageHeader = "Business Center";

            List<BusinessCenterViewModel> Model = new List<BusinessCenterViewModel>();
            List<BusinessCenter> businessCenterlist = _businessLocationService.BusinessCenterRepo.GetAll();

            Model = Mapper.Map<List<BusinessCenter>, List<BusinessCenterViewModel>>(businessCenterlist);
            return View(Model);
        }
        public ActionResult BusinessCenter(int? id)
        {
            ViewBag.Title = "Configure Business Center";
            ViewBag.PageHeader = "Business Center";
            var districtList = DropdownBuilder.GetSelectListItems(_geoService.GeoDistrictRepo.GetDropDownList());

            BusinessCenterViewModel submitModel = (id.GetValueOrDefault(0) == 0) ? new BusinessCenterViewModel() : Mapper.Map<BusinessCenter, BusinessCenterViewModel>(_businessLocationService.BusinessCenterRepo.Get(id.GetValueOrDefault(0)));
            submitModel.DistrictCodes = districtList;
            return View(submitModel);
        }

        [HttpPost]
        public ActionResult BusinessCenter(BusinessCenterViewModel viewModel) //when submits
        {

            var districtList = DropdownBuilder.GetSelectListItems(_geoService.GeoDistrictRepo.GetDropDownList());
            viewModel.DistrictCodes = districtList;
            // Ensure we have a valid viewModel to work with
            if (!ModelState.IsValid)
                return View(viewModel);

            // Try to create a data with the given values
            try
            {

                var data = Mapper.Map<BusinessCenterViewModel, BusinessCenter>(viewModel);
                if (viewModel.Id == 0) //INSERT
                {
                    var result = _businessLocationService.BusinessCenterRepo.Insert(data);
                    // If the entry could not be created /updated
                    if (result <= 0)
                    {
                        return View(viewModel);
                    }
                }
                else
                {
                    var result = _businessLocationService.BusinessCenterRepo.Update(data);
                    // If the entry could not be created /updated
                    if (!result)
                    {
                        return View(viewModel);
                    }
                }


                // If the entry was able to be submited we can redirect to list page

                return RedirectToAction("BusinessCenters");
            }
            catch (Exception ex)
            {
                // Add all errors to the page so they can be used to display what went wrong
                // Log errors

                return View(viewModel);
            }
        }
        #endregion
    }
}
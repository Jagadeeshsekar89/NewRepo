using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.Globalization;
using SmartERP.Repository.Core;

namespace SmartERP.Web.Utilities
{
    public class DropdownBuilder
    {

        public static IEnumerable<SelectListItem> GetAllPaymentMethods()
        {
            return new SelectList(new List<SelectListItem> {
                                    new SelectListItem { Value = "Cash", Text = "Cash"},
                                    new SelectListItem { Value = "Cheque", Text = "Cheque"},
                                    new SelectListItem { Value = "Draft", Text = "Draft"},
                                    new SelectListItem { Value = "GIRO", Text = "GIRO"},
                                    new SelectListItem { Value = "Paypal", Text = "Paypal"}
                                                         }, "Value", "Text");

        }

        public static IEnumerable<SelectListItem> GetSelectListItems(IEnumerable<dynamic> elements)
        {
            // Create an empty list to hold result of the operation
            var selectList = new List<SelectListItem>();

            // For each string in the 'elements' variable, create a new SelectListItem object
            // that has both its Value and Text properties set to a particular value.
            // This will result in MVC rendering each item as:
            //     <option value="State Name">State Name</option>
            foreach (var element in elements)
            {
                selectList.Add(new SelectListItem
                {
                    Value = (element.Id ?? String.Empty).ToString() , 
                    Text = (element.DisplayValue ?? String.Empty).ToString()  
                });
            }
            if ( selectList.Count==0)
            selectList.Add(new SelectListItem() { Value="0",Text="No items" });
            return selectList;
        }

    }
}
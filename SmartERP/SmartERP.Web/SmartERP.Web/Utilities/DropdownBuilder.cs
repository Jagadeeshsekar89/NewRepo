using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace SmartERP.Web.Utilities
{
    public class DropdownBuilder
    {
        public static IEnumerable<SelectListItem> GetSelectListItems(IEnumerable<dynamic> elements)
        {
            // Create an empty list to hold result of the operation
            var selectList = new List<SelectListItem>();

            foreach (var element in elements)
            {
                selectList.Add(new SelectListItem
                {
                    Value = (element.Id ?? String.Empty).ToString(),
                    Text = (element.DisplayValue ?? String.Empty).ToString()
                });
            }
            if (selectList.Count == 0)
                selectList.Add(new SelectListItem() { Value = "0", Text = "No items" });
            return selectList;
        }

    }
}
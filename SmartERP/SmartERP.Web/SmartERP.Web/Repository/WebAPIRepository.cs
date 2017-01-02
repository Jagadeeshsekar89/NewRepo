using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using SmartERP.Web.Models;
using System.Net.Http;
using System.Net.Http.Headers;
using Newtonsoft.Json;
using System.Threading.Tasks;

namespace SmartERP.Web.Repository
{
    public class WebAPIRepository
    {
        HttpClient client;
        //The HttpClient Class, this will be used for performing 
        //HTTP Operations, GET, POST, PUT, DELETE
        //Set the base address and the Header Formatter
        string url;
        public WebAPIRepository(string webapiurl)
        {
            url = webapiurl;
            client = new HttpClient();
            client.BaseAddress = new Uri(url);
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

        }

        public async Task<HttpResponseMessage> GetRespose()
        {
            HttpResponseMessage responseMessage = await client.GetAsync(url);
            if (responseMessage.IsSuccessStatusCode)
            {
                var responseData = responseMessage.Content.ReadAsStringAsync().Result;
                
            }
            return responseMessage;
        }
    }
}
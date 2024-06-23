using Flurl.Http;
using Flurl;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;
using System.Security.Policy;
using CalofitMVC.Models;
using NuGet.Protocol.Plugins;
using CalofitMVC.Common;
using CalofitMVC.EnumMVC;

namespace CalofitMVC.Controllers
{
    public class ForGetController : Controller
    {

        private readonly string lApiUrl = BaseURLEnum.BASE_URL.GetDescription() + "/api/ForgotPass";

        public IActionResult ForGet()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Forgot(string email, string password, string repass)
        {
            try
            {
                var response = await lApiUrl
                    .SetQueryParam("email", email)
                    .SetQueryParam("password", password)
                    .SetQueryParam("repass", repass)
                    .PostAsync();

                if (response.StatusCode == 200)
                {
                return Json(new { Message="Thanh Cong " });
                }
                else
                {
                    return Json(new { Message="Khong thanh cong"});
                }
            }
            catch (FlurlHttpException ex)
            {
                return Json(new { Message = "Khong thanh cong" });

            }

        }
    
    
        public IActionResult ForGot()
        {

            return View();
        }
    }
}

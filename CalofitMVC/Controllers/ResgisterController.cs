using Flurl.Http;
using Flurl;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;
using CalofitMVC.Common;
using CalofitMVC.EnumMVC;

namespace CalofitMVC.Controllers
{
    public class ResgisterController : Controller
    {
        public IActionResult IndexAsync()
        {
            return View();
        }
        private readonly string registerApiUrl = BaseURLEnum.BASE_URL.GetDescription() + "/api/Register";


        [HttpPost]
        public async Task<IActionResult> Index(string email, string password, string repass)
        {  // Check if passwords match

            if (password != repass)
            {
                return Json(new { Message = "Passwords do not match" });
            }

            try
            {
                var response = await registerApiUrl
                    .SetQueryParam("email", email)
                    .SetQueryParam("password", password)
                    .SetQueryParam("repass", repass)
                    .PostAsync();

                if (response.StatusCode == 200)
                {

                    return Json(new { Message = "thanh cong" });
                }
                else
                {



                    return Json(new { Message = "loi" });
                }
            }
            catch (FlurlHttpException ex)
            {
                return Json(new { Message = "API call failed: " + ex.Message });
            }
            catch (Exception ex)
            {
                return Json(new { Message = "An unexpected error occurred: " + ex.Message });
            }
        }
    }
 }



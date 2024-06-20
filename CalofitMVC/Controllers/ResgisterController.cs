using Flurl.Http;
using Flurl;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;

namespace CalofitMVC.Controllers
{
    public class ResgisterController : Controller
    {
        public IActionResult IndexAsync()
        {
            return View();
        }
        private readonly string registerApiUrl = "https://calofitweb.azurewebsites.net/api/Register";


        [HttpPost]
        public async Task<IActionResult> Index(string email, string password, string repass)
        {  // Check if passwords match


            try
            {
                var response = await registerApiUrl
                    .SetQueryParam("email", email)
                    .SetQueryParam("password", password)
                    .SetQueryParam("repass", repass)
                    .PostAsync();

                if (response.StatusCode == 200)
                {
                    var responseContent = await response.ResponseMessage.Content.ReadAsStringAsync();
                    var jsonResponse = JObject.Parse(responseContent);
                    int userId = jsonResponse.Value<int>("userId");

                    HttpContext.Session.SetInt32("user", userId);

                    if (HttpContext.Session.GetInt32("user") != null)
                    {
                        return RedirectToAction("Index", "Home");
                    }
                    else
                    {
                            return Json(new { Message = "Khong thanh cong" });
                        
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Registration failed. Please try again.");
                    return View();
                }
            }
            catch (FlurlHttpException ex)
            {
                return Json(new { Message = "Khong thanh cong" });
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", "An unexpected error occurred.");
                return View();
            }
        }
    }

}

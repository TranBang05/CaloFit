using Microsoft.AspNetCore.Mvc;
using Flurl.Http;
using System.Threading.Tasks;
using Flurl;

namespace CalofitMVC.Controllers
{
    public class LoginController : Controller
    {
        private readonly string loginApiUrl = "http://localhost:5150/api/Login";

        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Index(string email, string password)
        {
            try
            {
        
                var response = await loginApiUrl
                    .SetQueryParam("username", email)
                    .SetQueryParam("password", password)
                    .PostAsync(null) 
                    .ReceiveString();

                if (response == "sucess")
                {
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ViewBag.ErrorMessage = "Đăng nhập không thành công. Vui lòng kiểm tra lại email và mật khẩu.";
                    return View();
                }
            }
            catch (FlurlHttpException ex)
            {
                ViewBag.ErrorMessage = $"Đã xảy ra lỗi khi đăng nhập. Vui lòng thử lại sau. {ex.Message}";
                return View();
            }
            catch (Exception ex)
            {
                ViewBag.ErrorMessage = $"Đã xảy ra lỗi không mong muốn. Vui lòng thử lại sau. {ex.Message}";
                return View();
            }
        }
    }
}

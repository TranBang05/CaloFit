using CalofitMVC.Resp;
using Flurl;
using Flurl.Http;
using Flurl.Http.Newtonsoft;
using Microsoft.AspNetCore.Mvc;

namespace CalofitMVC.Controllers
{
    public class ResultController : Controller
    {


        public string link = "http://localhost:5150/api/CreateMealMenuDay";
        private NewtonsoftJsonSerializer serializer;
        public ResultController()
        {
            serializer = new Flurl.Http.Newtonsoft.NewtonsoftJsonSerializer();
        }

        [HttpPost]
        public IActionResult Index(string Allergies, string DietName, string Lich)
        {

                try
                {

                    var response =  link
                        .SetQueryParam("Allergies", Allergies)
                        .SetQueryParam("DietName", DietName)
                        .SetQueryParam("MealDate", Lich)
                        .PostAsync(null)
                        .ReceiveString();

                    if (response !=null)
                    {
                    return RedirectToAction("Result", "Home");

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


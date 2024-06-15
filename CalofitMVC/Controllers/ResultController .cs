using CalofitMVC.Resp;
using Flurl;
using Flurl.Http;
using Flurl.Http.Newtonsoft;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace CalofitMVC.Controllers
{
    public class ResultController : Controller
    {


        public string baseUrl = "http://localhost:5150/api/CreateMealMenuDay";
     
        private NewtonsoftJsonSerializer serializer;
        public ResultController()
        {
            serializer = new Flurl.Http.Newtonsoft.NewtonsoftJsonSerializer();
        }

        [HttpPost]
        //public async Task<IActionResult> IndexAsync(int Allergies, int DietName, string Lich)
        //{




        //    POST request to create a meal plan
        //   var createrecipResponse = await link.PutJsonAsync(Allergies, DietName, Lich);

        //    return View(createrecipResponse);





        //    try
        //    {

        //        var response = link
        //            .SetQueryParam("Allergies", Allergies)
        //            .SetQueryParam("DietName", DietName)
        //            .SetQueryParam("MealDate", Lich)
        //            .PostAsync(null)
        //            .ReceiveString();

        //        if (response != null)
        //        {
        //            return RedirectToAction("Result", "Home");

        //        }
        //        else
        //        {
        //            ViewBag.ErrorMessage = "Đăng nhập không thành công. Vui lòng kiểm tra lại email và mật khẩu.";
        //            return View();
        //        }
        //    }
        //    catch (FlurlHttpException ex)
        //    {
        //        ViewBag.ErrorMessage = $"Đã xảy ra lỗi khi đăng nhập. Vui lòng thử lại sau. {ex.Message}";
        //        return View();
        //    }
        //    catch (Exception ex)
        //    {
        //        ViewBag.ErrorMessage = $"Đã xảy ra lỗi không mong muốn. Vui lòng thử lại sau. {ex.Message}";
        //        return View();
        //    }

        //}




        public async Task<IActionResult> IndexAsync(int DietName, int Allergies, string Lich)
        {

            var requestData = new CreateRecipesRequest
            {
                DietId = DietName,
                Allergy = Allergies,

                dailyorweek = Lich,
                // Các thuộc tính khác của request nếu cần thiết
            };
            try
            {
                var response = await baseUrl

                    .PostJsonAsync(requestData)
                    .ReceiveJson<List<CreateMealPlan>>();

                return View(response);
            }
            catch (FlurlHttpException ex)
            {
                var errorMessage = await ex.GetResponseStringAsync();
                throw new Exception($"Error calling API: {errorMessage}", ex);
            }
        }

    }
}

    


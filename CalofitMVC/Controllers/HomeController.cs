using CalofitMVC.Common;
using CalofitMVC.EnumMVC;
using CalofitMVC.Models;
using CalofitMVC.Resp;
using Flurl;
using Flurl.Http;
using Flurl.Http.Newtonsoft;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace CalofitMVC.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public string linkrecipe = BaseURLEnum.BASE_URL.GetDescription() + "/api/Diet/recipe";
        public string link = BaseURLEnum.BASE_URL.GetDescription() + "/api/Carts/User";
        public string linkdiet = BaseURLEnum.BASE_URL.GetDescription() + "/api/Diet";
        public string linkall = BaseURLEnum.BASE_URL.GetDescription() + "/api/Alllergic";
        public string createrecipe = BaseURLEnum.BASE_URL.GetDescription() + "/api/CreateMealMenuDay";


        private NewtonsoftJsonSerializer serializer;


        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
            serializer = new Flurl.Http.Newtonsoft.NewtonsoftJsonSerializer();
        }

  

        public IActionResult Home()
        {
            return View();
        }

        public IActionResult Login()
        {
            return View();
        }

        public async Task<IActionResult> Recipe()
        {
            try
            {
                // Gọi API từ link để lấy danh sách Allergy
                var recip = await linkrecipe.GetJsonAsync<List<reciperepon1>>();
                return View(recip);
            }
            catch (FlurlHttpException ex)
            {
                _logger.LogError(ex, "Error calling API.");
                throw; //

            }

        }


        public async Task<IActionResult> MealPlan()
        {
            try
            {
                var allergies = await linkall.GetJsonAsync<List<Allergy>>();

                var diets = await linkdiet.GetJsonAsync<List<Diet>>();
                var model = new MealPlanViewModel
                {
                    Allergies = allergies,
                    Diets = diets
                };

                return View(model);
            }
            catch (FlurlHttpException ex)
            {
                _logger.LogError(ex, "Error calling API.");
                throw; //

            }
        }



        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View();
            //return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}

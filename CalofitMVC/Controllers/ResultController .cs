using CalofitMVC.EnumMVC;
using CalofitMVC.Models;
using CalofitMVC.Resp;
using Flurl;
using Flurl.Http;
using Flurl.Http.Newtonsoft;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

namespace CalofitMVC.Controllers
{
    public class ResultController : Controller
    {


        public string baseUrl = "http://localhost:5150/api/CreateMealMenuDay";

        private NewtonsoftJsonSerializer serializer;
        CalofitDBContext context;
        public ResultController(CalofitDBContext context)
        {
            this.context = context;
            serializer = new Flurl.Http.Newtonsoft.NewtonsoftJsonSerializer();
        }

        public IActionResult Index(int DietName = 1, int Allergies = 1, string MealType = "Bữa sáng")
        {

            //    var requestData = new CreateRecipesRequest
            //    {
            //        DietId = DietName,
            //        Allergy = Allergies,

            //        dailyorweek = Lich,
            //        // Các thuộc tính khác của request nếu cần thiết
            //    };
            //    try
            //    {
            //        var response = await baseUrl

            //            .PostJsonAsync(requestData)
            //            .ReceiveJson<List<CreateMealPlan>>();

            //        return View(response);
            //    }
            //    catch (FlurlHttpException ex)
            //    {
            //        var errorMessage = await ex.GetResponseStringAsync();
            //        throw new Exception($"Error calling API: {errorMessage}", ex);
            //    }
            //}

            //luc save thi ko de xuat nhung mon an co trong di ung cua ng dung, day chi la
            //display nen ko quan tam allergy
            int userId = HttpContext.Session.GetInt32("user") ?? 1;

            ViewData["list"] = context.Meals
                .Include(x => x.MealRecipes).ThenInclude(r => r.Image)
                .Include(x => x.MealRecipes.Menu).ThenInclude(me => me.Diet)
                .Where(x => x.MealRecipes.Menu.DietId == DietName)
                .Where(x => x.Plan.UserId == userId)
                //.Where(x => x.MealType.Equals(MealType))
                .ToList();
            return View("PlanMeal");
            //return View();
        }
    }
}




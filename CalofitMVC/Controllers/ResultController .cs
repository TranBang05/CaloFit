using CalofitMVC.EnumMVC;
using CalofitMVC.Models;
using CalofitMVC.Resp;
using Flurl;
using Flurl.Http;
using Flurl.Http.Newtonsoft;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyModel.Resolution;
using Newtonsoft.Json;

namespace CalofitMVC.Controllers
{
    public class ResultController : Controller
    {


        public string baseUrl = "https://calofitweb.azurewebsites.net/api/CreateMealMenuDay";

        private NewtonsoftJsonSerializer serializer;
        CalofitDBContext context;
        private static Dictionary<int, Array> MealMap = new Dictionary<int, Array>();
        public ResultController(CalofitDBContext context)
        {
            this.context = context;
            serializer = new Flurl.Http.Newtonsoft.NewtonsoftJsonSerializer();
        }

        public IActionResult Index(int DietName = 1, int day = 1)
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
            ViewBag.DietId = DietName;
            Random rand = new Random();
            ViewData["list"] = context.MealPlanManyToManies
                .Where(x => x.Plan.UserId == userId).Include(x => x.Meal)
                .ThenInclude(x => x.MealRecipes).ThenInclude(r => r.Image)
                .Include(x => x.Meal.MealRecipes.Menu).ThenInclude(me => me.Diet).Select(x => x.Meal).Skip(rand.Next(0, 18)).Take(3)
                .ToList();

            //Random rand = new Random();
            //ViewData["list"] = 
            return View();
        }

        public ActionResult PlanMeal()
        {
            ViewData["allergy"] = context.Allergies.ToList();
            ViewData["diet"] = context.Diets.ToList();
            return View();
        }
        [HttpPost]
        public IActionResult PlanMeal(IFormCollection f)
        {
            string type = f["plantype"].ToString();
            int dietId = int.Parse(f["diet"].ToString());
            int userId = HttpContext.Session.GetInt32("user") ?? 1;
            int days = (type == "daily") ? 1 : 7;

            deletePlan(userId);

            var plan = new MealPlan()
            {
                UserId = userId,
                PlanType = type,
                StartDate = DateTime.Now,
                EndDate = DateTime.Now.AddDays(days)
            };

            context.MealPlans.Add(plan) ;
            context.SaveChanges();

            BuildMealPlan(plan.PlanId, userId, dietId, days);

            return RedirectToAction("Index", new { DietName = dietId, day = 1 });
        }

        private void deletePlan(int userId)
        {
            List<MealPlanManyToMany> plan =  context.MealPlanManyToManies.Where(x => x.Plan.UserId == userId).ToList() ;
            List<MealPlan> mealPlans = context.MealPlans.Where(x => x.UserId == userId).ToList() ;
            context.MealPlanManyToManies.RemoveRange(plan) ;
            context.SaveChanges() ;
            context.MealPlans.RemoveRange(mealPlans);
            context.SaveChanges() ;
        }

        private void BuildMealPlan(int planId, int userId, int DietId, int times)
        {
            int index = 1;
            List<int> allergies = context.Allergies.Where(x => x.UserId == userId).Select(x => x.AllergyId).ToList();

            var meals = context.Meals
                .Where(x => x.MealRecipes.Menu.Diet.Id == DietId)
                .Include(x => x.MealRecipes).ThenInclude(m => m.RecipeIngredients)
                .Select(meal => new
                {
                    MealId = meal.MealId,
                    TotalCalo = meal.MealRecipes.RecipeIngredients
                        .Sum(ri => ri.Ingredient.Nutrition.Calories),
                    Fat = meal.MealRecipes.RecipeIngredients
                        .Sum(ri => ri.Ingredient.Nutrition.Fat),
                    Sugar = meal.MealRecipes.RecipeIngredients
                        .Sum(ri => ri.Ingredient.Nutrition.Sugar),
                    Carbo = meal.MealRecipes.RecipeIngredients
                        .Sum(ri => ri.Ingredient.Nutrition.Carbohydrates),
                    Protein = meal.MealRecipes.RecipeIngredients
                        .Sum(ri => ri.Ingredient.Nutrition.Protein)
                }).ToArray();

            for (int i = 0; i < meals.Length; i++)
            {
                for (int j = i + 1; j < meals.Length; j++)
                {
                    for (int k = j + 1; k < meals.Length; k++)
                    {
                        if (meals[i].TotalCalo + meals[j].TotalCalo + meals[k].TotalCalo >= (double)NutritionEnum.CaloMin &&
                            meals[i].TotalCalo + meals[j].TotalCalo + meals[k].TotalCalo <= (double)NutritionEnum.CaloMax )
                        {
                            MealMap.Add(index, new int[] { meals[i].MealId, meals[j].MealId, meals[k].MealId});
                            index++;
                        }
                    }
                }
            }
            Populate(MealMap, times, planId);
        }

        private void Populate(Dictionary<int, Array> mealMap, int times, int planId)
        {
            Random random = new Random();
            while (times >= 1) {
                int[] meals = new int[4];
                meals = (int[])mealMap.GetValueOrDefault(random.Next(1, mealMap.Count));
                context.MealPlanManyToManies.Add(new MealPlanManyToMany()
                {
                    PlanId = planId,
                    MealId = meals[0]
                }) ;
                context.MealPlanManyToManies.Add(new MealPlanManyToMany()
                {
                    PlanId = planId,
                    MealId = meals[1]
                });
                context.MealPlanManyToManies.Add(new MealPlanManyToMany()
                {
                    PlanId = planId,
                    MealId = meals[2]
                });

                context.SaveChanges();
                times--;
            }
        }
    }
}




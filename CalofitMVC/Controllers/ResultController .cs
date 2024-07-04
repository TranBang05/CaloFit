using CalofitMVC.Common;
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


        public string baseUrl = BaseURLEnum.BASE_URL.GetDescription() + "/api/CreateMealMenuDay";

        private NewtonsoftJsonSerializer serializer;
        CalofitDBContext context;
        private static Dictionary<int, Array> MealMap = new Dictionary<int, Array>();
        public ResultController(CalofitDBContext context)
        {
            this.context = context;
            serializer = new Flurl.Http.Newtonsoft.NewtonsoftJsonSerializer();
        }

        public IActionResult Index(int day = 1)
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
            Random rand = new Random();
            ViewData["list"] = context.MealPlanManyToManies
                .Where(x => x.Plan.UserId == userId).Include(x => x.Meal)
                .ThenInclude(x => x.MealRecipes).ThenInclude(r => r.Image)
                .Include(x => x.Meal.MealRecipes.Menu).ThenInclude(me => me.Diet).Select(x => x.Meal).Skip((day - 1) * 3).Take(3)
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
            string act = f["act"].ToString();
            string[] goal = f["goal"].ToArray();
            int userId = HttpContext.Session.GetInt32("user") ?? 1;

            User user = context.Users.FirstOrDefault(x => x.UserId == userId);

            int days = (type == "daily") ? 1 : 7;
            HttpContext.Session.SetInt32("days", days);

            deletePlan(userId);

            var plan = new MealPlan()
            {
                UserId = userId,
                PlanType = type,
                StartDate = DateTime.Now,
                EndDate = DateTime.Now.AddDays(days)
            };

            context.MealPlans.Add(plan);
            context.SaveChanges();

            BuildMealPlan(plan.PlanId, userId, days, user, act, goal);

            return RedirectToAction("Index", new { day = 1 });
        }

        private void deletePlan(int userId)
        {
            List<MealPlanManyToMany> plan = context.MealPlanManyToManies.Where(x => x.Plan.UserId == userId).ToList();
            List<MealPlan> mealPlans = context.MealPlans.Where(x => x.UserId == userId).ToList();
            context.MealPlanManyToManies.RemoveRange(plan);
            context.SaveChanges();
            context.MealPlans.RemoveRange(mealPlans);
            context.SaveChanges();

            MealMap.Clear();
        }

        private bool filter(double Totalcalo, double Fat, double sugar, double carbo, double protein, string[] goal, int act)
        {
            bool flag =false;
            foreach (string g in goal)
            {
                if (g == Goal.Disease.GetDescription())
                {
                    flag = Fat < 50 && protein > 30 && carbo < 56;
                }
                if (g == Goal.Loss.GetDescription())
                {
                    flag = Fat < 40 && protein > 40 && carbo < 56;
                }
                if (g == Goal.Maintain.GetDescription())
                {
                    flag = Fat < 70 && protein > 45 && carbo < 60;
                }
                if (g == Goal.Build.GetDescription())
                {
                    flag = Fat > 40 && protein > 60 && carbo > 30;
                }
            }

            double minCalo = 0;
            double maxCalo = 0;
            switch (act)
            {
                case 1:
                    minCalo = (double)(NutritionEnum.CaloMin + 200 * (act - 1));
                    maxCalo = (double)(NutritionEnum.CaloMax + 200 * (act - 1));
                    break;
                case 2:
                    minCalo = (double)(NutritionEnum.CaloMin + 200 * (act - 1));
                    maxCalo = (double)(NutritionEnum.CaloMax + 200 * (act - 1));
                    break;
                case 3:
                    minCalo = (double)(NutritionEnum.CaloMin + 200 * (act - 1));
                    maxCalo = (double)(NutritionEnum.CaloMax + 200 * (act - 1));
                    break;
                case 4:
                    minCalo = (double)(NutritionEnum.CaloMin + 200 * (act - 1));
                    maxCalo = (double)(NutritionEnum.CaloMax + 200 * (act - 1));
                    break;
            }

            flag = Totalcalo >= minCalo && Totalcalo <= maxCalo;
            return flag;
        }

        private void BuildMealPlan(int planId, int userId, int times, User user, string act, string[] goal)
        {
            int index = 1;
            List<int> allergies = context.Allergies.Where(x => x.UserId == userId).Select(x => x.AllergyId).ToList();

            int actId = Act.getAct(act);

            var meals = context.Meals
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
                        if (filter(meals[i].TotalCalo + meals[j].TotalCalo + meals[k].TotalCalo, meals[i].Fat + meals[j].Fat + meals[k].Fat,
                            meals[i].Sugar + meals[j].Sugar + meals[k].Sugar, meals[i].Carbo + meals[j].Carbo + meals[k].Carbo,
                            meals[i].Protein + meals[j].Protein + meals[k].Protein, goal, actId))
                        {
                            MealMap.Add(index, new int[] { meals[i].MealId, meals[j].MealId, meals[k].MealId });
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
            while (times >= 1)
            {
                int[] meals = new int[4];
                meals = (int[])mealMap.GetValueOrDefault(random.Next(1, mealMap.Count));
                context.MealPlanManyToManies.Add(new MealPlanManyToMany()
                {
                    PlanId = planId,
                    MealId = meals[0]
                });
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




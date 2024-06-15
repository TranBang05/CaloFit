using CaloFitAPI.Dto.Request;
using CaloFitAPI.Dto.Response;
using CaloFitAPI.Models;
using Microsoft.EntityFrameworkCore;

using Microsoft.AspNetCore.Http;

namespace CaloFitAPI.Service.Impl
{
    public class CreateMeal : ICreateMeal
    {

        public readonly CalofitDBContext _context;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private List<CreateMealPlan> createMealPlans;




		public CreateMeal(CalofitDBContext context, IHttpContextAccessor httpContextAccessor)
        {

            _context = context;
            _httpContextAccessor = httpContextAccessor;
        }

        public List<CreateMealPlan> getMealDay(CreateRecipesRequest request)
        {

			var httpContext = _httpContextAccessor.HttpContext;

			if (httpContext == null)
			{
				throw new InvalidOperationException("HttpContext is null.");
			}

			var session = httpContext.Session;
            //var userId = session.GetInt32("user");
            var userId = 1;

			if (request.dailyorweek == "daily")
            {
                var mealPlans = _context.MealPlans
                    .Include(mp => mp.Meals)
                        .ThenInclude(m => m.MealRecipes)
                            .ThenInclude(mr => mr.RecipeIngredients)
                                .ThenInclude(ri => ri.ServingSize)
                                    .ThenInclude(ss => ss.Ingredient)
                                        .ThenInclude(i => i.Nutrition)
                    .Include(mp => mp.Meals)
                        .ThenInclude(m => m.MealRecipes)
                            .ThenInclude(mr => mr.Steps)
                    .Include(mp => mp.Meals)
                        .ThenInclude(m => m.MealRecipes)
                            .ThenInclude(mr => mr.UserPreferences)
                                .ThenInclude(up => up.Diet)
                    .Include(mp => mp.Meals)
                        .ThenInclude(m => m.MealRecipes)
                            .ThenInclude(mr => mr.RecipeAllergies)
                                .ThenInclude(ra => ra.Allergy)
                    .Where(mp => mp.PlanType == request.dailyorweek)
                    .ToList();


                
                var newMealPlan = new MealPlan
                {
                    UserId = (int)userId,
                    StartDate = DateTime.Now,
                    EndDate = DateTime.Now.AddDays(1),
                    PlanType = request.dailyorweek
                };


                _context.MealPlans.Add(newMealPlan);


                _context.SaveChanges();


                 createMealPlans = mealPlans.Select(mp => new CreateMealPlan
                {
                    PlanId = newMealPlan.PlanId,
                    CreateMeals = mp.Meals.Select(m => new CreateRecipeMeal
                    {
                        MealId = m.MealId,
                        MealType = m.MealType,
                        recipeReponses = new recipeReponse
                        {
                            RecipeId = m.MealRecipes.RecipeId,
                            RecipeName = m.MealRecipes.RecipeName,
                            Servings = m.MealRecipes.Servings,
                            CookTime = m.MealRecipes.CookTime,
                            PrepTime = m.MealRecipes.PrepTime,
                            Description = m.MealRecipes.Description,
                            ImageId = m.MealRecipes.ImageId,
                            MenuId = m.MealRecipes.MenuId,
                            userPreferences = m.MealRecipes.UserPreferences
                                .Select(up => new UserPreferencesDto
                                {
                                    UserPreferenceId = up.UserPreferenceId,
                                    UserId = up.UserId,
                                    DietId = up.DietId,
                                    FavoriteRecipesId = up.FavoriteRecipesId
                                }).Where(up => up.DietId == request.DietId)
                                .ToList(),
                            step = m.MealRecipes.Steps.Select(s => new StepDto
                            {
                                StepId = s.StepId,
                                RecipeId = s.RecipeId,
                                StepNumber = s.StepNumber,
                                Description = s.Description,
                                ImageId = s.ImageId
                            }).ToList(),
                            recipeIngredients = m.MealRecipes.RecipeIngredients
                                .Select(ri => new recipeIngredientsDto
                                {
                                    RecipeIngredientId = ri.RecipeIngredientId,
                                    RecipeId = ri.RecipeId,
                                    IngredientId = ri.IngredientId,
                                    ServingSizeId = ri.ServingSizeId
                                }).ToList(),
                            RecipeAllergies = m.MealRecipes.RecipeAllergies
                                .Select(ra => new RecipeAllergyDto
                                {
                                    RecipeAllergyId = ra.RecipeAllergyId,
                                    RecipeId = ra.RecipeId,
                                    AllergyId = ra.AllergyId
                                }).Where(p => p.RecipeAllergyId == request.Allergy)
                                .ToList()
                        }
                    }).Take(3).ToList()
                }).Take(1).ToList();



                int mealTypeIndex = 0;

                foreach (var createMealPlan in createMealPlans)
                {
                    if (createMealPlan.CreateMeals.Count > 0)
                    {

                        for (int i = 0; i < createMealPlan.CreateMeals.Count; i++)
                        {
                            var createRecipeMeal = createMealPlan.CreateMeals[i];
                            string mealType = GetMealType(mealTypeIndex);

                            var meal = new Meal
                            {
                                PlanId = newMealPlan.PlanId,
                                MealType = mealType,
                                MealDate = DateTime.Now,
                                MealRecipesId = createRecipeMeal.recipeReponses.RecipeId
                            };

                            _context.Meals.Add(meal);

                            mealTypeIndex++; 
                        }

                        _context.SaveChanges();
                    }
                }

                return createMealPlans;

            }
            else
            {


                var mealPlans = _context.MealPlans
                   .Include(mp => mp.Meals)
                       .ThenInclude(m => m.MealRecipes)
                           .ThenInclude(mr => mr.RecipeIngredients)
                               .ThenInclude(ri => ri.ServingSize)
                                   .ThenInclude(ss => ss.Ingredient)
                                       .ThenInclude(i => i.Nutrition)
                   .Include(mp => mp.Meals)
                       .ThenInclude(m => m.MealRecipes)
                           .ThenInclude(mr => mr.Steps)
                   .Include(mp => mp.Meals)
                       .ThenInclude(m => m.MealRecipes)
                           .ThenInclude(mr => mr.UserPreferences)
                               .ThenInclude(up => up.Diet)
                   .Include(mp => mp.Meals)
                       .ThenInclude(m => m.MealRecipes)
                           .ThenInclude(mr => mr.RecipeAllergies)
                               .ThenInclude(ra => ra.Allergy)
                   .Where(mp => mp.PlanType == request.dailyorweek)
                   .ToList();



                for (int day = 0; day < 7; day++)
                {
                    var startDate = DateTime.Now.AddDays(day);
                    var endDate = startDate.AddDays(1);

                    var newMealPlan = new MealPlan
                    {
                        UserId = (int)userId,
                        StartDate = startDate,
                        EndDate = endDate,
                        PlanType = request.dailyorweek
                    };

                    _context.MealPlans.Add(newMealPlan);
                    _context.SaveChanges();


                    var createMealPlans = mealPlans.Select(mp => new CreateMealPlan
                    {
                        PlanId = newMealPlan.PlanId,
                        CreateMeals = mp.Meals.Select(m => new CreateRecipeMeal
                        {
                            MealId = m.MealId,
                            MealType = m.MealType,

                            recipeReponses = new recipeReponse
                            {
                                RecipeId = m.MealRecipes.RecipeId,
                                RecipeName = m.MealRecipes.RecipeName,
                                Servings = m.MealRecipes.Servings,
                                CookTime = m.MealRecipes.CookTime,
                                PrepTime = m.MealRecipes.PrepTime,
                                Description = m.MealRecipes.Description,
                                ImageId = m.MealRecipes.ImageId,
                                MenuId = m.MealRecipes.MenuId,
                                userPreferences = m.MealRecipes.UserPreferences
                                    .Select(up => new UserPreferencesDto
                                    {
                                        UserPreferenceId = up.UserPreferenceId,
                                        UserId = up.UserId,
                                        DietId = up.DietId,
                                        FavoriteRecipesId = up.FavoriteRecipesId
                                    }).Where(up => up.DietId != request.DietId)
                                    .ToList(),
                                step = m.MealRecipes.Steps.Select(s => new StepDto
                                {
                                    StepId = s.StepId,
                                    RecipeId = s.RecipeId,
                                    StepNumber = s.StepNumber,
                                    Description = s.Description,
                                    ImageId = s.ImageId
                                }).ToList(),
                                recipeIngredients = m.MealRecipes.RecipeIngredients
                                    .Select(ri => new recipeIngredientsDto
                                    {
                                        RecipeIngredientId = ri.RecipeIngredientId,
                                        RecipeId = ri.RecipeId,
                                        IngredientId = ri.IngredientId,
                                        ServingSizeId = ri.ServingSizeId
                                    }).ToList(),
                                RecipeAllergies = m.MealRecipes.RecipeAllergies
                                    .Select(ra => new RecipeAllergyDto
                                    {
                                        RecipeAllergyId = ra.RecipeAllergyId,
                                        RecipeId = ra.RecipeId,
                                        AllergyId = ra.AllergyId
                                    }).Where(p => p.RecipeAllergyId == request.Allergy)
                                    .ToList()
                            }
                        }).Take(3).ToList()
                    }).Take(1).ToList();

                    int mealTypeIndex = 0;

                    foreach (var createMealPlan in createMealPlans)
                    {
                        if (createMealPlan.CreateMeals.Count > 0)
                        {

                            for (int i = 0; i < createMealPlan.CreateMeals.Count; i++)
                            {
                                var createRecipeMeal = createMealPlan.CreateMeals[i];
                                string mealType = GetMealType(mealTypeIndex);

                                var meal = new Meal
                                {
                                    PlanId = newMealPlan.PlanId,
                                    MealType = mealType,
                                    MealDate = DateTime.Now,
                                    MealRecipesId = createRecipeMeal.recipeReponses.RecipeId
                                };

                                _context.Meals.Add(meal);

                                mealTypeIndex++; 
                            }

                            _context.SaveChanges();
                        }
                    }
                }

                return createMealPlans;


            }


        }
        public string GetMealType(int index)
        {
      
            switch (index % 3)
            {
                case 0:
                    return "Sáng"; 
                case 1:
                    return "Trưa"; 
                case 2:
                    return "Tối";  
                default:
                    throw new Exception("Unexpected index.");
            }
        }
    }
 }

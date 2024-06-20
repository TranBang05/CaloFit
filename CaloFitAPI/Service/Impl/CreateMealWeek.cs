//using CaloFitAPI.Dto.Request;
//using CaloFitAPI.Dto.Response;
//using CaloFitAPI.Models;
//using Microsoft.EntityFrameworkCore;

//namespace CaloFitAPI.Service.Impl
//{
//    public class CreateMealWeek : ICreateMealWeek
//    {
//        public readonly CalofitDBContext _context;
//        public CreateMealWeek(CalofitDBContext context)
//        {
//            _context = context;
//        }


//        public List<CreateMealPlan> getMealWeek(CreateRecipesRequest request)
//        {
//            var mealPlans = _context.MealPlans
//                .Include(mp => mp.Meals)
//                    .ThenInclude(m => m.MealRecipes)
//                        .ThenInclude(mr => mr.RecipeIngredients)
//                            .ThenInclude(ri => ri.ServingSize)
//                                .ThenInclude(ss => ss.Ingredient)
//                                    .ThenInclude(i => i.Nutrition)
//                .Include(mp => mp.Meals)
//                    .ThenInclude(m => m.MealRecipes)
//                        .ThenInclude(mr => mr.Steps)
//                .Include(mp => mp.Meals)
//                    .ThenInclude(m => m.MealRecipes)
//                        .ThenInclude(mr => mr.UserPreferences)
//                            .ThenInclude(up => up.Diet)
//                .Include(mp => mp.Meals)
//                    .ThenInclude(m => m.MealRecipes)
//                        .ThenInclude(mr => mr.RecipeAllergies)
//                            .ThenInclude(ra => ra.Allergy)
//                .ToList();

//            var createMealPlans = mealPlans.Where(pis => pis.PlanType == request.dailyorweek)


//                .Select(mealPlan => new CreateMealPlan
//                {
//                    PlanId = mealPlan.PlanId,
//                    CreateMeals = mealPlan.Meals.Select(m => new CreateRecipeMeal
//                    {
//                        MealId = m.MealId,
//                        recipeReponses = new recipeReponse
//                        {

<<<<<<< HEAD
                            RecipeId = m.MealRecipes.RecipeId,
                            RecipeName = m.MealRecipes.RecipeName,
                            Servings = m.MealRecipes.Servings,
                            CookTime = m.MealRecipes.CookTime,
                            PrepTime = m.MealRecipes.PrepTime,
                            Description = m.MealRecipes.Description,

                            MenuId = m.MealRecipes.MenuId,
                            userPreferences = m.MealRecipes.UserPreferences
                    .Select(up => new UserPreferencesDto
                    {
                        UserPreferenceId = up.UserPreferenceId,
                        UserId = up.UserId,
                        DietId = up.DietId,
                        FavoriteRecipesId = up.FavoriteRecipesId
                    }).Where(up => up.DietId == request.DietId).
                    ToList(),
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
=======
//                            RecipeId = m.MealRecipes.RecipeId,
//                            RecipeName = m.MealRecipes.RecipeName,
//                            Servings = m.MealRecipes.Servings,
//                            CookTime = m.MealRecipes.CookTime,
//                            PrepTime = m.MealRecipes.PrepTime,
//                            Description = m.MealRecipes.Description,
//                            ImageId = m.MealRecipes.ImageId,
//                            MenuId = m.MealRecipes.MenuId,
//                            userPreferences = m.MealRecipes.UserPreferences
//                    .Select(up => new UserPreferencesDto
//                    {
//                        UserPreferenceId = up.UserPreferenceId,
//                        UserId = up.UserId,
//                        DietId = up.DietId,
//                        FavoriteRecipesId = up.FavoriteRecipesId
//                    }).Where(up => up.DietId == request.DietId).
//                    ToList(),
//                            step = m.MealRecipes.Steps.Select(s => new StepDto
//                            {
//                                StepId = s.StepId,
//                                RecipeId = s.RecipeId,
//                                StepNumber = s.StepNumber,
//                                Description = s.Description,
//                                ImageId = s.ImageId
//                            }).ToList(),
//                            recipeIngredients = m.MealRecipes.RecipeIngredients
//                    .Select(ri => new recipeIngredientsDto
//                    {
//                        RecipeIngredientId = ri.RecipeIngredientId,
//                        RecipeId = ri.RecipeId,
//                        IngredientId = ri.IngredientId,
//                        ServingSizeId = ri.ServingSizeId
//                    }).ToList(),
>>>>>>> master




//                            RecipeAllergies = m.MealRecipes.RecipeAllergies
//                                .Select(ra => new RecipeAllergyDto
//                                {
//                                    RecipeAllergyId = ra.RecipeAllergyId,
//                                    RecipeId = ra.RecipeId,
//                                    AllergyId = ra.AllergyId
//                                }).Where(p => p.RecipeAllergyId == request.Allergy)
//                                .ToList()

//                        }
//                    }).Take(21).ToList()
//                }).ToList();

//            return createMealPlans;
//        }


//    }
//}

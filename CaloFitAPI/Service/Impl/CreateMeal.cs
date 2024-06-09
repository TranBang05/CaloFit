using CaloFitAPI.Dto.Request;
using CaloFitAPI.Dto.Response;
using CaloFitAPI.Models;
using Microsoft.EntityFrameworkCore;


namespace CaloFitAPI.Service.Impl
{
    public class CreateMeal : ICreateMeal
    {

        public readonly CalofitDBContext _context;
        public CreateMeal(CalofitDBContext context)
        {
            _context = context;
        }

        //public List<CreateMealPlan> getMealDay(CreateRecipesRequest request)
        //{

        //    var mealPlans = _context.MealPlans
        //.Include(mp => mp.Meals)
        //    .ThenInclude(m => m.MealRecipes)
        //        .ThenInclude(mr => mr.RecipeIngredients)
        //            .ThenInclude(ri => ri.ServingSize)
        //                .ThenInclude(ss => ss.Ingredient)
        //                    .ThenInclude(i => i.Nutrition)
        //.Include(mp => mp.Meals)
        //    .ThenInclude(m => m.MealRecipes)
        //        .ThenInclude(mr => mr.Steps)
        //.Include(mp => mp.Meals)
        //    .ThenInclude(m => m.MealRecipes)
        //        .ThenInclude(u => u.UserPreferences)
        //                    .ThenInclude(d => d.Diet)
        //.Include(mp => mp.Meals)
        //    .ThenInclude(m => m.MealRecipes)
        //                .ThenInclude(ar => ar.RecipeAllergies)
        //                            .ThenInclude(a => a.Allergy);


        //    var createMealPlans = mealPlans.Select(mealPlan => new CreateMealPlan
        //    {
        //        PlanId = mealPlan.PlanId,
        //        CreateMeals = mealPlan.Meals.Select(m => new CreateRecipeMeal
        //        {
        //            MealId = m.MealId,
        //            recipeReponses = m.MealRecipes.Select(mr => new recipeReponse
        //            {
        //                RecipeId = mr.Recipe.RecipeId,
        //                RecipeName = mr.Recipe.RecipeName,
        //                Servings = mr.Recipe.Servings,
        //                CookTime = mr.Recipe.CookTime,
        //                PrepTime = mr.Recipe.PrepTime,
        //                Description = mr.Recipe.Description,
        //                ImageId = mr.Recipe.ImageId,
        //                MenuId = mr.Recipe.MenuId,
        //                userPreferences = mr.Recipe.UserPreferences.ToList(),
        //                step = mr.Steps.ToList(),
        //                recipeIngredients = mr.RecipeIngredients.ToList()
        //            }).ToList()
        //        }).ToList()
        //    }).ToList();

        //    return createMealPlans;

        public List<CreateMealPlan> getMealDay(CreateRecipesRequest request)
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
                .ToList();

            var createMealPlans = mealPlans.Where(pis => pis.PlanId == request.daily)


                .Select(mealPlan => new CreateMealPlan
                {
                    PlanId = mealPlan.PlanId,
                    CreateMeals = mealPlan.Meals.Select(m => new CreateRecipeMeal
                    {
                        MealId = m.MealId,
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
                    }).Where(up => up.DietId == request.DietId || up.UserPreferenceId == request.favor).
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
                }).ToList();

            return createMealPlans;
        }





        public List<CreateMealPlan> getWeekDay(CreateRecipesRequest request)
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
                .ToList();

            var createMealPlans = mealPlans.Where(pis => pis.PlanId == request.daily)


                .Select(mealPlan => new CreateMealPlan
                {
                    PlanId = mealPlan.PlanId,
                    CreateMeals = mealPlan.Meals.Select(m => new CreateRecipeMeal
                    {
                        MealId = m.MealId,
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
                    }).Where(up => up.DietId == request.DietId || up.UserPreferenceId == request.favor).
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
                }).ToList();

            return createMealPlans;
        }

    }
    }

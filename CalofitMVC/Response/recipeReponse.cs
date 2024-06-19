

namespace CalofitMVC.Response
{
    public class recipeReponse
    {

        public int RecipeId { get; set; }
        public string RecipeName { get; set; } = null!;
        public int Servings { get; set; }
        public int CookTime { get; set; }
        public int PrepTime { get; set; }
        public string? Description { get; set; }
        public string? ImageName { get; set; }
        public int MenuId { get; set; }
        public List<UserPreferencesDto>? userPreferences { get; set; }
        public List<StepDto>? step { get; set; }
        public List<recipeIngredientsDto>? recipeIngredients { get; set; }
        public List<RecipeAllergyDto>? RecipeAllergies { get; set; }




    }
}

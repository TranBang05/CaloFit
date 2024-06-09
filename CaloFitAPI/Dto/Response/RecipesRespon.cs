using CaloFitAPI.Models;

namespace CaloFitAPI.Dto.Response
{
    public class RecipesRespon
    {

        public int RecipeId { get; set; }
        public string RecipeName { get; set; } = null!;
        public int Servings { get; set; }
        public int CookTime { get; set; }
        public int PrepTime { get; set; }
        public string? Description { get; set; }
     
        public  Nutrition ?nutrition { get; set; }
        public  Image? image { get; set; }
        public Ingredient? ingredient { get; set;}
        

    }
}

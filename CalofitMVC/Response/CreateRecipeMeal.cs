namespace CalofitMVC.Response
{
    public class CreateRecipeMeal
    {
        public int MealId { get; set; }
        public string MealType { get; set; } = null!;
        public  recipeReponse? recipeReponses { get; set; }
    }
}

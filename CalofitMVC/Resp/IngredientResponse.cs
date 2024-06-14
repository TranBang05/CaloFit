

namespace CalofitMVC.Resp
{
    public class IngredientResponse
    {
        public string? Name { get; set; }
        //public IngredientServingSizeResponse? IngredientServingSizes { get; set; }
        //public IngredientServingSizeResponse? IngredientServingSizes { get; set; }
        public virtual ICollection<IngredientServingSizeResponse>? ServingSizes { get; set; }
        public NutritionReponse? Nutrition { get; set; }
    }
}

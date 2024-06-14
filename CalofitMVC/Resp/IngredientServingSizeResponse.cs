namespace CalofitMVC.Resp
{
    public class IngredientServingSizeResponse
    {
        public double Qty { get; set; }
        public double Scale { get; set; }
        public string Units { get; set; } = null!;
        public double Grams { get; set; }
        public string? Description { get; set; }
    }
}

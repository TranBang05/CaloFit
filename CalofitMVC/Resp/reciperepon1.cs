namespace CalofitMVC.Resp
{
    public class reciperepon1
    {
        public string RecipeName { get; set; } = null!;
        public int Servings { get; set; }
        public int CookTime { get; set; }
        public int PrepTime { get; set; }
        public string? ImageName { get; set; }
        public string? Description { get; set; }
        public List<StepResponse>? Steps { get; set; }
        public virtual ICollection<RecipeIngredientResponse>? RecipeIngredients { get; set; }
    }
}

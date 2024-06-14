using CaloFitAPI.Models;

namespace CaloFitAPI.Dto.Response
{
    public class RecipeResponse
    {  public string RecipeName { get; set; } = null!;
    public int Servings { get; set; }
    public int CookTime { get; set; }
    public int PrepTime { get; set; }
    public int? ImageId { get; set; }
    public string? Description { get; set; }
    public List<StepResponse>? Steps { get; set; }
    public virtual ICollection<RecipeIngredientResponse>? RecipeIngredients { get; set; }
}
}

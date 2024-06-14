namespace CalofitMVC.Resp
{
	public class RecipeView
	{
		public string RecipeName { get; set; } = null!;
		public int Servings { get; set; }
		public int CookTime { get; set; }
		public int PrepTime { get; set; }
		public int? ImageId { get; set; }
		public string? Description { get; set; }
	}
}

namespace CalofitMVC.Resp
{

    public class StepDto
    {
        public int StepId { get; set; }
        public int RecipeId { get; set; }
        public int StepNumber { get; set; }
        public string Description { get; set; } = null!;
        public int? ImageId { get; set; }

    }
}

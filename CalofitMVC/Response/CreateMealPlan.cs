

namespace CalofitMVC.Response
{
    public class CreateMealPlan
    {
        public int PlanId { get; set; }
        public List<CreateRecipeMeal>? CreateMeals { get; set; }
    }
}

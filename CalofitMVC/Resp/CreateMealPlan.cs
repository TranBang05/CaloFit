

namespace CalofitMVC.Resp

{
    public class CreateMealPlan
    {
        public int PlanId { get; set; }
        public List<CreateRecipeMeal>? CreateMeals { get; set; }
    }
}

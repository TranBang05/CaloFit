using CaloFitAPI.Service.Impl;

namespace CaloFitAPI.Dto.Response
{
    public class CreateMealPlan
    {
        public int PlanId { get; set; }
        public List<CreateRecipeMeal>? CreateMeals { get; set; }
    }
}

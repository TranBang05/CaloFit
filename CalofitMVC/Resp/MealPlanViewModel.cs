using CalofitMVC.Models;

namespace CalofitMVC.Resp
{
    public class MealPlanViewModel
    {
        public List<Allergy> Allergies { get; set; }
        public List<Diet> Diets { get; set; }
    }
}

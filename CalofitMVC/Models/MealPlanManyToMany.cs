using System;
using System.Collections.Generic;

namespace CalofitMVC.Models
{
    public partial class MealPlanManyToMany
    {
        public int PlanId { get; set; }
        public int MealId { get; set; }
        public DateTime? Day { get; set; }
        public int Id { get; set; }

        public virtual Meal Meal { get; set; } = null!;
        public virtual MealPlan Plan { get; set; } = null!;
    }
}

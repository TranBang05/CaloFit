using System;
using System.Collections.Generic;

namespace CaloFitAPI.Models
{
    public partial class MealPlan
    {
        public MealPlan()
        {
            MealPlanManyToManies = new HashSet<MealPlanManyToMany>();
        }

        public int PlanId { get; set; }
        public int UserId { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public string PlanType { get; set; } = null!;

        public virtual User User { get; set; } = null!;
        public virtual ICollection<MealPlanManyToMany> MealPlanManyToManies { get; set; }
    }
}

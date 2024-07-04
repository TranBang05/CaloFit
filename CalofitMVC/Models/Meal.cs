using System;
using System.Collections.Generic;

namespace CalofitMVC.Models
{
    public partial class Meal
    {
        public Meal()
        {
            MealPlanManyToManies = new HashSet<MealPlanManyToMany>();
        }

        public int MealId { get; set; }
        public string? MealType { get; set; }
        public DateOnly? MealDate { get; set; }
        public int MealRecipesId { get; set; }

        public virtual Recipe MealRecipes { get; set; } = null!;
        public virtual ICollection<MealPlanManyToMany> MealPlanManyToManies { get; set; }
    }
}

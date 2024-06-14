using System;
using System.Collections.Generic;

namespace CalofitMVC.Models
{
    public partial class User
    {
        public User()
        {
            Allergies = new HashSet<Allergy>();
            Comments = new HashSet<Comment>();
            MealPlans = new HashSet<MealPlan>();
            Orders = new HashSet<Order>();
            RecipeRatings = new HashSet<RecipeRating>();
            UserGoals = new HashSet<UserGoal>();
            UserPreferences = new HashSet<UserPreference>();
            Products = new HashSet<Ingredient>();
        }

        public int UserId { get; set; }
        public string Username { get; set; } = null!;
        public string Password { get; set; } = null!;
        public string Email { get; set; } = null!;
        public string Role { get; set; } = null!;
        public DateTime RegistrationDate { get; set; }

        public virtual ICollection<Allergy> Allergies { get; set; }
        public virtual ICollection<Comment> Comments { get; set; }
        public virtual ICollection<MealPlan> MealPlans { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
        public virtual ICollection<RecipeRating> RecipeRatings { get; set; }
        public virtual ICollection<UserGoal> UserGoals { get; set; }
        public virtual ICollection<UserPreference> UserPreferences { get; set; }

        public virtual ICollection<Ingredient> Products { get; set; }
    }
}

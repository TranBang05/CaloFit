using System;
using System.Collections.Generic;

namespace CalofitMVC.Models
{
    public partial class Ingredient
    {
        public Ingredient()
        {
            IngredientServingSizes = new HashSet<IngredientServingSize>();
            OrderDetails = new HashSet<OrderDetail>();
            RecipeIngredients = new HashSet<RecipeIngredient>();
            Users = new HashSet<User>();
        }

        public int IngredientId { get; set; }
        public string Name { get; set; } = null!;
        public int ImageId { get; set; }

        public virtual Image Image { get; set; } = null!;
        public virtual Nutrition? Nutrition { get; set; }
        public virtual ICollection<IngredientServingSize> IngredientServingSizes { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
        public virtual ICollection<RecipeIngredient> RecipeIngredients { get; set; }

        public virtual ICollection<User> Users { get; set; }
    }
}

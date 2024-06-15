using System;
using System.Collections.Generic;

namespace CalofitMVC.Models
{
    public partial class Product
    {
        public Product()
        {
            Carts = new HashSet<Cart>();
            OrderDetails = new HashSet<OrderDetail>();
        }

        public int IngredientId { get; set; }
        public double? Price { get; set; }

        public virtual Ingredient Ingredient { get; set; } = null!;
        public virtual ICollection<Cart> Carts { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}

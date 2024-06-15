using System;
using System.Collections.Generic;

namespace CalofitMVC.Models
{
    public partial class Cart
    {
        public int Userid { get; set; }
        public int Productid { get; set; }
        public double? Quantity { get; set; }

        public virtual Product Product { get; set; } = null!;
        public virtual User User { get; set; } = null!;
    }
}

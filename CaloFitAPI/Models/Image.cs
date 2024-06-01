using System;
using System.Collections.Generic;

namespace CaloFitAPI.Models
{
    public partial class Image
    {
        public Image()
        {
            Recipes = new HashSet<Recipe>();
            Steps = new HashSet<Step>();
        }

        public int ImageId { get; set; }
        public string? ImageFilename { get; set; }

        public virtual Ingredient? Ingredient { get; set; }
        public virtual ICollection<Recipe> Recipes { get; set; }
        public virtual ICollection<Step> Steps { get; set; }
    }
}

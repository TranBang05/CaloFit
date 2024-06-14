using CaloFitAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace CaloFitAPI.Repository.Impl
{
    public class DietRepository : IDietRepository
    {
        private CalofitDBContext _dbContext;

        public DietRepository(CalofitDBContext dbContext)
        {
            _dbContext = dbContext;
        }


        
        public List<Diet> getDietById(int dietId)
        {
            return _dbContext.Diets
                .Include(d => d.Menus)
                    .ThenInclude(m => m.Recipes)
                        .ThenInclude(r => r.Steps)
                .Include(d => d.Menus)
                    .ThenInclude(m => m.Recipes)
                        .ThenInclude(r => r.RecipeIngredients)
                            .ThenInclude(ri => ri.Ingredient) 
                                .ThenInclude(i => i.Nutrition)
                .Include(d => d.Menus)
                    .ThenInclude(m => m.Recipes)
                        .ThenInclude(r => r.RecipeIngredients)
                            .ThenInclude(ri => ri.Ingredient) 
                                .ThenInclude(i => i.IngredientServingSizes)
                .ToList();

        }

     
        public List<Recipe> getRecipe()
        {
            return _dbContext.Recipes
                            .Include(r => r.Steps)
                            .Include(r => r.RecipeIngredients)
                                .ThenInclude(ri => ri.Ingredient)
                                    .ThenInclude(i => i.Nutrition)
                            .Include(r => r.RecipeIngredients)
                                .ThenInclude(ri => ri.Ingredient)
                                    .ThenInclude(i => i.IngredientServingSizes)
                            .ToList();
        }
    }
}

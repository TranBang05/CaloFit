using CaloFitAPI.Dto.Response;
using CaloFitAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace CaloFitAPI.Service.Impl
{
    public class NutritionalAnalysis : INutritionalAnalysis
    {

        public readonly CalofitDBContext _context;

        public NutritionalAnalysis(CalofitDBContext context)
        {
            _context = context;
        }

        NutritionDto INutritionalAnalysis.NutritionalAnalysis(int idIntergration)
        {
            var nutritionDto = _context.Ingredients
                                         .Where(i => i.IngredientId == idIntergration)
                                         .Include(i => i.Nutrition)
                                         .Select(i => new NutritionDto
                                         {
                                             Calories = i.Nutrition.Calories,
                                             Fat = i.Nutrition.Fat,
                                             Protein = i.Nutrition.Protein,
                                             Carbohydrates = i.Nutrition.Carbohydrates,
                                             Sugar = i.Nutrition.Sugar
                                         })
                                         .FirstOrDefault();

            return nutritionDto;



        }
    }
}

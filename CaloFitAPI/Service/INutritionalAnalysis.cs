using CaloFitAPI.Dto.Request;
using CaloFitAPI.Dto.Response;
using CaloFitAPI.Models;

namespace CaloFitAPI.Service
{
    public interface INutritionalAnalysis
    {
        public NutritionDto NutritionalAnalysis(int idIntergration);
    }
}

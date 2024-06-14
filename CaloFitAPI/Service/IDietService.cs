using CaloFitAPI.Dto.Response;

namespace CaloFitAPI.Service
{
    public interface IDietService
    {
       List<RecipeResponse> GetRecipe();
    }
}

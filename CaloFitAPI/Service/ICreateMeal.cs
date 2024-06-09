using CaloFitAPI.Dto.Request;
using CaloFitAPI.Dto.Response;

namespace CaloFitAPI.Service
{
    public interface ICreateMeal
    {

        public List<CreateMealPlan> getMealDay(CreateRecipesRequest request);
    }
}

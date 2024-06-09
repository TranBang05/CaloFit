using CaloFitAPI.Dto.Request;
using CaloFitAPI.Dto.Response;

namespace CaloFitAPI.Service
{
    public interface ICreateMealWeek
    {
        public List<CreateMealPlan> getMealWeek(CreateRecipesRequest request);
    }
}

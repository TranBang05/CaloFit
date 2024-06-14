using CaloFitAPI.Dto.Response;

namespace CaloFitAPI.Service
{
    public interface IDietService
    {
        DietResponse GetDietWithMenus(int dietId);

    }
}

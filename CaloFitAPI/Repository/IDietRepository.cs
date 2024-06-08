using CaloFitAPI.Models;

namespace CaloFitAPI.Repository
{
    public interface IDietRepository
    {
        Diet getDietById(int dietId);
    }
}

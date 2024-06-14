using CaloFitAPI.Dto.Response;
using CaloFitAPI.Models;

namespace CaloFitAPI.Service.Impl
{
    public class AllegicSevices : IAllegic
    {

        public readonly CalofitDBContext _context;
        public AllegicSevices(CalofitDBContext context)
        {
            _context = context;
        }
        public List<Allergy> GetAllergies()
        {
            var nutritionDto = _context.Allergies.ToList();

            return nutritionDto;

        }
    }
}

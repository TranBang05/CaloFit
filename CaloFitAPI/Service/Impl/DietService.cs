using AutoMapper;
using CaloFitAPI.Dto.Response;
using CaloFitAPI.Repository;

namespace CaloFitAPI.Service.Impl
{
    public class DietService : IDietService
    {
        private readonly IDietRepository _repository;
        private readonly IMapper _mapper;

        public DietService(IDietRepository repository, IMapper mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }

        public DietResponse GetDietWithMenus(int dietId)
        {
            var dietEntity = _repository.getDietById(dietId);
            if (dietEntity == null)
            {
                return null;
            }

            var dietDTO = _mapper.Map<DietResponse>(dietEntity);

            return dietDTO;
        }
    }
}

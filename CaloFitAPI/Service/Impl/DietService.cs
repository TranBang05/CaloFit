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

    

        public List<RecipeResponse> GetRecipe()
        {
            var dietEntity = _repository.getRecipe();
            if (dietEntity == null)
            {
                return null;
            }

            var recipeDTOs = _mapper.Map<List<RecipeResponse>>(dietEntity);
            return recipeDTOs;
        }
    }
}

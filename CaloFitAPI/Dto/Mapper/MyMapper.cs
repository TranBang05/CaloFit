using AutoMapper;
using CaloFitAPI.Dto.Response;
using CaloFitAPI.Models;

namespace CaloFitAPI.Dto.Mapper
{
    public class MyMapper:Profile
    {
        public MyMapper()
        {
            CreateMap<Diet, DietResponse>();
            CreateMap<Menu, MenuResponse>();
            CreateMap<Recipe, RecipeResponse>();
            CreateMap<Step, StepResponse>();
            CreateMap<RecipeIngredient, RecipeIngredientResponse>();


            CreateMap<IngredientServingSize, IngredientServingSizeResponse>();


            CreateMap<Ingredient, IngredientResponse>()
                 .ForMember(dest => dest.ServingSizes, opt => opt.MapFrom(src => src.IngredientServingSizes));



            CreateMap<Nutrition, NutritionReponse>();
        }
    }
}

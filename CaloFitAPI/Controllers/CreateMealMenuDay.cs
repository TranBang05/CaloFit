using CaloFitAPI.Dto.Request;
using CaloFitAPI.Models;
using CaloFitAPI.Service;
using CaloFitAPI.Service.Impl;
using Microsoft.AspNetCore.Mvc;

namespace CaloFitAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class CreateMealMenuDay : Controller
    {

        public readonly CalofitDBContext _context;

        public readonly ICreateMeal _createMeal;
        public CreateMealMenuDay(CalofitDBContext context, ICreateMeal createMeal) { 
        
        _context = context;
        _createMeal = createMeal;
             
        }
        [HttpPost]
        public IActionResult CreateMeal(CreateRecipesRequest request, [FromServices] IHttpContextAccessor httpContextAccessor)
        {
            try
            {
                var session = httpContextAccessor.HttpContext.Session;
                var result = _createMeal.getMealDay(request);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }
    }
}

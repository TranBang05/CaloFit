using CaloFitAPI.Service;
using Microsoft.AspNetCore.Mvc;

namespace CaloFitAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DietController : Controller
    {
        private readonly IDietService _dietService;

        public DietController(IDietService dietService)
        {
            _dietService = dietService;
        }

        [HttpGet("{dietId}")]
        public IActionResult GetDiet(int dietId)
        {
            var diet = _dietService.GetDietWithMenus(dietId);
            if (diet == null)
            {
                return NotFound();
            }
            return Ok(diet);
        }
    }
}

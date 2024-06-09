using CaloFitAPI.Models;
using CaloFitAPI.Service;
using Microsoft.AspNetCore.Mvc;

namespace CaloFitAPI.Controllers
{

    [ApiController]
    [Route("api/[controller]")]
    public class NutritionalAnalysisController : Controller
    {


        public readonly CalofitDBContext _context;

        public readonly INutritionalAnalysis _nutritional;
        public NutritionalAnalysisController(CalofitDBContext context, INutritionalAnalysis nutritional)
        {

            _context = context;
            _nutritional = nutritional;

        }
        [HttpGet]
        public IActionResult NutritionalAnaly(int id)
        {
            try
            {
                var result = _nutritional.NutritionalAnalysis(id);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}

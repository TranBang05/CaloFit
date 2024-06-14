using CaloFitAPI.Models;
using CaloFitAPI.Service;
using Microsoft.AspNetCore.Mvc;

namespace CaloFitAPI.Controllers
{


    [ApiController]
    [Route("api/[controller]")]
    public class AlllergicController : Controller
    {

        public readonly CalofitDBContext _context;

        public readonly IAllegic _allegic;

        public AlllergicController(CalofitDBContext context, IAllegic allegic)
        {
            _allegic = allegic;
            _context = context;

        }
        [HttpGet]
        public IActionResult Index()
        {

            var allegic = _allegic.GetAllergies();
            return Ok(allegic);
        }
    }
}

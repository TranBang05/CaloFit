using CaloFitAPI.Dto.Response;
using CaloFitAPI.Models;
using CaloFitAPI.Service;
using Microsoft.AspNetCore.Mvc;

namespace CaloFitAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UserManagementController : Controller
    {
        private readonly CalofitDBContext _context;

        private readonly Iusermanagement _iusermanagement;
        public UserManagementController(CalofitDBContext context, Iusermanagement iusermanagement)
        {
            _context = context;
            _iusermanagement = iusermanagement;

        }
        [HttpPost]
        public IActionResult Index( UserMangement request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            try
            {
                _iusermanagement.AddUserWithPreferencesAndAllergies(request);
                _context.SaveChanges();
                return Ok("User preferences and allergies updated successfully.");

            }
            catch (Exception ex)
            {
                return BadRequest(ex.InnerException != null ? ex.InnerException.Message : ex.Message);
            }
        }
    }
}

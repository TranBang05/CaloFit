using CaloFitAPI.Models;
using CaloFitAPI.Service;
using Microsoft.AspNetCore.Mvc;

namespace CaloFitAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ForgotPassController : Controller
    {

        public readonly CalofitDBContext _context;

        public readonly Iforgotpass _forgot;
        public ForgotPassController(CalofitDBContext context, Iforgotpass forgot)
        {

            _context = context;
            _forgot = forgot;

        }



        [HttpPost]
        public IActionResult ForgotPassword(string email, string password, string repass)
        {
            var result = _forgot.Forgot(email, password, repass);

            if (result)
            {
                return Ok("Password updated successfully");
            }
            else
            {
                return BadRequest("Username or password is incorrect");
            }
        }
    }
}

using CaloFitAPI.Dto.Request;
using CaloFitAPI.Models;
using CaloFitAPI.Service;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System;

namespace CaloFitAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RegisterController : ControllerBase
    {
        private readonly CalofitDBContext _context;

        private readonly ISignup _signup;
        public RegisterController(CalofitDBContext context, ISignup signup)
        {
            _context = context;
            _signup = signup;
        }

        [HttpPost]
        public IActionResult Register(string email, string password, string repass)
        {
            bool registrationSuccess = _signup.RegisterUser(email, password, repass);

            if (!registrationSuccess)
            {
                // Nếu đăng ký không thành công, trả về BadRequest hoặc StatusCode(400)
                return BadRequest("Registration failed. Please check your input.");
            }

            return Ok();
        }

    }

}

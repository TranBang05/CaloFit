using CaloFitAPI.Dto.Request;
using CaloFitAPI.Models;
using CaloFitAPI.Service;
using Microsoft.AspNetCore.Mvc;
using System;

namespace CaloFitAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RegisterController : ControllerBase
    {
        private readonly CalofitDBContext _context;

        private readonly ISignup _signup;
        public RegisterController(CalofitDBContext context,ISignup signup)
        {
            _context = context;
            _signup = signup;
        }

        [HttpPost]
        public IActionResult Register(RegisterRequest request)
        {

            bool login = _signup.RegisterUser(request);


            if (login == false)
            {
                return Unauthorized();
            }

            return Ok("sucess");
        }
    }

}

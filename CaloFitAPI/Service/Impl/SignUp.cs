using CaloFitAPI.Dto.Request;
using CaloFitAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace CaloFitAPI.Service.Impl
{
    public class SignUp : ISignup
    {

        private readonly CalofitDBContext _context;

        public SignUp(CalofitDBContext context)
        {
            _context = context;
        }
        public bool RegisterUser(RegisterRequest request)
        {

            if (_context.Users.Any(u => u.Username == request.Username || u.Email == request.RePassword))
            {
                return false; 
            }


            var newUser = new User
            {
                Username = request.Username,
                Password = request.Password,
                Email = request.RePassword,
                Role = "user", 
                RegistrationDate = DateTime.UtcNow 
            };

   
            _context.Users.Add(newUser);
            _context.SaveChanges();

            return true; 
        }
    }
}

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
        public bool RegisterUser(string email, string password, string repass)
        {
            string randomUsername;
            randomUsername = "user1" + Guid.NewGuid().ToString("N");
            if (_context.Users.Any(u => u.Username == email || u.Email == repass))
            {
                return false;
            }


            var newUser = new User
            {
                Username = randomUsername,
                Password = password,
                Email = email,
                Role = "user",
                RegistrationDate = DateTime.UtcNow
            };


            _context.Users.Add(newUser);
            _context.SaveChanges();

            return true;
        }
    }
}

using CaloFitAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace CaloFitAPI.Service.Impl
{
    public class ForgotPass : Iforgotpass
    {
        public readonly CalofitDBContext _context;
        public ForgotPass(CalofitDBContext context)
        {
            _context = context;
        }

        public bool Forgot(string username, string password,string repass)
        {
            // Check if a user with the provided username exists in the database
            var user = _context.Users.FirstOrDefault(u => u.Username == username);

            if (user == null)
            {
                // Username not found
                return false;
            }

            // Check if the provided password matches the user's password
            if (user.Password == password)
            {
                user.Password = repass;
                // Passwords match, login successful
                _context.Users.Update(user);
                 _context.SaveChangesAsync();
                return true;
            }
            else
            {
                // Passwords do not match
                return false;
            }
        }
    }
}

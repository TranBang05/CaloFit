using CaloFitAPI.Models;

namespace CaloFitAPI.Service.Impl
{
    public class Login : ILogins
    {
        private readonly CalofitDBContext _context;

        public Login(CalofitDBContext context)
        {
            _context = context;
        }

        public int GetUserId(string username)
        {
            var user = _context.Users.FirstOrDefault(u => u.Email == username);
            if (user == null)
            {
                throw new Exception("User not found.");
            }
            return user.UserId;
        }

        bool ILogins.Login(string username, string password)
        {

                // Check if a user with the provided username exists in the database
                var user = _context.Users.FirstOrDefault(u => u.Email == username);

                if (user == null)
                {
                    // Username not found
                    return false;
                }

                // Check if the provided password matches the user's password
                if (user.Password == password)
                {
                    // Passwords match, login successful
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

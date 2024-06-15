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

  
                var user = _context.Users.FirstOrDefault(u => u.Email == username);

                if (user == null)
                {
                    return false;
                }


                if (user.Password == password)
                {

                    return true;
                }
                else
                {

                    return false;
                }
            }
    
    }
}

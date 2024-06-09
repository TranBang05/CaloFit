using CaloFitAPI.Dto.Response;
using CaloFitAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace CaloFitAPI.Service.Impl
{
    public class userManagement : Iusermanagement
    {


        public readonly CalofitDBContext _context;

        public userManagement(CalofitDBContext context)
        {
            _context = context;
        }
        public void AddUserWithPreferencesAndAllergies(UserMangement request)
        {
            // Check if the user exists in the database
            var existingUser = _context.Users
                .Include(u => u.UserPreferences)
                .Include(u => u.Allergies)
                .FirstOrDefault(u => u.UserId == request.id);

            if (existingUser != null)
            {
              
            
                existingUser.Allergies.Clear();


                foreach (var allergy in request.allergies)
                {
                    existingUser.Allergies.Add(new Allergy { UserId = existingUser.UserId, Allergen = allergy });
                }

                _context.SaveChanges();
            }

        }

    }

}

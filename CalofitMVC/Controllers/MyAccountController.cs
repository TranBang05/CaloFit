using CalofitMVC.Models;
using Flurl.Util;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CalofitMVC.Controllers
{
    public class MyAccountController : Controller
    {
        CalofitDBContext db = new CalofitDBContext();

        public async Task<IActionResult> MyAccount()
        {
            int userId = HttpContext.Session.GetInt32("user") ?? 1;

            var user = await GetUserByIdAsync(userId);

            if (user == null)
            {
                // Handle the case where the user is not found
                return NotFound();
            }

            return View(user);
        }

        private async Task<User> GetUserByIdAsync(int id)
        {
            return await db.Users.FindAsync(id);
        }
    }
}

using Flurl.Http;
using Flurl;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;
using CalofitMVC.Common;
using CalofitMVC.EnumMVC;
using CalofitMVC.Models;

namespace CalofitMVC.Controllers
{
    public class ResgisterController : Controller
    {
        private readonly CalofitDBContext context;
        public ResgisterController(CalofitDBContext context)
        {
            this.context = context;
        }
        public IActionResult Index()
        {
            ViewData["fuck"] = context.Allergies.ToList();
            return View();
        }
        private readonly string registerApiUrl = BaseURLEnum.BASE_URL.GetDescription() + "/api/Register";


        [HttpPost]
        public IActionResult Index(User user, string repass)
        {  // Check if passwords match

            if (user.Password != repass)
            {
                return Json(new { Message = "Passwords do not match" });
            }
            user.Role = "user";
            context.Users.Add(user);
            context.SaveChanges();
            HttpContext.Session.SetInt32("user", user.UserId);
            return RedirectToAction("Home", "Home");
        }
    }
}



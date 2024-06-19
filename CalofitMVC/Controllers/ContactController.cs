using Microsoft.AspNetCore.Mvc;

namespace CalofitMVC.Controllers
{
    public class ContactController : Controller
    {
        public IActionResult Contact()
        {
            return View();
        }
    }
}

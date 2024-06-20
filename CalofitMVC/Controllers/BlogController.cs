using Microsoft.AspNetCore.Mvc;

namespace CalofitMVC.Controllers
{
    public class BlogController : Controller
    {
        public IActionResult Blog()
        {
            return View();
        }
    }
}

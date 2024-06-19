using Microsoft.AspNetCore.Mvc;

namespace CalofitMVC.Controllers
{
    public class PriceController : Controller
    {
        public IActionResult Price()
        {
            return View();
        }
    }
}

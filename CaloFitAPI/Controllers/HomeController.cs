using Microsoft.AspNetCore.Mvc;

namespace CaloFitAPI.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}

using Microsoft.AspNetCore.Mvc;

namespace CaloFitAPI.Controllers
{
    public class FavorController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}

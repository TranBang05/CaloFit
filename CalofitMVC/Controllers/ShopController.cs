using CalofitMVC.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CalofitMVC.Controllers
{
    public class ShopController : Controller
    {
        // GET: ShopController
        public ActionResult Index()
        {
            CalofitDBContext db = new CalofitDBContext();
            ViewData["list"] = db.Products.Include(x => x.Ingredient).ToList();
            return View("shop");
        }

        // GET: ShopController/Details/5
        public ActionResult Details(int id)
        {
            return View("shop");
        }

        // GET: ShopController/Create
        public ActionResult Create()
        {

            return RedirectToAction("Create","Cart","");
        }
        public ActionResult Cart(int id)
        {
            CalofitDBContext db = new CalofitDBContext();
            Product p = db.Products.Include(x => x.Ingredient).FirstOrDefault(x => x.IngredientId == id);
            
            return RedirectToAction("Create", "Cart", new {id = id});
        }

        // POST: ShopController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: ShopController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: ShopController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: ShopController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: ShopController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}

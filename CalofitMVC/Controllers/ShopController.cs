using CalofitMVC.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CalofitMVC.Controllers
{
    public class ShopController : Controller
    {
        // GET: ShopController
        CalofitDBContext db = new CalofitDBContext();
        public ActionResult Index()
        {
            ViewData["list"] = db.Products.Include(x => x.Ingredient).ThenInclude(i => i.Image).ToList();
            return View("shop");
        }

        // GET: ShopController/Details/5
        public ActionResult Details(int id = 1)
        {
            Product p = db.Products.Include(x => x.Ingredient).ThenInclude(x => x.Nutrition)
                .Include(x => x.Ingredient).ThenInclude(x => x.Image)
                .FirstOrDefault(x => x.IngredientId ==  id);
            Recipe recipe = db.Recipes.FirstOrDefault(x => x.RecipeId == 1);
            @ViewData["des"] = "This is a dish";
            ViewData["comment"] = recipe.Comments.ToList();
            return View("details", p);
        }

        // GET: ShopController/Create
        public ActionResult Create()
        {

            return RedirectToAction("Create", "Cart", "");
        }
        public ActionResult Cart(int id)
        {
            CalofitDBContext db = new CalofitDBContext();
            int userId = HttpContext.Session.GetInt32("user") ?? 1;
            Cart p = db.Carts.FirstOrDefault(x => x.Productid == id && x.Userid == userId);
            if(p != null)
            {
                TempData["mess"] = "Đã có trong giỏ hàng";
            }

            return RedirectToAction("Create", "Cart", new { id = id });
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

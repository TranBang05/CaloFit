using CaloFitAPI.Dto.Request;
using CalofitMVC.Common;
using CalofitMVC.EnumMVC;
using CalofitMVC.Models;
using Flurl;
using Flurl.Http;
using Flurl.Http.Newtonsoft;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Rotativa;
using Rotativa.AspNetCore;
using Rotativa.AspNetCore.Options;
using static System.Net.WebRequestMethods;

namespace CalofitMVC.Controllers
{
    public class CartController : Controller
    {
        public string link = BaseURLEnum.BASE_URL.GetDescription() + "/api/Carts";
        private NewtonsoftJsonSerializer serializer;
        public CartController()
        {
            serializer = new Flurl.Http.Newtonsoft.NewtonsoftJsonSerializer();
        }
        // GET: CartController
        public ActionResult Index(int userid)
        {
            List<Cart> carts = getAll(userid);
            ViewData["list"] = carts;
            return View("Cart");
        }

        private List<Cart> getAll(int userid)
        {
            return link.AppendPathSegments("/User", userid)
               .WithSettings(s => s.JsonSerializer = serializer)
               .GetJsonAsync<List<Cart>>().Result;
        }

        // GET: CartController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: CartController/Create
        public ActionResult Create(int id)
        {
            CartRequest cart = new()
            {
                Productid = id,
                Userid = HttpContext.Session.GetInt32("user") ?? 1,
                Quantity = 1
            };
            ;
            return Create(cart);
        }
        // POST: CartController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(CartRequest cart)
        {
            try
            {
                List<Cart> carts = getAll(cart.Userid);
                if(carts.FirstOrDefault(x => x.Productid == cart.Productid) != null)
                {
                    return RedirectToAction("Index", new { userid = HttpContext.Session.GetInt32("user") });
                }
                var abc = link.WithSettings(s => s.JsonSerializer = serializer)
                    .PostJsonAsync(cart);

            }
            catch (FlurlHttpException ex)
            {
                var err = ex.GetResponseJsonAsync<Exception>(); // or GetResponseStringAsync(), etc.
                Console.WriteLine($"Error returned from {ex.Call.Request.Url}: {err.Result.Message}");
            }
            return RedirectToAction("Index", new { userid = HttpContext.Session.GetInt32("user")});
        }
        public ActionResult ShopList(int userId)
        {
            List<Cart> carts = getAll(userId);
            return new ViewAsPdf("shoplist", carts) {
                FileName = "ShoppingList.pdf",
                PageSize = Size.A4,
                PageOrientation = Orientation.Portrait,
                PageMargins = new Margins(0, 0, 0, 0),
                CustomSwitches = "--print-media-type"
            };
        }
        public IActionResult ShoppingList(int userId)
        {
            List<Cart> carts = getAll(userId);
            return View("shoplist", carts);
        }

        // GET: CartController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: CartController/Edit/5
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

        // GET: CartController/Delete/5
        public async Task<ActionResult> Delete(int productId)
        {
            int userid = HttpContext.Session.GetInt32("user") ?? 1;
            var abc = await link.AppendPathSegments(productId, userid).DeleteAsync();
            TempData["mess"] = "deleted item";
            return RedirectToAction("Index", new { userid = HttpContext.Session.GetInt32("user") });
        }

        // POST: CartController/Delete/5
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

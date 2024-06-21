using Flurl.Http.Newtonsoft;
using Flurl;
using Microsoft.AspNetCore.Mvc;
using CalofitMVC.Resp;
using System.Collections.Generic;
using Flurl.Http;
using CalofitMVC.Models;
using Microsoft.EntityFrameworkCore;

namespace CalofitMVC.Controllers
{
    public class RecipeController : Controller
    {

        public string link = "https://calofitweb.azurewebsites.net/api/Diet/recipe";
        private NewtonsoftJsonSerializer serializer;
        private CalofitDBContext context;
        public RecipeController(CalofitDBContext context)
        {
            this.context = context;
            serializer = new Flurl.Http.Newtonsoft.NewtonsoftJsonSerializer();
        }
      
        public ActionResult Index()
        {
            List<recipeReponse> recipe = link.AppendPathSegment(null)
               .WithSettings(s => s.JsonSerializer = serializer)
               .GetJsonAsync<List<recipeReponse>>().Result;
            return View(recipe);
        }

        public ActionResult Details(int id = 1)
        {
            Recipe recipe = context.Recipes.Include(x => x.Image)
                .Include(x => x.RecipeIngredients).ThenInclude(x => x.Ingredient)
                .Include(x => x.Steps).ThenInclude(x => x.Image)
                .FirstOrDefault(x => x.RecipeId == id);
            return View("Details", recipe);
        }

    }
}

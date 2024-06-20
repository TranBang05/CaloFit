using Flurl.Http.Newtonsoft;
using Flurl;
using Microsoft.AspNetCore.Mvc;
using CalofitMVC.Resp;
using System.Collections.Generic;
using Flurl.Http;

namespace CalofitMVC.Controllers
{
    public class RecipeController : Controller
    {

        public string link = "https://calofitweb.azurewebsites.net/api/Diet/recipe";
        private NewtonsoftJsonSerializer serializer;
        public RecipeController()
        {
            serializer = new Flurl.Http.Newtonsoft.NewtonsoftJsonSerializer();
        }
      
        public ActionResult Index()
        {
            List<recipeReponse> recipe = link.AppendPathSegment(null)
               .WithSettings(s => s.JsonSerializer = serializer)
               .GetJsonAsync<List<recipeReponse>>().Result;
            return View(recipe);
        }

    }
}

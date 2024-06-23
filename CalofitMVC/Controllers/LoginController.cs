using Microsoft.AspNetCore.Mvc;
using Flurl.Http;
using System.Threading.Tasks;
using Flurl;
using Newtonsoft.Json.Linq;
using CalofitMVC.Common;
using CalofitMVC.EnumMVC;

namespace CalofitMVC.Controllers
{
	public class LoginController : Controller
	{
		private readonly string loginApiUrl = BaseURLEnum.BASE_URL.GetDescription() + "/api/Login";

		public IActionResult Index()
		{
			return View();
		}

		[HttpPost]
		public async Task<IActionResult> Index(string email, string password)
		{
			try
			{
				var response = await loginApiUrl
					.SetQueryParam("username", email)
					.SetQueryParam("password", password)
					.PostAsync();


				if (response.StatusCode==200)
				{
					var responseContent = await response.ResponseMessage.Content.ReadAsStringAsync();
					var jsonResponse = JObject.Parse(responseContent);
					int user = jsonResponse.Value<int>("userId");

			       	HttpContext.Session.SetInt32("user", user);


					if (HttpContext.Session.GetInt32("user") != null)
					{
				        return	RedirectToAction("Home", "Home");
					}
					else
					{
						return View();

					}
				}
				else
				{

					return View();
				}
			}
			catch (FlurlHttpException ex)
			{

				return View();
			}
			catch (Exception ex)
			{

				return View();
			}
		}
	}
}

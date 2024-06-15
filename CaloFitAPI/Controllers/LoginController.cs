using CaloFitAPI.Models;
using CaloFitAPI.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics.Eventing.Reader;
using System.Linq;

namespace CaloFitAPI.Controllers
{
	[ApiController]
	[Route("api/[controller]")]
	public class LoginController : ControllerBase
	{
		private readonly CalofitDBContext _context;

		private readonly ILogins _login;
		public LoginController(CalofitDBContext context, ILogins login)
		{

			_context = context;
			_login = login;
		}

		[HttpPost]
		public IActionResult Login(string username, string password)
		{

			bool login = _login.Login(username, password);
			if (login == false)
			{
				return Unauthorized();
			}
			int userId = _login.GetUserId(username);
			HttpContext.Session.SetInt32("user", userId);

			return Ok(new {userId});
		}
	}


}
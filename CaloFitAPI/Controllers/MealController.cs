using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using CaloFitAPI.Models;
using Microsoft.AspNetCore.OData.Query;

namespace CaloFitAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MealController : ControllerBase
    {
        private const int pagesize = 10;
        private readonly CalofitDBContext _context;

        public MealController(CalofitDBContext context)
        {
            _context = context;
        }

        // GET: api/Meal
        //https://www.odata.org/getting-started/basic-tutorial/ nested 
        //https://learn.microsoft.com/en-us/odata/webapi-8/fundamentals/server-driven-paging
        [HttpGet]
        [EnableQuery(PageSize = pagesize)]
        public ActionResult<List<Meal>> GetAllMeals()
        {
          if (_context.Meals == null)
          {
              return NotFound();
          }
            return Ok(_context.Meals.Include(x => x.MealRecipes).ToList());
        }

        // GET: api/Meal/5
        [HttpGet("{id}")]
        [EnableQuery(PageSize = pagesize)]
        public async Task<ActionResult<Meal>> GetMeal(int id)
        {
          if (_context.Meals == null)
          {
              return NotFound();
          }
            var meal = await _context.Meals.FindAsync(id);

            if (meal == null)
            {
                return NotFound();
            }

            return Ok(meal);
        }

        [HttpGet("plan/{userId}")]
        [EnableQuery(PageSize = pagesize)]
        public async Task<ActionResult<List<Meal>>> GetMealsByPlan(int userId)
        {
            if (_context.Meals == null)
            {
                return NotFound();
            }
            var meal = await _context.Meals.Include(x => x.Plan).Where(x => x.Plan.UserId == userId).ToListAsync();

            if (meal == null)
            {
                return NotFound();
            }

            return meal;
        }

        private bool MealExists(int id)
        {
            return (_context.Meals?.Any(e => e.MealId == id)).GetValueOrDefault();
        }
    }
}

using CaloFitAPI.Service;
﻿using System;
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
    public class DietController : ControllerBase
    {
        private readonly CalofitDBContext _context;

        private readonly IDietService _dietService;

        private const int pagesize = 5;

        public DietController(CalofitDBContext context, IDietService dietService)
        {
            _context = context;
            _dietService = dietService;
        }

        // GET: api/Diet
        [HttpGet]
        [EnableQuery(PageSize = pagesize)]
        public async Task<ActionResult<IEnumerable<Diet>>> GetDiets()
        {
          if (_context.Diets == null)
          {
              return NotFound();
          }
            return Ok( await _context.Diets.Include(x => x.Menus).ToListAsync());
        }

        [HttpGet("User/{userId:int}")]
        [EnableQuery(PageSize = pagesize)]
        public async Task<ActionResult<IEnumerable<Diet>>> GetFavoriteDietsOfUser(int userId)
        {
            if (_context.Diets == null)
            {
                return NotFound();
            }
            return Ok(await _context.UserPreferences.Where(x => x.UserId == userId).Select(x => x.Diet).ToListAsync());
        }

        // GET: api/Diet/5
        [HttpGet("{id}")]
        [EnableQuery(PageSize = pagesize)]
        public async Task<ActionResult<Diet>> GetDiet(int id)
        {
          if (_context.Diets == null)
          {
              return NotFound();
          }
            var diet = _dietService.GetDietWithMenus(id);

            if (diet == null)
            {
                return NotFound();
            }

            return Ok(diet);
        }

        private bool DietExists(int id)
        {
            return (_context.Diets?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}

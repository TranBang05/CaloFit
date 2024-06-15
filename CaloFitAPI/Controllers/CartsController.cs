using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using CaloFitAPI.Models;
using Microsoft.AspNetCore.OData.Query;
using CaloFitAPI.Dto.Request;
using AutoMapper;

namespace CaloFitAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CartsController : ControllerBase
    {
        private const int pagesize = 10;
        private readonly CalofitDBContext _context;
        private readonly IMapper _mapper;

        public CartsController(CalofitDBContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        // GET: api/Carts
        [HttpGet("User/{userId:int}")]
        [EnableQuery(PageSize = pagesize)]
        public async Task<ActionResult<IEnumerable<Cart>>> GetAllCartByUser(int userId)
        {
            if (_context.Carts == null)
            {
                return NotFound();
            }
            return Ok(await _context.Carts.Include(x => x.Product).ThenInclude(p => p.Ingredient).Include(x => x.User).Where(x => x.Userid == userId).ToListAsync());
        }

        // GET: api/Carts/5
        [HttpGet("{id}")]
        [EnableQuery(PageSize = pagesize)]
        public async Task<ActionResult<Cart>> GetCart(int id)
        {
            if (_context.Carts == null)
            {
                return NotFound();
            }
            var cart = await _context.Carts.FindAsync(id);

            if (cart == null)
            {
                return NotFound();
            }

            return Ok(cart);
        }

        // PUT: api/Carts/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        //[HttpPut("{id}")]
        //public async Task<IActionResult> PutCart(int id, Cart cart)
        //{
        //    if (id != cart.Id)
        //    {
        //        return BadRequest();
        //    }

        //    _context.Entry(cart).State = EntityState.Modified;

        //    try
        //    {
        //        await _context.SaveChangesAsync();
        //    }
        //    catch (DbUpdateConcurrencyException)
        //    {
        //        if (!CartExists(id))
        //        {
        //            return NotFound();
        //        }
        //        else
        //        {
        //            throw;
        //        }
        //    }

        //    return NoContent();
        //}

        //POST: api/Carts
        //To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Cart>> PostCart(CartRequest request)
        {
            if (_context.Carts == null)
            {
                return Problem("Entity set 'CalofitDBContext.Carts'  is null.");
            }
            Cart cart = _mapper.Map<Cart>(request);
            _context.Carts.Add(cart);
            await _context.SaveChangesAsync();

            return Created("GetCart", cart);
        }

        //[HttpPost]
        //public async Task<ActionResult<Cart>> PostCart(Cart request)
        //{
        //    if (_context.Carts == null)
        //    {
        //        return Problem("Entity set 'CalofitDBContext.Carts'  is null.");
        //    }
        //    _context.Carts.Add(request);
        //    await _context.SaveChangesAsync();

        //    return Created("GetCart", request);
        //}

        // DELETE: api/Carts/5
        [HttpDelete("{productId:int}/{userId:int}")]
        public async Task<IActionResult> DeleteCart(int productId, int userId)
        {
            if (_context.Carts == null)
            {
                return NotFound();
            }
            var cart = await _context.Carts.FirstOrDefaultAsync(x => x.Productid == productId && x.Userid == userId);
            if (cart == null)
            {
                return NotFound();
            }

            _context.Carts.Remove(cart);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        //private bool CartExists(int id)
        //{
        //    return (_context.Carts?.Any(e => e.Id == id)).GetValueOrDefault();
        //}
    }
}

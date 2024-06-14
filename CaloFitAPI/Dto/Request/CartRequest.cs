using CaloFitAPI.Models;

namespace CaloFitAPI.Dto.Request
{
    public class CartRequest
    {
        public int Userid { get; set; }
        public int Productid { get; set; }
        public double? Quantity { get; set; }

    }
}

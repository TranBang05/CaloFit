using CaloFitAPI.Models;

namespace CaloFitAPI.Dto.Request
{
    public class OrderDetailRequest
    {
        public int Id { get; set; }
        public int ProductId { get; set; }
        public double Price { get; set; }
        public int Quantity { get; set; }
    }
}

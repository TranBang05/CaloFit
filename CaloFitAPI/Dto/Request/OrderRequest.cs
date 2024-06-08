using CaloFitAPI.Models;

namespace CaloFitAPI.Dto.Request
{
    public class OrderRequest
    {
        public OrderRequest()
        {
            OrderDetailRequests = new HashSet<OrderDetailRequest>();
        }

        public int Id { get; set; }
        public DateTime Date { get; set; }
        public int Userid { get; set; }
        public ICollection<OrderDetailRequest> OrderDetailRequests { get; set; }
    }
}

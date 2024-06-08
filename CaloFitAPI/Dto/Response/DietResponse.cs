using CaloFitAPI.Models;

namespace CaloFitAPI.Dto.Response
{
    public class DietResponse
    {
        public string? DietName { get; set; }
        public List<MenuResponse>? Menus { get; set; }
    }
}

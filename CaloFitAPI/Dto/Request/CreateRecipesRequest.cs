namespace CaloFitAPI.Dto.Request
{
    public class CreateRecipesRequest
    {
        public int  DietId { get; set; } 
        public int favor { get; set; } 

        public int Allergy { get; set;} 

        public int  daily { get; set; }
        public int week { get; set; }
    }
}

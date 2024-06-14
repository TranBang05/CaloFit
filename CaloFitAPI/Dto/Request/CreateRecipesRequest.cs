namespace CaloFitAPI.Dto.Request
{
    public class CreateRecipesRequest
    {
        public int DietId { get; set; }
        public int Allergy { get; set;} 

        public string  dailyorweek { get; set; }
      
    }
}

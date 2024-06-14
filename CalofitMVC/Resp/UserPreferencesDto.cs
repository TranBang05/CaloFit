namespace CalofitMVC.Resp

{
    public class UserPreferencesDto
    {
        public int UserPreferenceId { get; set; }
        public int UserId { get; set; }
        public int DietId { get; set; }
        public int? FavoriteRecipesId { get; set; }
    }
}

namespace CalofitMVC.Models
{
    public class ForgotPasswordRequest
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public string NewPassword { get; set; }
    }
}

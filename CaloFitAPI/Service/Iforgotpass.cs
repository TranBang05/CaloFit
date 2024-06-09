namespace CaloFitAPI.Service
{
    public interface Iforgotpass
    {
        public bool Forgot(string username, string password, string repass);
    }
}

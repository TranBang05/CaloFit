namespace CaloFitAPI.Service
{
    public interface ILogins
    {
        int GetUserId(string username);
        public bool Login(string username, string password);
    }
}

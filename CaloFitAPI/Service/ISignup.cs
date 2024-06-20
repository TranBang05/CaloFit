using CaloFitAPI.Dto.Request;

namespace CaloFitAPI.Service
{
    public interface ISignup
    {
        bool RegisterUser(string email, string password, string repass);
    }
}

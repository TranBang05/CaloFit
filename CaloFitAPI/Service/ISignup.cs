using CaloFitAPI.Dto.Request;

namespace CaloFitAPI.Service
{
    public interface ISignup
    {
        bool RegisterUser(RegisterRequest request);
    }
}

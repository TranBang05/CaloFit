using CaloFitAPI.Dto.Response;
using CaloFitAPI.Models;
using Microsoft.OData.UriParser;

namespace CaloFitAPI.Service
{
    public interface Iusermanagement
    {
        public void   AddUserWithPreferencesAndAllergies(UserMangement request);


    }
}

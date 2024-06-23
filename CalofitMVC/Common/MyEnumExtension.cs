using System.ComponentModel;

namespace CalofitMVC.Common
{
    public static class MyEnumExtensions
    {
        public static string ToDescriptionString(this BaseURLEnum val)
        {
            DescriptionAttribute[] attributes = (DescriptionAttribute[])val
               .GetType()
               .GetField(val.ToString())
               .GetCustomAttributes(typeof(DescriptionAttribute), false);
            return attributes.Length > 0 ? attributes[0].Description : string.Empty;
        }
    }
}

using System.ComponentModel;

namespace CalofitMVC.EnumMVC
{
    public enum MealTypeEnum
    {
        [Description("Bữa sáng")]
        Morning,
        [Description("Bữa trưa")]
        Lunch,
        [Description("Bữa tối")]
        Dinner
    }
}

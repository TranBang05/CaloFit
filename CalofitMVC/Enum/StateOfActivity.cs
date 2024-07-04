using System.ComponentModel;

namespace CalofitMVC.EnumMVC
{
    public enum StateOfActivity
    {
        [Description("rare")]
        Rarely = 1,
        [Description("light")]
        Light = 2,
        [Description("moderate")]
        Moderate = 3,
        [Description("adhd")]
        ADHD = 4
    }
    public class Act
    {
        public static int getAct(string act)
        {
            foreach (StateOfActivity state in Enum.GetValues(typeof(StateOfActivity)))
            {
                if (state.GetDescription().Equals(act))
                {
                    return (int) state;
                }
            }
            return -1;
        }
    }
}

using System.ComponentModel;

namespace CalofitMVC.EnumMVC
{
    public enum Goal
    {
        [Description("loss")]
        Loss,
        [Description("disease")]
        Disease,
        [Description("maintain")]
        Maintain,
        [Description("build")]
        Build
    }
}

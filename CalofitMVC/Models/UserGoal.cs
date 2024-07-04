using System;
using System.Collections.Generic;

namespace CalofitMVC.Models
{
    public partial class UserGoal
    {
        public int UserGoalId { get; set; }
        public int UserId { get; set; }
        public string GoalType { get; set; } = null!;
        public string? GoalDetails { get; set; }
        public DateOnly? TargetDate { get; set; }

        public virtual User User { get; set; } = null!;
    }
}

//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CreditCardMS.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Reward
    {
        public int RewardsId { get; set; }
        public int CustomerId { get; set; }
        public Nullable<System.DateTime> RewardDate { get; set; }
        public int RewardsPoint { get; set; }
        public Nullable<double> TotalAmount { get; set; }
    
        public virtual Customer Customer { get; set; }
    }
}

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
    
    public partial class CustomerConsumingMoney
    {
        public int ConsumeId { get; set; }
        public int CustomerId { get; set; }
        public int Month { get; set; }
        public System.DateTime ConsumeDate { get; set; }
        public double ConsumeMoney { get; set; }
        public Nullable<double> TotalConsumeMoney { get; set; }
        public Nullable<double> CashBackMoney { get; set; }
    
        public virtual Customer Customer { get; set; }
        public virtual MonthTbl MonthTbl { get; set; }
    }
}

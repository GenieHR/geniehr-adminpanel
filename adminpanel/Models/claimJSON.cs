
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------


namespace adminpanel.Models
{

using System;
    using System.Collections.Generic;
    
public partial class claimJSON
{

    public claimJSON()
    {

        this.claimHistories = new HashSet<claimHistory>();

        this.ClaimRevisions = new HashSet<ClaimRevision>();

        this.claimManagers = new HashSet<claimManager>();

    }


    public int id { get; set; }

    public int EmpId { get; set; }

    public string claimNo { get; set; }

    public System.DateTime claimDate { get; set; }

    public string claimPurpose { get; set; }

    public string claimText { get; set; }

    public decimal totalAmount { get; set; }

    public int claimstatus { get; set; }

    public Nullable<System.DateTime> ClaimPeriodFrom { get; set; }

    public Nullable<System.DateTime> ClaimPeriodTo { get; set; }

    public Nullable<decimal> ApprovedAmount { get; set; }



    public virtual ICollection<claimHistory> claimHistories { get; set; }

    public virtual ClaimStatu ClaimStatu { get; set; }

    public virtual Employee Employee { get; set; }

    public virtual ICollection<ClaimRevision> ClaimRevisions { get; set; }

    public virtual ICollection<claimManager> claimManagers { get; set; }

}

}

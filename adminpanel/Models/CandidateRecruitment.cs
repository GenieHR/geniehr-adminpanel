
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
    
public partial class CandidateRecruitment
{

    public int Id { get; set; }

    public int CandidateId { get; set; }

    public int JobId { get; set; }

    public Nullable<int> CurrentStage { get; set; }

    public System.DateTime CreateDate { get; set; }

    public int CreatedBy { get; set; }

    public Nullable<System.DateTime> ModifiedDate { get; set; }

    public Nullable<int> ModifiedBy { get; set; }



    public virtual Employee Employee { get; set; }

    public virtual Employee Employee1 { get; set; }

    public virtual RecruitmentStage RecruitmentStage { get; set; }

}

}

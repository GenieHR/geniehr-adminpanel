
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
    
public partial class CandidateRecruitmentLog
{

    public int Id { get; set; }

    public int CandidateId { get; set; }

    public Nullable<int> JobId { get; set; }

    public int LogId { get; set; }

    public Nullable<int> ActionBy { get; set; }



    public virtual LogTable LogTable { get; set; }

    public virtual Employee Employee { get; set; }

    public virtual Candidate Candidate { get; set; }

}

}

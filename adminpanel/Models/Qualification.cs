
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
    
public partial class Qualification
{

    public Qualification()
    {

        this.Candidates = new HashSet<Candidate>();

        this.Degrees = new HashSet<Degree>();

        this.EmpQualifications = new HashSet<EmpQualification>();

    }


    public int Id { get; set; }

    public string QualificationName { get; set; }



    public virtual ICollection<Candidate> Candidates { get; set; }

    public virtual ICollection<Degree> Degrees { get; set; }

    public virtual ICollection<EmpQualification> EmpQualifications { get; set; }

}

}
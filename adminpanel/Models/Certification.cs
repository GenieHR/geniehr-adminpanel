
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
    
public partial class Certification
{

    public Certification()
    {

        this.JobCertifications = new HashSet<JobCertification>();

    }


    public int Id { get; set; }

    public string CertificationName { get; set; }

    public string IssuedBy { get; set; }

    public string Version { get; set; }

    public Nullable<int> SkillId { get; set; }

    public string CertificationRemarks { get; set; }



    public virtual Skill Skill { get; set; }

    public virtual ICollection<JobCertification> JobCertifications { get; set; }

}

}
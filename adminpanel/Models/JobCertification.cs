
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
    
public partial class JobCertification
{

    public int Id { get; set; }

    public int JobId { get; set; }

    public int CertificationId { get; set; }

    public Nullable<System.DateTime> CertifiedOn { get; set; }

    public Nullable<System.DateTime> Expiry { get; set; }



    public virtual Certification Certification { get; set; }

    public virtual JobDescription JobDescription { get; set; }

}

}

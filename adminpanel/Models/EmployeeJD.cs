
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
    
public partial class EmployeeJD
{

    public int Id { get; set; }

    public int EmpId { get; set; }

    public int JobId { get; set; }

    public Nullable<System.DateTime> Expiry { get; set; }

    public Nullable<int> Openings { get; set; }

    public Nullable<byte> Active { get; set; }

    public string Remarks { get; set; }

    public System.DateTime CreatedDate { get; set; }

    public int CreatedBy { get; set; }

    public Nullable<System.DateTime> ModifiedDate { get; set; }

    public Nullable<int> ModifiedBy { get; set; }



    public virtual Employee Employee { get; set; }

    public virtual Employee Employee1 { get; set; }

    public virtual Employee Employee2 { get; set; }

    public virtual JobDescription JobDescription { get; set; }

}

}

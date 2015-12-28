using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace adminpanel.Models
{
    public class CandidateDTO
    {
        public string CandidateName { get; set; }

        public long PrimaryMobile { get; set; }

        public Nullable<long> AlternateNumber { get; set; }

        public string Email { get; set; }

        public string CurrentCompany { get; set; }

        public Nullable<decimal> CurrentSalary { get; set; }

        public Nullable<int> CurrentExp { get; set; }

        public string CurrentLocation { get; set; }

        public string Designation { get; set; }

        public int TotalExp { get; set; }

        public string NativePlace { get; set; }

        public int HighestQualification { get; set; }

        public int CreatedBy { get; set; }

        public System.DateTime CreatedOn { get; set; }

        public DateTime? ModifiedOn { get; set; }

        public Nullable<int> ModifiedBy { get; set; }

        public Nullable<int> degree { get; set; }

        public string skillList { get; set; }

    }
}
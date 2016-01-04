using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace adminpanel.Models
{
    public class JdDTO
    {

        public Nullable<int> CleintId { get; set; }
        public string JobShortName { get; set; }
        public string JobTitle { get; set; }
        public int ExpFrom { get; set; }
        public int ExpTo { get; set; }
        public string JobLocation { get; set; }
        public Nullable<decimal> Salary { get; set; }
        public Nullable<decimal> SalaryTo { get; set; }

        public Nullable<int> Openings { get; set; }
        public string JobNotes { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public int CreatedBy { get; set; }
        public Nullable<int> RExpFrom { get; set; }
        public Nullable<int> RExpTo { get; set; }

        public string skillList { get; set; }

        public string certification { get; set; }

        public string qualification { get; set; }

    }
}
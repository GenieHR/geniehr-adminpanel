using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace adminpanel.Models
{
    public class passwordModel
    {
        public int EmpId { get; set; }

        public string oldPassword { get; set; }

        public string newPassword { get; set; }
    }
}
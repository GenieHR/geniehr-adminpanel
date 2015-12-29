using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace adminpanel.Models
{
    public class EmailDTO
    {
        public string toEmailAddress { get; set; }
        public string ccEmailAddress { get; set; }
        public string mailSubject { get; set; }
        public string mailBody { get; set; }
    }
}
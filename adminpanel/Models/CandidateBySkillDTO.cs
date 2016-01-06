using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace adminpanel.Models
{
    public class CandidateBySkillDTO
    {
        public int candidateId { get; set; }
        public string candidateName { get; set; }
        public long candidateMobile { get; set; }
        public string createdBy { get; set; }
        public string SkillName { get; set; }
        public int skillId { get; set; }
        public string jobTitle { get; set; }
        public string jobCreated { get; set; }
        
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace adminpanel.Models
{
    public class CandidateSkillDTO
    {
        ubietydbEntities db = new ubietydbEntities();

        public int candidateId;
        public int skillId;

        public CandidateSkillDTO(int CandidateId, int SkillId)
        {
            this.candidateId = CandidateId;
            this.skillId = SkillId;
        }

        public Candidate candidateInfo
        {
            get
            {
                return db.Candidates.Find(this.candidateId);
            }

            set
            {

            }
        }

        public Skill skillInfo
        {
            get
            {
                return db.Skills.Find(this.skillId);
            }
            set
            {

            }
        }
    }
}
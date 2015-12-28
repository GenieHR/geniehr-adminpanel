using adminpanel.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace adminpanel.Controllers
{
    public class CandidateController : ApiController
    {

        private ubietydbEntities db = new ubietydbEntities();


        [Route("putcandidate/")]
        [HttpPost]
        public int PutCandidate(CandidateDTO candidateInput)
        {

            Candidate candidate = new Candidate();

            
            TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
            DateTime currentTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);


            candidate.CandidateName = candidateInput.CandidateName;
            candidate.HighestQualification = candidateInput.HighestQualification;
            candidate.degree = candidateInput.degree;
            candidate.NativePlace = candidateInput.NativePlace;
            candidate.PrimaryMobile = candidateInput.PrimaryMobile;
            candidate.AlternateNumber = candidateInput.AlternateNumber;
            candidate.Email = candidateInput.Email;
            candidate.TotalExp = candidateInput.TotalExp;

            candidate.CurrentLocation = candidateInput.CurrentLocation;
            candidate.CurrentCompany = candidateInput.CurrentCompany;
            candidate.Designation = candidateInput.Designation;
            candidate.CurrentExp = candidateInput.CurrentExp;
            candidate.CurrentSalary = candidateInput.CurrentSalary;

            candidateInput.CreatedOn = currentTime;

            candidate.CreatedBy = candidateInput.CreatedBy;
            
            db.Candidates.Add(candidate);
            int retVal = -1;

            if (db.SaveChanges() == 1)
            {
                JArray skillList = JArray.Parse(candidateInput.skillList);
                foreach (string skillId in skillList)
                {
                    CandidateSkill candidateskill = new CandidateSkill();
                    candidateskill.CandidateId = candidate.Id;
                    candidateskill.SkillId = Int32.Parse(skillId);
                    db.CandidateSkills.Add(candidateskill);
                }
                retVal = db.SaveChanges();
            }

            return candidate.Id;
        }

        [Route("getcandidatesbyEmpId/{EmpId}")]
        [HttpGet]
        public dynamic PutCandidate(int EmpId)
        {
            db.Configuration.ProxyCreationEnabled = false;
            return new { data = db.getCandidatesByCreatedBy(EmpId) };
        }
    }
}

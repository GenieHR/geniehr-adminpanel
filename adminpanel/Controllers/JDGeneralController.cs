﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using adminpanel.Models;


namespace adminpanel.Controllers
{
    public class JDGeneralController : ApiController
    {
        private ubietydbEntities db = new ubietydbEntities();

        [Route("getCandidatesByJobId/{JobId}")]
        [HttpGet]

        public List<CandidateBySkillDTO> getCandidate(int JobId)
        {
            return db
               .vSkillMatches
               .Where(e => e.JobId == JobId)
               .Select(e => new
               {
                   candidateInfo = db.Candidates.FirstOrDefault(c => c.Id == e.CandidateId),
                   skillInfo = db.Skills.FirstOrDefault(s => s.Id == e.SkillId),
                   JDInfo = db.JobDescriptions.FirstOrDefault(j => j.Id == JobId)
                }
               )
                .Select(e => new CandidateBySkillDTO
                {
                    candidateId = e.candidateInfo.Id,
                    candidateLocation = e.candidateInfo.CurrentLocation,
                    jobLocation = e.JDInfo.JobLocation,
                    candidateMobile = e.candidateInfo.PrimaryMobile,
                    candidateName = e.candidateInfo.CandidateName,
                    SkillName = e.skillInfo.SkillName,
                    createdBy = e.candidateInfo.Employee1.EmpName,
                    jobCreated = e.JDInfo.Employee.EmpName,
                    jobTitle = e.JDInfo.JobTitle,
                    skillId = e.skillInfo.Id
                    
                }
                ).ToList();
        }
    }
}

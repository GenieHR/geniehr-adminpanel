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

namespace adminpanel.Controllers
{
    public class CandidateController : ApiController
    {

        private ubietydbEntities db = new ubietydbEntities();


        [Route("putcandidate/")]
        [HttpPost]
        public int PutCandidate(Candidate candidate)
        {

            TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
            DateTime currentTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

            candidate.CreatedOn = currentTime;

            db.Candidates.Add(candidate);

            return db.SaveChanges();


        }

        [Route("getcandidatesbyEmpId/{EmpId}")]
        [HttpGet]
        public dynamic PutCandidate(int EmpId)
        {
            db.Configuration.ProxyCreationEnabled = false;

            return db.getCandidatesByCreatedBy(EmpId);

        }



    }
}

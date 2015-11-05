using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using adminpanel.Models;


namespace adminpanel.Controllers
{
    public class ClaimUpdateController : ApiController
    {
        private ubietydbEntities db = new ubietydbEntities();

        private int createClaimLog(int claimId, int statusId, int empId, string remarks)
        {
            claimHistory claimHistory = new claimHistory();

            claimHistory.claimId = claimId;
            claimHistory.statusId = statusId;
            claimHistory.actionBy = empId;
            claimHistory.remarks = remarks;
            TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
            claimHistory.statusTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

            db.claimHistories.Add(claimHistory);
            return db.SaveChanges();
        }

        public int Post(claimUpdateDTO claimUpdateDTO)
        {
            createClaimLog(claimUpdateDTO.claimId, claimUpdateDTO.claimStatus, claimUpdateDTO.actionBy, claimUpdateDTO.revisionRemarks);

            claimJSON claim = db.claimJSONs.Find(claimUpdateDTO.claimId);
            claim.claimstatus = claimUpdateDTO.claimStatus;

            if (!(claimUpdateDTO.revisionText == null))
            { 
                claim.claimText = claimUpdateDTO.claimText;
            }
            
            db.Entry(claim).State = System.Data.Entity.EntityState.Modified;


            if (!(claimUpdateDTO.revisionText == null))
            {
                ClaimRevision claimRevision = new ClaimRevision();

                claimRevision.ClaimId = claimUpdateDTO.claimId;
                claimRevision.claimtext = claimUpdateDTO.revisionText;
                claimRevision.revisionDate = claimUpdateDTO.actionDateTime;
                claimRevision.revisionName = claimUpdateDTO.revisionNumber ?? 0;
                claimRevision.revisionBy = claimUpdateDTO.actionBy;
                claimRevision.revisionRemarks = claimUpdateDTO.revisionRemarks;
                db.ClaimRevisions.Add(claimRevision);
            }

            return db.SaveChanges();
        }
    }
}

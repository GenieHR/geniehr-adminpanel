using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace adminpanel.Models
{
    public class claimUpdateDTO
    {

        ubietydbEntities db = new ubietydbEntities();
        
        public int claimId { get; set; }
        public String revisionText { get; set; }

        public decimal? ApprovedAmount { get; set; }

        public String claimText { get; set; }

        public DateTime actionDateTime
        {
            get
            {
                TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
                return TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);
            }

            set
            {
                TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
                this.actionDateTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);
            }
        }

        public int? revisionNumber
        {
            
            get 
            {
                db.Configuration.ProxyCreationEnabled = false;
                return db.getNextClaimRevisionNo(this.claimId).FirstOrDefault(); 
            }

            set 
            {
                db.Configuration.ProxyCreationEnabled = false;
                this.revisionNumber = db.getNextClaimRevisionNo(this.claimId).FirstOrDefault();
            }
        }

        public int claimStatus { get; set; }

        public int actionBy { get; set; }

        public string revisionRemarks { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace adminpanel.Models
{
    public class claimDTO
    {
        //"id": 57,
        //"empid": 173,
        //"claimNo": "GHR-TST-006/12/1",
        //"claimDate": "2015-12-26T00:00:00",
        //"claimPurpose": "Demo Test Claim",
        //"totalAmount": 550,
        //"claimstatus": 3,
        //"ClaimStatusName": "Approved"

        public int claimId { get; set; }
        public int empId { get; set; }

        public string claimNo { get; set; }
        public DateTime claimDate { get; set; }
        public string claimPurpose { get; set; }
        public decimal totalAmount { get; set; }
        public int claimStatusId { get; set; }
        public string claimStatusName { get; set; }
        public decimal? approvedAmount { get; set; }

    }
}
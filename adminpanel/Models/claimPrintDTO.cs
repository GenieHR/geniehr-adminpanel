using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace adminpanel.Models
{
    public class claimPrintDTO
    {
        public string claimNo { get; set; }
        public string empNum { get; set; }

        public string empName { get; set; }
        public string workLocation { get; set; }
        public string designation { get; set; }
        public string email { get; set; }
        public long? mobileNO { get; set; }
        public string clientName { get; set; }
        public DateTime? periodFrom { get; set; }
        public DateTime? periodTO { get; set; }
        public DateTime createDate { get; set; }
        public string claimStatus { get; set; }
        public List<claimManagerDTO> managers { get; set; }
        public String claimText { get; set; }
        
    }
}
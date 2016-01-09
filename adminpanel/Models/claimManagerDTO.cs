using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace adminpanel.Models
{
    public class claimManagerDTO
    {
        public string managerId { get; set; }
        public string managerName { get; set;}
        public string managerEmail { get; set; }
        public long? managerMobile { get; set; }
        public int levelInClaim { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace adminpanel.Models
{
    public class EmerContactModal
    {
        public int EmpId { get; set; }
        public string contactName { get; set; }
        public int relation { get; set; }
        public string emailAddress { get; set; }
        public long mobileNumber { get; set; }
        public string address1 { get; set; }
        public string address2 { get; set; }
        public string city { get; set; }
        public string state { get; set; }
        public string pincode { get; set; }
        public string stdcode { get; set; }
        public long phonenumber { get; set; }
    }
}
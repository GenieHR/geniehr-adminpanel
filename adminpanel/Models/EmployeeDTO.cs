using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UbietyDataServices.Models
{
    public class EmployeeDTO
    {
        public string EmpName { get; set; }
        public int EmpId { get; set; }
        public int EmpStatus { get; set; }
        public string EmpNum { get; set; }
        public string Email { get; set; }
        public int Otp { get; set; }
        public long? MobileNum { get; set; }
        public String ProfilePicURL { get; set; }
        
    }
}
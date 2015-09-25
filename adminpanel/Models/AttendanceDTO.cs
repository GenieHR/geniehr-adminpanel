using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UbietyDataServices.Models;
using System.Spatial;



namespace UbietyDataServices.Models
{
    public class AttendanceDTO
    {
        public DateTime MarkDate { get; set; }

        public List<AttendanceLineDetail> attendanceLineDetails
        {
            get;
            set;
        }
    }
}
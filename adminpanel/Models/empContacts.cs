using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace adminpanel.Models
{
    public class EmpContacts
    {
        public int EmpId { get; set; }
        public string contactData { get; set; }
        public int contactType { get; set; }
        public string contactLable { get; set; }

    }
}
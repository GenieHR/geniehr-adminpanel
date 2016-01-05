using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace adminpanel.Models
{
    public class jobIDEmpDTO
    {
        public List<empIdJobId> empIdJobId {get; set;}

        public int Id { get; set; }
        public string JobShortName { get; set; }
        public string JobTitle { get; set; }
        public string ClientName { get; set; }
        public string JobLocation { get; set; }

        public jobIDEmpDTO(int id, string jobShortName, string jobTitle, string clientName, string jobLocation)
        {
            this.Id = id;
            this.JobShortName = jobShortName;
            this.JobTitle = jobTitle;
            this.ClientName = clientName;
            this.JobLocation = jobLocation;
        }
    }

    
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using adminpanel.Models;


namespace adminpanel.Controllers
{
    public class DashboardController : ApiController
    {
        private ubietydbEntities context = new ubietydbEntities();

        [Route("api/attOfClient/{clientId}/{numDaysBack}")]
        [HttpGet]

        public dynamic getAttendancesofClientsByDays(int clientId, int numDaysBack)
        {

            context.Configuration.ProxyCreationEnabled = false;
            return context.getAttendanceByClientsDays(clientId, numDaysBack);

        }

        [Route("api/attByManager/{managerId}/{numDaysBack}")]
        [HttpGet]

        public dynamic getAttendancesByManagerofClientsByDays(int managerId, int numDaysBack)
        {

            context.Configuration.ProxyCreationEnabled = false;
            return context.getAttendanceByManagerId(managerId, numDaysBack);

        }

    }
}

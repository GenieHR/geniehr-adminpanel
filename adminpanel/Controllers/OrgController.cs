using adminpanel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace adminpanel.Controllers
{
    public class OrgController : ApiController
    {
        private ubietydbEntities db = new ubietydbEntities();

        [Route("getProfilesByClient/{clientId}")]
        [HttpGet]
        public dynamic getProfilesByClient(int clientId)
        {
            db.Configuration.ProxyCreationEnabled = false;

            return db.profilestatus1(clientId).ToList();
        }
    }
}

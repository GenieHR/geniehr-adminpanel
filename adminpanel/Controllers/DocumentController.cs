using adminpanel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace adminpanel.Controllers
{
    public class DocumentController : ApiController
    {
        private ubietydbEntities db = new ubietydbEntities();

        [Route("getDocs/{EmpId}")]
        [HttpGet]
        public dynamic getDocs(int EmpId)
        {
            db.Configuration.ProxyCreationEnabled = false;

            return (from recordset in db.EmpDocs
                    where recordset.EmpId == EmpId
                    select recordset
               );
        }

        [Route("getEmpDocs/{EmpId}")]
        [HttpGet]
        public dynamic getEmpDocs(int EmpId)
        {
            db.Configuration.ProxyCreationEnabled = false;

            return db.vEmpDocs.Where(p => p.EmpId == EmpId).GroupBy(p => p.DocTypeName);
        }
    }

}

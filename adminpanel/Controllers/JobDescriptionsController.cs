using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using adminpanel.Models;

namespace adminpanel.Controllers
{
    public class JobDescriptionsController : ApiController
    {
        private ubietydbEntities db = new ubietydbEntities();

        [Route("getorgclients/{EmpId}")]
        [HttpGet]

        public dynamic getOrgClients(int EmpId)
        {
            return db.GetAllClientsOfEmpOrg(EmpId);
        }

        [Route("getCertifications/")]
        [HttpGet]
        public dynamic getCertification()
        {

            var certification = (from recordset in db.Certifications
                       select new CertificationDTO
                       {
                           Id = recordset.Id,
                           CertificationName = recordset.CertificationName
                       });

            return certification.ToList();
        }

        [Route("getBenefits/")]
        [HttpGet]
        public dynamic getBenefits()
        {


            var benefits = (from recordset in db.Benefits
                                 select new BenefitDTO
                                 {
                                     Id = recordset.Id,
                                     BenefitName = recordset.BenefitName
                                 });

            return benefits.ToList();
        }

    }
}
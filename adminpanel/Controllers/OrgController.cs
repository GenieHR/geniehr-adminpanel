using adminpanel.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
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

        [Route("editGroupTypeManager/{managerId}/{groupTypeId}")]
        [HttpGet]

        public int manageGroupTypeManager(int managerId, int groupTypeId)
        {
            db.Configuration.ProxyCreationEnabled = false;

            GroupTypeIncharge groupTypeManager =  db.GroupTypeIncharges.Where(f => f.GroupTypeId == groupTypeId).FirstOrDefault();

            if (groupTypeManager == null)
            {
                GroupTypeIncharge groupTypeIncharge = new GroupTypeIncharge();

                groupTypeIncharge.GroupTypeId = groupTypeId;
                groupTypeIncharge.InchargeId = managerId;

                db.GroupTypeIncharges.Add(groupTypeIncharge);
            }
            else
            {
                groupTypeManager.InchargeId = managerId;
                db.Entry(groupTypeManager).State = EntityState.Modified;
            }

            return db.SaveChanges();
        }

        [Route("getSecondLevelManager/{clientId}")]
        [HttpGet]
        public List<EmpBasicDetailDTO> getSecondLevelManager(int clientId)
        {
            db.Configuration.ProxyCreationEnabled = false;

            List<getUsersInRole_Result> secondLevelManagers =  db.getUsersInRole("SecondLevelManager").Where(f => f.CompanyId == clientId).ToList();

            List<EmpBasicDetailDTO> empBasicDetail = new List<EmpBasicDetailDTO>();

            foreach(var secondLevelManager in secondLevelManagers)
            {
                empBasicDetail.Add(new EmpBasicDetailDTO { EmpId = secondLevelManager.EmpId, EmpName = secondLevelManager.EmpName, Designation = secondLevelManager.Designation });
            }

            return empBasicDetail;
        }




        [Route("addClient/")]
        [HttpPost]
        public dynamic addClient(EmpClientModel empClient)
        {
            db.Configuration.ProxyCreationEnabled = false;

            Models.Client newClient = new Models.Client();

            newClient.ClientLogoURL = "0.png";

            newClient.ClientName = empClient.clientName;

            int? empCompanyId = db.Employees.Find(empClient.orgEmpId).CompanyId;

            newClient.OrgId = db.Organizations.Find(empCompanyId).OrgId;

            EmpClient ec = new EmpClient();

            ec.ClientId = newClient.ClientId;
            ec.EmpId = empClient.orgEmpId;

            newClient.EmpClients.Add(ec);

            db.Clients.Add(newClient);

            return db.SaveChanges();
        }
    }
}

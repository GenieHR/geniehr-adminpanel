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
using Newtonsoft.Json.Linq;

namespace adminpanel.Controllers
{
    public class claimJSONsController : ApiController
    {
        private ubietydbEntities db = new ubietydbEntities();

        // GET: api/claimJSONs
        public IQueryable<claimJSON> GetclaimJSONs()
        {
            return db.claimJSONs;
        }

        // GET: api/claimJSONs/5
        [ResponseType(typeof(claimJSON))]
        public dynamic GetclaimJSON(int id)
        {
            db.Configuration.ProxyCreationEnabled = false;

            //claimJSON claimJSON = db.claimJSONs.Find(id);
            //if (claimJSON == null)
            //{
            //    return NotFound();
            //}

            //return Ok(claimJSON);

            return db.claimJSONs.Where(b => b.id == id)
                                 .Include(b => b.ClaimStatu)
                                 .First();


        }

        // PUT: api/claimJSONs/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutclaimJSON(int id, claimJSON claimJSON)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != claimJSON.id)
            {
                return BadRequest();
            }

            db.Entry(claimJSON).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!claimJSONExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/claimJSONs
        [ResponseType(typeof(claimJSON))]
        public IHttpActionResult PostclaimJSON(claimJSON claimJSON)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            
            claimJSON.claimNo = db.getNextClaimNo(claimJSON.EmpId).FirstOrDefault();

            db.claimJSONs.Add(claimJSON);

            try
            {
                if (db.SaveChanges() == 1) {
                    createClaimLog(claimJSON.id, claimJSON.claimstatus, claimJSON.EmpId, "Claim Created");

                };
            }
            catch (DbUpdateException)
            {
                if (claimJSONExists(claimJSON.id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = claimJSON.id }, claimJSON);
        }

        [Route("api/getClaimDraft/{EmpId}")]
        [HttpGet]

        public dynamic getClaimDraft(int EmpId)
        {
            db.Configuration.ProxyCreationEnabled = false;

            return (from recordset in db.claimJSONs where recordset.EmpId == EmpId && recordset.claimstatus == 0 select recordset).ToList();
        }


        [Route("api/discardDraft/{DraftId}")]
        [HttpPost]

        public int discardDraft(int DraftId)
        {
            claimJSON draftClaim = db.claimJSONs.Find(DraftId);
            draftClaim.claimstatus = 8;

            db.Entry(draftClaim).State = EntityState.Modified;

            if (db.SaveChanges() == 1)
            {
                createClaimLog(draftClaim.id, draftClaim.claimstatus, draftClaim.EmpId, "Draft Discarded");
            };

            return 1;
        }


        [Route("api/empMyClaims/{EmpId}")]
        [HttpGet]
        public dynamic empMyClaims (int EmpId)
        {

            return 
                db.vSubmittedClaims
                .Where(e => e.empid == EmpId)
                .Select(e => new claimDTO
                {
                    claimDate = e.claimDate,
                    claimId = e.id,
                    claimNo = e.claimNo,
                    claimPurpose = e.claimPurpose,
                    claimStatusName = e.ClaimStatusName,
                    claimStatusId = e.claimstatus,
                    empId = e.empid,
                    totalAmount = e.totalAmount,
                    approvedAmount = e.ApprovedAmount
                })
                .ToList();
            
        }

        [Route("api/printClaim/{claimId}")]
        [HttpGet]

        public dynamic getPrintClaimDet(int claimId)
        {
            db.Configuration.ProxyCreationEnabled = false;

            //db.Database.Log = s => System.Diagnostics.Debug.WriteLine(s);

            string managerName = db.getClaimLogByStatus(claimId, 3).FirstOrDefault().Action_By;

            var abc = db
                .claimJSONs
                .Where(e => e.id == claimId)
                .Select(e => new
                {
                    employeeInfo = db.EmployeeDetails.FirstOrDefault(ED => ED.EmpId == e.EmpId),
                    clientInfo = db.Clients.FirstOrDefault(CF => CF.ClientId == e.Employee.CompanyId),
                    claimInfo = e
                })
                .Select(e => new claimPrintDTO {
                    empNum = e.claimInfo.Employee.EmpNum,
                    claimNo = e.claimInfo.claimNo,
                    clientName = e.clientInfo.ClientName,
                    workLocation = e.employeeInfo.WorkLocation,
                    designation = e.claimInfo.Employee.Designation,
                    claimStatus = e.claimInfo.ClaimStatu.Status,
                    periodFrom = e.claimInfo.ClaimPeriodFrom,
                    periodTO = e.claimInfo.ClaimPeriodTo,
                    claimText = e.claimInfo.claimText,
                    createDate = e.claimInfo.claimDate,
                    empName = e.claimInfo.Employee.EmpName,
                    mobileNO = e.claimInfo.Employee.PrimaryMobile,
                    approvingManager = managerName,
                    managers = e.claimInfo.claimManagers
                                            .Where(m => m.claimId == claimId)
                                            .OrderByDescending(x => x.level)
                                            .Select(n => new claimManagerDTO
                                                {
                                                    managerId = n.Employee.EmpName,
                                                    managerEmail = n.Employee.Email,
                                                    managerName = n.Employee.EmpName,
                                                    managerMobile = n.Employee.PrimaryMobile,
                                                    levelInClaim = n.level
                                            }).ToList(),
                    email = e.claimInfo.Employee.Email
                   
                }).First();

            return abc;
        }

        [Route("api/draftClaimJSON")]
        [HttpPost]

        public dynamic postDraftclaimJSON(claimJSON claimJSON)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            if (claimJSON.claimPurpose == null)
                claimJSON.claimPurpose = " ";
            if (claimJSON.claimNo == null)

            { 
                claimJSON.claimNo = "Draft/" + db.getNextClaimNo(claimJSON.EmpId).FirstOrDefault();

                db.claimJSONs.Add(claimJSON);

            try
            {
                if (db.SaveChanges() == 1)
                {
                    createClaimLog(claimJSON.id, claimJSON.claimstatus, claimJSON.EmpId, "Draft Claim Created");
                };
            }
            catch (DbUpdateException)
            {
                if (claimJSONExists(claimJSON.id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }
            }
            else
            {
                claimJSON claim = new claimJSON();
                claim = db.claimJSONs.Find(claimJSON.id);
                
                claim.claimPurpose = claimJSON.claimPurpose;
                claim.claimText = claimJSON.claimText;
                claim.totalAmount = claimJSON.totalAmount;
                claim.ClaimPeriodFrom = claimJSON.ClaimPeriodFrom;
                claim.ClaimPeriodTo = claimJSON.ClaimPeriodTo;

                db.Entry(claim).State = EntityState.Modified;

                if (db.SaveChanges() == 1)
                {
                    createClaimLog(claimJSON.id, claimJSON.claimstatus, claimJSON.EmpId, "Draft Claim Updated");
                };
            }
            return claimJSON;
        }

        private int createClaimLog(int claimId, int statusId, int empId, string remarks)
        {
            claimHistory claimHistory = new claimHistory();

            claimHistory.claimId = claimId;
            claimHistory.statusId = statusId;
            claimHistory.actionBy = empId;
            claimHistory.remarks = remarks;
            TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
            claimHistory.statusTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

            db.claimHistories.Add(claimHistory);
            return db.SaveChanges();
        }

        // DELETE: api/claimJSONs/5
        [ResponseType(typeof(claimJSON))]
        public IHttpActionResult DeleteclaimJSON(int id)
        {
            claimJSON claimJSON = db.claimJSONs.Find(id);
            if (claimJSON == null)
            {
                return NotFound();
            }

            db.claimJSONs.Remove(claimJSON);
            db.SaveChanges();

            return Ok(claimJSON);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        [Route("api/getClaimLog/{claimId}")]
        [HttpGet] 

        public dynamic getClaimLog(int claimId)
        {

            db.Configuration.ProxyCreationEnabled = false;
            return db.claimLog(claimId);
        }

        [Route("api/getClaimLogByStatus/{claimId}/{StatusId}")]
        [HttpGet]

        public dynamic getClaimLogByStatus(int claimId, int StatusId)
        {

            db.Configuration.ProxyCreationEnabled = false;
            return db.getClaimLogByStatus(claimId,StatusId);
        }

        private bool claimJSONExists(int id)
        {
            return db.claimJSONs.Count(e => e.id == id) > 0;
        }


        [Route("api/getopenclaimsbyman/{ManagerId}")]
        [HttpGet] 

        public dynamic getOpenClaimsManager(int ManagerId) 
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.getOpenCliamsByManagerId(ManagerId);
        }

        [Route("api/getActiveClaims/{ManagerId}")]
        [HttpGet]

        public dynamic getActiveClaims(int ManagerId)
        {
            db.Configuration.ProxyCreationEnabled = false;

            return db.getCliamsByManagerId1(ManagerId).ToList();
            
            
            //var myEmps = db.getEmpDetofManager(ManagerId).ToList();

            //IEnumerable<int> empIds = myEmps.Select(f => f.EmpId);

            //return db.vSubmittedClaims
            //            .Where(e => empIds.Contains(e.empid) && e.claimstatus != 0 && e.claimstatus != 8)
            //            .Select(q => new
            //            {
            //                employeeInfo => db.Employees.FirstOrDefault(EI => EI.empid = q.empid}
            //            )
            //            .ToList();

            //.vSubmittedClaims
            //.Where(e => empIds.Contains(e.empid) && e.claimstatus != 0 && e.claimstatus != 8)
            //.Select(e => new
            //{
            //    employeeInfo = db.Employees.FirstOrDefault(ED => ED.EmpId == e.empid)
            //})
            ////.Include(r => r.employeeInfo)
            //.ToList();

        }

        [Route("api/getEmployeeManagers/{EmpId}")]
        [HttpGet]

        public dynamic getEmployeeManagers(int EmpId)
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.getManagerDetail(EmpId);
        }

        [Route("api/getAllClaimsByClient/{ClientId}")]
        [HttpGet]

        public dynamic getAllClaimsByClient(int ClientId)
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.getAllClaimsByClient1(ClientId);
        }


        [Route("api/getOrgEmployeeDetails/{EmpId}")]
        [HttpGet]

        public dynamic getOrgEmployeeDetails(int EmpId)
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.getOrgEmpDetail2(EmpId);
        }

        [Route("api/getDivIncharge/{EmpId}")]
        [HttpGet]

        public dynamic getDivIncharge(int EmpId)
        {
            return db.getGroupTypeIncharge1(EmpId);
        }




    }
}
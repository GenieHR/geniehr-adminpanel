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

            claimJSON claimJSON = db.claimJSONs.Find(id);
            if (claimJSON == null)
            {
                return NotFound();
            }

            return Ok(claimJSON);

            //return db.claimJSONs.Where(b => b.id == claimJSON.id)
            //                     .Include(b => b.Employee)
            //                     .ToList();


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
                    createClaimLog(claimJSON.id, claimJSON.claimstatus, claimJSON.EmpId,"Claim Created");
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


        [Route("api/draftClaimJSON")]
        [HttpPost]

        public dynamic postDraftclaimJSON(claimJSON claimJSON)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

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

        [Route("api/getEmployeeManagers/{EmpId}")]
        [HttpGet]

        public dynamic getEmployeeManagers(int EmpId)
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.getManagerDetail(EmpId);
        }

    }
}
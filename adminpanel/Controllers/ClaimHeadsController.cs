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

namespace Admin.Controllers
{
    public class ClaimHeadsController : ApiController
    {
        private ubietydbEntities db = new ubietydbEntities();

        // GET: api/ClaimHeads
        public IQueryable<ClaimHead> GetClaimHeads()
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.ClaimHeads;
        }

        // GET: api/ClaimHeads/5
        [ResponseType(typeof(ClaimHead))]
        public dynamic GetClaimHead(int id)
        {
            db.Configuration.ProxyCreationEnabled = false;

            var clmH = db.ClaimHeads
                        .Where(b => b.id == id) 
                        .Include(b => b.ClaimLines)
                        .Include(b => b.ClaimStatusHistories)
                        .ToList(); 
            
            return new { Claim = clmH };
        }

        // PUT: api/ClaimHeads/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutClaimHead(int id, ClaimHead claimHead)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != claimHead.id)
            {
                return BadRequest();
            }

            db.Entry(claimHead).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ClaimHeadExists(id))
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

        // POST: api/ClaimHeads
        [ResponseType(typeof(ClaimHead))]
        public IHttpActionResult PostClaimHead(ClaimHead claimHead)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.ClaimHeads.Add(claimHead);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = claimHead.id }, claimHead);
        }

        // DELETE: api/ClaimHeads/5
        [ResponseType(typeof(ClaimHead))]
        public IHttpActionResult DeleteClaimHead(int id)
        {
            ClaimHead claimHead = db.ClaimHeads.Find(id);
            if (claimHead == null)
            {
                return NotFound();
            }

            db.ClaimHeads.Remove(claimHead);
            db.SaveChanges();

            return Ok(claimHead);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ClaimHeadExists(int id)
        {
            return db.ClaimHeads.Count(e => e.id == id) > 0;
        }

        [Route("api/getLastClaimHead/{EmpId}")]
        [HttpGet]

        public dynamic getLastClaim(int EmpId)
        {
            db.Configuration.ProxyCreationEnabled = false;

            var clmH = (db.ClaimHeads
                        .Where(b => b.EmpId == EmpId)
                        .Count() + 1).ToString("000");

            return new { ClaimNo = clmH };
        }
    }
}
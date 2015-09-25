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
    public class ClaimLinesController : ApiController
    {
        private ubietydbEntities db = new ubietydbEntities();

        // GET: api/ClaimLines
        public IQueryable<ClaimLine> GetClaimLines()
        {
            return db.ClaimLines;
        }

        // GET: api/ClaimLines/5
        [ResponseType(typeof(ClaimLine))]
        public IHttpActionResult GetClaimLine(int id)
        {
            ClaimLine claimLine = db.ClaimLines.Find(id);
            if (claimLine == null)
            {
                return NotFound();
            }

            return Ok(claimLine);
        }

        // PUT: api/ClaimLines/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutClaimLine(int id, ClaimLine claimLine)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != claimLine.Id)
            {
                return BadRequest();
            }

            db.Entry(claimLine).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ClaimLineExists(id))
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

        // POST: api/ClaimLines
        [ResponseType(typeof(ClaimLine))]
        public IHttpActionResult PostClaimLine(ClaimLine claimLine)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.ClaimLines.Add(claimLine);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (ClaimLineExists(claimLine.Id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = claimLine.Id }, claimLine);
        }

        // DELETE: api/ClaimLines/5
        [ResponseType(typeof(ClaimLine))]
        public IHttpActionResult DeleteClaimLine(int id)
        {
            ClaimLine claimLine = db.ClaimLines.Find(id);
            if (claimLine == null)
            {
                return NotFound();
            }

            db.ClaimLines.Remove(claimLine);
            db.SaveChanges();

            return Ok(claimLine);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ClaimLineExists(int id)
        {
            return db.ClaimLines.Count(e => e.Id == id) > 0;
        }
    }
}
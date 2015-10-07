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
        public IHttpActionResult GetclaimJSON(int id)
        {
            claimJSON claimJSON = db.claimJSONs.Find(id);
            if (claimJSON == null)
            {
                return NotFound();
            }

            return Ok(claimJSON);
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
                db.SaveChanges();
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

        private bool claimJSONExists(int id)
        {
            return db.claimJSONs.Count(e => e.id == id) > 0;
        }
    }
}
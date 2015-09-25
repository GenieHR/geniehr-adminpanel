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
    public class GroupTypesController : ApiController
    {
        private ubietydbEntities db = new ubietydbEntities();

        // GET: api/GroupTypes
        public IQueryable<GroupType> GetGroupTypes()
        {
            return db.GroupTypes;
        }

        // GET: api/GroupTypes/5
        [ResponseType(typeof(GroupType))]
        public IHttpActionResult GetGroupType(int id)
        {
            GroupType groupType = db.GroupTypes.Find(id);
            if (groupType == null)
            {
                return NotFound();
            }

            return Ok(groupType);
        }

        // PUT: api/GroupTypes/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutGroupType(int id, GroupType groupType)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != groupType.Id)
            {
                return BadRequest();
            }

            db.Entry(groupType).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!GroupTypeExists(id))
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

        // POST: api/GroupTypes
        [ResponseType(typeof(GroupType))]
        public IHttpActionResult PostGroupType(GroupType groupType)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            
            db.GroupTypes.Add(groupType);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = groupType.Id }, groupType);
        }

        [Route("api/groupTypes/of/{ClientId}")]
        [HttpGet]

        public ICollection<GroupType> getGroupTypesOfClient(int ClientId)
        {
            List<GroupType> groupTypesCollection = new List<GroupType>();
            var context = new ubietydbEntities();
            context.Configuration.ProxyCreationEnabled = false;
            
                groupTypesCollection = context.GroupTypes.Where(b => b.ClientId == ClientId).ToList();
            
            return groupTypesCollection;
        }


        // DELETE: api/GroupTypes/5
        [ResponseType(typeof(GroupType))]
        public IHttpActionResult DeleteGroupType(int id)
        {
            GroupType groupType = db.GroupTypes.Find(id);
            if (groupType == null)
            {
                return NotFound();
            }

            db.GroupTypes.Remove(groupType);
            db.SaveChanges();

            return Ok(groupType);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool GroupTypeExists(int id)
        {
            return db.GroupTypes.Count(e => e.Id == id) > 0;
        }
    }
}
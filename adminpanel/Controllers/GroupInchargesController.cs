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
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity;

namespace adminpanel.Controllers
{
    public class GroupInchargesController : ApiController
    {
        private ubietydbEntities db = new ubietydbEntities();

        // GET: api/GroupIncharges
        public IQueryable<GroupIncharge> GetGroupIncharges()
        {
            return db.GroupIncharges;
        }

        // GET: api/GroupIncharges/5
        [ResponseType(typeof(GroupIncharge))]
        public IHttpActionResult GetGroupIncharge(int id)
        {
            GroupIncharge groupIncharge = db.GroupIncharges.Find(id);
            if (groupIncharge == null)
            {
                return NotFound();
            }

            return Ok(groupIncharge);
        }

        [Route("api/getIncharge/{GroupId}")]
        [HttpGet]
        public ICollection<GroupIncharge> getInchargeOfGroup(int GroupId)
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.GroupIncharges.Where(b => b.GroupId == GroupId).ToList();
        }


        [Route("api/make/{EmpId}/inchargeof/{GroupId}")]
        [HttpGet]
        public dynamic addInchargeToGroup(int EmpId, int GroupId)
        {
            db.Configuration.ProxyCreationEnabled = false;

            GroupIncharge gi = new GroupIncharge();

            gi.InchargeId = EmpId;
            gi.GroupId = GroupId;

            db.GroupIncharges.Add(gi);

            
            if (db.SaveChanges() == 1)
            {
                var userStore = new UserStore<IdentityUser>();
                var UserManager = new UserManager<IdentityUser>(userStore);
                var user = UserManager.FindById(db.Employees.Find(EmpId).AuthUserId);
               return UserManager.AddToRole(user.Id, "ClientAdmin");
            }

            return 0;
        }

        [Route("api/remove/{EmpId}/inchargeof/{GroupId}")]
        [HttpGet]
        public int removeEmpFromGroup(int GroupId, int EmpId)
        {
            GroupIncharge grpIncharge = db.GroupIncharges.Where(b => b.GroupId == GroupId && b.InchargeId == EmpId).FirstOrDefault();

            db.GroupIncharges.Remove(grpIncharge);

            db.SaveChanges();

            if (db.GroupIncharges.Where(b => b.InchargeId == EmpId).Count() == 0)
            {
                var userStore = new UserStore<IdentityUser>();
                var UserManager = new UserManager<IdentityUser>(userStore);
                var user = UserManager.FindById(db.Employees.Find(EmpId).AuthUserId);
                 UserManager.RemoveFromRole(user.Id, "ClientAdmin");
            }

            return 1;
        }

        // PUT: api/GroupIncharges/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutGroupIncharge(int id, GroupIncharge groupIncharge)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != groupIncharge.Id)
            {
                return BadRequest();
            }

            db.Entry(groupIncharge).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!GroupInchargeExists(id))
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

        // POST: api/GroupIncharges
        [ResponseType(typeof(GroupIncharge))]
        public IHttpActionResult PostGroupIncharge(GroupIncharge groupIncharge)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.GroupIncharges.Add(groupIncharge);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = groupIncharge.Id }, groupIncharge);
        }

        // DELETE: api/GroupIncharges/5
        [ResponseType(typeof(GroupIncharge))]
        public IHttpActionResult DeleteGroupIncharge(int id)
        {
            GroupIncharge groupIncharge = db.GroupIncharges.Find(id);
            if (groupIncharge == null)
            {
                return NotFound();
            }

            db.GroupIncharges.Remove(groupIncharge);
            db.SaveChanges();

            return Ok(groupIncharge);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool GroupInchargeExists(int id)
        {
            return db.GroupIncharges.Count(e => e.Id == id) > 0;
        }
    }
}
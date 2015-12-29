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
using System.Data.SqlClient;

namespace adminpanel.Controllers
{
    public class GroupEmployeesController : ApiController
    {
        private ubietydbEntities db = new ubietydbEntities();
        

        [Route("api/clientEmp/of/{clientId}/notingroup/{groupId}")]
        [HttpGet]
        public dynamic getEmployees(int clientId, int groupId)
        {
            db.Configuration.ProxyCreationEnabled = false;

            return db.getEmpOfGroups1(clientId, groupId).ToList();
        }

        [Route("api/addEmployee/{EmpId}/to/{GroupId}")]
        [HttpGet]
        public int addEmployeeToGroup(int EmpId, int GroupId)
        {
            db.Configuration.ProxyCreationEnabled = false;

            GroupEmployee ge = new GroupEmployee();

            ge.EmpId = EmpId;
            ge.GroupId = GroupId;


            db.GroupEmployees.Add(ge);
            return db.SaveChanges();
        }


        [Route("api/groupEmployees/{GroupId}")]
        [HttpGet]
        public ICollection<Employee> GetGrpEmps(int GroupId)
        {
            db.Configuration.ProxyCreationEnabled = false;

            List<GroupEmployee> groupEmployees = db.GroupEmployees
                                                        .Where(b => b.GroupId == GroupId)
                                                        .Include(b => b.Employee)
                                                        .ToList();

            List<Employee> empList = new List<Employee>();


            foreach (GroupEmployee employee in groupEmployees)
            {
                empList.Add(employee.Employee);
            }

            return empList;

        }

        [Route("api/removeEmployee/{EmpId}/from/{GroupId}")]
        [HttpGet]
        public int removeEmpFromGroup(int GroupId, int EmpId)
        {
            GroupEmployee grpEmployee = db.GroupEmployees.Where(b => b.GroupId == GroupId && b.EmpId == EmpId).FirstOrDefault();

            db.GroupEmployees.Remove(grpEmployee);
            
           return db.SaveChanges();

        }
        
        // GET: api/GroupEmployees
        public IQueryable<GroupEmployee> GetGroupEmployees()
        {
            return db.GroupEmployees;
        }

        // GET: api/GroupEmployees/5
        [ResponseType(typeof(GroupEmployee))]
        public IHttpActionResult GetGroupEmployee(int id)
        {
            GroupEmployee groupEmployee = db.GroupEmployees.Find(id);
            if (groupEmployee == null)
            {
                return NotFound();
            }

            return Ok(groupEmployee);
        }


        // PUT: api/GroupEmployees/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutGroupEmployee(int id, GroupEmployee groupEmployee)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != groupEmployee.Id)
            {
                return BadRequest();
            }

            db.Entry(groupEmployee).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!GroupEmployeeExists(id))
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

        // POST: api/GroupEmployees
        [ResponseType(typeof(GroupEmployee))]
        public IHttpActionResult PostGroupEmployee(GroupEmployee groupEmployee)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.GroupEmployees.Add(groupEmployee);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = groupEmployee.Id }, groupEmployee);
        }

        // DELETE: api/GroupEmployees/5
        [ResponseType(typeof(GroupEmployee))]
        public IHttpActionResult DeleteGroupEmployee(int id)
        {
            GroupEmployee groupEmployee = db.GroupEmployees.Find(id);
            if (groupEmployee == null)
            {
                return NotFound();
            }

            db.GroupEmployees.Remove(groupEmployee);
            db.SaveChanges();

            return Ok(groupEmployee);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool GroupEmployeeExists(int id)
        {
            return db.GroupEmployees.Count(e => e.Id == id) > 0;
        }
    }
}
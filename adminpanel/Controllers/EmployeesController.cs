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
using System.Web.Configuration;
using System.Threading.Tasks;
using System.Web;
using adminpanel.Models;
using UbietyDataServices.Models;

namespace Admin.Controllers
{
    public class EmployeesController : ApiController
    {
        private ubietydbEntities db = new ubietydbEntities();



        [Route("GetEmpDetail/of/{id}")]
        [HttpGet]
        public dynamic GetEmpDetailsOf(int id)
        {
            var context = new ubietydbEntities();
            context.Configuration.ProxyCreationEnabled = false;

            var dataset2 = (from recordset in context.Employees
                            where recordset.EmpId == id
                            select new EmployeeDTO
                            {
                                EmpId = recordset.EmpId,
                                EmpNum = recordset.EmpNum,
                                EmpName = recordset.EmpName,
                                Email = recordset.Email,
                                MobileNum = recordset.PrimaryMobile,
                                ProfilePicURL = recordset.ProfilePic
                            });
            return new { employee = dataset2 };
        }

        // GET: api/Employees
        public IQueryable<Employee> GetEmployees()
        {
            return db.Employees;
        }

        // GET: api/Employees/5
        [ResponseType(typeof(Employee))]
        public IHttpActionResult GetEmployee(int id)
        {
            Employee employee = db.Employees.Find(id);
            if (employee == null)
            {
                return NotFound();
            }

            return Ok(employee);
        }

        // PUT: api/Employees/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutEmployee(int id, Employee employee)
        {
            
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != employee.EmpId)
            {
                return BadRequest();
            }

            db.Entry(employee).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EmployeeExists(id))
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

        // POST: api/Employees
        [ResponseType(typeof(Employee))]
        public IHttpActionResult PostEmployee(Employee employee)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var userStore = new UserStore<IdentityUser>();
            var manager = new UserManager<IdentityUser>(userStore);

            var user = new IdentityUser() { UserName = employee.Email, Email = employee.Email, PhoneNumber = employee.PrimaryMobile.ToString() };

            // TODO Environment Varialbe
            
            IdentityResult result = manager.Create(user, WebConfigurationManager.AppSettings["DefaultPassword"]);
        
            // IdentityResult result = manager.Create(user, Environment.GetEnvironmentVariable("DefaultPassword"));

            if (result.Succeeded)
            {
                string roleid = employee.EmpStatus == 4?"ClientEmployee":"ClientAdmin";
                employee.AuthUserId = user.Id;
                employee.ProfilePic = "0";
                employee.EmpStatus = 1;
                db.Employees.Add(employee);

                if (db.SaveChanges() != 1)
                { 
                     manager.Delete(user);
                }
                else
                {
                    manager.AddToRole(employee.AuthUserId, "ClientEmployee");
                    manager.AddToRole(employee.AuthUserId, roleid);
                }
            }
            return CreatedAtRoute("DefaultApi", new { id = employee.EmpId }, employee);
        }

        // DELETE: api/Employees/5
        [ResponseType(typeof(Employee))]
        public IHttpActionResult DeleteEmployee(int id)
        {
            Employee employee = db.Employees.Find(id);
            if (employee == null)
            {
                return NotFound();
            }

            db.Employees.Remove(employee);
            db.SaveChanges();

            return Ok(employee);
        }

        [Route("api/getempdetail/of/{id}")]
        [HttpGet]
        public dynamic GetEmpDetailsOfEmpId(int id)
        {
            var context = new ubietydbEntities();
            context.Configuration.ProxyCreationEnabled = false;

            var dataset2 = (from recordset in context.Employees
                            where recordset.EmpId == id
                            select new EmployeeDTO
                            {
                                EmpId = recordset.EmpId,
                                EmpNum = recordset.EmpNum,
                                EmpName = recordset.EmpName,
                                Email = recordset.Email,
                                MobileNum = recordset.PrimaryMobile,
                                ProfilePicURL = recordset.ProfilePic
                            });
            return new { employee = dataset2 };
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool EmployeeExists(int id)
        {
            return db.Employees.Count(e => e.EmpId == id) > 0;
        }

        
        [Route("api/clientEmployees/{ClientId}")]
        [HttpGet]
        public ICollection<Employee> GetOrgEmp(int ClientId)
        {
            var context = new ubietydbEntities();
            context.Configuration.ProxyCreationEnabled = false;

            var empclients = context.Employees.Where(b => b.CompanyId == ClientId).ToList();
            return empclients;
        }

        [Route("api/getMyEmps/{ManagerId}")]
        [HttpGet]
        public dynamic getMyEmps(int ManagerId)
        {
            db.Configuration.ProxyCreationEnabled = false;

            return db.getEmpDetofManager(ManagerId);
        }


        //public dynamic addEmployeeToRole(int EmpId, string RoleId)
        //{
        //    var userStore = new UserStore<IdentityUser>();
        //    var manager = new UserManager<IdentityUser>(userStore);

        //    Employee emp = db.Employees.Find(EmpId);

        //    return ; 
        //}
    }
}
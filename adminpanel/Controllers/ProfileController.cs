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
    public class ProfileController : ApiController
    {

        private ubietydbEntities db = new ubietydbEntities();


        [Route("GetFullProfileDetail/{EmpId}")]
        [HttpGet]
        public dynamic getEmpProfileDetails(int EmpId)
        {
            db.Configuration.ProxyCreationEnabled = false;

            return db.empProfBasicDetails(EmpId);
        }

        [Route("PostFinDetail/")]
        [HttpPost]

        //public int putFinDetail(EmpFinDetail empFinDetail)
        public int putFinDetail(EmpFinDetail empFinDetail)
        {

            db.Configuration.ProxyCreationEnabled = false;

            EmpFinDetail lEmpFinDetails = new EmpFinDetail();

            lEmpFinDetails = db.EmpFinDetails.Find(empFinDetail.EmpId);

             TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
             DateTime currentTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

            if (lEmpFinDetails == null)
            {
                empFinDetail.created = currentTime;
                db.EmpFinDetails.Add(empFinDetail);
            }

            else
            {
                lEmpFinDetails.AccountNum = empFinDetail.AccountNum;
                lEmpFinDetails.BankName = empFinDetail.BankName;
                lEmpFinDetails.BranchName = empFinDetail.BranchName;
                lEmpFinDetails.IFSCCode = empFinDetail.IFSCCode;
                lEmpFinDetails.SwiftCode = empFinDetail.SwiftCode;
                lEmpFinDetails.modified = currentTime;

                db.Entry(lEmpFinDetails).State = EntityState.Modified;
            }

            return db.SaveChanges();
        }

        [Route("PostBasicDetail/")]
        [HttpPost]
        public int putBasicDetail(EmployeeDetail employeeDetail)
        {
            db.Configuration.ProxyCreationEnabled = false;

            EmployeeDetail lEmployeeDetail = new EmployeeDetail();

            lEmployeeDetail = db.EmployeeDetails.Find(employeeDetail.EmpId);

            TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
            DateTime currentTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

            if (lEmployeeDetail == null)
            {
                employeeDetail.created = currentTime;
                db.EmployeeDetails.Add(employeeDetail);
            }

            else
            {
                lEmployeeDetail.FirstName = employeeDetail.FirstName;
                lEmployeeDetail.MiddleName = employeeDetail.MiddleName;
                lEmployeeDetail.LastName = employeeDetail.LastName;
                lEmployeeDetail.DOB = employeeDetail.DOB;
                lEmployeeDetail.FatherName = employeeDetail.FatherName;
                lEmployeeDetail.MotherName = employeeDetail.MotherName;
                lEmployeeDetail.SpouseName = employeeDetail.SpouseName;
                lEmployeeDetail.Gender = employeeDetail.Gender;
                lEmployeeDetail.BloodGroup = employeeDetail.BloodGroup;
                lEmployeeDetail.MaritalStatus = employeeDetail.MaritalStatus;

                lEmployeeDetail.modified = currentTime;
                
                db.Entry(lEmployeeDetail).State = EntityState.Modified;
            }

            return db.SaveChanges();
        }

        [Route("GetFinDetail/{EmpId}")]
        [HttpGet]
        public dynamic getEmpFinDetails(int EmpId)
        {
            db.Configuration.ProxyCreationEnabled = false;

            return (from recordset in db.EmpFinDetails where recordset.EmpId == EmpId select recordset).FirstOrDefault();
        }

        [Route("GetIdentity/{EmpId}")]
        [HttpGet]
        public dynamic EmpIdentities(int EmpId)
        {
            db.Configuration.ProxyCreationEnabled = false;

            return (from recordset in db.EmpIdentities where recordset.EmpID == EmpId select recordset).FirstOrDefault();
        }
    }
}

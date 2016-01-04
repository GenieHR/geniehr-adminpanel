using adminpanel.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Azure;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;

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

        [Route("PostIDDetail/")]
        [HttpPost]
        public int putIDNumber(IDDoc idDoc)
        {
            db.Configuration.ProxyCreationEnabled = false;

            TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
            DateTime currentTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

            EmpIdentity empIdentity = db.EmpIdentities.Find(idDoc.EmpId);

            if (!(empIdentity == null)) {

                if (idDoc.doctype.Equals("pan")) empIdentity.Pan = idDoc.DocNum;
                if (idDoc.doctype.Equals("dl")) empIdentity.DL = idDoc.DocNum;
                if (idDoc.doctype.Equals("voter")) empIdentity.Voter = idDoc.DocNum;
                if (idDoc.doctype.Equals("passport")) empIdentity.Passport = idDoc.DocNum;
                if (idDoc.doctype.Equals("adhaar")) empIdentity.Adhaar = idDoc.DocNum;
    
                empIdentity.modified = currentTime;
                db.Entry(empIdentity).State = EntityState.Modified;
            
            }
            else
            {
                empIdentity = new EmpIdentity();

                empIdentity.EmpID = idDoc.EmpId;

                if (idDoc.doctype.Equals("pan")) empIdentity.Pan = idDoc.DocNum;
                if (idDoc.doctype.Equals("dl")) empIdentity.DL = idDoc.DocNum;
                if (idDoc.doctype.Equals("voter")) empIdentity.Voter = idDoc.DocNum;
                if (idDoc.doctype.Equals("passport")) empIdentity.Passport = idDoc.DocNum;
                if (idDoc.doctype.Equals("adhaar")) empIdentity.Adhaar = idDoc.DocNum;
                
                empIdentity.created = currentTime;
                db.EmpIdentities.Add(empIdentity);
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

        [Route("putEmpContact/")]
        [HttpPost]
        public int postContactDetail(EmpContacts empContact)
        {
            db.Configuration.ProxyCreationEnabled = false;

            EmpContactDetail empContactDetail = new EmpContactDetail();

            empContactDetail.EmpId = empContact.EmpId;
            empContactDetail.contactTypeId = empContact.contactType;
            empContactDetail.contactLable = empContact.contactLable;
            empContactDetail.contactData = empContact.contactData;
            empContactDetail.contactLineId = db.getNextContactLineId(empContact.EmpId).First() ?? 0;

            db.EmpContactDetails.Add(empContactDetail);

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


        [Route("getEmpContact/{EmpId}")]
        [HttpGet]
        public dynamic getContactDetail(int EmpId)
        {
            db.Configuration.ProxyCreationEnabled = false;

            return db.getEmpContactDetail(EmpId);

        }

        [Route("putQualDetails/")]
        [HttpPost]

        public int postQualificationDetail(EmpQualification empQualificaiton)
        {
            db.Configuration.ProxyCreationEnabled = false;
            TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
            DateTime currentTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

            empQualificaiton.createdate = currentTime;

            db.EmpQualifications.Add(empQualificaiton);

            return db.SaveChanges();
        }

        [Route("PostPastEmp/")]
        [HttpPost]

        public int postPastEmployment(EmpPastEmp empPastEmp)
        {
            db.Configuration.ProxyCreationEnabled = false;

            TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
            DateTime currentTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

            empPastEmp.CreateDate = currentTime;

            db.EmpPastEmps.Add(empPastEmp);

            return db.SaveChanges();
        }


        [Route("putEmpAddress/")]
        [HttpPost]
        public int postContactDetail(EmpAddressDetail empAddressDetail)
        {
            db.Configuration.ProxyCreationEnabled = false;

            Address address = new Address();

            address.AddressName = empAddressDetail.AddressName;
            address.Address1 = empAddressDetail.Address1;
            address.Address2 = empAddressDetail.Address2;
            address.City = empAddressDetail.City;
            address.State = empAddressDetail.State;
            address.Pincode = empAddressDetail.PinCode;
            address.AddressTypId = empAddressDetail.AddressType;

            db.Addresses.Add(address);

            if (db.SaveChanges() == 1)
            {
                EntityAddress entityAddress = new EntityAddress();
                entityAddress.AddressId = address.AddressId;
                entityAddress.EntityTypId = 1;
                entityAddress.EntityId = empAddressDetail.EmpId;
                db.EntityAddresses.Add(entityAddress);
            }

            return db.SaveChanges();
        }

        [Route("getEmpShortAddressList/{EmpId}")]
        [HttpGet]
        public dynamic postContactDetail(int EmpId)
        {
            return db.getShortAddress(1, EmpId);
        }

        [Route("change/")]
        [HttpPost]

        public IdentityResult changePassword(passwordModel pm)
        {
            Employee emp = db.Employees.Find(pm.EmpId);

            var userStore = new UserStore<IdentityUser>();
            var UserManager = new UserManager<IdentityUser>(userStore);

            var user = UserManager.FindByName(emp.Email);

            return UserManager.ChangePassword(user.Id, pm.oldPassword, pm.newPassword);

        }


        [Route("getIDocUploads/{EmpId}")]
        [HttpGet]

        public dynamic getIDocUploads(int EmpId)
        {
            CloudStorageAccount storageAccount = CloudStorageAccount.Parse(System.Configuration.ConfigurationManager.AppSettings["StorageConnectionString"]);
            CloudBlobClient blobClient = storageAccount.CreateCloudBlobClient();
            CloudBlobContainer container = blobClient.GetContainerReference("identity");

            IEnumerable<IListBlobItem> listBlobs = container.ListBlobs(EmpId + "/", true);

            List<string> iDocList = new List<string>();

            string urlName =  System.Configuration.ConfigurationManager.AppSettings["GenericURL"] + "identity/" + EmpId + "/";

            for (int i = 0; i < listBlobs.Count(); i++)
            {
                iDocList.Add(listBlobs.ElementAt(i).Uri.ToString().Replace(urlName, ""));
            }

            return iDocList;

        }

        [Route("deleteIDoc/{DocId}")]
        [HttpGet]

        public int deleteIDoc(string DocId)
        {
            CloudStorageAccount storageAccount = CloudStorageAccount.Parse(System.Configuration.ConfigurationManager.AppSettings["StorageConnectionString"]);
            CloudBlobClient blobClient = storageAccount.CreateCloudBlobClient();
            CloudBlobContainer container = blobClient.GetContainerReference("identity");
            CloudBlob blob = container.GetBlobReference(DocId.Replace("-","/").Replace("_","."));

            try
            {
                blob.Delete();
                return 1;
            }
            catch
            {
                return -1;
            }
        }

        [Route("getRelations/")]
        [HttpGet]

        public IEnumerable<Relation> getRelations()
        {
            db.Configuration.ProxyCreationEnabled = false;

            return db.Relations.ToList();
        }

        [Route("postEmergencyContact/")]
        //[ResponseType(typeof(EmergencyContact))]

        [HttpPost]
        public int postEmergencyContact(EmerContactModal emerContactModal)
        {
            db.Configuration.ProxyCreationEnabled = false;

            TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
            DateTime currentTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

            EmpContactDetail ecd = new EmpContactDetail();
            
            if (emerContactModal.stdcode != null)
            {
                ecd.contactTypeId = 5;
                ecd.contactLable = emerContactModal.contactName;
                ecd.contactData = emerContactModal.stdcode + "-" + emerContactModal.phonenumber;
                ecd.contactLineId = db.getNextContactLineId(emerContactModal.EmpId).First() ?? 0;
                ecd.EmpId = emerContactModal.EmpId;
                db.EmpContactDetails.Add(ecd);
                db.SaveChanges();
            }

            if (emerContactModal.emailAddress != null)
            {
                ecd = new EmpContactDetail();
                ecd.contactTypeId = 4;
                ecd.contactLable = emerContactModal.contactName;
                ecd.contactData = emerContactModal.emailAddress;
                ecd.contactLineId = db.getNextContactLineId(emerContactModal.EmpId).First() ?? 0;
                ecd.EmpId = emerContactModal.EmpId;
                db.EmpContactDetails.Add(ecd);
                db.SaveChanges();
            }

            if (emerContactModal.mobileNumber.ToString() != null)
            {
                ecd = new EmpContactDetail();
                ecd.contactTypeId = 3;
                ecd.contactLable = emerContactModal.contactName;
                ecd.contactData = emerContactModal.mobileNumber.ToString();
                ecd.contactLineId = db.getNextContactLineId(emerContactModal.EmpId).First() ?? 0;
                ecd.EmpId = emerContactModal.EmpId;
                db.EmpContactDetails.Add(ecd);
                db.SaveChanges();
            }

            Address address = new Address();

            address.AddressName = emerContactModal.contactName;
            address.AddressTypId = 5;
            address.Address1 = emerContactModal.address1;
            address.Address2 = emerContactModal.address2;
            address.City = emerContactModal.city;
            address.State = emerContactModal.state;
            address.Pincode = emerContactModal.pincode;

            db.Addresses.Add(address);

            if (db.SaveChanges() == 1)
            {
                EntityAddress ea = new EntityAddress();

                ea.EntityId = emerContactModal.EmpId;
                ea.EntityTypId = 3;
                ea.AddressId = address.AddressId;

                db.EntityAddresses.Add(ea);

                if (db.SaveChanges() == 1) 
                { 
                    EmergencyContact ec = new EmergencyContact();

                    ec.EmpId = emerContactModal.EmpId;
                    ec.ContactName = emerContactModal.contactName;
                    ec.Relation = emerContactModal.relation;

                    ec.entityaddressid = ea.EntityAddressId;

                    ec.createdate = currentTime;
                    db.EmergencyContacts.Add(ec);

                    return db.SaveChanges();
                }
            }
            return -1;            
        }

        [Route("getEmergencySummary/{EmpId}")]
        [HttpGet]
        public dynamic getEmergencySummary(int EmpId)
        {
            return db.getEmergencyHeader(EmpId);
        }


        [Route("getQual/")]
        [HttpGet]
        public List<QualDTO> getQual()
        {
            db.Configuration.ProxyCreationEnabled = false;

            return (from recordset in db.Qualifications
                    select new QualDTO
                    {
                        QualId = recordset.Id,
                        QualName = recordset.QualificationName
                    }).ToList();
        }

        [Route("getpastEmpSummary/{EmpId}")]
        [HttpGet]
        public List<PastEmpDTO> pastEmp(int EmpId)
        {
            db.Configuration.ProxyCreationEnabled = false;

            return (from recordset in db.EmpPastEmps
                    where recordset.EmpId == EmpId
                    select new PastEmpDTO
                    {
                        pastEmpId = recordset.Id,
                        companyName = recordset.Company,
                        designation = recordset.Designation
                    }).ToList();
        }


        [Route("getDegreeByQual/{QualId}")]
        [HttpGet]
        public List<DegreeDTO> getDegreeByQual(int QualId)
        {
            db.Configuration.ProxyCreationEnabled = false;

            if (QualId != 0) { 
            return (from recordset in db.Degrees
             where recordset.Qualification == QualId
             select new DegreeDTO
             {
                 DegreeId = recordset.Id,
                 DegreeName = recordset.DegreeName
             }).ToList();
            }
            else
            {
                return (from recordset in db.Degrees
                        select new DegreeDTO
                        {
                            DegreeId = recordset.Id,
                            DegreeName = recordset.DegreeName
                        }).ToList();
            }
        }

        [Route("getQualSummary/{EmpId}")]
        [HttpGet]
        public dynamic getQualSummary(int EmpId)
        {
            db.Configuration.ProxyCreationEnabled = false;


            return db.qualsummary(EmpId).ToList();
        }


    }
}


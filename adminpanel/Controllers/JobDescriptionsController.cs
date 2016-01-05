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
using Newtonsoft.Json.Linq;

namespace adminpanel.Controllers
{
    public class JobDescriptionsController : ApiController
    {
        private ubietydbEntities db = new ubietydbEntities();

        [Route("getorgclients/{EmpId}")]
        [HttpGet]

        public dynamic getOrgClients(int EmpId)
        {
            return db.GetAllClientsOfEmpOrg(EmpId);
        }

        [Route("getCertifications/")]
        [HttpGet]
        public dynamic getCertification()
        {

            var certification = (from recordset in db.Certifications
                       select new CertificationDTO
                       {
                           Id = recordset.Id,
                           CertificationName = recordset.CertificationName
                       });

            return certification.ToList();
        }

        [Route("getBenefits/")]
        [HttpGet]
        public dynamic getBenefits()
        {
            var benefits = (from recordset in db.Benefits
                                 select new BenefitDTO
                                 {
                                     Id = recordset.Id,
                                     BenefitName = recordset.BenefitName
                                 });
            return benefits.ToList();
        }

        [Route("postJD/")]
        [HttpPost]

        public dynamic postJD(JdDTO jddto)
        {

            TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
            DateTime currentTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

            JobDescription jd = new JobDescription();
            int jdId = 0;
            int retVal = -1;
            jd.JobTitle = jddto.JobTitle;
            jd.JobShortName = jddto.JobShortName;
            jd.CleintId = jddto.CleintId;
            jd.JobLocation = jddto.JobLocation;
            jd.Openings = jddto.Openings;
            jd.JobNotes = jddto.JobNotes;

            jd.ExpFrom = jddto.ExpFrom;
            jd.ExpTo = jddto.ExpTo;
            jd.RExpFrom = jddto.RExpFrom;
            jd.RExpTo = jddto.RExpTo;
            jd.Salary = jddto.Salary;
            jd.SalaryTo = jddto.SalaryTo;

            jd.CreatedDate = currentTime;
            jd.CreatedBy = jddto.CreatedBy;

            db.JobDescriptions.Add(jd);


            if (db.SaveChanges() == 1) {

                jdId = jd.Id;
                retVal = 0;

                JArray skillList = JArray.Parse(jddto.skillList);

                foreach (string skillId in skillList)
                {
                    JobSkill jobSkill = new JobSkill();
                    jobSkill.JobId = jdId;
                    jobSkill.SkillId = Int32.Parse(skillId);
                    db.JobSkills.Add(jobSkill);
                }

                try
                { 
                        JArray certification = JArray.Parse(jddto.certification);
                        foreach(string certificate in certification)
                        {
                            JobCertification jobcerti = new JobCertification();
                            jobcerti.CertificationId = Int32.Parse(certificate);
                            jobcerti.JobId = jdId;
                            db.JobCertifications.Add(jobcerti);
                        }
                }
                catch (Exception ex) { }

                try
                {
                    JArray qualification = JArray.Parse(jddto.qualification);
                        foreach(string degree in qualification)
                        {
                            JobQualification jobqual = new JobQualification();
                            jobqual.DegreeId = Int32.Parse(degree);
                            jobqual.JobId = jdId;
                            db.JobQualifications.Add(jobqual);       
                        }
                }
                catch (Exception ex) { }

                try
                {
                    JArray beneifts = JArray.Parse(jddto.benefit);
                        foreach(string benefit in beneifts)
                        {
                            JObject benefitObject = JObject.Parse(benefit);
                            JobBenefit jobBenefit = new JobBenefit();
                            jobBenefit.JobId = jdId;
                            jobBenefit.BenefitId = Int32.Parse((string)benefitObject["benefitId"]);
                            jobBenefit.BenefitDesc = (string)benefitObject["benefitRem"];
                            db.JobBenefits.Add(jobBenefit);
                        }
                }
                catch (Exception ex) { }  

                retVal = db.SaveChanges();
            }
            return retVal;
        }
        [Route("getJD/")]
        [HttpGet]

        public List<jobIDEmpDTO> getJD()
        {
            var jobIdList = db.GetJobId().ToList();
            List<jobIDEmpDTO> jobIDEmpDTOList = new List<jobIDEmpDTO>();

            foreach (var JobId in jobIdList)
            {
                jobIDEmpDTO vari = new jobIDEmpDTO(JobId.Id,JobId.JobShortName,JobId.JobTitle,JobId.ClientName,JobId.JobLocation);

                vari.empIdJobId = ( from recordset in db.EmpJDs
                                    where recordset.JDId == JobId.Id
                                    select new empIdJobId { EmpId = recordset.EmpId, EmpName = recordset.Employee.EmpName}).ToList();

                jobIDEmpDTOList.Add(vari);
            }
            return jobIDEmpDTOList;
        }

        [Route("getEmpNotInJD/{JDId}")]
        [HttpGet]
        public dynamic getEmpNotInJD(int JDId)
        {
            return db.getOrgEmpNotInJdId(JDId);
        }


    }


    
}
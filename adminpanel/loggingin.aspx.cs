using adminpanel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNet.Identity;
using System.Security;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity.EntityFramework;


namespace Admin
{
    public partial class loggingin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String str = System.Web.HttpContext.Current.User.Identity.GetUserId();
            using (var context = new ubietydbEntities())
            {
                var employee = context.Employees
                   .Where(b => b.AuthUserId.Equals(str))
                   .FirstOrDefault();

                Session["EmpId"] = employee.EmpId;
                Session["loggedinuserName"] = employee.EmpName;
                Session["Designation"] = employee.Designation;
                Session["EmpNum"] = employee.EmpNum;

                if (System.Web.HttpContext.Current.User.IsInRole("ClientAdmin"))
                {
                    Session["ClientId"] = employee.CompanyId;
                    Response.Redirect("~/GroupManagement.aspx");
                }
                if (System.Web.HttpContext.Current.User.IsInRole("OrgEmployee"))
                {
                    Response.Redirect("~/showclients.aspx");
                }
                else if (System.Web.HttpContext.Current.User.IsInRole("ClientEmployee"))
                {
                    Response.Redirect("~/AddClaim.aspx");
                }
                else if (System.Web.HttpContext.Current.User.IsInRole("SuperAdmin"))
                {
                    Response.Redirect("~/Dashboard.aspx");
                }
            }
        }
    
    }
}
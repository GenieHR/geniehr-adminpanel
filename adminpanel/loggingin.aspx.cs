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

                
                if (System.Web.HttpContext.Current.User.IsInRole("OrgEmployee"))
                {
                    Response.Redirect("~/showclients.aspx");
                }
                else if (System.Web.HttpContext.Current.User.IsInRole("ClientAdmin"))
                {
                    Session["EmpId"] = employee.EmpId;

                    Session["ClientId"] = employee.CompanyId;
                    Session["SelectClientId"] = employee.CompanyId;

                    Client client = context.Clients.Find(employee.CompanyId);
                    Session["ClientName"] = client.ClientName;

                    Response.Redirect("~/GroupManagement.aspx");
                }
                else if (System.Web.HttpContext.Current.User.IsInRole("ClientManager"))
                {
                    Session["ClientId"] = employee.CompanyId;
                    Session["SelectClientId"] = employee.CompanyId;

                    Client client = context.Clients.Find(employee.CompanyId);
                    Session["ClientName"] = client.ClientName;

                    //var emp = context.getEmpsofManager(employee.EmpId);

                    Response.Redirect("~/main.aspx");
                }
                else if (System.Web.HttpContext.Current.User.IsInRole("ClientEmployee"))
                {
                    Session["ClientId"] = employee.CompanyId;
                    Session["SelectClientId"] = employee.CompanyId;

                    Client client = context.Clients.Find(employee.CompanyId);
                    Session["ClientName"] = client.ClientName;

                    Response.Redirect("~/Claim.aspx");
                }
                else if (System.Web.HttpContext.Current.User.IsInRole("SuperAdmin"))
                {
                    Response.Redirect("~/Dashboard.aspx");
                }
                
            }
        }
    
    }
}
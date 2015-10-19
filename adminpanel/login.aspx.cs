using adminpanel.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

       //     var userStore = new UserStore<IdentityUser>();
       //     var manager = new UserManager<IdentityUser>(userStore);

           // var user = new IdentityUser();

           //user =  ;

        //    manager.Delete(manager.FindById("9d334fe5-f2e9-4c14-bc1d-68c1ad9d1e4e"));

            //var roleManager = new RoleManager<Microsoft.AspNet.Identity.EntityFramework.IdentityRole>(new RoleStore<IdentityRole>(new ApplicationDbContext()));
            // if (!roleManager.RoleExists("SuperAdmin"))
            //roleManager.Create(new IdentityRole("OrgAdmin"));
            //roleManager.Create(new IdentityRole("OrgManager"));
            //roleManager.Create(new IdentityRole("OrgEmployee"));
            //roleManager.Create(new IdentityRole("ClientAdmin"));
            //roleManager.Create(new IdentityRole("ClientManager"));
            //roleManager.Create(new IdentityRole("ClientEmployee"));

			//DefaultConnection1 context = new DefaultConnection1();

            var userStore = new UserStore<IdentityUser>();
            var UserManager = new UserManager<IdentityUser>(userStore);

        //try
        //{
            //var user = UserManager.FindByName("laks@geniehr.com");
            //UserManager.AddToRole(user.Id, "ClientAdmin");
            
            //UserManager.RemoveFromRole(user.Id, "ClientManager");

            //var user = UserManager.FindByName("yogi.tomer@gmail.com");
            //UserManager.AddToRole(user.Id, "ClientEmployee");


        //    user = UserManager.FindByName("preeti.negi@geniehr.com");
        //    UserManager.AddToRole(user.Id, "OrgEmployee");

        //    user = UserManager.FindByName("laks@geniehr.com");
        //    UserManager.AddToRole(user.Id, "SuperAdmin");
        //}
        //catch
        //{
        //    throw;
        //}

        }

        protected override void OnInit(EventArgs e)
        {
            Button b = new Button();
            b.CssClass = "btn btn-primary block full-width m-b";
            b.ID = "Button";
            b.Text = "Login";
            
            b.Click += new EventHandler(b_Click);
            form1.Controls.Add(b);
        }

        void b_Click(object sender, EventArgs e)
        {
            var userStore = new UserStore<IdentityUser>();

            TextBox tbUserName = (TextBox)form1.FindControl("username");
            TextBox tbPassword = (TextBox)form1.FindControl("password");

            var userManager = new UserManager<IdentityUser>(userStore);
            var user = userManager.Find(tbUserName.Text, tbPassword.Text);

            if (user != null)
            {
                var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                var userIdentity = userManager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);

                authenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = false }, userIdentity);

                Response.Redirect("~/loggingin.aspx");
            }
            else
            {
                Response.Redirect("~/Login.aspx?credentials=wrong");
            }
        }
    }
}
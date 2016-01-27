using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace adminpanel.Org
{
    public partial class viewClaim : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (System.Web.HttpContext.Current.User.IsInRole("OrgManager"))
            {
                this.MasterPageFile = "~/Org/OrgManager.Master";
            }

            else if (System.Web.HttpContext.Current.User.IsInRole("OrgEmployee"))
            {
                this.MasterPageFile = "~/Org/OrgTemplate1.Master";
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}
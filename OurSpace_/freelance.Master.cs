using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ourspace
{
    public partial class freelance : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Session["freelance"] as String))
            {
                Response.Redirect("freelance_login.aspx");
            }
            else
            { 
                
            }

        }

        protected void lbtnlogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session["freelance"] = "";
            Response.Redirect("freelance_login.aspx");
        }
    }
}
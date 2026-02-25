using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ourspace
{
    public partial class admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Session["admin"] as String))
            {
                Response.Redirect("admin_login.aspx");
            }
            else
            {
                lbluser.Text = "Welcome-:" + Session["admin"].ToString();
            }

        }

        protected void lbtnlogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session["admin"] = "";
            Response.Redirect("admin_login.aspx");
        }
    }
}
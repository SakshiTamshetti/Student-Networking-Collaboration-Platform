using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ourspace
{
    public partial class student : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Session["student"] as String))
            {
                Response.Redirect("student_login.aspx");
            }
            else
            {
                utility u = new utility();
                lblwelcome.Text = "Welcome- " + u.getstudentnamebyemail(Session["student"].ToString());
            }
        }

        protected void lbtnlogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session["student"] = "";
            Response.Redirect("student_login.aspx");
        }
    }
}
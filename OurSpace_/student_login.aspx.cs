using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ourspace
{
    public partial class student_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            utility u = new utility();
            SqlConnection cn = u.connection();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "select * from studenttbl where email=@email and pass=@pass";
            cmd.Parameters.AddWithValue("@email", txtemail.Text.Trim());
            cmd.Parameters.AddWithValue("@pass",txtpass.Text.Trim());
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                Session["student"] = txtemail.Text.Trim();
                Response.Redirect("student_add_project.aspx");
            }
            else
            {
                Response.Write("<script>alert('Incorrect Credentials')</script>");
            }
        }

        protected void btnsignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("student_reg.aspx");
        }
    }
}
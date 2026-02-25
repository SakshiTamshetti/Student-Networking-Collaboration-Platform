using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ourspace
{
    public partial class admin_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from admintbl where username=@username and password=@password";
            cmd.Parameters.AddWithValue("@username",txtusername.Text.Trim());
            cmd.Parameters.AddWithValue("@password", txtpass.Text.Trim());
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                Session["admin"] = txtusername.Text.Trim();
                Response.Redirect("aproject_list.aspx");
            }
            else
            {
                Response.Write("<script>alert('Invalid Credentials !')</script>");
                txtusername.Text = "";
                txtusername.Focus();
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ourspace
{
    public partial class student_change_pass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnchange_Click(object sender, EventArgs e)
        {
            utility u = new utility();
            SqlConnection cn = u.connection();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "select * from studenttbl where email=@email and pass=@pass";
            cmd.Parameters.AddWithValue("@email", Session["student"]);
            cmd.Parameters.AddWithValue("@pass", txtoldpass.Text.Trim());
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Dispose();
                cmd.CommandText = "update studenttbl set pass=@newpass where email=@email";
                cmd.Parameters.AddWithValue("@newpass",txtnpass.Text);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Password Changed Successfully')</script>");
                txtcnpass.Text = "";
                txtnpass.Text = "";
                txtoldpass.Text = "";
            }
            else
            {
                Response.Write("<script>alert('Invalid Old Password')</script>");
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ourspace
{
    public partial class student_view_projects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Session["student"] as String))
            {
                Response.Redirect("student_login.aspx");
            }
            else
            {
                loadownprojects(Session["student"].ToString());
            }
        }

        public void loadownprojects(String studentemail)
        {
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from upstudent where puseremail=@email";
            cmd.Parameters.Add("@email", studentemail);
            SqlDataReader dr = cmd.ExecuteReader();
            gvstudentproject.DataSource = dr;
            gvstudentproject.DataBind();
        }

        protected void gvstudentproject_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int pid=Convert.ToInt32(e.CommandArgument);
             utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "delete from upstudent where pid=@pid";
            cmd.Parameters.AddWithValue("@pid", pid);
            cmd.ExecuteNonQuery();
            loadownprojects(Session["student"].ToString());

        }
    }
}
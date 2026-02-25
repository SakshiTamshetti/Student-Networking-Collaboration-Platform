using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ourspace
{
    public partial class s_othersprojects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Session["student"] as String))
            {
                Response.Redirect("student_login.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    loadothersproject();
                }
            }
        }




        public void loadothersproject()
        {
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from upstudent u, studenttbl s where s.email=u.puseremail and u.puseremail!=@student";
            cmd.Parameters.AddWithValue("@student",Session["student"].ToString());
            SqlDataReader dr = cmd.ExecuteReader(); ;
            repuproject.DataSource = dr;
            repuproject.DataBind();
            
        }

        protected void repuproject_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
             utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from projectuploadcount where uploadid=@id and student=@student";
            cmd.Parameters.AddWithValue("@id",id);
            cmd.Parameters.AddWithValue("@student",Session["student"].ToString());
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                Response.Write("<script>alert('You already Added rating to this Project')</script>");
            }
            else
            {
                dr.Dispose();
                cmd.CommandText = "insert into projectuploadcount(uploadid,student,count)values(@id,@student,@count)";
                cmd.Parameters.AddWithValue("@count",1);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Rating Added')</script>");
            }
        }
    }
}
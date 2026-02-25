using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ourspace
{
    public partial class s_readarticles : System.Web.UI.Page
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
                    loadothersarticle();
                }
            }
        }

        public void loadothersarticle()
        { 
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from articletbl a,studenttbl s where s.email=a.addedby and addedby!=@addedby";
            cmd.Parameters.AddWithValue("@addedby", Session["student"].ToString());
            SqlDataReader dr = cmd.ExecuteReader();
            reparticles.DataSource = dr;
            reparticles.DataBind();
        }

        protected void reparticles_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int articleid = Convert.ToInt32(e.CommandArgument);
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from articlecnttbl where articleid=@article and student=@addedby";
            cmd.Parameters.AddWithValue("@article",articleid);
            cmd.Parameters.AddWithValue("@addedby",Session["student"].ToString());
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                Response.Write("<script>alert('You Already Rated this')</script>");
            }
            else
            {
                dr.Dispose();
                cmd.CommandText = "insert into articlecnttbl(articleid,student,count)values(@article,@addedby,@count)";
                cmd.Parameters.AddWithValue("@count",1);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Success')</script>");
            }
        }
    }
}
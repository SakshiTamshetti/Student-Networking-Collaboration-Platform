using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ourspace
{
    public partial class student_add_articles : System.Web.UI.Page
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
                    loadarticles();
                }
            }
        }


        public void loadarticles()
        {
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from articletbl where addedby=@addedby";
            cmd.Parameters.AddWithValue("@addedby", Session["student"].ToString());
            SqlDataReader dr = cmd.ExecuteReader();
            gvarticle.DataSource = dr;
            gvarticle.DataBind();
        }


        protected void btnupload_Click(object sender, EventArgs e)
        {
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from articletbl where article=@article and addedby=@addedby";
            cmd.Parameters.AddWithValue("@article",details.Text.Trim());
            cmd.Parameters.AddWithValue("@addedby",Session["student"].ToString());
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                Response.Write("<script>alert('Article Already Added')</script>");
            }
            else
            {
                dr.Dispose();
                cmd.CommandText = "insert into articletbl(article,addedby,adate)values(@article,@addedby,@adate)";
                cmd.Parameters.AddWithValue("@adate",System.DateTime.Now);
                cmd.ExecuteNonQuery();

            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int aid = Convert.ToInt32(e.CommandArgument);
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "delete from articletbl where aid=@aid";
            cmd.Parameters.AddWithValue("@aid", aid);
            cmd.ExecuteNonQuery();
            loadarticles();
        }
    }
}
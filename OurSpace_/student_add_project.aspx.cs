using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ourspace
{
    public partial class student_add_project : System.Web.UI.Page
    {
        String studentemail;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (String.IsNullOrEmpty(Session["student"] as string))
            {
                Response.Redirect("student_login.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    studentemail = Session["student"].ToString();
                    loadownproject(studentemail);
                }
            }
            
        }


        public void loadownproject(String studentemail)
        {
            utility u = new utility();
            SqlConnection cn = u.connection();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "select * from projecttbl where addedby=@user";
            cmd.Parameters.AddWithValue("@user", Session["student"].ToString());
            SqlDataReader dr = cmd.ExecuteReader();
            gvproject.DataSource = dr;
            gvproject.DataBind();
            
        }



        protected void btnadd_Click(object sender, EventArgs e)
        {
            int a = 1;
            utility u=new utility();
            DateTime dt = u.getcdatetime();
            SqlConnection cn = u.connection();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "insert into projecttbl(title,details,addedby,dtime,status)values(@title,@details,@addedby,@dtime,@status)";
            cmd.Parameters.AddWithValue("@title", txttitle.Text.Trim());
            cmd.Parameters.AddWithValue("@details", details.Text.Trim());
            cmd.Parameters.AddWithValue("@addedby", Session["student"].ToString());
            cmd.Parameters.AddWithValue("@dtime",dt);
            cmd.Parameters.AddWithValue("@status", a);
            cmd.ExecuteNonQuery();
            txttitle.Text = "";
            details.Text = "";
            txttitle.Focus();
            loadownproject(studentemail);
            
        }

        protected void gvproject_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int pid = Convert.ToInt32(e.CommandArgument);
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "delete from projecttbl where pid=@pid";
            cmd.Parameters.AddWithValue("@pid", pid);
            cmd.ExecuteNonQuery();
            loadownproject(studentemail);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ourspace
{
    public partial class view_project_requests : System.Web.UI.Page
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
                    loadallreq();
                    loadowninterest();
                }
            }

        }

        public void loadallreq()
        {
            utility u = new utility();
            SqlConnection cn = u.connection();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "select * from projecttbl u, studenttbl s where s.email=u.addedby and u.addedby!=@email ";
            cmd.Parameters.AddWithValue("@email",Session["student"].ToString());
            SqlDataReader dr = cmd.ExecuteReader();
            repprojects.DataSource = dr;
            repprojects.DataBind();
        }


        public void loadowninterest()
        {
            String suser = Session["student"].ToString();
            DateTime dt = System.DateTime.Now;
            utility u = new utility();
            SqlConnection cn = u.connection();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;


            cmd.CommandText = "select * from interesttbl i,projecttbl p  where i.pid=p.pid and  i.student=@student";
            cmd.Parameters.AddWithValue("@student", suser);
            SqlDataReader dr = cmd.ExecuteReader();
            GridView1.DataSource = dr;
            GridView1.DataBind();

        }

        protected void repprojects_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int pid = Convert.ToInt32(e.CommandArgument);
            String suser = Session["student"].ToString();
            DateTime dt = System.DateTime.Now;
            utility u = new utility();
            SqlConnection cn = u.connection();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;

            cmd.CommandText = "select * from interesttbl where pid=@pid and student=@student";
            cmd.Parameters.AddWithValue("@pid",pid);
            cmd.Parameters.AddWithValue("@student", suser);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                Response.Write("<script>alert('You Already Added the Interest in this project')</script>");
            }
            else
            {
                dr.Dispose();
                cmd.CommandText = "insert into interesttbl(pid,student,idate)values(@pid,@student,@date)";
                cmd.Parameters.Add("@date", dt);
                cmd.ExecuteNonQuery();
                loadowninterest();
            }
        }

        protected void btnproject_Click(object sender, EventArgs e)
        {
            panelproject.Visible = true;
            panelinterest.Visible = false;
        }

        protected void btninterest_Click(object sender, EventArgs e)
        {
            panelproject.Visible = false;
            panelinterest.Visible = true;
        }

        

        protected void btnaddprojreq_Click1(object sender, EventArgs e)
        {
            Response.Redirect("student_add_project.aspx");
        }

    }
}
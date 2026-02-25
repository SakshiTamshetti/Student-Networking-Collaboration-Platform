using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ourspace
{
    public partial class s_otherqna : System.Web.UI.Page
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
                    loadownquestion();
                }
            }

        }



        public void loadownquestion()
        {
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from questiontbl q, studenttbl s where s.email=q.addedby and addedby!=@a";
            cmd.Parameters.AddWithValue("@a", Session["student"].ToString());
            SqlDataReader dr = cmd.ExecuteReader();
            repoqna.DataSource = dr;
            repoqna.DataBind();
        }

        protected void repoqna_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int qid = Convert.ToInt32(e.CommandArgument);
            panelquestion.Visible = false;
            Response.Redirect("answers.aspx?qid=" + qid);

        }


       

    }
}
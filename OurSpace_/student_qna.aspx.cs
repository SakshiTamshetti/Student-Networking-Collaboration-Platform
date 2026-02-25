using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ourspace
{
    public partial class student_qna : System.Web.UI.Page
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
            cmd.CommandText = "select * from questiontbl where addedby=@a";
            cmd.Parameters.AddWithValue("@a", Session["student"].ToString());
            SqlDataReader dr = cmd.ExecuteReader();
            gvownqna.DataSource = dr;
            gvownqna.DataBind();
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from questiontbl where question=@q and addedby=@a";
            cmd.Parameters.AddWithValue("@q",txtquestion.Text.Trim());
            cmd.Parameters.AddWithValue("@a", Session["student"].ToString());
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                Response.Write("<script>alert('You already Added the same Question')</script>");
                txtquestion.Text = "";
                txtquestion.Focus();

            }
            else
            {
                dr.Dispose();
                cmd.CommandText = "insert into questiontbl(question,addedby,adate)values(@q,@a,@date)";
                cmd.Parameters.AddWithValue("@date",System.DateTime.Now);
                cmd.ExecuteNonQuery();
                txtquestion.Text = "";
                txtquestion.Focus();
                loadownquestion();
            }

        }

        protected void gvownqna_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int qid = Convert.ToInt32(e.CommandArgument);
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "delete from questiontbl where qid=@q";
            cmd.Parameters.Add("@q", qid);
            cmd.ExecuteNonQuery();
            loadownquestion();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ourspace
{
    public partial class all_answers : System.Web.UI.Page
    {
        int qid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Request.QueryString["qid"] as String))
            {
            }
            else
            {
                qid = Convert.ToInt32(Request.QueryString["qid"]);
                loadq(qid);
                loadanswers(qid);
            }
        }


        public void loadq(int qid)
        {
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from questiontbl where qid=@qid";
            cmd.Parameters.AddWithValue("@qid", qid);
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            lblque.Text = dr["question"].ToString();
        }

        public void loadanswers(int qid)
        {
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from anstbl a, studenttbl s where a.answerby=s.email and a.qid=@qid order by aid desc";
            cmd.Parameters.AddWithValue("@qid", qid);
            SqlDataReader dr = cmd.ExecuteReader();
            repanswers.DataSource = dr;
            repanswers.DataBind();

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            Response.Redirect("sqna.aspx");
        }
    }
}
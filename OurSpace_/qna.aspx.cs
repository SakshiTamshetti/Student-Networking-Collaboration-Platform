using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ourspace
{
    public partial class qna : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadqna();
        }


        public void loadqna()
        {
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from questiontbl q, studenttbl s where s.email=q.student order by qid desc";
            SqlDataReader dr = cmd.ExecuteReader();
            repqna.DataSource = dr;
            repqna.DataBind();
        }


    }
}
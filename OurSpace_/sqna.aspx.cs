using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ourspace
{
    public partial class sqna : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadallquestion();
            }
        }
        public void loadallquestion()
        {
            utility u = new utility();
            SqlConnection cn = u.connection();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "select * from questiontbl u, studenttbl s where s.email=u.addedby ";
            SqlDataReader dr = cmd.ExecuteReader();
            repprojects.DataSource = dr;
            repprojects.DataBind();
        }

        protected void repprojects_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("all_answers.aspx?qid="+id);
        }
    }
}
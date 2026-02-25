using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ourspace
{
    public partial class qnalist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Session["admin"] as String))
            {
                Response.Redirect("admin_login.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    loadquestion();
                }
            }
        }

        public void loadquestion()
        {
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from questiontbl";
            SqlDataReader dr = cmd.ExecuteReader();
            gvownqna.DataSource = dr;
            gvownqna.DataBind();
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
            loadquestion();
        }

    }
}
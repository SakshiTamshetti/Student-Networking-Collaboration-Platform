using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ourspace
{
    public partial class detail_article : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Request.QueryString["aid"] as String))
            {

            }
            else
            {
                int qid = Convert.ToInt32(Request.QueryString["aid"]);
                loaddetailarticle(qid);
            }
        }

        public void loaddetailarticle(int aid)
        {
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from articletbl where aid=@aid";
            cmd.Parameters.AddWithValue("@aid", aid);
            SqlDataReader dr = cmd.ExecuteReader();
            repdetailarticle.DataSource = dr;
            repdetailarticle.DataBind();
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("articles.aspx");
        }

    }
}
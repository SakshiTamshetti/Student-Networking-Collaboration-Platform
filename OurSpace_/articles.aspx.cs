using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ourspace
{
    public partial class articles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                loadarticle();
            }
        }


        public void loadarticle()
        {
            utility u = new utility();
            SqlConnection cn = u.connection();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
//            cmd.CommandText = "select * from articletbl u, studenttbl s where s.email=u.addedby";
            cmd.CommandText = "SELECT u.aid, s.fullname, u.addedby,u.article, u.adate, a.articleid, COUNT(a.count) AS cnt FROM articletbl AS u INNER JOIN articlecnttbl AS a ON u.aid = a.articleid INNER JOIN studenttbl AS s ON s.email = u.addedby GROUP BY s.fullname, u.addedby, a.articleid, u.article, u.adate,u.aid";
            SqlDataReader dr = cmd.ExecuteReader();
            repprojects.DataSource = dr;
            repprojects.DataBind();
        }

        protected void repprojects_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int aid = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("detail_article.aspx?aid="+aid);
        }
    }
}
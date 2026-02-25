using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ourspace
{
    public partial class project_request : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadallreq();
        }

        public void loadallreq()
        {
            utility u = new utility();
            SqlConnection cn = u.connection();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "select * from projecttbl u, studenttbl s where s.email=u.addedby ";
            SqlDataReader dr = cmd.ExecuteReader();
            repprojects.DataSource = dr;
            repprojects.DataBind();
        }

    }
}
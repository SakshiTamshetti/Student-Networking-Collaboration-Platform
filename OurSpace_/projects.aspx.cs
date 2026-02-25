using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ourspace
{
    public partial class projects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadallproject();

        }

        public void loadallproject()
        {
            utility u = new utility();
            SqlConnection cn = u.connection();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "select * from upstudent u, studenttbl s where s.email=u.puseremail ";
            SqlDataReader dr = cmd.ExecuteReader();
            repprojects.DataSource = dr;
            repprojects.DataBind();
        }

    }
}
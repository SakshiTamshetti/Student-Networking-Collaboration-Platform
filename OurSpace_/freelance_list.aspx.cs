using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ourspace
{
    public partial class freelance_list : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadfreelancelist();
        }

        public void loadfreelancelist()
        {
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from freelancetbl";
            SqlDataReader dr = cmd.ExecuteReader();
            gvstudentlist.DataSource = dr;
            gvstudentlist.DataBind();
        }


    }
}
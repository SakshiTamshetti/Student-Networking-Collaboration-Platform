using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ourspace
{
    public partial class Events : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadevent();
        }



        public void loadevent()
        {
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from eventtbl order by eid desc";
            SqlDataReader dr = cmd.ExecuteReader();
            repevent.DataSource = dr;
            repevent.DataBind();
        }
    }
}
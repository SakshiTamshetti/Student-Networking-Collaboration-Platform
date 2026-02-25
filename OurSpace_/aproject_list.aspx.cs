using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ourspace
{
    public partial class aproject_list : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadproject();
            }
        }

        public void loadproject()
        {
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from upstudent u, studenttbl s where s.email=u.puseremail";
            SqlDataReader dr = cmd.ExecuteReader();
            gvprojectlist.DataSource = dr;
            gvprojectlist.DataBind();
            
        }


    }
}
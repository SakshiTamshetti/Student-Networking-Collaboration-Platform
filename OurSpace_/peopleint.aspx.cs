using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ourspace
{
    public partial class peopleint : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Session["freelance"] as String))
            {
                Response.Redirect("freelance_login.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    loadpeopleinterests();
                }
            }
        }

        public void loadpeopleinterests()
        {
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from fworkinteresttbl fw, fworktbl f where f.wid=fw.wid and f.addedby=@email";
            cmd.Parameters.AddWithValue("@email", Session["freelance"].ToString());
            SqlDataReader dr = cmd.ExecuteReader();
            gvshowninterest.DataSource = dr;
            gvshowninterest.DataBind();
        }

    }
}
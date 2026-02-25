using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ourspace
{
    public partial class afreelanceprojectlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Session["admin"] as String))
            {

            }
            else
            {
                if (!IsPostBack)
                {
                    loadallwork();
                }
            }
        }

        public void loadallwork()
        {
            DateTime dt = System.DateTime.Now;
           
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from fworktbl";
           
            SqlDataReader dr = cmd.ExecuteReader();
            gvwork.DataSource = dr;
            gvwork.DataBind();

        }

        protected void btndel_Click(object sender, EventArgs e)
        {
           
        }

        protected void btndel_Click1(object sender, EventArgs e)
        {

        }

        protected void gvwork_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int wid = Convert.ToInt32(e.CommandArgument);
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "delete from fworktbl where wid=@wid";
            cmd.Parameters.AddWithValue("@wid", wid);
            cmd.ExecuteNonQuery();

            loadallwork();
        }

       
       
       
    }
}
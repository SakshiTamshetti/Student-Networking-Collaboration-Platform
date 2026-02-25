using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ourspace
{
    public partial class showinterests : System.Web.UI.Page
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
                    showninterestwork();
                }
            }
        }

        public void showninterestwork()
        {
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from fworkinteresttbl fw, fworktbl f where f.wid=fw.wid and fw.interestby=@email";
            cmd.Parameters.AddWithValue("@email", Session["freelance"].ToString());
            SqlDataReader dr = cmd.ExecuteReader();
            gvshowninterest.DataSource = dr;
            gvshowninterest.DataBind();
        }

        protected void gvshowninterest_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            utility u=new utility();
            int sid = Convert.ToInt32(e.CommandArgument);
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "delete from fworkinteresttbl where sid=@sid";
            cmd.Parameters.AddWithValue("@sid",sid);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Interest Deleted')</script>");
            showninterestwork();
        }
    }
}
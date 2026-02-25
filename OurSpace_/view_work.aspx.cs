using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ourspace
{
    public partial class view_work : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Session["freelance"] as String))
            {

            }
            else
            {
                if (!IsPostBack)
                {
                    loadwork();
                }
            }
        }

        public void loadwork()
        {
            String freelanceuser = Session["freelance"].ToString();
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from fworktbl fw, freelancetbl f where f.email=fw.addedby and  fw.addedby!=@addedby order by fw.wid desc";
            cmd.Parameters.AddWithValue("@addedby", freelanceuser);
            SqlDataReader dr = cmd.ExecuteReader();
            repfreelance.DataSource = dr;
            repfreelance.DataBind();
        }

        protected void repfreelance_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int wid = Convert.ToInt32(e.CommandArgument);
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from fworkinteresttbl where interestby=@email and wid=@wid";
            cmd.Parameters.AddWithValue("@wid",wid);
            cmd.Parameters.AddWithValue("@email", Session["freelance"].ToString());
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                Response.Write("<script>alert('Interest Already Added')</script>");
            }
            else
            {
                dr.Dispose();
                cmd.CommandText = "insert into fworkinteresttbl(wid,interestby,adate)values(@wid,@email,@adate)";
                cmd.Parameters.AddWithValue("@adate",u.getcdatetime());
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Interest Added')</script>");
            }

        }


    }
}
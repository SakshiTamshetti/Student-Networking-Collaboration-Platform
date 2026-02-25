using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ourspace
{
    public partial class freelance_add_work : System.Web.UI.Page
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
                    loadownwork();
                }
            }
        }

        public void loadownwork()
        {
            DateTime dt = System.DateTime.Now;
            String freelanceuser = Session["freelance"].ToString();
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from fworktbl where addedby=@addedby order by wid desc";
            cmd.Parameters.AddWithValue("@addedby", freelanceuser);
            SqlDataReader dr = cmd.ExecuteReader();
            gvwork.DataSource = dr;
            gvwork.DataBind();
            
        }


        protected void btnadd_Click(object sender, EventArgs e)
        {
            DateTime dt = System.DateTime.Now;
            String freelanceuser = Session["freelance"].ToString();
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from fworktbl where title=@title and details=@details and addedby=@addedby";
            cmd.Parameters.AddWithValue("@title",txttitle.Text.Trim());
            cmd.Parameters.AddWithValue("@details", txtdetails.Text.Trim());
            cmd.Parameters.AddWithValue("@addedby", freelanceuser);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                Response.Write("<script>alert('Same work You already Added')</script>");
                txttitle.Text = "";
                txtdetails.Text = "";
                txttitle.Focus();
            }
            else
            {
                dr.Dispose();
                cmd.CommandText = "insert into fworktbl(title,details,addedby,adate)values(@title,@details,@addedby,@adate)";
                cmd.Parameters.AddWithValue("@adate", dt);
                cmd.ExecuteNonQuery();
                txttitle.Text = "";
                txtdetails.Text = "";
                txttitle.Focus();
                loadownwork();
            }

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

            loadownwork();
        }
    }
}
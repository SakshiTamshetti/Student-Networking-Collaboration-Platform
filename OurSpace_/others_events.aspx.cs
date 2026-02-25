using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ourspace
{
    public partial class others_events : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Session["student"] as String))
            {
                Response.Redirect("student_login.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    loadevent();
                }
            }
        }

        public void loadevent()
        {
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from eventtbl where student!=@student order by eid desc";
            cmd.Parameters.AddWithValue("@student",Session["student"].ToString());
            SqlDataReader dr = cmd.ExecuteReader();
            repevent.DataSource = dr;
            repevent.DataBind();
        }

        protected void repevent_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from eventcounttbl where eventid=@id and student=@student";
            cmd.Parameters.AddWithValue("@id",id);
            cmd.Parameters.AddWithValue("@student",Session["student"].ToString());
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                Response.Write("<script>alert('Already Added Rating to this Event')</script>");
            }
            else
            {
                dr.Dispose();
                cmd.CommandText = "insert into eventcounttbl(eventid,student,count)values(@id,@student,@count)";
                cmd.Parameters.AddWithValue("@count",1);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Your Rating Added')</script>");
            }
        }
    }
}
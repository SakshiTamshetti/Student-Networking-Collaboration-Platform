using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;

namespace ourspace
{
    public partial class add_events : System.Web.UI.Page
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

        protected void btnadd_Click(object sender, EventArgs e)
        {
            String nfile, ext;
            nfile = FileUpload1.FileName;
            ext = Path.GetExtension(nfile);
            if(ext==".jpg" || ext==".jpeg" || ext==".png" || ext==".bmp")
            {
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from eventtbl where title=@title and student=@student";
            cmd.Parameters.AddWithValue("@title",txttitle.Text.Trim());
            cmd.Parameters.AddWithValue("@student",Session["student"].ToString());
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                Response.Write("<script>alert('Same Event already Added')</script>");
                txttitle.Text = "";
            }
            else
            {
                String newfile;
                newfile = u.getticks() + ext;
                dr.Dispose();
                cmd.CommandText = "insert into eventtbl(student,title,eventimage,adate)values(@student,@title,@file,@adate)";
                cmd.Parameters.AddWithValue("@file",newfile);
                cmd.Parameters.AddWithValue("@adate",u.getcdatetime());
                cmd.ExecuteNonQuery();
                FileUpload1.SaveAs(Server.MapPath(newfile));
                txttitle.Text="";
                loadevent();
            }
            }
            else
            {
                Response.Write("<script>alert('Select Image file Only')</script>");
            }
        }

        public void loadevent()
        {
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from eventtbl where student=@student";
            cmd.Parameters.AddWithValue("@student", Session["student"].ToString());
            SqlDataReader dr = cmd.ExecuteReader();
            gvevent.DataSource = dr;
            gvevent.DataBind();
        }

        protected void gvevent_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
             utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "delete from eventtbl where eid=@eid";
            cmd.Parameters.AddWithValue("@eid", id);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Event Deleted')</script>");
            loadevent();
        }
    }
}
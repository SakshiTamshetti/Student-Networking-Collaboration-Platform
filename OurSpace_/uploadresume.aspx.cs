using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Data.SqlClient;

namespace ourspace
{
    public partial class uploadresume : System.Web.UI.Page
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
                    loadownresume();
                }
            }

        }



        public void loadownresume()
        {
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from resumetbl where useremail=@email";
            cmd.Parameters.Add("@email", Session["student"].ToString());
            SqlDataReader dr = cmd.ExecuteReader();
            gvresumes.DataSource = dr;
            gvresumes.DataBind();

        }



        protected void btnupload_Click(object sender, EventArgs e)
        {
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from resumetbl where useremail=@email";
            cmd.Parameters.Add("@email", Session["student"].ToString());
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                Response.Write("<script>alert('Already Uploaded')</script>");
            }
            else
            {


                String filen = fileresume.FileName;
                String ext = Path.GetExtension(filen);
                if (ext == ".pdf")
                {
                    dr.Dispose();
                    String newfilename = u.getticks() + ext;
                    cmd.CommandText = "insert into resumetbl(useremail,resumefile)values(@email,@file)";
                    cmd.Parameters.AddWithValue("@file",newfilename);
                    cmd.ExecuteNonQuery();
                    fileresume.SaveAs(Server.MapPath(newfilename));
                    Response.Write("<script>alert('Upload Success')</script>");
                    loadownresume();
                }
                else
                {
                    Response.Write("<script>alert('Please upload pdf File Only')</script>");
                }
            }
        }

        protected void gvresumes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rid = Convert.ToInt32(e.CommandArgument);
            utility u = new utility();
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "delete from resumetbl where rid=@rid";
            cmd.Parameters.AddWithValue("@rid",rid);
            cmd.ExecuteNonQuery();
            loadownresume();
        }
    }
}
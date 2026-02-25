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
    public partial class uploadproject : System.Web.UI.Page
    {
        String suser;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Session["student"] as string))
            {
                Response.Redirect("student_login.aspx");
            }
            else
            {
                suser = Session["student"].ToString();
            }
        }

        protected void btnupload_Click(object sender, EventArgs e)
        {
           
            String filen = pfileu.FileName;
            String ext = Path.GetExtension(filen);
            if (ext == ".zip" || ext == ".rar")
            {

                String ticks = System.DateTime.Now.Ticks.ToString();
                String newfilename = ticks + ext;
                pfileu.SaveAs(Server.MapPath(newfilename));
                utility u = new utility();
                SqlConnection con = u.connection();
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "insert into upstudent(puseremail,ptitle,pdetails,pfile,udate)values(@email,@title,@detail,@file,@udate)";
                cmd.Parameters.Add("@email", suser);
                cmd.Parameters.Add("@title", txttitle.Text.Trim());
                cmd.Parameters.Add("@detail", details.Text.Trim());
                cmd.Parameters.Add("@file", newfilename);
                cmd.Parameters.Add("@udate", System.DateTime.Now);
                cmd.ExecuteNonQuery();
                txttitle.Text = "";
                details.Text = "";
                

            }

            else
            {
                Response.Write("<script>alert('Upload Zip file')</script>");
            }
        }
    }
}
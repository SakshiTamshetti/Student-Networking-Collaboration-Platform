using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ourspace
{
    public partial class freelance_reg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadstate();
                loadcity(drdstate.Text);
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            utility u = new utility();
            SqlConnection cn = u.connection();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "select * from freelancetbl where email=@email";
            cmd.Parameters.AddWithValue("@email", txtemail.Text.Trim());
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                Response.Write("<script>alert('Email id Already Registored')</script>");
                txtemail.Text = "";
                txtemail.Focus();
            }
            else
            {
                dr.Dispose();
                cmd.CommandText = "insert into freelancetbl(fullname,email,phone,dob,statename,cityname,pass)values(@fn,@email,@phone,@dob,@state,@city,@pass)";
                cmd.Parameters.AddWithValue("@fn", txtfullname.Text.Trim());
                cmd.Parameters.AddWithValue("@phone", txtphone.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", txtdob.Text.Trim());
                cmd.Parameters.AddWithValue("@state", drdstate.Text.Trim());
                cmd.Parameters.AddWithValue("@city", drdcity.Text.Trim());
                cmd.Parameters.AddWithValue("@pass", txtpass.Text.Trim());
                cmd.ExecuteNonQuery();
                Response.Redirect("freelance_login.aspx");
            }
        }


        public void loadcity(String statename)
        {
            drdcity.Items.Clear();
            utility u = new utility();
            SqlConnection cn = u.connection();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "select * from citytbl";
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                drdcity.Items.Add(dr["cityname"].ToString());
            }
        }



        public void loadstate()
        {
            drdstate.Items.Clear();
            utility u = new utility();
            SqlConnection cn = u.connection();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "select * from statetbl";
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                drdstate.Items.Add(dr["statename"].ToString());
            }
        }






        protected void drdstate_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadcity(drdstate.Text);
        }
    }
}
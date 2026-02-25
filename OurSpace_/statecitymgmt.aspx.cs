using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace ourspace
{
    public partial class statecitymgmt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadstate();
                loadstateforcity();
                loadcity();
            }

        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            utility u= new utility();
            SqlConnection cn = u.connection();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "select * from statetbl where statename=@statename";
            cmd.Parameters.Add("@statename", txtstate.Text.Trim());
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                Response.Write("<script>alert('State Already Added')</script>");
                txtstate.Text="";
                txtstate.Focus();
            }
            else
            { 
                dr.Dispose();
                cmd.CommandText="insert into statetbl(statename)values(@statename)";
                cmd.ExecuteNonQuery();
                txtstate.Text = "";
                txtstate.Focus();
                loadstate();
                loadstateforcity();
            }
        }
        public void loadstate()
        {
            utility u = new utility();
            SqlConnection cn = u.connection();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "select * from statetbl";
            SqlDataReader dr = cmd.ExecuteReader();
            gvstate.DataSource = dr;
            gvstate.DataBind();
        }

        public void loadcity()
        {
            utility u = new utility();
            SqlConnection cn = u.connection();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "select * from citytbl";
            SqlDataReader dr = cmd.ExecuteReader();
            gvcity.DataSource = dr;
            gvcity.DataBind();
        }



        public void loadstateforcity()
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


        protected void gvstate_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            utility u=new utility();
            int sid = Convert.ToInt32(e.CommandArgument);
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "delete from statetbl where sid=@sid";
            cmd.Parameters.AddWithValue("@sid", sid);
            cmd.ExecuteNonQuery();
            loadstate();
        }

        protected void btnaddcity_Click(object sender, EventArgs e)
        {
            utility u = new utility();
            SqlConnection cn = u.connection();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "select * from citytbl where statename=@statename and cityname=@city";
            cmd.Parameters.Add("@statename", drdstate.Text);
            cmd.Parameters.AddWithValue("@city", txtcity.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                Response.Write("<script>alert('City Already Added')</script>");
                txtcity.Text = "";
                txtcity.Focus();
            }
            else
            {
                dr.Dispose();
                cmd.CommandText = "insert into citytbl(statename,cityname)values(@statename,@city)";
                cmd.ExecuteNonQuery();
                txtcity.Text = "";
                txtcity.Focus();
                loadcity();
            }
        }

        protected void gvcity_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            utility u = new utility();
            int cid = Convert.ToInt32(e.CommandArgument);
            SqlConnection con = u.connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "delete from citytbl where cid=@cid";
            cmd.Parameters.AddWithValue("@cid", cid);
            cmd.ExecuteNonQuery();
            loadcity();

        }

      
    }

}
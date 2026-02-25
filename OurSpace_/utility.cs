using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace ourspace
{
    public class utility
    {
        public SqlConnection connection()
        {

            SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=G:\Work\2023-24\ourspace\ourspacedb.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
            return con;
        }



        public DateTime getcdatetime()
        {
            DateTime dt = System.DateTime.Now;
            return dt;
        }

        public string getticks()
        {
            String ticks = System.DateTime.Now.Ticks.ToString();
            return ticks;
        }

        public String getstudentnamebyemail(String email)
        {
            utility u = new utility();
            SqlConnection cn = u.connection();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "select * from studenttbl where email=@email";
            cmd.Parameters.Add("@email", email);
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            String sname=dr["fullname"].ToString();
            return sname;
        }







        public SqlDataReader loadstate()
        {
            utility u = new utility();
            SqlConnection cn = u.connection();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "select * from statetbl";
            SqlDataReader dr = cmd.ExecuteReader();
            return dr;
        }

        public SqlDataReader loadcity(String state)
        {
            utility u = new utility();
            SqlConnection cn = u.connection();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "select * from citytbl where statename=@statename";
            cmd.Parameters.AddWithValue("@statename", state);
            SqlDataReader dr = cmd.ExecuteReader();
            return dr;
        }






    }
}
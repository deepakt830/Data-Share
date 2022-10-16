using System;
using System.Web;
using System.Data.SqlClient;
using System.Web.Services;
using System.Net;
using System.Text;
using System.IO;
using System.Web.UI.WebControls;
using System.ComponentModel;
using System.Data;

namespace TestWebApp
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data source=.; uid=sa; pwd=1; database=Testing");
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        [WebMethod]
        protected void Log_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data source=.; uid=sa; pwd=1; database=Testing"))
            {
                con.Open();
                string a = "";
                try
                {
                    SqlCommand cmd = new SqlCommand("Select * from UserMaster where UserName = @User and Password = @Password and Client = @client", con);
                    cmd.Parameters.AddWithValue("@User", logid.Text);
                    cmd.Parameters.AddWithValue("@Password", pass.Text);
                    cmd.Parameters.AddWithValue("@client", drop.SelectedValue);
                    DataSet ds = new DataSet();
                    //using (OleDbConnection connection = new OleDbConnection(connectionString))
                    //using (OleDbCommand command = new OleDbCommand(query, connection))
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        adapter.Fill(ds);
                    }
                    //SqlDataSet sdr = cmd.ExecuteReader();
                    if (ds != null && ds.Tables[0] != null && ds.Tables[0].Rows.Count>0)
                    {
                        Session["UserName"] = logid.Text;
                        HttpContext.Current.Session["Password"] = pass.Text;
                        HttpContext.Current.Session["client"] = drop.SelectedValue;
                        a = "Success";
                        if(a == "Success")
                        {
                            var token = Guid.NewGuid().ToString();
                            HttpContext.Current.Session["token"] = token;
                            SqlCommand cmd1 = new SqlCommand("update UserMaster set Token = '" + token + "' where UserName='"+ logid.Text +"'", con);
                            //cmd1.Parameters.AddWithValue("@user", logid.Text);
                            cmd1.ExecuteNonQuery();
                        }
                        Response.Redirect("Home.aspx", false);
                    }
                    else if(drop.SelectedValue == "")
                    {
                        L1.Text = "Please Select a Location";
                    }
                    else
                    {
                        a = "Failed";
                        //logid.Text = "Incorrect Cread";
                        L1.Text = "Invalid Creadentials";
                        Session.Clear();
                        Session.Abandon();
                        //Response.Redirect("Login.aspx", false);
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error is:" + ex);
                }
            }
        }
        //public static string ConfirmLogins(string UserName, string Password)
        //{
        //    using (SqlConnection con = new SqlConnection("Data source=.; uid=sa; pwd=1; database=Testing"))
        //    {
        //        con.Open();
        //        string a = "";
        //        try
        //        {
        //            SqlCommand cmd = new SqlCommand("select * from UserMaster where UserName = @User and Password = @Password", con);
        //            cmd.Parameters.AddWithValue("@User", UserName);
        //            cmd.Parameters.AddWithValue("@Password", Password);
        //            SqlDataReader sdr = cmd.ExecuteReader();
        //            if (sdr.HasRows)
        //            {

        //                HttpContext.Current.Session["UserName"] = UserName;
        //                HttpContext.Current.Session["Password"] = Password;
        //                a = "success";

        //            }
        //            else
        //            {
        //                a = "Failed";
        //            }
        //        }
        //        catch (Exception ex)
        //        {
        //            Console.WriteLine("Error is:" + ex);
        //        }
        //        return a;
        //    }
        //}
    }
}
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestWebApp
{
    public partial class CreateUser : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-G37V1H3;Initial Catalog=Testing;Integrated Security=SSPI; user=sa; password=1;");
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["UserName"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
        protected void Sub_Click(object sender, EventArgs e)
        {
            try
            {
                if(pass.Text==null || pass.Text =="" || pass.Text.Length<=8)
                {
                    passcheck.ForeColor = System.Drawing.Color.Red;
                    passcheck.Text = "Password Must be more than 8.!!";
                }
                else
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("insert into UserMaster(UserName, password, Client) values (@user, @pass, @clints)", con);
                    cmd.Parameters.AddWithValue("@user", user.Text);
                    cmd.Parameters.AddWithValue("@pass", pass.Text);
                    cmd.Parameters.AddWithValue("@clints", drop.SelectedValue);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Clear();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error is: " + ex);
            }
        }
        public void Clear()
        {
            user.Text = "";
            pass.Text = "";
            drop.SelectedValue = "";
        }
    }
}
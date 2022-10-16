using System;
using System.Data.SqlClient;
using System.Web;
using System.Data;

namespace TestWebApp
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = (string)HttpContext.Current.Session["UserName"];
            string location = (string)HttpContext.Current.Session["client"];
            string token = (string)HttpContext.Current.Session["token"];
            //user.InnerHtml = a;
            //hiduser.Value = a;

        }

        protected void Outlog_Click(object sender, EventArgs e)
        {
            string username = (string)HttpContext.Current.Session["UserName"];
            using (SqlConnection con = new SqlConnection("Data source=.; uid=sa; pwd=1; database=Testing"))
            {
                SqlCommand cmd = new SqlCommand("update UserMaster set Token='' where UserName = @user", con);
                cmd.Parameters.AddWithValue("@user", username);
                DataSet ds = new DataSet();
                using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                {
                    adapter.Fill(ds);
                }
            }
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
            Response.Cache.SetNoStore();
            Session.Abandon();
            Session.Clear();
            System.Web.Security.FormsAuthentication.SignOut();
            Response.Redirect("Login.aspx", false);
        }

        //protected void LinkButton1_Click(object sender, EventArgs e)
        //{
        //    string username = (string)HttpContext.Current.Session["UserName"];
        //    string location = (string)HttpContext.Current.Session["client"];
        //    string token = (string)HttpContext.Current.Session["token"];
        //    var formPostText = @"<html><body><div>
        //    <form method=""POST"" action=""http://localhost:5000/home"" name=""frm2Post"">
        //      <input type=""hidden"" name=""user"" value=""" + username + @""" /> 
        //      <input type=""hidden"" name=""client"" value=""" + location + @""" />
        //      <input type=""hidden"" name=""token"" value=""" + token + @""" />
        //    </form></div><script type=""text/javascript"">document.frm2Post.submit();</script></body></html>";
        //    Response.Redirect("http://localhost:5000/home?", false);
        //}
        //protected void logbutton_Click(object sender, EventArgs e)
        //{
        //    using (SqlConnection con = new SqlConnection("Data source=.; uid=sa; pwd=1; database=Testing"))
        //    {
        //        SqlCommand cmd = new SqlCommand("update UserMaster set Token='' where UserName = @user");
        //        cmd.Parameters.AddWithValue("@user", user.InnerText);
        //        cmd.ExecuteNonQuery();
        //    }
        //    string username = (string)HttpContext.Current.Session["UserName"];
        //    Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //    Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        //    Response.Cache.SetNoStore();
        //    Session.Abandon();
        //    Session.Clear();
        //    System.Web.Security.FormsAuthentication.SignOut();
        //    Response.Redirect("Login.aspx", false);
        //}
        //string username = (string)HttpContext.Current.Session["UserName"];
        //string location = (string)HttpContext.Current.Session["client"];


        //String result = "";
        //String strPost = "username=" + username + "&client=" + location;
        //StreamWriter myWriter = null;

        //HttpWebRequest objRequest = (HttpWebRequest)WebRequest.Create(url);
        //objRequest.Method = "POST";
        //objRequest.ContentLength = strPost.Length;
        //objRequest.ContentType = "application/x-www-form-urlencoded";

        //try
        //{
        //    myWriter = new StreamWriter(objRequest.GetRequestStream());
        //    myWriter.Write(strPost);
        //}
        //catch (Exception ex)
        //{
        //    Console.WriteLine( ex.Message);
        //}
        //finally
        //{
        //    myWriter.Close();
        //}

        //HttpWebResponse objResponse = (HttpWebResponse)objRequest.GetResponse();
        //using (StreamReader sr =
        //   new StreamReader(objResponse.GetResponseStream()))
        //{
        //    result = sr.ReadToEnd();

        //    // Close and clean up the StreamReader
        //    sr.Close();
        //}

        //public static void LogOut()
        //{
        //    try
        //    {
        //        if (!Page.IsPostBack)
        //        {
        //            Session.Abandon();
        //            Session.Remove("UserName");
        //            Session.Remove("Password");
        //            Response.Redirect("~/Login.aspx");
        //        }
        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //}
    }

}
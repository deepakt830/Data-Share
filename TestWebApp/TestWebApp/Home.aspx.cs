using System;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Services;

namespace TestWebApp
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-G37V1H3;Initial Catalog=Staff;Integrated Security=SSPI; user=sa; password=1;");
        protected void Page_Load(object sender, EventArgs e)
        {
            string a = (string)HttpContext.Current.Session["UserName"];
            //user.InnerText = (a);
        }

        //public static string EncodePasswordToBase64(string UserName, string Password)
        //{
        //    try
        //    {
        //        //string a = (string)HttpContext.Current.Session["UserName"];
        //        //string b = (string)HttpContext.Current.Session["Password"];

        //        //string a = "";

        //        //byte[] encData_byte = new byte[UserName.Length & Password.Length];
        //        //encData_byte = System.Text.Encoding.UTF8.GetBytes(UserName);
        //        //encData_byte = System.Text.Encoding.UTF8.GetBytes(Password);
        //        //string encodedData = Convert.ToBase64String(encData_byte);
        //        //return encodedData;

        //    }
        //    catch (Exception ex)
        //    {
        //        throw new Exception("Error in base64Encode" + ex.Message);
        //    }

        //}
        protected void Python_Click(object sender, EventArgs e)
        {

            //    string name = HttpContext.Current.Session["UserName"].ToString();
            //    string pass = HttpContext.Current.Session["Password"].ToString();
            //    Response.Redirect("http://localhost:5000/?user=" + name + "?password=" + pass);
        }

        //public static string toPython()
        //{

        //}

        //private void button1_Click(object sender, EventArgs e)
        //{
        //}

        //private void run_cmd()
        //{
        //    try
        //    {
        //        var psi = new ProcessStartInfo();
        //        psi.FileName = @"C:\Program Files(x86)\Microsoft Visual Studio\Shared\Python39_64\python.exe";
        //        var script = @"D:\Python\Sentimentapi\app.py";
        //        //var start = "2022 -1-1";
        //        //var end = "2022-1-22";


        //        psi.Arguments = $"\"{script}\"";

        //        psi.UseShellExecute = false;
        //        psi.CreateNoWindow = true;
        //        psi.RedirectStandardOutput = true;
        //        psi.RedirectStandardError = true;

        //        var errors = "";
        //        var results = "";

        //        using (var process = Process.Start(psi))
        //        {
        //            errors = process.StandardError.ReadToEnd();
        //            results = process.StandardOutput.ReadToEnd();
        //        }
        //        Console.WriteLine("Errors:");
        //        Console.WriteLine(errors);
        //        Console.WriteLine();
        //        Console.WriteLine("Results:");
        //        Console.WriteLine(results);
        //    }
        //    catch(Exception ex)
        //    {
        //        Console.WriteLine("Error is" + ex);

        //    }
        //}

        //[WebMethod]
        //public static string UserSessions()
        //{
        //    users obj = new users();
        //    obj.username = (string)HttpContext.Current.Session["UserName"];
        //    obj.location = (string)HttpContext.Current.Session["client"];
        //    obj.token = (string)HttpContext.Current.Session["token"];

        //    return (string)HttpContext.Current.Session["token"];
        //}
    }

    public class users
    {
        public string username { get; set; }
        public string location { get; set; }
        public string token { get; set; }
    }
}
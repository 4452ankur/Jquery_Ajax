using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebMethodInPage
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        // ScriptManager will adapt it's call code if you specify to use GET by placing ScriptMethod attribute. 
        // removing ScriptMethod attribute ScriptManager will use POST by default

        // Necessary!
        [System.Web.Services.WebMethod()]
        // The next line specify that the method MUST be called with GET with your ajax call (using jquery or other), ScriptManager will use GET with this attribute, otherwise it will use a POST by default!
        [System.Web.Script.Services.ScriptMethod(UseHttpGet = true)]
        public static string Test()
        {
            return "sohel rana";
        }

        [System.Web.Services.WebMethod()]
        // IMPORTANT: pass the paramenter with POST and data 
        public static string TestParPost(int id)
        {
            return " parametro: " + id.ToString();
        }

        [System.Web.Services.WebMethod()]
        // IMPORTANT: pass the parameter by querystring
        [System.Web.Script.Services.ScriptMethod(UseHttpGet = true)]
        public static string TestParGet(int id)
        {
            return " parametro: " + id.ToString();
        }

        [System.Web.Services.WebMethod()]
        [System.Web.Script.Services.ScriptMethod(UseHttpGet = true)]
        public static dynamic TestClass()
        {
            return new { name = "tom", age = 12 };
        }
    }
}
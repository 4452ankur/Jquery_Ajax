using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AjaxExmp.AjaxExample
{
    public partial class Ajax1 : System.Web.UI.Page
    {

        // Ref Update Panel: http://ajax.net-tutorials.com/controls/updatepanel-control/
        // Ref Progess Bar : http://ajax.net-tutorials.com/controls/updateprogress-control/
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
        protected void ProgressButton_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(5000);
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            DateTimeLabel1.Text = DateTime.Now.ToString();
            DateTimeLabel2.Text = DateTime.Now.ToString();
        }
    }
}
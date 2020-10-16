using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assigment
{
    public partial class VacationList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.IsInRole("Admin"))
            {
                Response.Redirect("/Default");
            }
        }

        protected void LoginView1_ViewChanged(object sender, EventArgs e)
        {

        }
    }
}
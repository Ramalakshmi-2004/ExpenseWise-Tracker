using System;

namespace ExpenseWise
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnUserLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin/AdminLogin.aspx");
        }
    }
}
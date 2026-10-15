using System;

namespace ExpenseWise
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear all session variables
            Session.Clear();

            // Destroy the current session
            Session.Abandon();

            // Remove browser cache
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache);
            Response.Cache.SetNoStore();

            // Redirect to Login page after 2 seconds
            Response.AddHeader("REFRESH", "2;URL=Login.aspx");
        }
    }
}
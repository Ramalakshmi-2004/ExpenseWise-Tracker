using System;
using System.Configuration;
using System.Data.SqlClient;

namespace ExpenseWise
{
    public partial class Dashboard : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ExpenseWiseDB"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
            }


            if (Session["FullName"] != null)
            {
                lblUser.Text = Session["FullName"].ToString();
            }


            if (!IsPostBack)
            {
                LoadDashboard();
            }
        }



        private void LoadDashboard()
        {
            decimal totalIncome = 0;
            decimal totalExpense = 0;


            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();


                // Total Income of logged-in user
                SqlCommand cmdIncome = new SqlCommand(
                    @"SELECT ISNULL(SUM(Amount),0)
                      FROM Income
                      WHERE UserId=@UserId", con);


                cmdIncome.Parameters.AddWithValue(
                    "@UserId",
                    Convert.ToInt32(Session["UserId"])
                );


                totalIncome = Convert.ToDecimal(cmdIncome.ExecuteScalar());



                // Total Expense of logged-in user
                SqlCommand cmdExpense = new SqlCommand(
                    @"SELECT ISNULL(SUM(Amount),0)
                      FROM Expenses
                      WHERE UserId=@UserId", con);



                cmdExpense.Parameters.AddWithValue(
                    "@UserId",
                    Convert.ToInt32(Session["UserId"])
                );


                totalExpense = Convert.ToDecimal(cmdExpense.ExecuteScalar());



                // Display values

                lblIncome.Text = "₹ " + totalIncome.ToString("N2");

                lblExpense.Text = "₹ " + totalExpense.ToString("N2");

                lblBalance.Text = "₹ " +
                    (totalIncome - totalExpense).ToString("N2");
            }
        }
    }
}
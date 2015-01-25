using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace AmazonHackathon
{
    public partial class StudentTestResults : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["SQLCON"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            try
            {
                string query = "SELECT  RESULT AS ACTUAL_ANSWER, USERANS AS YOUR_ANSWER FROM CONDUCTEXAM LEFT JOIN USER_ANS_INSERT ON CONDUCTEXAM.QID = USER_ANS_INSERT.QID AND USERID = @USERID";
                SqlCommand cmnd = new SqlCommand(query, con);
                cmnd.Parameters.AddWithValue("@USERID", Session["name"]);
                con.Open();
                Gd_viewresults.DataSource = cmnd.ExecuteReader();
                Gd_viewresults.DataBind();
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }
    }
}
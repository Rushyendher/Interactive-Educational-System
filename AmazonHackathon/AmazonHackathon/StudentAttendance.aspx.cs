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
    public partial class StudentAttendance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                string cs = ConfigurationManager.ConnectionStrings["SQLCON"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);
                try
                {
                    string query = "SELECT C_CODE AS CourseCode,C_NAME AS CourseName,T_CLASSES AS TotalClasses,T_ATTEND AS TotalAttended FROM ATTENDANCE WHERE USERID = @USERID";
                    SqlCommand cmnd = new SqlCommand(query, con);
                    cmnd.Parameters.AddWithValue("@USERID", Session["name"]);
                    con.Open();
                    Gd_viewattendance.DataSource = cmnd.ExecuteReader();
                    Gd_viewattendance.DataBind();
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }
                finally
                {
                    con.Close();
                }
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

namespace AmazonHackathon
{
    public partial class SProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                lb_name.Text = "Welcome " + Session["name"].ToString();
                string cs = ConfigurationManager.ConnectionStrings["SQLCON"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);
                try
                {
                    string query = "select MSG as Notifications, FACULTY_ID AS FacultyID from FACULTY_NOTIFY where NOTIFY_DATE = @NOTIFY_DATE";
                    SqlCommand cmnd = new SqlCommand(query, con);
                    con.Open();
                    DateTime dt = DateTime.Now;
                    string sdate = dt.ToShortDateString();
                    cmnd.Parameters.AddWithValue("@NOTIFY_DATE", sdate);
                    if (sdate == DateTime.Now.ToShortDateString())
                    {
                        GridView1.DataSource = cmnd.ExecuteReader();
                        GridView1.DataBind();
                    }
                    else
                    {

                    }
                }
                catch (Exception ex)
                {
                    Response.Write("There are no notifications..");
                }
                finally
                {
                    con.Close();
                }
            }
        }

        protected void btn_logout_Click(object sender, ImageClickEventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("Login.aspx");
        }
    }
}
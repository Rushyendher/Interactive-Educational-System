using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;

namespace AmazonHackathon
{
    public partial class StudentDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            lblShare.Text = "<a name=\"fb_share\" type=\"button\"></a>" +
                    "<script " +
                    "src=\"http://static.ak.fbcdn.net/connect.php/js/FB.Share\" " +
                    "type=\"text/javascript\"></script>";
            HtmlMeta tag = new HtmlMeta();
            tag.Name = "title";
            tag.Content = "This is the page title";
            Page.Header.Controls.Add(tag);
            HtmlMeta tag1 = new HtmlMeta();
            tag.Name = "description";
            tag.Content = "This is a page description.";
            Page.Header.Controls.Add(tag1);  

            if (!IsPostBack)
            {
                string cs = ConfigurationManager.ConnectionStrings["SQLCON"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);
                try
                {
                    string query = "SELECT C_CODE AS CourseCode,C_NAME AS CourseName,T_MARKS AS TotalMarks,T_GOT AS TotalGot FROM MARKS WHERE USERID = @USERID";
                    SqlCommand cmnd = new SqlCommand(query, con);
                    cmnd.Parameters.AddWithValue("@USERID", Session["name"]);
                    con.Open();
                    gd_marks.DataSource = cmnd.ExecuteReader();
                    gd_marks.DataBind();
                }
                catch (Exception ex)
                {
                    
                }
                finally
                {
                    con.Close();
                }
            }
        }
    }
}
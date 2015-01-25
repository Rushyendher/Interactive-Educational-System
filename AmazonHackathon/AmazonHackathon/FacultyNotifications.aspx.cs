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
    public partial class FacultyNotifications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txt_date.Text = Calendar1.SelectedDate.ToShortDateString();
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.IsOtherMonth)
            {
                e.Day.IsSelectable = false;
            }
        }
        protected void btn_notify_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["SQLCON"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            try
            {
                string QUERY = "INSERT INTO FACULTY_NOTIFY VALUES(@NOTIFY_DATE,@MSG,@FACULTY_ID)";
                SqlCommand cmnd = new SqlCommand(QUERY, con);
                cmnd.Parameters.AddWithValue("@NOTIFY_DATE", txt_date.Text);
                cmnd.Parameters.AddWithValue("@MSG", txt_notify.Text);
                cmnd.Parameters.AddWithValue("@FACULTY_ID", Session["name"]);
                con.Open();
                int result = cmnd.ExecuteNonQuery();
                if (result >= 1)
                {
                    lb_err.Visible = true;
                    lb_err.Text = "Notified...";
                    lb_err.ForeColor = System.Drawing.Color.Green;
                    txt_date.Text = "";
                    txt_notify.Text = "";
                }
                else
                {
                    lb_err.Visible = true;
                    lb_err.Text = "Not Notified...";
                    lb_err.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch(Exception ex)
            {
                lb_err.Visible = true;
                lb_err.Text = ex.Message;
                lb_err.ForeColor = System.Drawing.Color.Red;

            }
            finally
            {
                con.Close();
            }
        }
    }
}
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
    public partial class FacultyUploadAttendance : System.Web.UI.Page
    {
        void Reset()
        {
            txt_ccode.Text = "";
            txt_cname.Text = "";
            txt_total.Text = "";
            txt_attend.Text = "";
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_upload_attend_Click(object sender, EventArgs e)
        {
            string cs =  ConfigurationManager.ConnectionStrings["SQLCON"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            try
            {
                string query = "INSERT INTO ATTENDANCE VALUES(@C_CODE,@C_NAME,@T_CLASSES,@T_ATTEND,@U_ID)";
                SqlCommand cmnd = new SqlCommand(query, con);
                con.Open();
                cmnd.Parameters.AddWithValue("@C_CODE", txt_ccode.Text);
                cmnd.Parameters.AddWithValue("@C_NAME", txt_cname.Text);
                cmnd.Parameters.AddWithValue("@T_CLASSES", txt_total.Text);
                cmnd.Parameters.AddWithValue("@T_ATTEND", txt_attend.Text);
                cmnd.Parameters.AddWithValue("@U_ID", txt_attendance_uid.Text);

                int result = cmnd.ExecuteNonQuery();
                if (result >= 1)
                {
                    lb_err.Visible = true;
                    lb_err.Text = "Uploades successfully";
                    lb_err.ForeColor = System.Drawing.Color.Green;
                    Reset();
                }
                else
                {
                    lb_err.Visible = true;
                    lb_err.Text = "Upload failed";
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
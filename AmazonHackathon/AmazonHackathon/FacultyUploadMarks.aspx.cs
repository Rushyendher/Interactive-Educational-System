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
    public partial class FacultyUploadMarks : System.Web.UI.Page
    {
        void Reset()
        {
            txt_ccode.Text = "";
            txt_cname.Text = "";
            txt_marksgot.Text = "";
            txt_total.Text = "";
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_upload_marks_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["SQLCON"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            try
            {

                string query = "INSERT INTO MARKS VALUES(@C_CODE,@C_NAME,@T_MARKS,@T_GOT,@USERID)";
                SqlCommand cmnd = new SqlCommand(query, con);
                cmnd.Parameters.AddWithValue("@C_CODE", txt_ccode.Text);
                cmnd.Parameters.AddWithValue("@C_NAME", txt_cname.Text);
                cmnd.Parameters.AddWithValue("@T_MARKS", txt_total.Text);
                cmnd.Parameters.AddWithValue("@T_GOT", txt_marksgot.Text);
                cmnd.Parameters.AddWithValue("@USERID", txt_marks_uid.Text);
                con.Open();
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
            catch (Exception ex)
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
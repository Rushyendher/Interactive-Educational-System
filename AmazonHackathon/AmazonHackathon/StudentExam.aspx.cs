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
    public partial class StudentExam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                string cs = ConfigurationManager.ConnectionStrings["SQLCON"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);
                try
                {
                    string query = "select TESTNAME from CONDUCTEXAM";
                    SqlCommand cmnd = new SqlCommand(query, con);
                    con.Open();
                    GridView1.DataSource = cmnd.ExecuteReader();
                    GridView1.DataBind();

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

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void lnKEXAM_Click(object sender, EventArgs e)
        {
            Response.Redirect("WriteOnlineExam.aspx");
        }
    }
}
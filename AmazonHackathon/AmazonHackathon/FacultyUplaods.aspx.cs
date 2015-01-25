using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace AmazonHackathon
{
    public partial class FacultyUplaods : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_upload_Click(object sender, EventArgs e)
        {
            UploadFile();
        }

        public void UploadFile()
        {
            string filePath = FileUpload1.PostedFile.FileName;
            string filename = Path.GetFileName(filePath);
            string ext = Path.GetExtension(filename);
            string contenttype = String.Empty;
            switch (ext)
            {
                case ".doc":
                    contenttype = "application/vnd.ms-word";
                    break;
                case ".docx":
                    contenttype = "application/     ";
                    break;
                case ".pdf":
                    contenttype = "application/pdf";
                    break;
            }
            if (contenttype != String.Empty)
            {

                Stream fs = FileUpload1.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                Byte[] bytes = br.ReadBytes((Int32)fs.Length);

                string cs = ConfigurationManager.ConnectionStrings["SQLCON"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);

                string query = "INSERT INTO UPLOADS VALUES(@NAME,@CONTENT,@DATA)";
                SqlCommand cmd = new SqlCommand(query);
                cmd.Parameters.Add("@NAME", SqlDbType.VarChar).Value = filename;
                cmd.Parameters.AddWithValue("@CONTENT", contenttype);
                cmd.Parameters.AddWithValue("@DATA", bytes);
                InsertUpdateData(cmd);
                lb_msg.ForeColor = System.Drawing.Color.Green;
                lb_msg.Text = "File uploaded";
            }
            else
            {
                lb_msg.ForeColor = System.Drawing.Color.Red;
                lb_msg.Text = "Unknow format";
            }
        }
        private Boolean InsertUpdateData(SqlCommand cmd)
        {
            String cs = ConfigurationManager.ConnectionStrings["SQLCON"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
                return false;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }
    }
}
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

using System.Data.SqlClient;
using System.Configuration;
using System.Data.OleDb;
using fee;
using System.IO;


public partial class next_admin_new_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
            string Extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
            string FolderPath = ConfigurationManager.AppSettings["FolderPath"];
            string FilePath = Server.MapPath(FolderPath + FileName);


            FileUpload1.SaveAs(FilePath);
            Import_To_Grid(FilePath, Extension, rbHDR.SelectedItem.Text);
        }
    }

    private int Import_To_Grid(string FilePath, string Extension, string isHDR)
    {
        string conStr = "";
        switch (Extension)
        {
            case ".xls": //Excel 97-03
                conStr = ConfigurationManager.ConnectionStrings["Excel03ConString"]
                         .ConnectionString;
                break;
            case ".xlsx": //Excel 07
                conStr = ConfigurationManager.ConnectionStrings["Excel07ConString"]
                          .ConnectionString;
                break;
        }
        conStr = String.Format(conStr, FilePath, isHDR);
        OleDbConnection connExcel = new OleDbConnection(conStr);
        OleDbCommand cmdExcel = new OleDbCommand();
        OleDbDataAdapter oda = new OleDbDataAdapter();
        DataTable dt = new DataTable();
        cmdExcel.Connection = connExcel;

        //Get the name of First Sheet
        connExcel.Open();
        DataTable dtExcelSchema;
        dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
        string SheetName = dtExcelSchema.Rows[0]["TABLE_NAME"].ToString();
        connExcel.Close();

        //Read Data from First Sheet
        connExcel.Open();
        cmdExcel.CommandText = "SELECT * From [" + SheetName + "]";
        oda.SelectCommand = cmdExcel;
        oda.Fill(dt);
        connExcel.Close();


        //Bind Data to GridView
        GridView1.Caption = Path.GetFileName(FilePath);
        GridView1.DataSource = dt;
        GridView1.DataBind();
        return 0;
    }

    protected void PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        string FolderPath = ConfigurationManager.AppSettings["FolderPath"];
        string FileName = GridView1.Caption;
        string Extension = Path.GetExtension(FileName);
        string FilePath = Server.MapPath(FolderPath + FileName);

        Import_To_Grid(FilePath, Extension, rbHDR.SelectedItem.Text);
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }





    protected void Button1_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow Gv1 in GridView1.Rows)
        {
            clsregister obj = new clsregister();
            clsregistrationprp objprp = new clsregistrationprp();

            objprp.rollno = Gv1.Cells[0].Text;
            objprp.acadmics = Gv1.Cells[1].Text;
            objprp.hostelfee1 = Gv1.Cells[2].Text;
            objprp.busfee =Gv1.Cells[3].Text;
            objprp.fine = Gv1.Cells[4].Text;
            objprp.exam = Gv1.Cells[5].Text;
            objprp.extra =Gv1.Cells[6].Text;
            objprp.pending = Gv1.Cells[7].Text;
            objprp.total = "0";



            try
            {

                obj.data_entry(objprp);

                Label1.Text = "Records inserted successfully";
            }
            catch (Exception exp)
            {
                Label1.Text = exp + "error";
            }
        }
    }
}

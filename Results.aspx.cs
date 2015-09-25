﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace NHCostumes
{
    public partial class Results : System.Web.UI.Page
    {
        public string varcat = "";
        public string sql;
        protected void Page_Load(object sender, EventArgs e)
        
        {
            if (Request.QueryString["search"] == null) { resultsrow.InnerHtml = "<h2>Try a new search</h2>"; return; }
            try
            {
                sql = "SELECT * FROM costumes WHERE title LIKE '%" + Request.QueryString["search"].Replace(" ", "%") + "%' AND visible = 1 AND quantity > 0 ORDER BY topcategory;";
                string CnStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
                SqlDataAdapter adp = new SqlDataAdapter(sql, CnStr);
                DataSet ds = new DataSet();
                adp.Fill(ds, "TableName");
                DataTable dt = new DataTable();
                dt = ds.Tables[0];
                if (dt.Rows.Count == 0) resultsrow.InnerHtml = "<h2>Sorry, no results found</h2>";
                for (int a = 0; a < dt.Rows.Count; a++)
                {
                    if (dt.Rows[a]["topcategory"].ToString() != varcat)
                    {
                        resultsrow.InnerHtml += "<h2 class='cathead' id='" +
                        dt.Rows[a]["topcategory"].ToString() +
                        "'>" +
                        dt.Rows[a]["topcategory"].ToString() +
                        "</h2>";
                        varcat = dt.Rows[a]["topcategory"].ToString();
                    }
            resultsrow.InnerHtml += "<div class='col-sm-4'><div class='aafeat'><a href='Item?id=" +
            dt.Rows[a]["item_id"].ToString() +
            "'><span class='aatitle'>" +
            dt.Rows[a]["title"].ToString() +
            "</span>" +
            "<img src='images/" +
            dt.Rows[a]["pictures"].ToString().Split(',')[0] +
            "' width='369' height='547' alt='" +
            dt.Rows[a]["title"].ToString() +
            "'/><br/>" +
            "<span class='aaprice'>Rental Price: " +
            string.Format("{0:C02}", dt.Rows[a]["rental"]);
                if (Double.Parse(dt.Rows[a]["purchase"].ToString()) > 0)
                    {
                        resultsrow.InnerHtml += "<br/>Purchase Price: " +
                        string.Format("{0:C02}", dt.Rows[a]["purchase"]);
                    }
                    resultsrow.InnerHtml += "</span></a></div></div>";
                }

            }
            catch (System.Exception exc)
            {
                Title = "Error: Page Not Found";
                resultsrow.InnerHtml = exc.Message;
                resultsrow.InnerHtml += exc;
            }

        }
    }
}
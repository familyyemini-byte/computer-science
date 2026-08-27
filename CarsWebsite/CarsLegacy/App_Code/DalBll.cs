using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Data.SqlClient;



public class DalBll
{

    //התחברות לבסיס נתונים תשפ
    public static SqlConnection GetConnection()
    {
        string path = HttpContext.Current.Server.MapPath("~/App_Data/DataBase.mdf");

        //string connStr = string.Format(@"Data Source=(LocalDB)\v11.0;;AttachDbFilename={0};Integrated Security=True", path);
        string connStr = string.Format(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename={0};Integrated Security=True", path);

        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();

        return conn;
    }


    public static bool IsExist(string sql)
    {

        SqlCommand cmd = new SqlCommand(sql, GetConnection());
            SqlDataReader data = cmd.ExecuteReader();
        if (data.Read())
        {
            data.Close();
            GetConnection().Close();
            return true;
        }
        data.Close();
        GetConnection().Close();
        return false;

    }

    public static void DoQuery(string sql)
    {
    //    GetConnection();
        SqlCommand cmd = new SqlCommand(sql, GetConnection());
        cmd.ExecuteNonQuery();
        GetConnection().Close();
    }


    public static SqlDataReader SelectQuery(string sql)
    {
        //מחזיר רשומות ממסד הנתונים

        SqlCommand cmd = new SqlCommand(sql, GetConnection());
        SqlDataReader data1 = cmd.ExecuteReader();
        return data1;
    }


}


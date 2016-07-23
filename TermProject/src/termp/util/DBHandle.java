package termp.util;

import java.util.Properties;

import com.mysql.jdbc.Connection;

//import curd.util.DbUtil;

import java.sql.*;
import java.io.*;

public class DBHandle {

	//public static Connection getDBHandle()

    private static Connection connection = null;
    public static Connection getDBHandle() {
        if (connection != null)
            return connection;
        else {
            try {
                Properties prop = new Properties();
                InputStream inputStream = DBHandle.class.getClassLoader().getResourceAsStream("/db.properties");
              //InputStream is = ClassLoader.getSystemResourceAsStream("db.properties");
                
                prop.load(inputStream);
                String driver = prop.getProperty("driver");
                String url = prop.getProperty("url");
                String user = prop.getProperty("user");
                String password = prop.getProperty("password");
                Class.forName(driver);
                connection = (Connection) DriverManager.getConnection(url, user, password);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            return connection;
        }

    }    


}



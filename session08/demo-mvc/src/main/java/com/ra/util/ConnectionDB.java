package com.ra.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDB {
    private static final String URL = "jdbc:mysql://localhost:3306/session08";
    private static final String USER = "root";
    private static final String PASSWORD = "150401";

    // tạo phương thức mở kết nối
    public static Connection openConnection() {
        Connection connection = null;
        try {
            // đky drive
            Class.forName("com.mysql.cj.jdbc.Driver");
            // get ket noi
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return connection;
    }

    // tạo phương thức đóng kết nối
    public static void closeConection( Connection connection){
        if (connection != null){
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

}

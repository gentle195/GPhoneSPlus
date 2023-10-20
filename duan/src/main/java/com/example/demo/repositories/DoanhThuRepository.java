package com.example.demo.repositories;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.demo.DTO.DoanhThuTheoThang;
import org.springframework.stereotype.Repository;

@Repository
public class DoanhThuRepository {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/mydb";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "123";

    public List<DoanhThuTheoThang> getDoanhThusTheoThang(int year) throws Exception {
        Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);

        PreparedStatement statement = connection.prepareStatement("SELECT SUM(tong_tien) AS doanh_thu, MONTH(ngay_thanh_toan) AS thang FROM hoa_don WHERE YEAR(ngay_thanh_toan) = ? GROUP BY thang");
        statement.setInt(1, year);

        ResultSet resultSet = statement.executeQuery();

        List<DoanhThuTheoThang> doanhThus = new ArrayList<>();
        while (resultSet.next()) {
            DoanhThuTheoThang doanhThu = new DoanhThuTheoThang();
            doanhThu.setThang(resultSet.getInt("thang"));
            doanhThu.setDoanhThu(resultSet.getBigDecimal("doanh_thu"));

            doanhThus.add(doanhThu);
        }

        connection.close();

        return doanhThus;
    }
}

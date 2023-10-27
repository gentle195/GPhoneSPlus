package com.example.demo.services;

import com.example.demo.DTO.DoanhThuHang;
import com.example.demo.DTO.DoanhThuSanPham;
import com.example.demo.DTO.DoanhThuTheoThang;

import java.sql.Date;
import java.util.List;

public interface ThongKeService {

    int countHD();
    int avgHD();
    List<DoanhThuTheoThang> doanhThu();
    List<DoanhThuTheoThang> selectedYear();
    List<DoanhThuTheoThang> loctheonam(Integer Nam);

    List<DoanhThuHang> doanhThuHang();
    List<DoanhThuHang> locdoanhThuHang(Date startDate, Date endDate);

    List<DoanhThuSanPham> doanhThuSanPham();
    List<DoanhThuSanPham> selectedHang();
    List<DoanhThuSanPham> locHang(String ten);

}

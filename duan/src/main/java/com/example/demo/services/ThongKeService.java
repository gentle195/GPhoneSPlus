package com.example.demo.services;

import com.example.demo.DTO.DoanhThuTheoThang;
import com.example.demo.models.HoaDon;
import org.springframework.data.repository.query.Param;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

public interface ThongKeService {

    public int countHD();
    public int avgHD();
    public List<DoanhThuTheoThang> doanhThu();
    List<DoanhThuTheoThang> selectedYear();
    public List<DoanhThuTheoThang> loctheonam(Integer Nam);

    List<DoanhThuTheoThang> doanhThuSanPham();
    List<DoanhThuTheoThang> doanhThuHang();


}

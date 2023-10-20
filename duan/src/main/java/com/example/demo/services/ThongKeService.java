package com.example.demo.services;

import com.example.demo.DTO.DoanhThuTheoThang;
import com.example.demo.models.HoaDon;

import java.math.BigDecimal;
import java.util.List;

public interface ThongKeService {

    public int countHD();
    public int avgHD();

    public List<DoanhThuTheoThang> getDoanhThusInYear(int year);
}

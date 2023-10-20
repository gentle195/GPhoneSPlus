package com.example.demo.services.impl;

import com.example.demo.DTO.DoanhThuTheoThang;
import com.example.demo.models.HoaDon;
import com.example.demo.repositories.ThongKeRepository;
import com.example.demo.services.ThongKeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class ThongKeServiceImpl implements ThongKeService {

    @Autowired
    private ThongKeRepository thongKeRepository;

    @Override
    public int countHD() {
        return thongKeRepository.countHD();
    }

    @Override
    public int avgHD() {
       return   thongKeRepository.avgHD();
    }

    @Override
    public List<DoanhThuTheoThang> getDoanhThusInYear(int year) {
        return thongKeRepository.getDoanhThusInYear(year);
    }
}

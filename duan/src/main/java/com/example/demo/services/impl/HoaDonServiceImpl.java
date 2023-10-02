package com.example.demo.services.impl;

import com.example.demo.models.ChiTietSanPham;
import com.example.demo.models.HoaDon;
import com.example.demo.models.HoaDonChiTiet;
import com.example.demo.repositories.ChiTietSanPhamRepository;
import com.example.demo.repositories.HoaDonChiTietRepository;
import com.example.demo.repositories.HoaDonRepository;
import com.example.demo.repositories.IMEIRepository;
import com.example.demo.services.HoaDonService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service

public class HoaDonServiceImpl implements HoaDonService {

    @Autowired
    HoaDonRepository hoaDonRepository;
    @Autowired
    HoaDonChiTietRepository hoaDonChiTietRepository;
    @Autowired
    IMEIRepository imeiRepository;
    @Autowired
    ChiTietSanPhamRepository chiTietSanPhamRepository;

    private HoaDon hoaDon;

    @Override
    public Page<HoaDon> getAll(Pageable pageable) {
        return hoaDonRepository.findAll(pageable);
    }

    @Override
    public List<HoaDon> findAll() {
        return hoaDonRepository.findAll();
    }

    @Override
    public List<HoaDon> find() {
        return hoaDonRepository.find();
    }

    @Override
    public HoaDon findById(UUID id) {
        return hoaDonRepository.findById(id).orElse(null);
    }

    @Override
    public HoaDon add(HoaDon hoaDon) {
        return hoaDonRepository.save(hoaDon);
    }

    @Override
    public HoaDon update(UUID id, HoaDon hoaDon) {
        if (id != null) {
            HoaDon hoaDonUpdate = hoaDonRepository.findById(id).orElse(null);
            if (hoaDonUpdate != null) {
                BeanUtils.copyProperties(hoaDon, hoaDonUpdate);
                hoaDonRepository.save(hoaDonUpdate);
            }
        }
        return null;
    }

    @Override
    public HoaDon thanhToan(HoaDon hoaDon) {
        return hoaDonRepository.save(hoaDon);
    }

    @Override
    public Boolean delete(UUID id) {
        if (id != null) {
            HoaDon hoaDon = hoaDonRepository.findById(id).orElse(null);
            if (hoaDon != null) {
                hoaDonRepository.delete(hoaDon);
                return true;
            }
        }
        return false;
    }

    @Override
    public void update(UUID id, int tinhTrang, Date ngayCapNhat) {
        hoaDonRepository.update(id, tinhTrang, ngayCapNhat);
    }

    @Override
    public void autoUpdate() {
        Date getDate = Date.valueOf(LocalDate.now());
        List<HoaDon> list = listAuto();

        for (HoaDon hd : list) {
            List<HoaDonChiTiet> hdct = hoaDonChiTietRepository.getHoaDonChiTiet(hd.getId());
            System.out.println(hdct);

            if (!hdct.isEmpty()) {
                for (HoaDonChiTiet ct : hdct) {
                    ChiTietSanPham ctsp = chiTietSanPhamRepository.getChiTiet(ct.getImei().getId());
                    ctsp.setSoLuong(ctsp.getSoLuong() + 1);
                    long millis = System.currentTimeMillis();
                    Date date = new Date(millis);
                    ctsp.setNgayTao(date);
                    if (ctsp.getSoLuong() > 0) {
                        ctsp.setTinhTrang(0);
                    }
                    chiTietSanPhamRepository.save(ctsp);
                    imeiRepository.updateImei1(date, ct.getId());
                    hoaDonRepository.deleteById(ct.getId());
                }
                // Cập nhật tình trạng và ngày cập nhật sau khi xử lý tất cả HoaDonChiTiet
                hd.setTinhTrang(8);
                hd.setNgayCapNhat(getDate);
                hoaDonRepository.save(hd);
            } else {
                // Cập nhật tình trạng và ngày cập nhật sau khi xử lý tất cả HoaDonChiTiet
                hd.setTinhTrang(8);
                hd.setNgayCapNhat(getDate);
                hoaDonRepository.save(hd);
            }
        }
    }

    private List<HoaDon> listAuto() {
        Date getDate = Date.valueOf(LocalDate.now());
        List<HoaDon> list = hoaDonRepository.findAll();
        List<HoaDon> resultList = new ArrayList<>();
        for (HoaDon hd : list
        ) {
            if (hd.getTinhTrang() == 0) {
                resultList.add(hd);
            }
        }
        return resultList;
    }
}

package com.example.demo.services.impl;

import com.example.demo.models.ChiTietSanPham;
import com.example.demo.models.DiaChi;
import com.example.demo.models.GioHang;
import com.example.demo.models.GioHangChiTiet;
import com.example.demo.repositories.BanHangOnLinerepository;
import com.example.demo.services.BanHangOnlineService;
import com.example.demo.viewmodels.TongtienvsTongspchon;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
@Service
public class BanHangOnlineServiceImpl implements BanHangOnlineService {
@Autowired
    BanHangOnLinerepository banHangOnLinerepository;
    @Override
    public Integer tonggiamgia(String idctsp) {
        if(banHangOnLinerepository.tonggiamgia(UUID.fromString(idctsp))==null) {
            return 0;
        }

return banHangOnLinerepository.tonggiamgia(UUID.fromString(idctsp));
    }

    @Override
    public List<ChiTietSanPham> ctspbanhang() {
        return banHangOnLinerepository.ctspbanhang();
    }

    @Override
    public Integer soluongcon(String idctsp) {
        return banHangOnLinerepository.soluongcon(UUID.fromString(idctsp));
    }

    @Override
    public Integer soluongdaban(String idctsp) {
        return banHangOnLinerepository.soluongdaban(UUID.fromString(idctsp));
    }

    @Override
    public List<ChiTietSanPham> locbanhang(String idHang,
                                           String moTaCam,
                                           String moTaMan,
                                           String moTaMau,
                                           String idRam,
                                           String idRom,
                                           String idPin,
                                           String idDLPin,
                                           String idChip,
                                           String tenSP)
    {        return banHangOnLinerepository.locbanhang(idHang,
            moTaCam,
            moTaMan,
            moTaMau,
            idRam,
            idRom,
            idPin,
            idDLPin,
            idChip,
            tenSP);
    }

    @Override
    public List<ChiTietSanPham> ListctspTheoidsp(String idsp) {
        return banHangOnLinerepository.ListctspTheoidsp(UUID.fromString(idsp));
    }

    @Override
    public List<GioHang> ListghTheoidkh(String idkh) {
        return banHangOnLinerepository.ListghTheoidkh(UUID.fromString(idkh));
    }

    @Override
    public Integer sl1ctsptronggh(UUID idgh, UUID idctsp) {
        return banHangOnLinerepository.sl1ctsptronggh(idgh,idctsp);
    }

    @Override
    public List<GioHangChiTiet> ListghctTheoidgh(UUID idgh) {
        return banHangOnLinerepository.ListghctTheoidgh(idgh);
    }

    @Override
    public List<GioHangChiTiet> ListghctTheoIdghvsIdctsp(UUID idgh, UUID idctsp) {
        return banHangOnLinerepository.ListghctTheoIdghvsIdctsp(idgh,idctsp);
    }

    @Override
    public TongtienvsTongspchon TongtienvsTongspchon(UUID idgh) {
        return banHangOnLinerepository.TongtienvsTongspchon(idgh);
    }

    @Override
    public void trangthaighct(Integer trangthai, UUID idgh) {
        banHangOnLinerepository.trangthaighct(trangthai,idgh);
    }

    @Override
    public List<GioHangChiTiet> ListghTheoidghvsTT1(UUID idgh) {
        return banHangOnLinerepository.ListghTheoidghvsTT1(idgh);
    }

    @Override
    public List<DiaChi> Listdiachimotkhachang(UUID idkh) {
        return banHangOnLinerepository.Listdiachimotkhachang(idkh);
    }


}

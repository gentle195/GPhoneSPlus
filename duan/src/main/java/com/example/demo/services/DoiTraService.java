package com.example.demo.services;

import com.example.demo.models.ChiTietSanPham;
import com.example.demo.models.DoiTra;
import com.example.demo.models.HoaDon;
import com.example.demo.models.HoaDonChiTiet;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.UUID;

public interface DoiTraService {
    public Page<DoiTra> getAll(Pageable pageable);

    public List<DoiTra> findAll();

    public DoiTra findById(UUID id);

    public DoiTra add(DoiTra doiTra);

    public DoiTra update(UUID id, DoiTra doiTra);

    public Boolean delete(UUID id);

    public Page<DoiTra> getAll0(Pageable pageable) ;

    public Page<DoiTra> getAll1(Pageable pageable) ;

    public Page<DoiTra> getAll2(Pageable pageable) ;


    public Page<HoaDon> getAllhoadon(Pageable pageable) ;
    public Page<HoaDon> getAllHD(Pageable pageable);

    public List<HoaDonChiTiet> getHoaDonChiTiet(UUID id);



    List<ChiTietSanPham> locbanhang(String idHang,
                                    String moTaCam,
                                    String moTaMan,
                                    String moTaMau,
                                    String idRam,
                                    String idRom,
                                    String idPin,
                                    String idDLPin,
                                    String idChip,
                                    String tenSP);

    public List<DoiTra> fillAll0();

    public List<DoiTra> fillAll1();

    public List<DoiTra> fillAll2();
}



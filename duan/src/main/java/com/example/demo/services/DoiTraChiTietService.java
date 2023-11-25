package com.example.demo.services;

import com.example.demo.models.DoiTra;
import com.example.demo.models.DoiTraChiTiet;
import com.example.demo.models.HoaDonChiTiet;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.UUID;

public interface DoiTraChiTietService {
    public Page<DoiTraChiTiet> getAll(Pageable pageable);

    public DoiTraChiTiet add(DoiTraChiTiet doiTraChiTiet);

    public DoiTraChiTiet update(UUID id, DoiTraChiTiet doiTraChiTiet);

    public Boolean delete(UUID id);

    List<HoaDonChiTiet> getHoaDonChiTiet(UUID id);

    List<HoaDonChiTiet> getHoaDonChiTietByIdList(@Param("idList") List<UUID> idList);
    public List<DoiTraChiTiet> getDoiTraChiTietByIdList(@Param("idList") List<UUID> idList);
     List<DoiTraChiTiet> getAll();
    public boolean existsByDoiTraAndHoaDonChiTiet(DoiTra doiTra, HoaDonChiTiet hoaDonChiTiet);


    List<DoiTraChiTiet> getDoiTraChiTietByDoiTraId(UUID id);
    public DoiTraChiTiet findById(UUID id);

    DoiTraChiTiet findByHDCT(UUID id);


}
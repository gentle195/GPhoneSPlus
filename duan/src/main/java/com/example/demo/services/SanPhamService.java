package com.example.demo.services;

import com.example.demo.models.Rom;
import com.example.demo.models.SanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface SanPhamService {
    public Page<SanPham> getAll(Pageable pageable);

    public List<SanPham> findAll();

    public List<SanPham> findAll0();

    public SanPham findById(UUID id);

    public SanPham add(SanPham sanPham);

    public SanPham update(UUID id, SanPham sanPham);

    public SanPham update1(SanPham sanPham);

    public Boolean delete(UUID id);

    List<SanPham> search(String dungluong);

    List<SanPham> search2(String dungluong);

    public Page<SanPham> getAll0(Pageable pageable);

    Page<SanPham> getall1(Pageable pageable);

    void update0();

    List<SanPham> loc(UUID idHang, UUID idMan, UUID idCamera);
}



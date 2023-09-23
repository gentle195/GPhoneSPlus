package com.example.demo.repositories;

import com.example.demo.models.Rom;
import com.example.demo.models.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface SanPhamRepository extends JpaRepository<SanPham, UUID> {
    @Query("SELECT r FROM SanPham r WHERE r.ten LIKE %:dungluong% or r.heDieuHanh LIKE %:dungluong%")
    List<SanPham> search(String dungluong);
}

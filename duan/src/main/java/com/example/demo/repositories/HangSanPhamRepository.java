package com.example.demo.repositories;

import com.example.demo.models.HangSanPham;
import com.example.demo.models.Rom;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface HangSanPhamRepository extends JpaRepository<HangSanPham, UUID> {
    @Query("SELECT r FROM HangSanPham r WHERE r.ten LIKE %:dungluong%")
    List<HangSanPham> search(String dungluong);
}

package com.example.demo.repositories;

import com.example.demo.models.KhachHang;
import com.example.demo.models.Rom;
import jakarta.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface RomRepository extends JpaRepository<Rom, UUID> {
    @Query("SELECT r FROM Rom r WHERE r.dungLuong LIKE %:dungluong%")
    List<Rom> search(String dungluong);

    @Query("select r from Rom r  where r.tinhTrang=0")
    Page<Rom> getall0(Pageable pageable);

    @Query("select r from Rom r  where r.tinhTrang=1")
    Page<Rom> getall1(Pageable pageable);

    @Transactional
    @Modifying
    @Query(value ="update rom set tinh_trang=0",nativeQuery = true)
    void update0();

}

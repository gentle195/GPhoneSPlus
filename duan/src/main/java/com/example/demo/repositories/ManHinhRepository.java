package com.example.demo.repositories;

import com.example.demo.models.Camera;
import com.example.demo.models.ManHinh;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface ManHinhRepository extends JpaRepository<ManHinh, UUID> {
    @Query("select c from ManHinh c where c.ma like %:search% or c.thongSo like %:search% or c.congNghe like %:search% " +
            "or c.loaiCamUng like %:search% or c.tiLeKhungHinh like %:search% or c.doPhanGiai like %:search%")
    List<ManHinh> search(String search);
}

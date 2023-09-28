package com.example.demo.repositories;

import com.example.demo.models.NhanVien;
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
public interface NhanVienRepository extends JpaRepository<NhanVien, UUID> {


    @Query("select nv from NhanVien nv  where nv.tinhTrang=0")
    Page<NhanVien> getAll(Pageable pageable);

    @Query("select nv from NhanVien nv  where nv.tinhTrang=1")
    Page<NhanVien> getAll1(Pageable pageable);

    @Query("select nv from NhanVien nv  where nv.tinhTrang=0 and (nv.ma like %:ten% or nv.hoTen like %:ten% or nv.queQuan like %:ten% or nv.taiKhoan like %:ten% " +
            "or nv.sdt like %:ten% or nv.canCuoc like %:ten% or nv.email like %:ten%)")
    List<NhanVien> search0(String ten);

    @Query("select nv from NhanVien nv  where nv.tinhTrang=1 and (nv.ma like %:ten% or nv.hoTen like %:ten% or nv.queQuan like %:ten% or nv.taiKhoan like %:ten% " +
            "or nv.sdt like %:ten% or nv.canCuoc like %:ten% or nv.email like %:ten%)")
    List<NhanVien> search1(String ten);

    @Transactional
    @Modifying
    @Query(value = "update  nhan_vien set tinh_trang=0", nativeQuery = true)
    void updateTT();
}

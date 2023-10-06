package com.example.demo.repositories;

import com.example.demo.models.HoaDon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Repository
public interface HoaDonRepository extends JpaRepository<HoaDon, UUID> {
    @Query("select hd from HoaDon hd where hd.tinhTrang=0")
    List<HoaDon> find();

    @Transactional
    @Modifying
    @Query("update HoaDon hd set hd.tinhTrang=:tinhTrang,hd.ngayCapNhat =:ngayCapNhat where hd.id=:id")
    void update(UUID id, int tinhTrang, Date ngayCapNhat);

    @Query("SELECT hd FROM HoaDon hd " +
            "LEFT JOIN KhachHang kh ON hd.khachHang.id = kh.id " +
            "LEFT JOIN NhanVien nv ON hd.nhanVien.id = nv.id " +
            "LEFT JOIN DiaChi dc ON hd.diaChi.id = dc.id " +
            "LEFT JOIN QuyDoi qd ON hd.quyDoi.id = qd.id " +
            "WHERE hd.ma LIKE %:ten% OR kh.hoTen LIKE %:ten% OR nv.hoTen LIKE %:ten% OR dc.diaChi LIKE %:ten% OR qd.soTienQuyDoi = :soTienQuyDoi")
    List<HoaDon> search(@Param("ten") String ten, @Param("soTienQuyDoi") BigDecimal soTienQuyDoi);




    @Query("select hd from HoaDon hd left join KhachHang kh on hd.khachHang.id = kh.id " +
            "LEFT JOIN NhanVien nv ON hd.nhanVien.id = nv.id " +
//            "LEFT JOIN DiaChi dc ON hd.diaChi.id = dc.id " +
            " where (:idKH is null or kh.id =:idKH) " +
            "and (:idNV is null or nv.id=: idNV) " )
//            "and (:idDC is null or dc.id=: idDC) ")
//            "AND (:startDate IS NULL OR hd.ngayTao >= :startDate) " +
//            "AND (:endDate IS NULL OR hd.ngayTao <= :endDate) " +
//            "AND (:shipStartDate IS NULL OR hd.ngayShip >= :shipStartDate) " +
//            "AND (:shipEndDate IS NULL OR hd.ngayShip <= :shipEndDate) " +
//            "AND (:receiveStartDate IS NULL OR hd.ngayNhan >= :receiveStartDate) " +
//            "AND (:receiveEndDate IS NULL OR hd.ngayNhan <= :receiveEndDate)")
    List<HoaDon> loc(
            @Param("idKH") UUID idKH,
            @Param("idNV") UUID idNV
//            , @Param("idDC") UUID idDC
//            @Param("startDate") Date startDate,
//            @Param("endDate") Date endDate,
//            @Param("shipStartDate") Date shipStartDate,
//            @Param("shipEndDate") Date shipEndDate,
//            @Param("receiveStartDate") Date receiveStartDate,
//            @Param("receiveEndDate") Date receiveEndDate
    );

}

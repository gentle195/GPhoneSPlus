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
            "WHERE hd.ma LIKE %:ten% OR kh.hoTen LIKE %:ten% OR nv.hoTen LIKE %:ten% OR dc.diaChi LIKE %:ten% OR qd.soTienQuyDoi = :soTienQuyDoi OR hd.sdt like %:ten%")
    List<HoaDon> search(@Param("ten") String ten, @Param("soTienQuyDoi") BigDecimal soTienQuyDoi);

    @Query("select hd from HoaDon hd " +
            "left join hd.khachHang kh " +
            "LEFT JOIN hd.nhanVien nv " +
            "LEFT JOIN hd.diaChi dc " +
            " where (:idKH IS NULL OR kh.id=:idKH) " +
            "and (:idNV IS NULL OR nv.id=:idNV)  " +
            "and (:idDC IS NULL OR dc.id=:idDC) " +
            "AND ((:startDate IS NULL and:endDate IS NULL) OR hd.ngayTao between :startDate and :endDate) " +
            "AND ((:shipStartDate IS NULL and :shipEndDate IS NULL) OR hd.ngayShip between :shipStartDate and :shipEndDate) " +
            "AND ((:receiveStartDate IS NULL and :receiveEndDate IS NULL) OR hd.ngayNhan between :receiveStartDate and :receiveEndDate) "
//            +
//            "AND ()"
    )
    List<HoaDon> loc1(
            UUID idKH, UUID idNV, UUID idDC
            , @Param("startDate") Date startDate,
            @Param("endDate") Date endDate,
            @Param("shipStartDate") Date shipStartDate,
            @Param("shipEndDate") Date shipEndDate,
            @Param("receiveStartDate") Date receiveStartDate,
            @Param("receiveEndDate") Date receiveEndDate
    );
    @Query("SELECT h FROM HoaDon h WHERE h.ngayThanhToan >= :startDate")
    List<HoaDon> findAllByCreatedAtAfter(@Param("startDate") java.util.Date startDate);
}

package com.example.demo.repositories;

import com.example.demo.DTO.DoanhThuTheoThang;
import com.example.demo.models.HoaDon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Repository
public interface ThongKeRepository extends JpaRepository<HoaDon, UUID> {

    @Query(value = "select count(h) from HoaDon h where  h.tinhTrang = 2")
    int countHD();

    @Query(value = "select avg (h.tongTien) from HoaDon h  where h.tinhTrang = 2")
    int avgHD();

    @Query(value = "SELECT SUM(tong_tien) AS doanh_thu, MONTH(ngay_thanh_toan) AS thang FROM " +
            "hoa_don WHERE YEAR(ngay_thanh_toan) = ? GROUP BY thang", nativeQuery = true)
    List<DoanhThuTheoThang> getDoanhThusInYear(int year);

//    @Query("select hd from HoaDon hd where hd.ngayTao <= :endDate and hd.ngayTao >= :startDate")
//    List<HoaDon> getHoaDonInRangeDate(Date startDate, Date endDate);
}

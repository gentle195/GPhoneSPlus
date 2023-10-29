package com.example.demo.repositories;

import com.example.demo.DTO.DoanhThuHang;
import com.example.demo.DTO.DoanhThuSanPham;
import com.example.demo.DTO.DoanhThuTheoThang;
import com.example.demo.models.HoaDon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.sql.Date;
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

    @Query(value = "SELECT MONTH(ngay_thanh_toan) AS thang,\n" +
            "            COUNT(hoa_don_chi_tiet.so_luong) as soLuongSP,\n" +
            "            SUM(tong_tien) AS DoanhThu,\n" +
            "            MIN(tong_tien) AS GiaMuaMin, MAX(tong_tien) AS GiaMuaMax,\n" +
            "            AVG(tong_tien) AS DoanhThuTrungBinh\n" +
            "            FROM hoa_don left join hoa_don_chi_tiet on hoa_don.id = hoa_don_chi_tiet.id_hoa_don\n" +
            "            where YEAR(ngay_thanh_toan) = 2023" +
            "            GROUP BY MONTH(ngay_thanh_toan)", nativeQuery = true)
    List<DoanhThuTheoThang> doanhThu();

    @Query(value = "SELECT MONTH(ngay_thanh_toan) AS thang,\n" +
            "            COUNT(hoa_don_chi_tiet.so_luong) as soLuongSP,\n" +
            "            SUM(tong_tien) AS DoanhThu,\n" +
            "            MIN(tong_tien) AS GiaMuaMin, MAX(tong_tien) AS GiaMuaMax,\n" +
            "            AVG(tong_tien) AS DoanhThuTrungBinh\n" +
            "            FROM hoa_don left join hoa_don_chi_tiet on hoa_don.id = hoa_don_chi_tiet.id_hoa_don\n" +
            "            where YEAR(ngay_thanh_toan) = ?1\n" +
            "            GROUP BY MONTH(ngay_thanh_toan)", nativeQuery = true)
    List<DoanhThuTheoThang> loctheonam(Integer Nam);

    @Query(value = "SELECT YEAR(ngay_thanh_toan) AS Nam FROM hoa_don GROUP BY YEAR(ngay_thanh_toan)",nativeQuery = true)
    List<DoanhThuTheoThang> selectedYear();


    @Query(value = "SELECT san_pham.ten as tenSanPham,\n" +
            "COUNT(hoa_don_chi_tiet.id_imei) AS soLuongSP,\n" +
            "SUM(don_gia) as DoanhThu,\n" +
            "MIN(don_gia) AS GiaMuaMin, MAX(don_gia) AS GiaMuaMax,\n" +
            "AVG(don_gia) AS DoanhThuTrungBinh\n" +
            "FROM hoa_don\n" +
            "LEFT JOIN hoa_don_chi_tiet ON hoa_don.id = hoa_don_chi_tiet.id_hoa_don\n" +
            "LEFT JOIN imei ON hoa_don_chi_tiet.id_imei = imei.id\n" +
            "LEFT JOIN chi_tiet_san_pham ON imei.id_chi_tiet_san_pham = chi_tiet_san_pham.id \n" +
            "LEFT JOIN san_pham ON chi_tiet_san_pham.id_san_pham = san_pham.id\n" +
            "WHERE hoa_don.tinh_trang = 2\n" +
            "GROUP BY san_pham.ten", nativeQuery = true)
    List<DoanhThuSanPham> doanhThuSanPham();

    @Query(value = "SELECT hang_dien_thoai.ten as tenHang," +
            "san_pham.ten as tenSanPham ,\n" +
            "COUNT(san_pham.id_hang) as soLuongSP,\n" +
            "SUM(don_gia) AS DoanhThu,\n" +
            "MIN(don_gia) AS GiaMuaMin, MAX(don_gia) AS GiaMuaMax,\n" +
            "AVG(don_gia) AS DoanhThuTrungBinh\n" +
            "FROM hoa_don LEFT JOIN hoa_don_chi_tiet ON hoa_don.id = hoa_don_chi_tiet.id_hoa_don\n" +
            "             LEFT JOIN imei ON hoa_don_chi_tiet.id_imei = imei.id\n" +
            "             LEFT JOIN chi_tiet_san_pham ON imei.id_chi_tiet_san_pham = chi_tiet_san_pham.id\n" +
            "             LEFT JOIN san_pham ON chi_tiet_san_pham.id_san_pham = san_pham.id\n" +
            "             LEFT JOIN hang_dien_thoai ON  hang_dien_thoai.id = san_pham.id_hang\n" +
            "WHERE hang_dien_thoai.ten like %:ten%\n" +
            "GROUP BY hang_dien_thoai.ten, san_pham.ten", nativeQuery = true)
    List<DoanhThuSanPham> locHang(String ten);

    @Query(value = "SELECT hang_dien_thoai.ten as tenHang\n" +
            "FROM hoa_don LEFT JOIN hoa_don_chi_tiet ON hoa_don.id = hoa_don_chi_tiet.id_hoa_don\n" +
            "             LEFT JOIN imei ON hoa_don_chi_tiet.id_imei = imei.id\n" +
            "             LEFT JOIN chi_tiet_san_pham ON imei.id_chi_tiet_san_pham = chi_tiet_san_pham.id\n" +
            "             LEFT JOIN san_pham ON chi_tiet_san_pham.id_san_pham = san_pham.id\n" +
            "             LEFT JOIN hang_dien_thoai ON  hang_dien_thoai.id = san_pham.id_hang\n" +
            "GROUP BY hang_dien_thoai.ten", nativeQuery = true)
    List<DoanhThuSanPham> selectedHang();

    @Query(value = "SELECT hang_dien_thoai.ten as tenHang,\n" +
            "COUNT(san_pham.id_hang) as soLuongSP,\n" +
            "SUM(don_gia) AS DoanhThu,\n" +
            "MIN(don_gia) AS GiaMuaMin, MAX(don_gia) AS GiaMuaMax,\n" +
            "AVG(don_gia) AS DoanhThuTrungBinh\n" +
            "FROM hoa_don LEFT JOIN hoa_don_chi_tiet ON hoa_don.id = hoa_don_chi_tiet.id_hoa_don\n" +
            "             LEFT JOIN imei ON hoa_don_chi_tiet.id_imei = imei.id\n" +
            "             LEFT JOIN chi_tiet_san_pham ON imei.id_chi_tiet_san_pham = chi_tiet_san_pham.id\n" +
            "             LEFT JOIN san_pham ON chi_tiet_san_pham.id_san_pham = san_pham.id\n" +
            "             LEFT JOIN hang_dien_thoai ON  hang_dien_thoai.id = san_pham.id_hang\n" +
            "WHERE hoa_don.tinh_trang = 2\n" +
            "GROUP BY hang_dien_thoai.ten", nativeQuery = true)
    List<DoanhThuHang> doanhThuHang();

    @Query(value = "SELECT hang_dien_thoai.ten as tenHang,\n" +
            "COUNT(san_pham.id_hang) as soLuongSP,\n" +
            "SUM(don_gia) AS DoanhThu,\n" +
            "MIN(don_gia) AS GiaMuaMin, MAX(don_gia) AS GiaMuaMax,\n" +
            "AVG(don_gia) AS DoanhThuTrungBinh\n" +
            "FROM hoa_don LEFT JOIN hoa_don_chi_tiet ON hoa_don.id = hoa_don_chi_tiet.id_hoa_don\n" +
            "             LEFT JOIN imei ON hoa_don_chi_tiet.id_imei = imei.id\n" +
            "             LEFT JOIN chi_tiet_san_pham ON imei.id_chi_tiet_san_pham = chi_tiet_san_pham.id\n" +
            "             LEFT JOIN san_pham ON chi_tiet_san_pham.id_san_pham = san_pham.id\n" +
            "             LEFT JOIN hang_dien_thoai ON  hang_dien_thoai.id = san_pham.id_hang\n" +
            "WHERE hoa_don.tinh_trang = 2\n" +
            "AND ngay_thanh_toan BETWEEN :startDate AND :endDate\n" +
            "GROUP BY hang_dien_thoai.ten", nativeQuery = true)
    List<DoanhThuHang> locdoanhThuHang(@Param("startDate") Date startDate,@Param("endDate") Date endDate);

}

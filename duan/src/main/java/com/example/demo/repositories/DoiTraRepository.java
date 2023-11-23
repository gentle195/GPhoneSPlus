package com.example.demo.repositories;

import com.example.demo.models.ChiTietSanPham;
import com.example.demo.models.DoiTra;
import com.example.demo.models.HoaDon;
import com.example.demo.models.HoaDonChiTiet;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface DoiTraRepository extends JpaRepository<DoiTra, UUID> {
    @Query("SELECT d from DoiTra d where d.tinhTrang=0")
    Page<DoiTra> fillAll0(Pageable pageable);

    @Query("SELECT d from DoiTra d where d.tinhTrang=1")
    Page<DoiTra> fillAll1(Pageable pageable);

    @Query("SELECT d from DoiTra d where d.id=:id")
    List<DoiTra> findId(UUID id);

    @Query("SELECT d from DoiTra d where d.tinhTrang=2")
    Page<DoiTra> fillAll2(Pageable pageable);

    @Query("SELECT d from HoaDon d where d.tinhTrang=2")
    Page<HoaDon> fillAllHoaDon(Pageable pageable);

    @Query("SELECT d FROM HoaDon d WHERE d.tinhTrang = 2 AND NOT EXISTS (SELECT 1 FROM DoiTra dt WHERE dt.hoaDon.id = d.id)")
    Page<HoaDon> getAllHD(Pageable pageable);

    @Query("SELECT d from DoiTra d where d.tinhTrang=0")
    List<DoiTra> getAll0();

    @Query("SELECT d from DoiTra d where d.tinhTrang=1")
    List<DoiTra> getAll1();

    @Query("SELECT d from DoiTra d where d.tinhTrang=2")
    List<DoiTra> getAll2();

    @Query("select hdct from HoaDonChiTiet hdct left join HoaDon hd on hdct.hoaDon.id=hd.id where hd.id=:id")
    List<HoaDonChiTiet> getHoaDonChiTiet(UUID id);







    @Query("SELECT ct FROM ChiTietSanPham ct LEFT JOIN SanPham sp ON ct.sanPham.id = sp.id " +
            "LEFT JOIN HangSanPham hang ON sp.hangSanPham.id = hang.id " +
            "LEFT JOIN Ram ram ON ct.ram.id = ram.id " +
            "LEFT JOIN Rom rom ON ct.rom.id = rom.id " +
            "LEFT JOIN Pin pin ON ct.pin.id = pin.id " +
            "LEFT JOIN MauSac ms ON ct.mauSac.id = ms.id " +
            "LEFT JOIN Chip chip ON ct.chip.id = chip.id " +
            "LEFT JOIN DungLuongPin dungLuong ON pin.dungLuongPin.id = dungLuong.id " +
            "LEFT JOIN ManHinh manHinh ON sp.manHinh.id = manHinh.id " +
            "LEFT JOIN Camera cam ON sp.camera.id = cam.id " +
            "WHERE " +
            "(:idHang = 'null' OR hang.ten = :idHang) " +
            "AND (:idRam = 'null' OR ram.dungLuong = :idRam) " +
            "AND (:idRom = 'null' OR rom.dungLuong = :idRom) " +
            "AND (:idPin = 'null' OR pin.loaiPin = :idPin) " +
            "AND (:idDLPin = 'null' OR dungLuong.thongSo = :idDLPin) " +
            "AND (:idChip = 'null' OR chip.ten = :idChip) " +
            "AND (:moTaMan = 'null' OR manHinh.thongSo = :moTaMan) " +
            "AND (:moTaCam = 'null' OR cam.thongSo = :moTaCam) " +
            "AND (:moTaMau = 'null' OR ms.ten = :moTaMau) " +
            "AND (:tenSP = 'null' OR sp.ten = :tenSP) " +
            "AND (ct.tinhTrang = 0 AND sp.tinhTrang = 0)")
    List<ChiTietSanPham> locbanhang(@Param("idHang") String idHang,
                                    @Param("moTaCam") String moTaCam,
                                    @Param("moTaMan") String moTaMan,
                                    @Param("moTaMau") String moTaMau,
                                    @Param("idRam") String idRam,
                                    @Param("idRom") String idRom,
                                    @Param("idPin") String idPin,
                                    @Param("idDLPin") String idDLPin,
                                    @Param("idChip") String idChip,
                                    @Param("tenSP") String tenSP);




}

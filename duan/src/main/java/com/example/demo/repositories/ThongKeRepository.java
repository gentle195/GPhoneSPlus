package com.example.demo.repositories;

import com.example.demo.models.HoaDon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

@Repository
public interface ThongKeRepository extends JpaRepository<HoaDon, UUID> {

    @Query(value = "select count(h) from HoaDon h where  h.tinhTrang = 1")
    int countHD();

    @Query(value = "select avg (h.tongTien) from HoaDon h  where h.tinhTrang = 1")
    int avgHD();

}

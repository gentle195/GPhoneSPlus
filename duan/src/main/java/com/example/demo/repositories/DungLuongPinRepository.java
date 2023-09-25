package com.example.demo.repositories;

import com.example.demo.models.Chip;
import com.example.demo.models.DungLuongPin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface DungLuongPinRepository extends JpaRepository<DungLuongPin, UUID> {
    @Query("select c from DungLuongPin c  where c.ma like %:ten% or c.thongSo like %:ten%")
    List<DungLuongPin> sreach(String ten);
}

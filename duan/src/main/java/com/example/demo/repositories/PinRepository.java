package com.example.demo.repositories;

import com.example.demo.models.Chip;
import com.example.demo.models.Pin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface PinRepository extends JpaRepository<Pin, UUID> {
    @Query("select c from Pin c  where c.ma like %:ten% or c.loaiPin like %:ten%")
    List<Pin> sreach(String ten);
}

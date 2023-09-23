package com.example.demo.repositories;

import com.example.demo.models.Rom;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface RomRepository extends JpaRepository<Rom, UUID> {
    @Query("SELECT r FROM Rom r WHERE r.dungLuong LIKE %:dungluong%")
    List<Rom> search(String dungluong);

}

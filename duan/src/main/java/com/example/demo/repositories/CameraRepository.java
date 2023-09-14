package com.example.demo.repositories;

import com.example.demo.models.Camera;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface CameraRepository extends JpaRepository<Camera, UUID> {
    @Query("select c from Camera c where c.ma like %:search% or c.thongSo like %:search%")
    List<Camera> search(String search);
}

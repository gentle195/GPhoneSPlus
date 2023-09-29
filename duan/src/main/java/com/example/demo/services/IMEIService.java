package com.example.demo.services;

import com.example.demo.models.IMEI;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.sql.Date;
import java.util.List;
import java.util.UUID;

public interface IMEIService {
    public Page<IMEI> getAll(Pageable pageable);

    public List<IMEI> getIMEI(UUID id);

    public List<IMEI> searchOn(String imei);

    public List<IMEI> searchOff(String imei);

    public List<IMEI> findAll();

    public List<IMEI> findAll0();

    public IMEI findById(UUID id);

    public IMEI add(IMEI imei);

    public IMEI update(UUID id, IMEI imei);

    public IMEI updateI(IMEI imei);

    public Boolean delete(UUID id);

    public void updatImei(Date date, UUID id);

    public void updatImei1(Date date, UUID id);

    public Page<IMEI> getImeiOn(Pageable pageable);

    public Page<IMEI> getImeiOff(Pageable pageable);

    public List<IMEI> getImeiOff();

    public void khoiPhuc(UUID uuid);
}



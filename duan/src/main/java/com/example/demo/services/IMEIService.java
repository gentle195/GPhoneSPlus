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

    public List<IMEI> searchOff2(String imei);

    public List<IMEI> findAll();

    public List<IMEI> findAll0();

    public IMEI searchSoImei(String imei);

    public String searchSoImei2(String imei);

    public IMEI findById(UUID id);

    public IMEI add(IMEI imei);

    public IMEI update(UUID id, IMEI imei);

    public IMEI updateI(IMEI imei);

    public Boolean delete(UUID id);

    public void updatImei(Date date, UUID id);

    public void updatImeiChoXuLy(Date date, UUID id);

    public void updatImei1(Date date, UUID id);

    public Page<IMEI> getImeiOn(Pageable pageable);

    public Page<IMEI> getImeiOff(Pageable pageable);

    public List<IMEI> getImeiOff();

    Page<IMEI> getImeiOff3(Pageable pageable);

    List<IMEI> findAll3();

    public void khoiPhuc(UUID uuid);
}



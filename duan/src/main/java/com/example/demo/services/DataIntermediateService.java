package com.example.demo.services;

import com.example.demo.models.KhachHang;
import org.springframework.stereotype.Service;

@Service
public class DataIntermediateService {
    private KhachHang sharedData;

    public void setSharedData(KhachHang data) {
        this.sharedData = data;
    }

    public KhachHang getSharedData() {
        return sharedData;
    }

}

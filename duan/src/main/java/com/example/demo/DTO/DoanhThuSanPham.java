package com.example.demo.DTO;

import java.math.BigDecimal;

public interface DoanhThuSanPham {

    String getTenSanPham();
    String getTenHang();
    Integer getSoLuongSP();
    BigDecimal getDoanhThu();
    BigDecimal getGiaMuaMin();
    BigDecimal getGiaMuaMax();
    BigDecimal getDoanhThuTrungBinh();

}


package com.example.demo.controllers;

import com.example.demo.DTO.DoanhThuTheoThang;
import com.example.demo.models.HoaDon;
import com.example.demo.services.ThongKeService;
import org.bouncycastle.math.raw.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.DecimalFormat;
import java.util.List;

@RequestMapping("thong-ke")
@Controller
public class ThongKeController {

    @Autowired
    private ThongKeService thongKeService;

    @GetMapping("/hien-thi")
    public String hienThi(Model model) {
        DecimalFormat df = new DecimalFormat("#,###");
        model.addAttribute("listCount", thongKeService.countHD());
        model.addAttribute("listAvg",df.format(thongKeService.avgHD()));
        model.addAttribute("contentPage", "../thongke/thong-ke.jsp");
        return "/home/layout";
    }

    @GetMapping("/doanh-thu-theo-nam/{year}")
    public String getDoanhThusTheoNam(Model model,@PathVariable(value = "year", required = false) int year) {
        List<DoanhThuTheoThang> doanhThus = thongKeService.getDoanhThusInYear(year);
        model.addAttribute("doanhThus", doanhThus);
        model.addAttribute("year", year);
        model.addAttribute("contentPage", "../thongke/thong-ke.jsp");
        return "/home/layout";
    }
}

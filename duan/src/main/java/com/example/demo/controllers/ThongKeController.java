package com.example.demo.controllers;

import com.example.demo.DTO.DoanhThuTheoThang;
import com.example.demo.services.ThongKeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.DecimalFormat;
import java.util.List;

@RequestMapping("/thong-ke")
@Controller
public class ThongKeController {

    @Autowired
    private ThongKeService thongKeService;

    @GetMapping("/hien-thi")
    public String hienThi(Model model) {

        List<DoanhThuTheoThang> doanhThuTheoThangs = thongKeService.doanhThu();
        List<DoanhThuTheoThang> selected = thongKeService.selectedYear();

        model.addAttribute("listDoanhThu", doanhThuTheoThangs);
        model.addAttribute("listYear", selected);

        DecimalFormat df = new DecimalFormat("#,###");
//        model.addAttribute("listCount", thongKeService.countHD());
//        model.addAttribute("listAvg",df.format(thongKeService.avgHD()));
        model.addAttribute("contentPage", "../thongke/thong-ke.jsp");
        return "/home/layout";
    }


    @PostMapping("/loc-nam")
    public String locNam(Model model, @ModelAttribute("namSelect") Integer nam) {
        List<DoanhThuTheoThang> doanhThuTheoThangs = thongKeService.loctheonam(nam);
        model.addAttribute("listDoanhThu", doanhThuTheoThangs);

        List<DoanhThuTheoThang> selected = thongKeService.selectedYear();
        model.addAttribute("listYear", selected);
        DecimalFormat df = new DecimalFormat("#,###");
//        model.addAttribute("listCount", thongKeService.countHD());
//        model.addAttribute("listAvg", df.format(thongKeService.avgHD()));
        model.addAttribute("contentPage", "../thongke/thong-ke.jsp");
        return "/home/layout";
    }


    @GetMapping("/hien-thi-sp")
    public String hienThiDoanhThuSP(Model model) {

        List<DoanhThuTheoThang> doanhThuTheoThangs = thongKeService.doanhThuSanPham();
        model.addAttribute("listDoanhThuSP", doanhThuTheoThangs);
        model.addAttribute("contentPage", "../thongke/thong-ke-sp.jsp");
        return "/home/layout";
    }

    @GetMapping("/hien-thi-hang")
    public String hienThiHang(Model model) {

        List<DoanhThuTheoThang> doanhThuTheoThangs = thongKeService.doanhThuHang();
        model.addAttribute("listDoanhThuHang", doanhThuTheoThangs);
        model.addAttribute("contentPage", "../thongke/thong-ke-hang.jsp");
        return "/home/layout";
    }




//    @GetMapping("/doanh-thu-theo-nam/{year}")
//    public String getDoanhThusTheoNam(Model model,@PathVariable(value = "year", required = false) int year) {
//        List<DoanhThuTheoThang> doanhThus = thongKeService.getDoanhThusInYear(year);
//        model.addAttribute("doanhThus", doanhThus);
//        model.addAttribute("year", year);
//        model.addAttribute("contentPage", "../thongke/thong-ke.jsp");
//        return "/home/layout";
//    }
}

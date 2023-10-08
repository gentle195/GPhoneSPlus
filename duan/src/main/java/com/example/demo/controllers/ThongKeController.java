package com.example.demo.controllers;

import com.example.demo.services.ThongKeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.DecimalFormat;

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
}

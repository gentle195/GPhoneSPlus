package com.example.demo.controllers;

import com.example.demo.models.KhachHang;
import com.example.demo.models.NhanVien;
import com.example.demo.repositories.KhachHangRepository;
import com.example.demo.repositories.NhanVienRepository;
import com.example.demo.services.DataIntermediateService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
    @Autowired
    private NhanVienRepository nhanVienRepository;

    @Autowired
    private KhachHangRepository khachHangRepository;

    @Autowired
    private DataIntermediateService service;

    private String un;
    private NhanVien nhanVien2;//du lieu khi dang nhap la nhan vien
    private KhachHang khachHang2;//du lieu khi dang nhap la khach hang

    @GetMapping("/login")
    public String login() {
        return "login/loginPage";

    }

    @PostMapping("login")
    public String loginSuccess(@RequestParam String username, @RequestParam String password, Model model) {
        NhanVien nhanVien = nhanVienRepository.findByTaiKhoan(username);


        if (nhanVien != null) {
            if (password.contains(nhanVien.getMatKhau())) {
                un = username;
                NhanVien nhanVien1 = nhanVienRepository.findByTaiKhoan(un);
                nhanVien2=nhanVien1;
                System.out.println(nhanVien1.getTaiKhoan());
                return "redirect:/home";
            }
        }
        KhachHang khachHang = khachHangRepository.getKhachHangByTaiKhoan(username);
        if (khachHang != null) {
            if (password.contains(khachHang.getMatKhau())) {
                un = username;
                KhachHang khachHang1 = khachHangRepository.getKhachHangByTaiKhoan(un);
                System.out.println(khachHang1.getTaiKhoan());
                khachHang2=khachHang1;
                service.setSharedData(khachHang2);
                model.addAttribute("khachHang000",khachHang2);
                return "redirect:/ban-hang-online/dang-nhap/hien-thi";
            }

        }

        model.addAttribute("tb", "Tài khoản hoặc mật khẩu không đúng");
        return "login/loginPage";


    }
    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response){
        request.getSession().invalidate();
        return "redirect:/login";

    }
    @GetMapping("/thong-tin-ca-nhan")
    public String thongTinND(Model model){
        if (nhanVien2!=null){
            model.addAttribute("us",nhanVien2);
            model.addAttribute("contentPage","/home/thong-tin-ca-nhan.jsp");
            return "layout";

        }else if (khachHang2!=null){
            model.addAttribute("contentPage","/home/thong-tin-ca-nhan.jsp");
            return "layout";
        }
        model.addAttribute("tb","Bạn phải đăng nhập trước!");
        return "/home/layout";


    }
}

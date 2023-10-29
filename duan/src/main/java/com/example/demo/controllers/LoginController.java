package com.example.demo.controllers;

import com.example.demo.models.KhachHang;
import com.example.demo.models.NhanVien;
import com.example.demo.repositories.KhachHangRepository;
import com.example.demo.repositories.NhanVienRepository;
import com.example.demo.services.DataIntermediateService;
import com.example.demo.services.KhachHangService;
import com.example.demo.services.MailerService;
import com.example.demo.services.NhanVienService;
import com.example.demo.util.FileUploadUtil;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.SecureRandom;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Controller
public class LoginController {
    @Autowired
    private NhanVienRepository nhanVienRepository;
    @Autowired
    private NhanVienService nhanVienService;

    @Autowired
    private KhachHangRepository khachHangRepository;
    @Autowired
    private KhachHangService khachHangService;

    @Autowired
    DataIntermediateService service;

    @Autowired
    private MailerService mailer;

    private String un;
    private NhanVien nhanVien2;//du lieu khi dang nhap la nhan vien
    private KhachHang khachHang2;//du lieu khi dang nhap la khach hang

    @GetMapping("/login")
    public String login(@ModelAttribute("khachHang") KhachHang khachHang) {
        return "login/loginPage";

    }

    @PostMapping("login")
    public String loginSuccess(@RequestParam String username, @RequestParam String password, Model model) {
        NhanVien nhanVien = nhanVienRepository.findByTaiKhoan(username);


        if (nhanVien != null) {
            boolean matches = BCrypt.checkpw(password, nhanVien.getMatKhau());
            if (matches == true) {
                un = username;
                NhanVien nhanVien1 = nhanVienRepository.findByTaiKhoan(un);
                nhanVien2 = nhanVien1;
                service.setDataNhanVienLogin(nhanVien2);
                System.out.println(nhanVien1.getTaiKhoan());
                model.addAttribute("nhanVien", service.getSharedDataNhanVien());
                return "/home/layout";
            }
        }
        KhachHang khachHang = khachHangRepository.getKhachHangByTaiKhoan(username);
        if (khachHang != null) {
            boolean matchess = BCrypt.checkpw(password, khachHang.getMatKhau());
            if (matchess == true) {
                un = username;
                KhachHang khachHang1 = khachHangRepository.getKhachHangByTaiKhoan(un);
                System.out.println(khachHang1.getTaiKhoan());
                khachHang2 = khachHang1;
                service.setSharedData(khachHang2);
                model.addAttribute("khachHang000", khachHang2);
                return "redirect:/ban-hang-online/dang-nhap/hien-thi";
            }

        }

        model.addAttribute("tb", "Tài khoản hoặc mật khẩu không đúng");
        return "login/loginPage";


    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().invalidate();
        nhanVien2 = null;
        khachHang2 = null;
        return "redirect:/login";

    }

    @GetMapping("/thong-tin-ca-nhan")
    public String thongTinND(Model model, @ModelAttribute("us") NhanVien nhanVien) {
        model.addAttribute("us", service.getSharedDataNhanVien());
        model.addAttribute("contentPage", "../thong-tin/thong-tin-ca-nhan.jsp");
        return "/home/layout";
    }

    @GetMapping("/doi-mat-khau")
    public String doiMatKhau(Model model) {
        model.addAttribute("us", service.getSharedDataNhanVien());
        model.addAttribute("contentPage", "../thong-tin/doi-mat-khau.jsp");
        return "/home/layout";
    }

    @GetMapping("/dang-ky-tai-khoan")
    public String dangKyTaiKhoan(Model model, @ModelAttribute("khachHang") KhachHang khachHang) {
        return "login/dang-ki";
    }

    @GetMapping("/quen-mat-khau")
    public String quenMatKhau(Model model, @ModelAttribute("khachHang") KhachHang khachHang) {
        return "login/quen-mat-khau";
    }

    @PostMapping("/login/dang-ky-tai-khoan")
    public String dangKy(Model model, @ModelAttribute("khachHang") KhachHang khachHang) {
        List<KhachHang> listCheck = khachHangService.findAll0();
        for (KhachHang kh : listCheck
        ) {
            if (kh.getTaiKhoan().equalsIgnoreCase(khachHang.getTaiKhoan())) {
                model.addAttribute("thongBao", "Tài khoản đã có người sử dụng");
                return "login/dang-ki";
            }
        }
        String matKhau = khachHang.getMatKhau();
        String hashedPassword = BCrypt.hashpw(khachHang.getMatKhau(), BCrypt.gensalt());
        khachHang.setMatKhau(hashedPassword);
        khachHang.setMa("KH" + (String.valueOf(khachHangService.findAll().size()) + 1));
        khachHang.setNgayTao(Date.valueOf(LocalDate.now()));
        khachHang.setTinhTrang(0);
        khachHang.setDiem(10);
        khachHangService.add(khachHang);
        KhachHang khachHang1 = khachHangService.findById(khachHang.getId());
        mailer.queue(khachHang1.getEmail(), "Bạn đã đăng kí tài khoản thành công", "TK: " + khachHang1.getTaiKhoan() + "\nMK: " + matKhau);
        return "redirect:/login";
    }

    @PostMapping("/login/quen-mat-khau")
    public String khoiPhuc(Model model, @RequestParam("taiKhoan-quen") String taiKhoan, @RequestParam("email-quen") String email) {
        KhachHang khachHang = khachHangService.quenMatKhau(taiKhoan, email);
        if (khachHang == null) {
            model.addAttribute("thongBao", "Không có thông tin tài khoản này");
            return "login/quen-mat-khau";
        } else {
            String randomPW = generateRandomPassword(8);
            String matKhau = randomPW;
            String hashedPassword = BCrypt.hashpw(matKhau, BCrypt.gensalt());
            khachHang.setMatKhau(hashedPassword);
            khachHang.setNgayCapNhat(Date.valueOf(LocalDate.now()));
            khachHangService.update(khachHang.getId(), khachHang);
            KhachHang kh = khachHangService.findById(khachHang.getId());
            mailer.queue(kh.getEmail(), "Bạn đã khôi phục tài khoản thành công", "Tài khoản: " + kh.getTaiKhoan() + "\nMật khẩu mới: " + matKhau);
            model.addAttribute("thongBao", "Mật khẩu mới đã được gửi vào email của bạn");
            return "login/quen-mat-khau";
        }
    }

    private String generateRandomPassword(int length) {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+";
        SecureRandom random = new SecureRandom();
        StringBuilder password = new StringBuilder(length);

        for (int i = 0; i < length; i++) {
            int randomIndex = random.nextInt(characters.length());
            password.append(characters.charAt(randomIndex));
        }

        return password.toString();
    }

    @PostMapping("/login/update-thong-tin/{id}")
    public String updateThongTin(Model model, @ModelAttribute("us") @Valid NhanVien nhanVien,
                                 BindingResult bindingResult, @PathVariable("id") UUID id
            , @RequestParam("checkanh1") String checkanh1, @RequestParam("anh1s") MultipartFile anh1) throws IOException {
        if (bindingResult.hasErrors()) {
            model.addAttribute("contentPage", "../thong-tin/thong-tin-ca-nhan.jsp");
            return "/home/layout";
        }

        String fileName1 = StringUtils.cleanPath(anh1.getOriginalFilename());
        if (checkanh1.equals("cu1")) {
        } else {
            if (fileName1.equals("")) {
            } else {
                String uploadDir = "src/main/webapp/uploads/";
                FileUploadUtil.saveFile(uploadDir, fileName1, anh1);
            }
            nhanVien.setUrlAnh(fileName1);
        }
        NhanVien nv = nhanVienService.findById(id);
        System.out.println(nv);
        nhanVien.setChucVu(nv.getChucVu());
        nhanVien.setNgayCapNhat(Date.valueOf(LocalDate.now()));
        nhanVienService.update(id, nhanVien);
        return "redirect:/thong-tin-ca-nhan";
    }

    @PostMapping("/login/doi-mat-khau/{id}")
    public String doiMatKhau(Model model, @ModelAttribute("us") @Valid NhanVien nhanVien, @PathVariable("id") UUID id,
                             @RequestParam("mat-khau-cu") String oldp,
                             @RequestParam("mat-khau-moi") String newp,
                             @RequestParam("xac-nhan-mat-khau") String conp,
                             @RequestParam("checkanh1") String checkanh1, @RequestParam("anh1s") MultipartFile anh1) throws IOException {
        NhanVien nv = nhanVienService.findById(id);
        boolean matches = BCrypt.checkpw(oldp, nv.getMatKhau());
        if (matches == false) {
            model.addAttribute("thongBao1", "Sai mật khẩu");
            model.addAttribute("contentPage", "../thong-tin/doi-mat-khau.jsp");
            return "/home/layout";
        } else {
            if (!newp.equalsIgnoreCase(conp)) {
                model.addAttribute("thongBao3", "Mật khẩu mới chưa khớp với mật khẩu xác nhận");
                model.addAttribute("contentPage", "../thong-tin/doi-mat-khau.jsp");
                return "/home/layout";
            } else {
                String fileName1 = StringUtils.cleanPath(anh1.getOriginalFilename());
                if (checkanh1.equals("cu1")) {
                } else {
                    if (fileName1.equals("")) {
                    } else {
                        String uploadDir = "src/main/webapp/uploads/";
                        FileUploadUtil.saveFile(uploadDir, fileName1, anh1);
                    }
                    nhanVien.setUrlAnh(fileName1);
                }
                nhanVien.setChucVu(nv.getChucVu());
                nhanVien.setNgayCapNhat(Date.valueOf(LocalDate.now()));
                String matKhau = newp;
                String hashedPassword = BCrypt.hashpw(matKhau, BCrypt.gensalt());
                nhanVien.setMatKhau(hashedPassword);
                nhanVienService.update(id, nhanVien);
                NhanVien newnv = nhanVienService.findById(id);
                mailer.queue(newnv.getEmail(), "Bạn đã thay đổi mật khẩu thành công", "Tài khoản: " + newnv.getTaiKhoan() + "\nMật khẩu mới: " + matKhau);
               return "redirect:/login";
            }
        }
    }
}

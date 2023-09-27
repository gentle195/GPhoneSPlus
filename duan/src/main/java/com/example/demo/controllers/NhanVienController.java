package com.example.demo.controllers;

import com.example.demo.models.ChucVu;
import com.example.demo.models.NhanVien;
import com.example.demo.repositories.ChucVuRepository;
import com.example.demo.services.NhanVienService;
import com.example.demo.util.FileUploadUtil;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping("/nhan-vien")
public class NhanVienController {
    @Autowired
    private NhanVienService nhanVienService;
    @Autowired
    private ChucVuRepository chucVuRepository;

    @GetMapping("/hien-thi")
    public String hienThi(Model model, @ModelAttribute("nhanVien") NhanVien nhanVien,
                          @RequestParam("pageNum") Optional<Integer> pageNum,
                          @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {

        Sort sort = Sort.by("ngayTao").descending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<NhanVien> page = nhanVienService.getAll(pageable);
        model.addAttribute("contentPage", "nhanvien/nhan-vien.jsp");
        model.addAttribute("listNhanVien", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "layout";
    }

    @GetMapping("/hien-thi-delete")
    public String hienThiDelete(Model model, @ModelAttribute("nhanVien") NhanVien nhanVien,
                                @RequestParam("pageNum") Optional<Integer> pageNum,
                                @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {

        Sort sort = Sort.by("ngayTao").descending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<NhanVien> page = nhanVienService.getAll1(pageable);
        model.addAttribute("contentPage", "nhanvien/nhan-vien-delete.jsp");
        model.addAttribute("listNhanVien", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "layout";
    }


    @GetMapping("/view-add")
    public String viewAdd(Model model) {

        List<ChucVu> listChucVu = chucVuRepository.findAll();
        model.addAttribute("listChucVu", listChucVu);
        model.addAttribute("nhanVien", new NhanVien());
        model.addAttribute("contentPage", "nhanvien/nhan-vien-add.jsp");

        return "layout";
    }

    @PostMapping("/add")
    public String addNhanVien(Model model, @ModelAttribute("nhanVien") @Valid NhanVien nhanVien, BindingResult bindingResult,
                              @RequestParam("pageNum") Optional<Integer> pageNum,
                              @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize,
                              @RequestParam("images") MultipartFile multipartFile) throws IOException {
        String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
        String uploadDir = "src/main/webapp/uploads/";
        FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);

        nhanVien.setUrlAnh(fileName);

        if (bindingResult.hasErrors()) {
            List<ChucVu> listChucVu = chucVuRepository.findAll();
            model.addAttribute("listChucVu", listChucVu);
            model.addAttribute("contentPage", "nhanvien/nhan-vien-add.jsp");

            return "layout";
//            return "nhanvien/nhan-vien-add.jsp";
        }

        Integer nv = nhanVienService.findAll().size();
        String maNV = "";
        if (nv < 10) {
            maNV = "MaNV0" + nv;
        } else {
            maNV = "MaMS" + nv;
        }
        nhanVien.setMa(maNV);
        nhanVien.setNgayTao(Date.valueOf(LocalDate.now()));
        nhanVienService.add(nhanVien);
        List<ChucVu> listChucVu = chucVuRepository.findAll();

        model.addAttribute("listChucVu", listChucVu);
        model.addAttribute("contentPage", "nhanvien/nhan-vien.jsp");
        return "redirect:/nhan-vien/hien-thi";
    }

    @GetMapping("/detail/{id}")
    public String detail(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        List<ChucVu> listChucVu = chucVuRepository.findAll();
        model.addAttribute("listChucVu", listChucVu);
        NhanVien nhanVien = nhanVienService.findById(id);
        model.addAttribute("nhanVien", nhanVien);
        model.addAttribute("contentPage", "nhanvien/nhan-vien-update.jsp");
        return "layout";
    }


    @PostMapping("/update/{id}")
    public String update(Model model, @PathVariable("id") UUID id, @ModelAttribute("nhanVien") @Valid NhanVien nhanVien
            , BindingResult bindingResult, @RequestParam("images") MultipartFile file) {

        nhanVien.setId(id);
        nhanVien.setNgayCapNhat(Date.valueOf(LocalDate.now()));

        // Xử lý tệp ảnh nếu người dùng đã chọn ảnh mới
        if (!file.isEmpty()) {
            String fileName = StringUtils.cleanPath(file.getOriginalFilename());
            String uploadDir = "src/main/webapp/uploads/"; // Đổi đường dẫn lưu ảnh tùy ý
            try {
                byte[] bytes = file.getBytes();
                Path path = Paths.get(uploadDir + File.separator + fileName);
                Files.write(path, bytes);
                nhanVien.setUrlAnh(fileName);
            } catch (IOException e) {
                e.printStackTrace();
                // Xử lý lỗi nếu cần
            }
        }
        nhanVienService.update(id, nhanVien);
        model.addAttribute("contentPage", "nhanvien/nhan-vien.jsp");

        return "redirect:/nhan-vien/hien-thi";

    }
}

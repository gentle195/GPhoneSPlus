package com.example.demo.controllers;

import com.example.demo.models.ChucVu;
import com.example.demo.models.NhanVien;
import com.example.demo.services.ChucVuService;
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
    private ChucVuService chucVuService;

    @GetMapping("/hien-thi")
    public String hienThi(Model model, @ModelAttribute("nhanVien") NhanVien nhanVien,
                          @RequestParam("pageNum") Optional<Integer> pageNum,
                          @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {

        Sort sort = Sort.by("ngayTao").descending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<NhanVien> page = nhanVienService.getAll(pageable);
        model.addAttribute("contentPage", "../nhanvien/nhan-vien.jsp");
        model.addAttribute("listNhanVien", page.getContent());
        model.addAttribute("listChucVu", chucVuService.findAll());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "/home/layout";
    }


    @GetMapping("/hien-thi-delete")
    public String hienThiDelete(Model model, @ModelAttribute("nhanVien") NhanVien nhanVien,
                                @RequestParam("pageNum") Optional<Integer> pageNum,
                                @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {

        Sort sort = Sort.by("ngayTao").descending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<NhanVien> page = nhanVienService.getAll1(pageable);
        model.addAttribute("contentPage", "../nhanvien/nhan-vien-delete.jsp");
        model.addAttribute("listNhanVien", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "/home/layout";
    }

    @GetMapping("/loc")
    public String hienThiLoc(Model model,
                             @RequestParam("ten1") String tenChucVu,
                             @RequestParam("gioiTinh1") String gioiTinh,
                             @RequestParam("pageNum") Optional<Integer> pageNum,
                             @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {

        Sort sort = Sort.by("ngayTao").descending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);

        // Gọi phương thức mới để lọc theo chức vụ và giới tính
        List<NhanVien> filteredNhanViens = nhanVienService.searchByChucVuAndGioiTinh(tenChucVu, gioiTinh, pageable);
        List<ChucVu> listChucVu = chucVuService.findAll();

        // Đặt danh sách chức vụ vào mô hình
        model.addAttribute("listChucVu", listChucVu);
        model.addAttribute("contentPage", "../nhanvien/nhan-vien.jsp");
        model.addAttribute("listNhanVien", filteredNhanViens);
//        model.addAttribute("page", pageable.getPageNumber());
//        model.addAttribute("total", pageable.getPageSize());
        return "/home/layout";
    }


    @GetMapping("/view-add")
    public String viewAdd(Model model, @ModelAttribute("nhanVien") NhanVien nhanVien,
                          @ModelAttribute("chucVu") ChucVu chucVu) {

        nhanVien.setTinhTrang(0);
        nhanVien.setGioiTinh(true);
//        nhanVien.setMatKhau(nhanVien.getMatKhau());
        List<ChucVu> listChucVu = chucVuService.findAll();
        model.addAttribute("listChucVu", listChucVu);
//        model.addAttribute("nhanVien", new NhanVien());
        model.addAttribute("contentPage", "../nhanvien/nhan-vien-add.jsp");

        return "/home/layout";
    }

    @PostMapping("/add")
    public String addNhanVien(Model model, @ModelAttribute("nhanVien") @Valid NhanVien nhanVien,
                              BindingResult bindingResult,
                              @ModelAttribute("chucVu") ChucVu chucVu,
                              @RequestParam("pageNum") Optional<Integer> pageNum,
//                              @RequestParam("urlAnh") String anh,
                              @RequestParam("matKhau") String mk,
                              @RequestParam("email") String email,
                              @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize,
                              @RequestParam("images") MultipartFile multipartFile) throws IOException {


        if (bindingResult.hasErrors()) {
            List<ChucVu> listChucVu = chucVuService.findAll();
            nhanVien.setTinhTrang(0);
            nhanVien.setGioiTinh(true);
//            model.addAttribute("listNhanVien", nhanVienService.findAll());
            model.addAttribute("listChucVu", listChucVu);
            model.addAttribute("contentPage", "../nhanvien/nhan-vien-add.jsp");

            return "/home/layout";
//            return "../nhanvien/nhan-vien-add.jsp";
        }
        String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
        String uploadDir = "src/main/webapp/uploads/";
        FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);
        nhanVien.setUrlAnh(fileName);
        long millis = System.currentTimeMillis();
        Date date = new Date(millis);

        Sort sort = Sort.by("ma").descending();
        Integer nv = nhanVienService.findAll().size();
        String maNV = "";
        if (nv < 10) {
            maNV = "MaNV0" + nv;
        } else {
            maNV = "MaNV" + nv;
        }
        nhanVien.setMa(maNV);
        nhanVien.setNgayCapNhat(Date.valueOf(LocalDate.now()));
        nhanVien.setNgayTao(date);
        nhanVien.setTinhTrang(0);
        nhanVien.setMatKhau(mk);
        nhanVien.setEmail(email);
        nhanVienService.add(nhanVien);
        List<ChucVu> listChucVu = chucVuService.findAll();

        Page<NhanVien> page = nhanVienService.getAll(Pageable.unpaged());

        model.addAttribute("listChucVu", listChucVu);
        model.addAttribute("nhanVien", new NhanVien());
        model.addAttribute("listNhanVien", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());

        model.addAttribute("contentPage", "../nhanvien/nhan-vien.jsp");
        return "redirect:/nhan-vien/hien-thi";
//        return "/home/layout";
    }

    @GetMapping("/detail/{id}")
    public String detail(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
//                         @RequestParam("matKhau") String mk,
//                         @RequestParam("email") String email,
//                         @ModelAttribute("nhanVien") NhanVien nhanVien,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        List<ChucVu> listChucVu = chucVuService.findAll();
//        nhanVien.setMatKhau(mk);
//        nhanVien.setEmail(email);
        model.addAttribute("listChucVu", listChucVu);
        NhanVien nhanVien = nhanVienService.findById(id);
        model.addAttribute("nhanVien", nhanVien);
        model.addAttribute("contentPage", "../nhanvien/nhan-vien-update.jsp");
        return "/home/layout";
    }


    @PostMapping("/update/{id}")
    public String update(Model model, @PathVariable("id") UUID id,
                         @RequestParam("matKhau") String mk,
                         @RequestParam("email") String email,
                         @ModelAttribute("nhanVien") @Valid NhanVien nhanVien
            , BindingResult bindingResult, @RequestParam("images") MultipartFile file) throws IOException {

        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        nhanVien.setId(id);
        nhanVien.setNgayCapNhat(Date.valueOf(LocalDate.now()));
        nhanVien.setNgayTao(date);
        nhanVien.setTinhTrang(0);
        nhanVien.setMatKhau(mk);
        nhanVien.setEmail(email);
        nhanVien.setUrlAnh(file.getOriginalFilename());



        if (bindingResult.hasErrors()) {
            NhanVien nhanVien1 = nhanVienService.findById(id);
            List<ChucVu> listChucVu = chucVuService.findAll();
            List<NhanVien> listNhanVien = nhanVienService.findAll();
            nhanVien.setTinhTrang(0);
            nhanVien.setGioiTinh(true);


            model.addAttribute("listChucVu", listChucVu);

            model.addAttribute("contentPage", "../nhanvien/nhan-vien-update.jsp");

            return "/home/layout";

        }
        // Xử lý tệp ảnh nếu người dùng đã chọn ảnh mới


        if (file.isEmpty()) {
        } else {
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

        List<ChucVu> listChucVu = chucVuService.findAll();
        model.addAttribute("listChucVu", listChucVu);
        nhanVienService.update(id, nhanVien);
        model.addAttribute("contentPage", "../nhanvien/nhan-vien.jsp");

        return "redirect:/nhan-vien/hien-thi";
    }


    @PostMapping("/search-0")
    public String search0(Model model, @ModelAttribute("nhanVien") NhanVien
            nhanVien, @RequestParam("search") String search) {
        List<NhanVien> list = nhanVienService.search0(search);
        model.addAttribute("listNhanVien", list);
        model.addAttribute("contentPage", "../nhanvien/nhan-vien.jsp");
        return "/home/layout";
    }

    @PostMapping("/search-1")
    public String search1(Model model, @ModelAttribute("nhanVien") NhanVien
            nhanVien, @RequestParam("search") String search) {
        List<NhanVien> list = nhanVienService.search1(search);
        model.addAttribute("listNhanVien", list);
        model.addAttribute("contentPage", "../nhanvien/nhan-vien-delete.jsp");
        return "/home/layout";
    }

    @GetMapping("/update-all-status")
    public String updateTT(Model model, @RequestParam("pageNum") Optional<Integer> pageNum,
                           @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize,
                           @ModelAttribute("nhanVien") NhanVien nhanVien) {
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        nhanVien.setNgayCapNhat(date);

        nhanVienService.updateTT();
        Page<NhanVien> page = nhanVienService.getAll1(pageable);
        model.addAttribute("contentPage", "../nhanvien/nhan-vien-delete.jsp");
        model.addAttribute("listNhanVien", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "/home/layout";
    }

    @GetMapping("/update-status/{id}")
    public String updateStatus(Model model, @PathVariable("id") UUID id,
                               @RequestParam("pageNum") Optional<Integer> pageNum,
                               @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer
                                       pageSize, @ModelAttribute("nhanVien") NhanVien nhanVien) {
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);

        NhanVien nhanVien1 = nhanVienService.findById(id);
        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        nhanVien1.setNgayCapNhat(date);
        nhanVien1.setTinhTrang(1);
        nhanVienService.update(id, nhanVien1);
        Page<NhanVien> page = nhanVienService.getAll(pageable);
        model.addAttribute("contentPage", "../nhanvien/nhan-vien.jsp");
        model.addAttribute("listNhanVien", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "/home/layout";
    }

    @GetMapping("/reset-status/{id}")
    public String resetStatus(Model model, @PathVariable("id") UUID
            id, @RequestParam("pageNum") Optional<Integer> pageNum,
                              @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer
                                      pageSize, @ModelAttribute("nhanVien") NhanVien nhanVien) {
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        NhanVien nhanVien1 = nhanVienService.findById(id);
        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        nhanVien1.setNgayCapNhat(date);

        nhanVien1.setTinhTrang(0);
        nhanVienService.update(id, nhanVien1);
        Page<NhanVien> page = nhanVienService.getAll1(pageable);
        model.addAttribute("contentPage", "../nhanvien/nhan-vien-delete.jsp");
        model.addAttribute("listNhanVien", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "/home/layout";
    }


    @PostMapping("/modal-add-chuc-vu")
    public String addChuVuModal(Model model, @ModelAttribute("chucVu") @Valid ChucVu chucVu, BindingResult
            bindingResult
//                                @ModelAttribute("nhanVien") @Valid NhanVien nhanVien
    ) {
        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        Integer sl = chucVuService.findAll().size();
        String maCV = "";

        if (sl < 10) {
            maCV = "MaCV0" + sl;
        } else {
            maCV = "MaCV" + sl;
        }

        chucVu.setMa(maCV);
        chucVu.setNgayTao(date);
        chucVu.setNgayCapNhat(date);
        chucVu.setTinhTrang(0);

        if (bindingResult.hasErrors()) {
            model.addAttribute("chucVuError", "true"); // Đặt một thuộc tính để chỉ định có lỗi
        } else {

            chucVuService.add(chucVu);
//            return "redirect:/nhan-vien/view-add"; // Sau khi thêm chức vụ, điều hướng đến trang thêm nhân viên
        }
//        return "nhanvien/nhan-vien-add.jsp"; // Trả về trang hiện thị modal
        return "redirect:/nhan-vien/view-add"; // Sau khi thêm chức vụ, điều hướng đến trang thêm nhân viên
    }


}

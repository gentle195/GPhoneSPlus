package com.example.demo.controllers;

import com.example.demo.models.Anh;
import com.example.demo.services.AnhService;
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

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping("/anh")
public class AnhController {
    @Autowired
    private AnhService anhService;

    @GetMapping("hien-thi")
    public String hienThi(@ModelAttribute("anh") Anh anh, Model model, @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
        Page<Anh> list = anhService.getAll(pageable);
        model.addAttribute("listAnh", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        model.addAttribute("contentPage", "anh/hien-thi.jsp");
        return "layout";
    }

    @GetMapping("/hien-thi-delete")
    public String hienThiDelete(Model model, @ModelAttribute("anh") Anh anh,
                                @RequestParam("pageNum") Optional<Integer> num,
                                @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer size) {

        Sort sort = Sort.by("ngayTao").descending();
        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
        Page<Anh> page = anhService.getAll1(pageable);
        model.addAttribute("contentPage", "anh/anh-delete.jsp");
        model.addAttribute("listAnh", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "layout";
    }

    @GetMapping("/view-add")
    public String viewAdd(Model model, @ModelAttribute("anh") Anh anh) {
        model.addAttribute("anh", new Anh());
        model.addAttribute("contentPage", "anh/add.jsp");
        return "layout";
    }

    @GetMapping("/update-tt")
    public String updateTT(Model model, @RequestParam("pageNum") Optional<Integer> pageNum,
                           @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize,
                           @ModelAttribute("anh") Anh anh) {
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        anh.setNgayCapNhat(date);
        anhService.updateTT();
        Page<Anh> page = anhService.getAll1(pageable);
        model.addAttribute("contentPage", "anh/anh-delete.jsp");
        model.addAttribute("listAnh", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "layout";
    }

    @GetMapping("/update-status/{id}")
    public String updateStatus(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                               @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize, @ModelAttribute("anh") Anh anh) {
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);

        Anh anh1 = anhService.findById(id);
        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        anh1.setNgayCapNhat(date);
        anh1.setTinhTrang(1);
        anhService.update(id, anh1);
        Page<Anh> page = anhService.getAll(pageable);
        model.addAttribute("contentPage", "anh/hien-thi.jsp");
        model.addAttribute("listAnh", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "layout";
    }

    @GetMapping("/reset-status/{id}")
    public String resetStatus(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                              @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize, @ModelAttribute("anh") Anh anh) {
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Anh anh1 = anhService.findById(id);
        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        anh1.setNgayCapNhat(date);

        anh1.setTinhTrang(0);
        anhService.update(id, anh1);
        Page<Anh> page = anhService.getAll1(pageable);
        model.addAttribute("contentPage", "anh/anh-delete.jsp");
        model.addAttribute("listAnh", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "layout";
    }

    @PostMapping("/search-0")
    public String search0(Model model, @ModelAttribute("anh") Anh anh, @RequestParam("search") String search, @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        if (search.isEmpty()) {
            model.addAttribute("thongBao", "Không để trống thông tin");
            Sort sort = Sort.by("ngayTao").descending();
            Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
            Page<Anh> list = anhService.getAll(pageable);
            model.addAttribute("listAnh", list.getContent());
            model.addAttribute("total", list.getTotalPages());
            model.addAttribute("contentPage", "anh/hien-thi.jsp");
            return "layout";
        } else {
            List<Anh> list = anhService.search0(search);
            model.addAttribute("listAnh", list);
            model.addAttribute("contentPage", "anh/hien-thi.jsp");
            return "layout";
        }

    }

    @PostMapping("/search-1")
    public String search1(Model model, @ModelAttribute("anh") Anh anh, @RequestParam("search") String search, @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        if (search.isEmpty()) {
            model.addAttribute("thongBao", "Không để trống thông tin");
            Sort sort = Sort.by("ngayTao").descending();
            Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
            Page<Anh> list = anhService.getAll1(pageable);
            model.addAttribute("listAnh", list.getContent());
            model.addAttribute("total", list.getTotalPages());
            model.addAttribute("contentPage", "anh/anh-delete.jsp");
            return "layout";
        } else {
            List<Anh> list = anhService.search1(search);
            model.addAttribute("listAnh", list);
            model.addAttribute("contentPage", "anh/anh-delete.jsp");
            return "layout";
        }

    }

    @PostMapping("/add")
    public String add(Model model,
                      @ModelAttribute("anh") @Valid Anh anh,
                      BindingResult bindingResult,
                      @RequestParam("anh1") MultipartFile anh1,
                      @RequestParam("anh2") MultipartFile anh2,
                      @RequestParam("anh3") MultipartFile anh3
    ) throws IOException {
        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        if (bindingResult.hasErrors()) {
            model.addAttribute("contentPage", "anh/add.jsp");
            return "layout";
        }
        anh.setMa("ANH" + String.valueOf(anhService.findAll().size() + 1));
        anh.setNgayTao(date);
        anh.setNgayCapNhat(date);
        anh.setTinhTrang(0);

        // Xử lý ảnh 1
        String fileName1 = StringUtils.cleanPath(anh1.getOriginalFilename());
        if (!fileName1.isEmpty()) {
            String uploadDir = "src/main/webapp/uploads/";
            FileUploadUtil.saveFile(uploadDir, fileName1, anh1);
            anh.setAnh1(fileName1);
        }

        // Xử lý ảnh 2
        String fileName2 = StringUtils.cleanPath(anh2.getOriginalFilename());
        if (!fileName2.isEmpty()) {
            String uploadDir = "src/main/webapp/uploads/";
            FileUploadUtil.saveFile(uploadDir, fileName2, anh2);
            anh.setAnh2(fileName2);
        }

        // Xử lý ảnh 3
        String fileName3 = StringUtils.cleanPath(anh3.getOriginalFilename());
        if (!fileName3.isEmpty()) {
            String uploadDir = "src/main/webapp/uploads/";
            FileUploadUtil.saveFile(uploadDir, fileName3, anh3);
            anh.setAnh3(fileName3);
        }
        anhService.add(anh);
        return "redirect:/anh/hien-thi";
    }
//    @PostMapping("/khach-hang/update")
//    public String updateDongSP(Model model, @ModelAttribute("kh") @Valid Anh anh,
//                               BindingResult bindingResult,
//                               @ModelAttribute("KHHangAnh") HangAnh hangAnh,
//                               @RequestParam("checkanh") String checkanh,
//                               @RequestParam("anh") MultipartFile multipartFile,
//                               @RequestParam("num") Optional<Integer> num,
//                               @RequestParam(name = "size", defaultValue = "5", required = false) Integer size
//    ) throws IOException {
//        if (bindingResult.hasErrors()) {
//            anh = anhService.findById(anh.getId());
//            model.addAttribute("hkh", hangAnhService.getALL0());
//            model.addAttribute("contentPage", "khach-hang/khach-hang-update.jsp");
//            return "layout";
//        }
//        long millis = System.currentTimeMillis();
//        Date date = new Date(millis);
//        anh.setNgayCapNhat(date);
//        String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
//        if (checkanh.equals("cu")) {
//        } else {
//            if (fileName.equals("")) {
//            } else {
//                String uploadDir = "src/main/webapp/uploads/";
//                FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);
//            }
//            anh.setAnh(fileName);
//        }
//
//        anhService.add(anh);
//        Sort sort = Sort.by("ma").descending();
//        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
//        Page<Anh> list = anhService.getALL0(pageable);
//        model.addAttribute("dulieu", list.getContent());
//        model.addAttribute("total", kt(list.getTotalPages()));
//        model.addAttribute("hkh", hangAnhService.getALL0());
//        model.addAttribute("tong", anhService.findAll00().size());
//        model.addAttribute("contentPage", "khach-hang/khach-hang.jsp");
//
//
//        return "layout";
//    }
}

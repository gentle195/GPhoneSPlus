package com.example.demo.controllers;

import com.example.demo.models.*;
import com.example.demo.services.CameraService;
import com.example.demo.services.HangSanPhamService;
import com.example.demo.services.ManHinhService;
import com.example.demo.services.SanPhamService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Controller
//@RequestMapping("/san-pham")
public class SanPhamController {
    @Autowired
    SanPhamService sanPhamService;
    @Autowired
    HangSanPhamService hangSanPhamService;
    @Autowired
    ManHinhService manHinhService;
    @Autowired
    CameraService cameraService;

    @GetMapping("/san-pham/hien-thi")
    public String hienthi(@ModelAttribute("dulieuxem") SanPham dulieuxem,
                          @ModelAttribute("manHinh") ManHinh manHinh,
                          @ModelAttribute("hangSP") HangSanPham hangSanPham,
                          @ModelAttribute("camera") Camera camera,
                          Model model, @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        Pageable pageable = PageRequest.of(num.orElse(0), size);
        Page<SanPham> list = sanPhamService.getAll0(pageable);
        model.addAttribute("listManHinh", manHinhService.findAll());
        model.addAttribute("listHangSP", hangSanPhamService.findAll());
        model.addAttribute("listCamera", cameraService.findAll());
        model.addAttribute("contentPage", "san-pham/hien-thi.jsp");
        model.addAttribute("hsp", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        return "layout";
    }

    @GetMapping("/san-pham/hien-thi-tung-xoa")
    public String hienthi1(@ModelAttribute("dulieuxem") SanPham dulieuxem,
                           @ModelAttribute("manHinh") ManHinh manHinh,
                           @ModelAttribute("hangSP") HangSanPham hangSanPham,
                           @ModelAttribute("camera") Camera camera,
                           Model model, @RequestParam("num") Optional<Integer> num,
                           @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        Pageable pageable = PageRequest.of(num.orElse(0), size);
        Page<SanPham> list = sanPhamService.getall1(pageable);
        model.addAttribute("listManHinh", manHinhService.findAll());
        model.addAttribute("listHangSP", hangSanPhamService.findAll());
        model.addAttribute("listCamera", cameraService.findAll());
        model.addAttribute("contentPage", "san-pham/san-pham-tung-xoa.jsp");
        model.addAttribute("hsp", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        return "layout";
    }


//    @ModelAttribute("hangsp")
//    public List<HangSanPham> hsp() {
//        return hangSanPhamService.findAll();
//    }
//
//    @ModelAttribute("manHinh")
//    public List<ManHinh> manHinh() {
//        return manHinhService.findAll();
//    }
//
//    @ModelAttribute("camera")
//    public List<Camera> camera() {
//        return cameraService.findAll();
//    }

    @GetMapping("san-pham/detail/{id}")
    public String viewupdate(@PathVariable("id") UUID id, @ModelAttribute("dulieuxem") SanPham dulieuxem,
                             @ModelAttribute("manHinh") ManHinh manHinh,
                             @ModelAttribute("hangSP") HangSanPham hangSanPham,
                             @ModelAttribute("camera") Camera camera,
                             Model model, @RequestParam("num") Optional<Integer> num,
                             @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        SanPham hsp = sanPhamService.findById(id);
        model.addAttribute("dulieuxem", hsp);
        Pageable pageable = PageRequest.of(num.orElse(0), size);
        Page<SanPham> list = sanPhamService.getAll(pageable);
        model.addAttribute("listManHinh", manHinhService.findAll());
        model.addAttribute("listHangSP", hangSanPhamService.findAll());
        model.addAttribute("listCamera", cameraService.findAll());
        model.addAttribute("contentPage", "san-pham/update.jsp");
        model.addAttribute("hsp", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        return "layout";
    }

    @PostMapping("/san-pham/add")
    public String add(Model model, @ModelAttribute("dulieuxem") @Valid SanPham dulieuxem,
                      BindingResult bindingResult, @RequestParam("num") Optional<Integer> num,
                      @RequestParam(name = "size", defaultValue = "5", required = false) Integer size,
                      @ModelAttribute("hangSP") HangSanPham hangSanPham,
                      @ModelAttribute("camera") Camera camera) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("content", "san-pham/hien-thi.jsp");
            Sort sort = Sort.by("ngayTao").ascending();
            Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
            Page<SanPham> list = sanPhamService.getAll(pageable);
            model.addAttribute("listManHinh", manHinhService.findAll());
            model.addAttribute("listHangSP", hangSanPhamService.findAll());
            model.addAttribute("listCamera", cameraService.findAll());
            model.addAttribute("contentPage", "SanPham/hien-thi.jsp");
            model.addAttribute("hsp", list.getContent());
            model.addAttribute("total", list.getTotalPages());

            return "SanPham/hien-thi";
        }

        dulieuxem.setNgayTao(Date.valueOf(LocalDate.now()));
        dulieuxem.setMa("SP" + String.valueOf(hangSanPhamService.findAll().size() + 1));
        sanPhamService.add(dulieuxem);
        return "redirect:/san-pham/hien-thi";
        // Tiếp tục xử lý và trả về view tương ứng
    }

    @PostMapping("/san-pham/update/{id}")
    public String update(Model model, @ModelAttribute("dulieuxem") @Valid SanPham dulieuxem,
                         BindingResult bindingResult, @PathVariable("id") UUID id,
                         @ModelAttribute("manHinh") ManHinh manHinh,
                         @ModelAttribute("hangSP") HangSanPham hangSanPham,
                         @ModelAttribute("camera") Camera camera) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("content", "san-pham/update.jsp");
            return "SanPham/update";
        }
        SanPham hsp = sanPhamService.findById(id);
        Date ngayTao = hsp.getNgayTao();
        hsp.setTen(dulieuxem.getTen());
        hsp.setHeDieuHanh(dulieuxem.getHeDieuHanh());
        hsp.setSoSim(dulieuxem.getSoSim());
        hsp.setBluetooth(dulieuxem.getBluetooth());
        hsp.setHoTroMang(dulieuxem.getHoTroMang());
        hsp.setCongGiaoTiep(dulieuxem.getCongGiaoTiep());
        hsp.setThongSoWifi(dulieuxem.getThongSoWifi());
        hsp.setKichThuoc(dulieuxem.getKichThuoc());
        hsp.setTrongLuong(dulieuxem.getTrongLuong());
        hsp.setChatLieu(dulieuxem.getChatLieu());
        hsp.setNgayTao(ngayTao);
        hsp.setHangSanPham(dulieuxem.getHangSanPham());
        // Gán ngày hiện tại
        hsp.setNgayCapNhat(Date.valueOf(LocalDate.now()));
        hsp.setTinhTrang(dulieuxem.getTinhTrang());
        hsp.setMoTa(dulieuxem.getMoTa());
        sanPhamService.update(id, hsp);
        return "redirect:/san-pham/hien-thi";
    }

    @GetMapping("/san-pham/delete/{id}")
    public String delete(Model model, @ModelAttribute("dulieuxem") SanPham dulieuxem, @PathVariable("id") UUID id, @RequestParam("num") Optional<Integer> num,
                         @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        SanPham sp1 = sanPhamService.findById(id);
        sp1.setTinhTrang(1);
        sanPhamService.add(sp1);
        Pageable pageable = PageRequest.of(num.orElse(0), size);
        Page<SanPham> list = sanPhamService.getAll0(pageable);
        model.addAttribute("contentPage", "san-pham/hien-thi.jsp");
        model.addAttribute("hsp", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        return "layout";

    }

    @GetMapping("/san-pham/khoi-phuc/{id}")
    public String khoiphuc(Model model, @ModelAttribute("dulieuxem") SanPham dulieuxem, @PathVariable("id") UUID id, @RequestParam("num") Optional<Integer> num,
                           @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        SanPham sp1 = sanPhamService.findById(id);
        sp1.setTinhTrang(0);
        sanPhamService.add(sp1);
        Pageable pageable = PageRequest.of(num.orElse(0), size);
        Page<SanPham> list = sanPhamService.getall1(pageable);
        model.addAttribute("contentPage", "san-pham/san-pham-tung-xoa.jsp");
        model.addAttribute("hsp", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        return "layout";

    }

    @PostMapping("/san-pham/search")
    public String search(@RequestParam("search") String search, @ModelAttribute("dulieuxem") SanPham dulieuxem,
                         @ModelAttribute("manHinh") ManHinh manHinh,
                         @ModelAttribute("hangSP") HangSanPham hangSanPham,
                         @ModelAttribute("camera") Camera camera,
                         Model model, @RequestParam("num") Optional<Integer> num,
                         @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        List<SanPham> list = sanPhamService.search(search);


        model.addAttribute("contentPage", "san-pham/hien-thi.jsp");
        model.addAttribute("listManHinh", manHinhService.findAll());
        model.addAttribute("listHangSP", hangSanPhamService.findAll());
        model.addAttribute("listCamera", cameraService.findAll());
        model.addAttribute("hsp", list);
//        model.addAttribute("total", list);
        return "layout";
    }

    @PostMapping("/san-pham/search2")
    public String search2(@RequestParam("search") String search, @ModelAttribute("dulieuxem") SanPham dulieuxem,
                          @ModelAttribute("manHinh") ManHinh manHinh,
                          @ModelAttribute("hangSP") HangSanPham hangSanPham,
                          @ModelAttribute("camera") Camera camera,
                          Model model, @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        List<SanPham> list = sanPhamService.search2(search);


        model.addAttribute("contentPage", "san-pham/san-pham-tung-xoa.jsp");
        model.addAttribute("listManHinh", manHinhService.findAll());
        model.addAttribute("listHangSP", hangSanPhamService.findAll());
        model.addAttribute("listCamera", cameraService.findAll());
        model.addAttribute("hsp", list);
//        model.addAttribute("total", list);
        return "layout";
    }

    @GetMapping("/san-pham/form-add")
    public String formadd(@ModelAttribute("dulieuxem") SanPham dulieuxem,
                          @ModelAttribute("manHinh") ManHinh manHinh,
                          @ModelAttribute("hangSP") HangSanPham hangSanPham,
                          @ModelAttribute("camera") Camera camera,
                          Model model, @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        Pageable pageable = PageRequest.of(num.orElse(0), size);
        Page<SanPham> list = sanPhamService.getAll(pageable);
        model.addAttribute("listManHinh", manHinhService.findAll());
        model.addAttribute("listHangSP", hangSanPhamService.findAll());
        model.addAttribute("listCamera", cameraService.findAll());
        model.addAttribute("contentPage", "san-pham/add.jsp");
        model.addAttribute("hsp", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        return "layout";
    }

    @GetMapping("/san-pham/khoi-phuc-het")
    public String khoiphuchet(
            Model model,
//            @PathVariable("id") UUID id,
//            @ModelAttribute("HKHHangKhachHang") HangKhachHang HKHHangKhachHang,
            @RequestParam("num") Optional<Integer> num,
            @RequestParam(name = "size", defaultValue = "5", required = false) Integer size


    ) {

//        HangKhachHang hkh1=hangKhachHangService.findById(id);
//        hkh1.setTinhTrang(0);
//        hangKhachHangService.add(hkh1);
        sanPhamService.update0();
        Sort sort = Sort.by("ma").descending();
        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
        Page<SanPham> list = sanPhamService.getall1(pageable);

        model.addAttribute("contentPage", "san-pham/san-pham-tung-xoa.jsp");
        model.addAttribute("hsp", list.getContent());
        model.addAttribute("total", list.getTotalPages());


        return "layout";
    }

    @PostMapping("/san-pham/loc")
    public String loc(Model model, @RequestParam(value = "hang", required = false) UUID hang,


                      @RequestParam(value = "manHinh", required = false) UUID moTaMan,
                      @RequestParam(value = "camera", required = false) UUID moTaCam,
                      @ModelAttribute("sanpham") SanPham sanPham
    ) {
        List<SanPham> list = sanPhamService.loc(hang, moTaMan, moTaCam);
        model.addAttribute("hsp", list);
        model.addAttribute("listHang", hangSanPhamService.findAll());
        model.addAttribute("listManHinh", manHinhService.findAll());
        model.addAttribute("listCamera", cameraService.findAll());
        model.addAttribute("contentPage", "san-pham/tim-kiem-loc.jsp");
        return "layout";
    }

    @GetMapping("/san-pham/hien-thi-loc")
    public String hienThiLoc(Model model, @RequestParam("pageNum") Optional<Integer> pageNum
    ) {
        Sort sort = Sort.by("ngayTao").descending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), 5);
        Page<SanPham> chiTietSanPhamPage = sanPhamService.getAll0(pageable);
        model.addAttribute("total", chiTietSanPhamPage.getTotalPages());
        model.addAttribute("list", chiTietSanPhamPage.getContent());
        model.addAttribute("listHang", hangSanPhamService.findAll());
        model.addAttribute("listManHinh", manHinhService.findAll());
        model.addAttribute("listCamera", cameraService.findAll());
        model.addAttribute("contentPage", "san-pham/tim-kiem-loc.jsp");
        model.addAttribute("page", chiTietSanPhamPage.getNumber());
        model.addAttribute("hsp", chiTietSanPhamPage.getContent());
        return "layout";
    }

    @PostMapping("/add2")
    public String add(@Valid @ModelAttribute(name = "chitietsanpham") ChiTietSanPham chiTietSanPham,
                      BindingResult result, Model model) throws IOException {




            model.addAttribute("hang", new HangSanPham());
            model.addAttribute("manhinh", new ManHinh());
            model.addAttribute("camera", new Camera());


            model.addAttribute("listSanPham", sanPhamService.findAll());
            model.addAttribute("listmanHinh", manHinhService.findAll());
            model.addAttribute("listHang", hangSanPhamService.findAll());
            model.addAttribute("listCamera", cameraService.findAll());
            model.addAttribute("contentPage", "san-pham/add-san-pham.jsp");

            return "layout";

    }

    @GetMapping("/san-pham/view-add")
    public String hienthiadd(@ModelAttribute("dulieuxem") SanPham dulieuxem,
                          @ModelAttribute("manHinh") ManHinh manHinh,
                          @ModelAttribute("hangSP") HangSanPham hangSanPham,
                          @ModelAttribute("camera") Camera camera,
                          Model model, @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        Pageable pageable = PageRequest.of(num.orElse(0), size);
        Page<SanPham> list = sanPhamService.getAll0(pageable);
        model.addAttribute("listManHinh", manHinhService.findAll());
        model.addAttribute("listHangSP", hangSanPhamService.findAll());
        model.addAttribute("listCamera", cameraService.findAll());
        model.addAttribute("contentPage", "san-pham/add-san-pham.jsp");
        model.addAttribute("hsp", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        return "layout";
    }
}


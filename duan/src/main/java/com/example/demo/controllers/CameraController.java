package com.example.demo.controllers;

import com.example.demo.models.Camera;
import com.example.demo.models.Camera;
import com.example.demo.models.ManHinh;
import com.example.demo.services.CameraService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping("/camera")
public class CameraController {
    @Autowired
    private CameraService cameraService;

    @GetMapping("hien-thi")
    public String hienthi(@ModelAttribute("camera") Camera camera, Model model, @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        Sort sort = Sort.by("ngayTao").descending();
        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
        Page<Camera> list = cameraService.getAll(pageable);
        model.addAttribute("listCamera", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        model.addAttribute("contentPage", "camera/hien-thi.jsp");
        return "layout";
    }

    @GetMapping("/hien-thi-delete")
    public String hienThiDelete(Model model, @ModelAttribute("camera") Camera camera,
                                @RequestParam("pageNum") Optional<Integer> num,
                                @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer size) {

        Sort sort = Sort.by("ngayTao").descending();
        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
        Page<Camera> page = cameraService.getAll1(pageable);
        model.addAttribute("contentPage", "camera/camera-delete.jsp");
        model.addAttribute("listCamera", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "layout";
    }

    @GetMapping("/detail/{id}")
    public String detail(Model model, @PathVariable("id") UUID id) {
        Camera hsp = cameraService.findById(id);
        model.addAttribute("camera", hsp);
        model.addAttribute("contentPage", "camera/update.jsp");
        return "layout";
    }

    @PostMapping("/add")
    public String add(Model model,@Valid @ModelAttribute("camera") Camera camera ,BindingResult bindingResult,
                      @RequestParam("pageNum") Optional<Integer> num,
                      @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer size) {
        if (bindingResult.hasErrors()) {
            Sort sort = Sort.by("ngayTao").descending();
            Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
            Page<Camera> list = cameraService.getAll(pageable);
            model.addAttribute("listCamera", list.getContent());
            model.addAttribute("total", list.getTotalPages());
            model.addAttribute("contentPage", "camera/hien-thi.jsp");
            return "layout";
        }
        camera.setNgayTao(Date.valueOf(LocalDate.now()));
        camera.setTinhTrang(0);
        camera.setMa("CAM" + String.valueOf(cameraService.findAll().size() + 1));
        cameraService.add(camera);
        return "redirect:/camera/hien-thi";
        // Tiếp tục xử lý và trả về view tương ứng
    }

    @PostMapping("/update/{id}")
    public String update(Model model, @ModelAttribute("camera") @Valid Camera camera,
                         BindingResult bindingResult, @PathVariable("id") UUID id) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("contentPage", "camera/update.jsp");
            return "layout";
        }
        Camera hsp = cameraService.findById(id);
        Date ngayTao = hsp.getNgayTao();
        hsp.setThongSo(camera.getThongSo());
        hsp.setNgayTao(ngayTao);
        // Gán ngày hiện tại
        hsp.setNgayCapNhat(Date.valueOf(LocalDate.now()));
        hsp.setTinhTrang(camera.getTinhTrang());
        hsp.setMoTa(camera.getMoTa());
        cameraService.update(id, hsp);
        return "redirect:/camera/hien-thi";
    }

    @GetMapping("/update-tt")
    public String updateTT(Model model, @RequestParam("pageNum") Optional<Integer> pageNum,
                           @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize,
                           @ModelAttribute("camera") Camera camera) {
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        camera.setNgayCapNhat(date);
        cameraService.updateTT();
        Page<Camera> page = cameraService.getAll1(pageable);
        model.addAttribute("contentPage","camera/camera-delete.jsp");
        model.addAttribute("listCamera", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "layout";
    }

    @GetMapping("/update-status/{id}")
    public String updateStatus(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                               @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize, @ModelAttribute("camera") Camera camera) {
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);

        Camera camera1 = cameraService.findById(id);
        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        camera1.setNgayCapNhat(date);
        camera1.setTinhTrang(1);
        cameraService.update(id,camera1);
        Page<Camera> page = cameraService.getAll(pageable);
        model.addAttribute("contentPage","camera/hien-thi.jsp");
        model.addAttribute("listCamera", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "layout";
    }

    @GetMapping("/reset-status/{id}")
    public String resetStatus(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                              @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize, @ModelAttribute("camera") Camera camera) {
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Camera camera1 = cameraService.findById(id);
        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        camera1.setNgayCapNhat(date);

        camera1.setTinhTrang(0);
        cameraService.update(id,camera1);
        Page<Camera> page = cameraService.getAll1(pageable);
        model.addAttribute("contentPage","camera/camera-delete.jsp");
        model.addAttribute("listCamera", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "layout";
    }

    @PostMapping("/search-0")
    public String search0(Model model, @ModelAttribute("camera") Camera camera, @RequestParam("search") String search, @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        if (search.isEmpty()) {
            model.addAttribute("thongBao", "Không để trống thông tin");
            Sort sort = Sort.by("ngayTao").descending();
            Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
            Page<Camera> list = cameraService.getAll(pageable);
            model.addAttribute("listCamera", list.getContent());
            model.addAttribute("total", list.getTotalPages());
            model.addAttribute("contentPage", "camera/hien-thi.jsp");
            return "layout";
        } else {
            List<Camera> list = cameraService.search0(search);
            model.addAttribute("listCamera", list);
            model.addAttribute("contentPage", "camera/hien-thi.jsp");
            return "layout";
        }

    }

    @PostMapping("/search-1")
    public String search1(Model model, @ModelAttribute("camera") Camera camera, @RequestParam("search") String search, @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        if (search.isEmpty()) {
            model.addAttribute("thongBao", "Không để trống thông tin");
            Sort sort = Sort.by("ngayTao").descending();
            Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
            Page<Camera> list = cameraService.getAll1(pageable);
            model.addAttribute("listCamera", list.getContent());
            model.addAttribute("total", list.getTotalPages());
            model.addAttribute("contentPage", "camera/camera-delete.jsp");
            return "layout";
        } else {
            List<Camera> list = cameraService.search1(search);
            model.addAttribute("listCamera", list);
            model.addAttribute("contentPage", "camera/camera-delete.jsp");
            return "layout";
        }

    }
}

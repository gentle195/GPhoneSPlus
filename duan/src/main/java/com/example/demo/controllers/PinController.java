package com.example.demo.controllers;

import com.example.demo.models.DungLuongPin;
import com.example.demo.models.Pin;
import com.example.demo.services.DungLuongPinService;
import com.example.demo.services.PinService;
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
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@RequestMapping("/pin")
@Controller
public class PinController {

    @Autowired
    private PinService pinService;

    @Autowired
    private DungLuongPinService dungLuongPinService;

    @GetMapping("/hien-thi")
    public String hienThi(Model model, @ModelAttribute("pin") Pin pin,
                          @ModelAttribute("dungLuongPin") DungLuongPin dungLuongPin,
                          @RequestParam("pageNum") Optional<Integer> pageNum,
                          @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {

        Sort sort = Sort.by("ngayTao").descending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<Pin> page = pinService.getAll(pageable);
        model.addAttribute("listDungLuongPin", dungLuongPinService.findAll());
        model.addAttribute("contentPage", "pin/pin.jsp");
        model.addAttribute("listPin", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "layout";
    }

    @GetMapping("/hien-thi-delete")
    public String hienThi1(Model model, @ModelAttribute("pin") Pin pin,
                          @RequestParam("pageNum") Optional<Integer> pageNum,
                          @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {

        Sort sort = Sort.by("ngayTao").descending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<Pin> page = pinService.getAll1(pageable);
        model.addAttribute("listDungLuongPin", dungLuongPinService.findAll());
        model.addAttribute("contentPage", "pin/pin-delete.jsp");
        model.addAttribute("listPin", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "layout";
    }


    @PostMapping("/add")
    public String addPin(Model model, @ModelAttribute("pin") @Valid Pin pin, BindingResult bindingResult, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<Pin> page = pinService.getAll(pageable);

        if (bindingResult.hasErrors()) {
            model.addAttribute("contentPage", "pin/pin.jsp");
            model.addAttribute("listPin", page.getContent());
            model.addAttribute("page", page.getNumber());
            model.addAttribute("total", page.getTotalPages());
            return "layout";
        }

        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        String ma = "PIN" + pinService.findAll().size();
        pin.setMa(ma);
//        pin.setNgayTao(date);
        pin.setTinhTrang(0);
        pinService.add(pin);

        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        model.addAttribute("contentPage", "pin/pin.jsp");
        return "redirect:/pin/hien-thi";
    }

    @PostMapping("/modal-add")
    public String addDungLuongPin(Model model, @ModelAttribute("dungLuongPin") @Valid DungLuongPin dungLuongPin, BindingResult bindingResult, @RequestParam("pageNum") Optional<Integer> pageNum,
                                  @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<DungLuongPin> page = dungLuongPinService.getAll(pageable);
        if (bindingResult.hasErrors()) {
            model.addAttribute("contentPage", "pin/pin.jsp");
            model.addAttribute("listDungLuongPin", page.getContent());
            model.addAttribute("page", page.getNumber());
            model.addAttribute("total", page.getTotalPages());
            return "layout";
        }
        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        String ma = "DLP" + dungLuongPinService.findAll().size();
        dungLuongPin.setMa(ma);
        dungLuongPin.setNgayTao(date);
        dungLuongPin.setTinhTrang(0);

        dungLuongPinService.add(dungLuongPin);
        model.addAttribute("listDungLuongPin", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "redirect:/pin/hien-thi";
    }

    @PostMapping("/update/{id}")
    public String updatePin(Model model, @PathVariable("id") UUID id, @ModelAttribute("pin") @Valid Pin pin, BindingResult bindingResult, @RequestParam("pageNum") Optional<Integer> pageNum,
                            @RequestParam(name = "pageSize", required = false, defaultValue = "3") Integer pageSize) {

        if (bindingResult.hasErrors()) {
            model.addAttribute("listDungLuongPin", dungLuongPinService.findAll());
            return "pin/pin-update";
        }
        model.addAttribute("listDungLuongPin", dungLuongPinService.findAll());
        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        pin.setNgayCapNhat(date);
        pin.setNgayTao(pin.getNgayTao());
        pinService.update(id, pin);
        return "redirect:/pin/hien-thi";
    }

    @GetMapping("/update-tt")
    public String updateTT(Model model, @RequestParam("pageNum") Optional<Integer> pageNum,
                           @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize, @ModelAttribute("pin") Pin pin) {
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        pin.setNgayCapNhat(date);

        pinService.updateTT();
        Page<Pin> page = pinService.getAll1(pageable);
        model.addAttribute("contentPage","pin/pin-delete.jsp");
        model.addAttribute("listPin", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "layout";
    }

    @GetMapping("/update-status/{id}")
    public String updateStatus(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                               @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize, @ModelAttribute("pin") Pin pin) {
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);

        Pin pin1 = pinService.findById(id);
        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        pin1.setNgayCapNhat(date);
        pin1.setTinhTrang(1);
        pinService.update(id,pin1);
        Page<Pin> page = pinService.getAll(pageable);
        model.addAttribute("contentPage","pin/pin.jsp");
        model.addAttribute("listPin", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "layout";
    }

    @GetMapping("/reset-status/{id}")
    public String resetStatus(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                              @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize, @ModelAttribute("pin") Pin pin) {
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Pin pin1 = pinService.findById(id);
        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        pin1.setNgayCapNhat(date);

        pin1.setTinhTrang(0);
        pinService.update(id,pin1);
        Page<Pin> page = pinService.getAll1(pageable);
        model.addAttribute("contentPage","pin/pin-delete.jsp");
        model.addAttribute("listPin", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "layout";
    }


    @GetMapping("/detail/{id}")
    public String detail(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        Pin sp = pinService.findById(id);
        model.addAttribute("pin", sp);
        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<Pin> page = pinService.getAll(pageable);
        model.addAttribute("dungLuongPin", dungLuongPinService.findAll());
        model.addAttribute("contentPage", "pin/pin-update.jsp");
        model.addAttribute("listPin", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "layout";
    }

    @GetMapping("/view-add")
    public String viewAdd(Model model, @ModelAttribute("pin") Pin pin, @RequestParam("pageNum") Optional<Integer> pageNum,
                          @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        model.addAttribute("dungLuongPin", dungLuongPinService.findAll());
        model.addAttribute("contentPage", "pin/pin-add.jsp");
        return "layout";
    }

    @PostMapping("/search-0")
    public String search0(Model model, @RequestParam("search") String sreach, @ModelAttribute("pin") Pin pin) {
        List<Pin> listPin = pinService.search0(sreach);
        model.addAttribute("listPin", listPin);
        model.addAttribute("contentPage", "pin/pin.jsp");
        return "layout";
    }

    @PostMapping("/search-1")
    public String search1(Model model, @RequestParam("search") String sreach, @ModelAttribute("pin") Pin pin) {
        List<Pin> listPin = pinService.search1(sreach);
        model.addAttribute("listPin", listPin);
        model.addAttribute("contentPage", "pin/pin-delete.jsp");
        return "layout";
    }

}
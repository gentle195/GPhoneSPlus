package com.example.demo.controllers;

import com.example.demo.models.Chip;
import com.example.demo.models.DungLuongPin;
import com.example.demo.services.DungLuongPinService;
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
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@RequestMapping("/dung-luong-pin")
@Controller
public class DungLuongPinController {

    @Autowired
    private DungLuongPinService service;

    @GetMapping("/hien-thi")
    public String hienThi(Model model, @ModelAttribute("dungLuongPin") DungLuongPin dungLuongPin,
                          @RequestParam("pageNum") Optional<Integer> pageNum,
                          @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {

        Sort sort = Sort.by("ngayTao").descending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<DungLuongPin> page = service.getAll(pageable);
        model.addAttribute("contentPage", "dungluongpin/dung-luong-pin.jsp");
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "layout";
    }

    @PostMapping("/add")
    public String addDungLuongPin(Model model, @ModelAttribute("dungLuongPin") @Valid DungLuongPin dungLuongPin, BindingResult bindingResult, @RequestParam("pageNum") Optional<Integer> pageNum,
                                  @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<DungLuongPin> page = service.getAll(pageable);
        if (bindingResult.hasErrors()) {
            model.addAttribute("contentPage", "dungluongpin/dung-luong-pin.jsp");
            model.addAttribute("list", page.getContent());
            model.addAttribute("page", page.getNumber());
            model.addAttribute("total", page.getTotalPages());
            return "layout";
        }

        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        String ma = "DLP" + service.findAll().size();
        dungLuongPin.setMa(ma);
        dungLuongPin.setNgayTao(date);
        dungLuongPin.setTinhTrang(0);

        service.add(dungLuongPin);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "redirect:/dung-luong-pin/hien-thi";
    }

    @PostMapping("/update/{id}")
    public String updateDungLuongPin(Model model, @PathVariable("id") UUID id, @ModelAttribute("dungLuongPin") @Valid DungLuongPin dungLuongPin, BindingResult bindingResult, @RequestParam("pageNum") Optional<Integer> pageNum,
                                     @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        if (bindingResult.hasErrors()) {
            return "dungluongpin/dung-luong-pin-update";
        }

        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        dungLuongPin.setNgayCapNhat(date);
        service.update(id, dungLuongPin);

        return "redirect:/dung-luong-pin/hien-thi";
    }

    @GetMapping("/delete/{id}")
    public String delete(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize, @ModelAttribute("dungLuongPin") DungLuongPin dungLuongPin) {
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        service.delete(id);
        Page<DungLuongPin> page = service.getAll(pageable);
        model.addAttribute("contentPage", "dungluongpin/dung-luong-pin.jsp");
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "layout";
    }

    @GetMapping("/detail/{id}")
    public String detail(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize, @ModelAttribute("dungLuongPin") DungLuongPin dungLuongPin) {
        DungLuongPin sp = service.findById(id);
        model.addAttribute("dungLuongPin", sp);
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<DungLuongPin> page = service.getAll(pageable);
        model.addAttribute("contentPage", "dungluongpin/dung-luong-pin-update.jsp");
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "layout";
    }

    @GetMapping("/view-add")
    public String viewAdd(Model model,  @ModelAttribute("dungLuongPin") DungLuongPin dungLuongPin, @RequestParam("pageNum") Optional<Integer> pageNum,
                          @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        model.addAttribute("contentPage","dungluongpin/dung-luong-pin-add.jsp");
        return "layout";
    }

    @PostMapping("/search")
    public String search(Model model, @RequestParam("search") String sreach, @ModelAttribute("dungLuongPin") DungLuongPin dungLuongPin) {
        List<DungLuongPin> listDungLuongPin = service.search(sreach);
        model.addAttribute("list", listDungLuongPin);
        model.addAttribute("contentPage", "dungluongpin/dung-luong-pin.jsp");
        return "layout";
    }
}

package com.example.demo.controller;

import com.example.demo.models.*;
import com.example.demo.services.RomService;
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

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Controller
//@RequestMapping("/rom")
public class RomController {
    @Autowired
    RomService romService;

    @GetMapping("/rom/hien-thi")
    public String hienthi(@ModelAttribute("dulieuxem") Rom dulieuxem, Model model, @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
        Page<Rom> list = romService.getAll(pageable);
        model.addAttribute("contentPage","rom/hien-thi.jsp");
        model.addAttribute("hsp", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        return "layout";
    }

    @GetMapping("/rom/detail/{id}")
    public String viewupdate( @PathVariable("id") UUID id,@ModelAttribute("dulieuxem") Rom dulieuxem, Model model, @RequestParam("num") Optional<Integer> num,
                             @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        Rom hsp = romService.findById(id);
        model.addAttribute("dulieuxem", hsp);
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
        Page<Rom> list = romService.getAll(pageable);
        model.addAttribute("contentPage","rom/update.jsp");
        model.addAttribute("hsp", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        return "layout";
    }
    @GetMapping("/rom/form-add")
    public String formadd( @ModelAttribute("dulieuxem") Rom dulieuxem, Model model, @RequestParam("num") Optional<Integer> num,
                              @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);

        Page<Rom> list = romService.getAll(pageable);
        model.addAttribute("contentPage","rom/add.jsp");
        model.addAttribute("hsp", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        return "layout";
    }

    @PostMapping("rom/add")
    public String add(Model model, @ModelAttribute("dulieuxem") @Valid Rom dulieuxem, BindingResult bindingResult,
                      @RequestParam("num") Optional<Integer> num, @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("content", "Rom/hien-thi.jsp");
            Sort sort = Sort.by("ngayTao").ascending();
            Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
            Page<Rom> list = romService.getAll(pageable);
            model.addAttribute("contentPage","Rom/rom.jsp");
            model.addAttribute("hsp", list.getContent());
            model.addAttribute("total", list.getTotalPages());
            return "Rom/hien-thi";
        }

        dulieuxem.setNgayTao(Date.valueOf(LocalDate.now()));
        dulieuxem.setMa("R" + String.valueOf(romService.findAll().size() + 1));

        romService.add(dulieuxem);

        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
        Page<Rom> list = romService.getAll(pageable);
        model.addAttribute("hsp", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        return "redirect:/rom/hien-thi";
        // Tiếp tục xử lý và trả về view tương ứng
    }

    @PostMapping("rom/update/{id}")
    public String update( @ModelAttribute("dulieuxem") @Valid Rom dulieuxem, BindingResult bindingResult, @PathVariable("id") UUID id, Model model, @RequestParam("num") Optional<Integer> num,
                         @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("content", "rom/update.jsp");
            Sort sort = Sort.by("ngayTao").ascending();
            Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
            Page<Rom> list = romService.getAll(pageable);
            model.addAttribute("contentPage","Rom/hien-thi.jsp");
            model.addAttribute("hsp", list.getContent());
            model.addAttribute("total", list.getTotalPages());
            return "Rom/update";
        }

        Rom hsp = romService.findById(id);
        Date ngayTao = hsp.getNgayTao();
        hsp.setDungLuong(dulieuxem.getDungLuong());
        hsp.setNgayTao(ngayTao);
        // Gán ngày hiện tại
        hsp.setNgayCapNhat(Date.valueOf(LocalDate.now()));
        hsp.setTinhTrang(dulieuxem.getTinhTrang());
        hsp.setMoTa(dulieuxem.getMoTa());
        romService.update(id, hsp);
        return "redirect:/rom/hien-thi";
    }

    @GetMapping("rom/delete/{id}")
    public String delete(Model model, @ModelAttribute("dulieuxem") Rom dulieuxem, @PathVariable("id") UUID id, @RequestParam("num") Optional<Integer> num,
                         @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        romService.delete(id);
        Pageable pageable = PageRequest.of(num.orElse(0), size);
        Page<Rom> list = romService.getAll(pageable);
        model.addAttribute("contentPage","rom/hien-thi.jsp");
        model.addAttribute("hsp", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        return "layout";

    }
    @PostMapping("/rom/search")
    public String search( @RequestParam("search") String search,@ModelAttribute("dulieuxem") Rom dulieuxem, Model model, @RequestParam("num") Optional<Integer> num,
                         @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        List<Rom> list = romService.search(search);


        model.addAttribute("contentPage","rom/hien-thi.jsp");
        model.addAttribute("hsp", list);
//        model.addAttribute("total", list);
        return "layout";
    }

}

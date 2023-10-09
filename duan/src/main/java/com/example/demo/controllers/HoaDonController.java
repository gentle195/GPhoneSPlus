package com.example.demo.controllers;

import com.example.demo.models.DiaChi;
import com.example.demo.models.HoaDon;
import com.example.demo.models.HoaDonChiTiet;
import com.example.demo.models.KhachHang;
import com.example.demo.models.NhanVien;
import com.example.demo.models.QuyDoi;
import com.example.demo.services.DiaChiService;
import com.example.demo.services.HoaDonChiTietService;
import com.example.demo.services.HoaDonService;
import com.example.demo.services.KhachHangService;
import com.example.demo.services.NhanVienService;
import com.example.demo.services.QuyDoiService;
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

import java.math.BigDecimal;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@RequestMapping("hoa-don")
@Controller
public class HoaDonController {
    @Autowired
    private HoaDonService hoaDonService;

    @Autowired
    private KhachHangService khachHangService;
    @Autowired
    private NhanVienService nhanVienService;
    @Autowired
    private DiaChiService diaChiService;

    @Autowired
    private QuyDoiService quyDoiService;


    @Autowired
    private HoaDonChiTietService hoaDonChiTietService;

    @GetMapping("/hien-thi")
    public String hienThi(Model model, @ModelAttribute("hoaDon") HoaDon hoaDon,
                          @RequestParam("pageNum") Optional<Integer> pageNum,
                          @RequestParam(name = "pageSize", required = false, defaultValue = "20") Integer pageSize) {

        Sort sort = Sort.by("ma").descending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<HoaDon> page = hoaDonService.getAll(pageable);
        model.addAttribute("contentPage", "../hoadon/hoa-don.jsp");
        model.addAttribute("listHoaDon", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "/home/layout";
    }

    @PostMapping("/search")
    public String search(Model model, @ModelAttribute("hoaDon") HoaDon hoaDon,
                         @RequestParam("search") String search,
                         @RequestParam(name = "soTienQuyDoi", required = false) BigDecimal soTienQuyDoi) {
        List<HoaDon> list = hoaDonService.search(search, soTienQuyDoi);
        model.addAttribute("listHoaDon", list);
        model.addAttribute("contentPage", "../hoadon/hoa-don.jsp");

        return "/home/layout";
    }

    @GetMapping("/view-loc")
    public String viewLoc(Model model, @ModelAttribute("hoaDon") HoaDon hoaDon) {


        List<NhanVien> listNhanVien = nhanVienService.findAll();
        List<KhachHang> listKhachHang = khachHangService.findAll();
//        List<DiaChi> listDiaChi = diaChiService.findAll();


        model.addAttribute("listKhachHang", listKhachHang);
        model.addAttribute("listNhanVien", listNhanVien);
//        model.addAttribute("listDiaChi", listDiaChi);
        model.addAttribute("contentPage", "../hoadon/hoa-don-loc.jsp");

        return "/home/layout";
    }

    @GetMapping("/loc")
    public String locHoaDon(Model model,
                            @RequestParam(name = "idKH", required = false) UUID idKH,
                            @RequestParam(name = "idNV", required = false) UUID idNV
//                            @RequestParam(name = "idDC", required = false) UUID idDC
//                            @RequestParam(name = "startDate", required = false) Date startDate,
//                            @RequestParam(name = "endDate", required = false) Date endDate,
//                            @RequestParam(name = "shipStartDate", required = false) Date shipStartDate,
//                            @RequestParam(name = "shipEndDate", required = false) Date shipEndDate,
//                            @RequestParam(name = "receiveStartDate", required = false) Date receiveStartDate,
//                            @RequestParam(name = "receiveEndDate", required = false) Date receiveEndDate
    ) {
        // Bạn có thể làm bất kỳ xử lý nào với danh sách hoá đơn đã lọc ở đây
        List<HoaDon> filteredHoaDon = hoaDonService.locHoaDon(idKH, idNV
//                , startDate, endDate, shipStartDate, shipEndDate, receiveStartDate, receiveEndDate
        );
        List<NhanVien> listNhanVien = nhanVienService.findAll();
        List<KhachHang> listKhachHang = khachHangService.findAll();
//        List<DiaChi> listDiaChi = diaChiService.findAll();


        model.addAttribute("listKhachHang", listKhachHang);
        model.addAttribute("listNhanVien", listNhanVien);
//        model.addAttribute("listDiaChi", listDiaChi);
//        Sort sort = Sort.by("ngayTao").descending();

        model.addAttribute("listHoaDon", filteredHoaDon);
        model.addAttribute("contentPage", "../hoadon/hoa-don-loc.jsp");
        return "/home/layout"; // Điều hướng về trang layout hoặc trang hiển thị kết quả lọc
    }

    @GetMapping("/detail/{id}")
    public String detail(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "20") Integer pageSize) {
        List<NhanVien> listNhanVien = nhanVienService.findAll();
        List<KhachHang> listKhachHang = khachHangService.findAll();
        List<DiaChi> listDiaChi = diaChiService.findAll();
        List<QuyDoi> listQuyDoi = quyDoiService.findAll();


        List<HoaDonChiTiet> listHoaDonChiTiet = hoaDonChiTietService.getHoaDonChiTiet(id);
        model.addAttribute("listKhachHang", listKhachHang);
        model.addAttribute("listNhanVien", listNhanVien);
        model.addAttribute("listDiaChi", listDiaChi);
        model.addAttribute("listQuyDoi", listQuyDoi);

        HoaDon hoaDon = hoaDonService.findById(id);
        model.addAttribute("hoaDon", hoaDon);
        model.addAttribute("listHoaDonChiTiet", listHoaDonChiTiet);
        model.addAttribute("contentPage", "../hoadon/hoa-don-detail.jsp");
        return "/home/layout";
    }

    @GetMapping("/view-add")
    public String viewAdd(Model model, @ModelAttribute("hoaDon") HoaDon hoaDon,
                          @ModelAttribute("khachHang") KhachHang khachHang,
                          @ModelAttribute("nhanVien") NhanVien nhanVien,
                          @ModelAttribute("diaChi") DiaChi diaChi
//                          @ModelAttribute("quyDoi") QuyDoi quyDoi
    ) {

        hoaDon.setTinhTrang(0);
        List<KhachHang> listKhachHang = khachHangService.findAll0();
        model.addAttribute("listKhachHang", listKhachHang);

        List<NhanVien> listNhanVien = nhanVienService.findAll();
        model.addAttribute("listNhanVien", listNhanVien);

        List<DiaChi> listDiaChi = diaChiService.getALL0();
        model.addAttribute("listDiaChi", listDiaChi);

//        List<QuyDoi> listQuyDoi = quyDoiService.findAll();
//        model.addAttribute("listQuyDoi", listQuyDoi);
//        model.addAttribute("nhanVien", new NhanVien());
        model.addAttribute("contentPage", "../hoadon/hoa-don-cho.jsp");

        return "/home/layout";
    }

    @PostMapping("/add")
    public String addHoaDon(Model model, @ModelAttribute("hoaDon") @Valid HoaDon hoaDon,
                            BindingResult bindingResult
//            ,
//                                        @ModelAttribute("khachHang") KhachHang khachHang,
//                                        @ModelAttribute("nhanVien") NhanVien nhanVien,
//                                        @ModelAttribute("diaChi") DiaChi diaChi

    ) {

        if (bindingResult.hasErrors()) {
            List<KhachHang> listKhachHang = khachHangService.findAll0();
            model.addAttribute("listKhachHang", listKhachHang);

            List<NhanVien> listNhanVien = nhanVienService.findAll();
            model.addAttribute("listNhanVien", listNhanVien);

            List<DiaChi> listDiaChi = diaChiService.getALL0();
            model.addAttribute("listDiaChi", listDiaChi);

//            List<QuyDoi> listQuyDoi = quyDoiService.findAll();
//            model.addAttribute("listQuyDoi", listQuyDoi);

            hoaDon.setTinhTrang(0);
            model.addAttribute("contentPage", "../hoadon/hoa-don-cho-add.jsp");
        }
        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        Sort sort = Sort.by("ma").descending();
        Integer hd = hoaDonService.findAll().size() + 1;
        String maHD = "";
        if (hd < 9) {
            maHD = "HD0" + hd;
        } else {
            maHD = "HD" + hd;
        }
        hoaDon.setMa(maHD);
        hoaDon.setNgayCapNhat(Date.valueOf(LocalDate.now()));
        hoaDon.setNgayTao(date);
        hoaDon.setTinhTrang(0);
//            hoaDon.setNgayNhan(date);


        List<KhachHang> listKhachHang = khachHangService.findAll0();
        model.addAttribute("listKhachHang", listKhachHang);

        List<NhanVien> listNhanVien = nhanVienService.findAll();
        model.addAttribute("listNhanVien", listNhanVien);

        List<DiaChi> listDiaChi = diaChiService.getALL0();
        model.addAttribute("listDiaChi", listDiaChi);

        hoaDonService.add(hoaDon);
//        model.addAttribute("hoaDon", new HoaDon());
        model.addAttribute("contentPage", "../hoadon/hoa-don.jsp");
        return "redirect:/hoa-don/hien-thi";
    }


}

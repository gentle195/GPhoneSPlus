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
    private int dem = 0;

    @GetMapping("/hien-thi")
    public String hienThi(Model model, @ModelAttribute("hoaDon") HoaDon hoaDon,
                          @RequestParam("pageNum") Optional<Integer> pageNum,
                          @RequestParam(name = "pageSize", required = false, defaultValue = "20") Integer pageSize) {
        dem = 0;
        Sort sort = Sort.by("ma").descending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<HoaDon> page = hoaDonService.getAll(pageable);
        List<NhanVien> listNhanVien = nhanVienService.findAll();
        List<KhachHang> listKhachHang = khachHangService.findAll00();
        List<DiaChi> listDiaChi = diaChiService.getALL0();

        model.addAttribute("listKhachHang", listKhachHang);
        model.addAttribute("listNhanVien", listNhanVien);
        model.addAttribute("listDiaChi", listDiaChi);

        model.addAttribute("dem", dem);
        model.addAttribute("contentPage", "../hoadon/hoa-don.jsp");
        model.addAttribute("listHoaDon", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "/home/layout";
    }

    @PostMapping("/search")
    public String search(Model model, @ModelAttribute("hoaDon") HoaDon hoaDon,
                         @RequestParam("search") String search,
                         @RequestParam(name = "soTienQuyDoi", required = false) BigDecimal soTienQuyDoi,
                         @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "20") Integer pageSize) {

        dem = 1;
        model.addAttribute("dem", dem);
        Sort sort = Sort.by("ma").descending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<HoaDon> page = hoaDonService.getAll(pageable);
        List<HoaDon> list = hoaDonService.search(search, soTienQuyDoi);
        List<NhanVien> listNhanVien = nhanVienService.findAll();
        List<KhachHang> listKhachHang = khachHangService.findAll();
        List<DiaChi> listDiaChi = diaChiService.findAll();
        model.addAttribute("dem", dem);
        model.addAttribute("listKhachHang", listKhachHang);
        model.addAttribute("listNhanVien", listNhanVien);
        model.addAttribute("listDiaChi", listDiaChi);
        model.addAttribute("listHoaDon", list);
        model.addAttribute("contentPage", "../hoadon/hoa-don.jsp");


        return "/home/layout";
    }

    @GetMapping("/huy/{id}")
    public String huyHoaDon(Model model, @PathVariable("id") UUID id
            , @ModelAttribute("hoaDon") HoaDon hoaDon
    ) {

        HoaDon hoaDon1 = hoaDonService.findById(id);
        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        hoaDon1.setNgayCapNhat(date);
        hoaDon1.setTinhTrang(8);
        hoaDonService.update(id, hoaDon1);
        model.addAttribute("hoaDon", hoaDon1);
        model.addAttribute("contentPage", "../hoadon/hoa-don.jsp");
        return "redirect:/hoa-don/hien-thi"; // Chuyển hướng về trang danh sách hóa đơn sau khi hủy
    }

    @PostMapping("/loc")
    public String loc1(Model model, @RequestParam(value = "nhanVien", required = false) UUID idNV,
                       @RequestParam(value = "khachHang", required = false) UUID idKH,
                       @RequestParam(value = "diaChi", required = false) UUID idDC,
                       @ModelAttribute("nhanVien") NhanVien nhanVien,
                       @ModelAttribute("khachHang") KhachHang khachHang,
                       @ModelAttribute("diaChi") DiaChi diaChi,
                       @ModelAttribute("hoaDon") HoaDon hoaDon,
//                       @ModelAttribute("startDate") Date ngayTao),
//                       @ModelAttribute("endDate") Date ngay),
//                       @ModelAttribute("") Date ngayNhan),
//
//                       @ModelAttribute("startDate") Date ngayTao),
                       @RequestParam("pageNum") Optional<Integer> pageNum,
                       @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        //      Date startDate, Date endDate, Date shipStartDate, Date shipEndDate, Date receiveStartDate, Date receiveEndDate

        Sort sort = Sort.by("ngayTao").descending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), 5);
        dem = 2;
        List<HoaDon> listHoaDon = hoaDonService.loc1(idKH, idNV, idDC, hoaDon.getNgayTao(), hoaDon.getNgayNhan(), hoaDon.getNgayShip(), hoaDon.getNgayTao(), hoaDon.getNgayNhan(), hoaDon.getNgayShip());
        model.addAttribute("listHoaDon", listHoaDon);
        model.addAttribute("dem", dem);
        model.addAttribute("listKhachHang", khachHangService.findAll00());
        model.addAttribute("listNhanVien", nhanVienService.findAll());
        model.addAttribute("listDiaChi", diaChiService.getALL0());

//        model.addAttribute("listHoaDon", listHoaDon.getContent());
//        model.addAttribute("page", listHoaDon.getNumber());
//        model.addAttribute("total", listHoaDon.getTotalPages());
        model.addAttribute("contentPage", "../hoadon/hoa-don.jsp");
        return "/home/layout";

    }


    @GetMapping("/detail/{id}")
    public String detail(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "20") Integer pageSize) {
        List<NhanVien> listNhanVien = nhanVienService.findAll();
        List<KhachHang> listKhachHang = khachHangService.findAll();
        List<DiaChi> listDiaChi = diaChiService.findAll();
        List<QuyDoi> listQuyDoi = quyDoiService.findAll();
        dem = 4;

        Page<HoaDonChiTiet> listHoaDonChiTiet = hoaDonChiTietService.getHoaDonChiTietPage(id, Pageable.unpaged());
        model.addAttribute("listKhachHang", listKhachHang);
        model.addAttribute("listNhanVien", listNhanVien);
        model.addAttribute("listDiaChi", listDiaChi);
        model.addAttribute("listQuyDoi", listQuyDoi);
        model.addAttribute("dem", dem);
        HoaDon hoaDon = hoaDonService.findById(id);
        model.addAttribute("hoaDon", hoaDon);
        model.addAttribute("listHoaDonChiTiet", listHoaDonChiTiet.getContent());
        model.addAttribute("contentPage", "../hoadon/hoa-don-detail.jsp");
        model.addAttribute("page", listHoaDonChiTiet.getNumber());
        model.addAttribute("total", listHoaDonChiTiet.getTotalPages());
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

    //update thông tin khi trạng thái là đang chờ, chờ xác nhận...
    @GetMapping("/view-update/{id}")
    public String viewUpdate(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                             @RequestParam(name = "pageSize", required = false, defaultValue = "20") Integer pageSize) {
        List<NhanVien> listNhanVien = nhanVienService.findAll();
        List<KhachHang> listKhachHang = khachHangService.findAll();
        List<DiaChi> listDiaChi = diaChiService.findAll();
        List<QuyDoi> listQuyDoi = quyDoiService.findAll();
        dem = 4;

        Page<HoaDonChiTiet> listHoaDonChiTiet = hoaDonChiTietService.getHoaDonChiTietPage(id, Pageable.unpaged());
        model.addAttribute("listKhachHang", listKhachHang);
        model.addAttribute("listNhanVien", listNhanVien);
        model.addAttribute("listDiaChi", listDiaChi);
        model.addAttribute("listQuyDoi", listQuyDoi);

        HoaDon hoaDon = hoaDonService.findById(id);
        model.addAttribute("hoaDon", hoaDon);
        model.addAttribute("listHoaDonChiTiet", listHoaDonChiTiet.getContent());
        model.addAttribute("contentPage", "../hoadon/hoa-don-view-update.jsp");
        model.addAttribute("page", listHoaDonChiTiet.getNumber());
        model.addAttribute("total", listHoaDonChiTiet.getTotalPages());
        return "/home/layout";
    }

    //
    @GetMapping("/update/{id}")
    public String Update(Model model, @PathVariable("id") UUID id,
                         @ModelAttribute("hoaDon") HoaDon hoaDon, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "20") Integer pageSize) {

        List<NhanVien> listNhanVien = nhanVienService.findAll();
        List<KhachHang> listKhachHang = khachHangService.findAll00();
        List<DiaChi> listDiaChi = diaChiService.findAll0();
//        List<QuyDoi> listQuyDoi = quyDoiService.findAll();
        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        hoaDon.setId(id);
        hoaDon.setNgayCapNhat(Date.valueOf(LocalDate.now()));
        hoaDon.setNgayTao(date);

        model.addAttribute("listKhachHang", listKhachHang);
        model.addAttribute("listNhanVien", listNhanVien);
        model.addAttribute("listDiaChi", listDiaChi);

        hoaDonService.update(id, hoaDon);
        model.addAttribute("contentPage", "../hoadon/hoa-don-view-update.jsp");

        return "/home/layout";
    }


    @PostMapping("/search-hdct")
    public String searchHDCT(Model model, @ModelAttribute("ten") String ten,
                             @RequestParam("pageNum") Optional<Integer> pageNum,
                             @RequestParam(name = "pageSize", required = false, defaultValue = "20") Integer pageSize) {
        List<NhanVien> listNhanVien = nhanVienService.findAll();
        List<KhachHang> listKhachHang = khachHangService.findAll00();
        List<DiaChi> listDiaChi = diaChiService.getALL0();
        List<QuyDoi> listQuyDoi = quyDoiService.findAll();
//        HoaDon hoaDon = hoaDonService.findById(id);
        dem = 5;
//        List<HoaDonChiTiet> listHoaDonChiTiet = hoaDonChiTietService.getHoaDonChiTiet(id);
        Page<HoaDonChiTiet> listHoaDonChiTiets = hoaDonChiTietService.search(ten, Pageable.unpaged());

        model.addAttribute("listKhachHang", listKhachHang);
        model.addAttribute("listNhanVien", listNhanVien);
        model.addAttribute("listDiaChi", listDiaChi);
        model.addAttribute("listQuyDoi", listQuyDoi);
//        model.addAttribute("hoaDon", hoaDon);
        model.addAttribute("contentPage", "hoadon/hoa-don-detail.jsp");
        model.addAttribute("listHoaDonChiTiet", listHoaDonChiTiets.getContent());
        model.addAttribute("page", listHoaDonChiTiets.getNumber());
        model.addAttribute("total", listHoaDonChiTiets.getTotalPages());
        return "/home/layout";
    }


}

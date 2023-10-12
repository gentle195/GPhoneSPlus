package com.example.demo.controllers;

import com.example.demo.models.ChiTietSanPham;
import com.example.demo.models.DiaChi;
import com.example.demo.models.HoaDon;
import com.example.demo.models.HoaDonChiTiet;
import com.example.demo.models.KhachHang;
import com.example.demo.models.NhanVien;
import com.example.demo.models.QuyDoi;
import com.example.demo.services.ChiTietSanPhamService;
import com.example.demo.services.DiaChiService;
import com.example.demo.services.HoaDonChiTietService;
import com.example.demo.services.HoaDonService;
import com.example.demo.services.IMEIService;
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
    private ChiTietSanPhamService chiTietSanPhamService;

    @Autowired
    private IMEIService imeiService;

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
        HoaDon hd = hoaDonService.findById(id);
        LocalDate ngayCapNhat = LocalDate.now();
        List<HoaDonChiTiet> list = hoaDonChiTietService.getHoaDonChiTiet(hd.getId());
        if (!list.isEmpty()) {
            for (HoaDonChiTiet hdct : list
            ) {
                ChiTietSanPham ctsp = chiTietSanPhamService.getChiTiet(hdct.getImei().getId());
                ctsp.setSoLuong(ctsp.getSoLuong() + 1);
                long millis = System.currentTimeMillis();
                Date date = new Date(millis);
                ctsp.setNgayTao(date);
                if (ctsp.getSoLuong() > 0) {
                    ctsp.setTinhTrang(0);
                }
                chiTietSanPhamService.update1(ctsp);
                imeiService.updatImei1(date, hdct.getId());
                hdct.setTinhTrang(8);
                hoaDonChiTietService.update(hdct.getId(), hdct);
            }
            hd.setTinhTrang(8);
            hd.setNgayCapNhat(Date.valueOf(ngayCapNhat));
            hoaDonService.update(id, hd);
        } else {
            hd.setTinhTrang(8);
            hd.setNgayCapNhat(Date.valueOf(ngayCapNhat));
            hoaDonService.update(id, hd);
        }
        model.addAttribute("hoaDon", hd);
        model.addAttribute("contentPage", "../hoadon/hoa-don.jsp");
        return "redirect:/hoa-don/hien-thi"; // Chuyển hướng về trang danh sách hóa đơn sau khi hủy
    }

    @PostMapping("/loc")
    public String loc1(Model model, @RequestParam(value = "nhanVien", required = false) UUID idNV,
                       @RequestParam(value = "khachHang", required = false) UUID idKH,
                       @RequestParam(value = "diaChi", required = false) UUID idDC,
                       @RequestParam(value = "startDate", required = false) java.sql.Date startDate,
                       @RequestParam(value = "receiveStartDate", required = false) java.sql.Date receiveStartDate,
                       @RequestParam(value = "shipStartDate", required = false) java.sql.Date shipStartDate,
                       @RequestParam(value = "endDate", required = false) java.sql.Date endDate,
                       @RequestParam(value = "receiveEndDate", required = false) java.sql.Date receiveEndDate,
                       @RequestParam(value = "shipEndDate", required = false) java.sql.Date shipEndDate,
                       @ModelAttribute("nhanVien") NhanVien nhanVien,
                       @ModelAttribute("khachHang") KhachHang khachHang,
                       @ModelAttribute("diaChi") DiaChi diaChi,
                       @ModelAttribute("hoaDon") HoaDon hoaDon,
                       @RequestParam("pageNum") Optional<Integer> pageNum,
                       @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {

        Sort sort = Sort.by("ngayTao").descending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), 5);
        dem = 2;
        List<HoaDon> listHoaDon = hoaDonService.loc1(idKH, idNV, idDC, startDate, endDate, shipStartDate, shipEndDate, receiveStartDate, receiveEndDate);
        model.addAttribute("listHoaDon", listHoaDon);
        model.addAttribute("dem", dem);
        model.addAttribute("listKhachHang", khachHangService.findAll00());
        model.addAttribute("listNhanVien", nhanVienService.findAll());
        model.addAttribute("listDiaChi", diaChiService.getALL0());
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

        List<HoaDonChiTiet> listHoaDonChiTiet = hoaDonChiTietService.getHoaDonChiTiet(id);
        model.addAttribute("listKhachHang", listKhachHang);
        model.addAttribute("listNhanVien", listNhanVien);
        model.addAttribute("listDiaChi", listDiaChi);
        model.addAttribute("listQuyDoi", listQuyDoi);
        model.addAttribute("dem", dem);
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
        dem = 5;
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

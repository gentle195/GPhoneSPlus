package com.example.demo.controllers;

import com.example.demo.models.*;
import com.example.demo.services.*;
import com.example.demo.util.SecurityUtil;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.math.BigDecimal;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

@Controller
@RequestMapping("doi-tra")
public class DoiTraController {
    @Autowired
    private DoiTraService doiTraService;

    @Autowired
    private HoaDonService hoaDonService;
    @Autowired
    private ChiTietSanPhamService chiTietSanPhamService;
    @Autowired
    private NhanVienService nhanVienService;
    @Autowired
    private KhachHangService khachHangService;
    @Autowired
    private HoaDonChiTietService hoaDonChiTietService;
    @Autowired
    private DiaChiService diaChiService;
    @Autowired
    private IMEIService imeiService;
    @Autowired
    private SanPhamService sanPhamService;
    @Autowired
    private MauSacService mauSacService;
    @Autowired
    private ChipService chipService;
    @Autowired
    private RamService ramService;
    @Autowired
    private RomService romService;
    @Autowired
    private PinService pinService;
    @Autowired
    private HangSanPhamService hangSanPhamService;
    @Autowired
    private HangKhachHangService hangKhachHangService;
    @Autowired
    private DungLuongPinService dungLuongPinService;
    @Autowired
    private ManHinhService manHinhService;
    @Autowired
    private CameraService cameraService;
    @Autowired
    private DoiTraChiTietService doiTraChiTietService;


    @GetMapping("/hien-thi")
    public String hienthi(@ModelAttribute("sanpham") SanPham sanpham, @ModelAttribute("NhanVien") NhanVien nhanVien,
                          @ModelAttribute("KhachHang") KhachHang khachHang,
                          @ModelAttribute("HoaDon") HoaDon hoaDon,
                          Model model) {
        List<DoiTra> list = doiTraService.getAll0();
        List<HoaDon> listt = doiTraService.getAllHD();
        List<NhanVien> listNhanVien = nhanVienService.findAll();
        List<KhachHang> listKhachHang = khachHangService.findAll00();
//        Page<IMEI> imei=imeiService.fill1();
        model.addAttribute("listKhachHang", listKhachHang);
        model.addAttribute("listNhanVien", listNhanVien);
        model.addAttribute("hangds", hangSanPhamService.findAll0());
        model.addAttribute("camds", cameraService.findAll0());
        model.addAttribute("mands", manHinhService.findAll0());
        model.addAttribute("mauds", mauSacService.findAll0());
        model.addAttribute("ramds", ramService.findAll0());
        model.addAttribute("romds", romService.findAll0());
        model.addAttribute("pinds", pinService.findAll0());
        model.addAttribute("dungds", dungLuongPinService.findAll0());
        model.addAttribute("chipds", chipService.findAll0());
        model.addAttribute("sands", sanPhamService.findAll0());
        model.addAttribute("listChiTietSanPham", chiTietSanPhamService.findAll0());
        model.addAttribute("contentPage", "../doi-tra/hien-thi.jsp");
        model.addAttribute(("list"), list);
//        model.addAttribute("imeiii",imei.getContent());
        model.addAttribute("listt", listt);
        return "home/layout";

    }

    @GetMapping("/detail-imei/{imeiId}")
    @ResponseBody
    public IMEI detail(@PathVariable("imeiId") UUID imeiId, Model model) {
        IMEI imei = imeiService.findById(imeiId);
        model.addAttribute("imei", imei);
        return imei;

    }

    @GetMapping("/hien-thi-tu-choi-tra")
    public String hienthi1(@ModelAttribute("sanpham") SanPham sanpham, @ModelAttribute("NhanVien") NhanVien nhanVien,
                           @ModelAttribute("KhachHang") KhachHang khachHang,
                           @ModelAttribute("HoaDon") HoaDon hoaDon,
                           Model model) {
        List<DoiTra> list = doiTraService.getAll1();
        model.addAttribute("listKhachHang", khachHangService.findAll00());
        model.addAttribute("listNhanVien", nhanVienService.findAll());
        model.addAttribute("contentPage", "../doi-tra/tu-choi-tra-hang.jsp");
        model.addAttribute(("list"), list);

        return "home/layout";

    }


    @GetMapping("/thanh-cong")
    public String hienthi2(@ModelAttribute("sanpham") SanPham sanpham, @ModelAttribute("NhanVien") NhanVien nhanVien,
                           @ModelAttribute("KhachHang") KhachHang khachHang,
                           @ModelAttribute("HoaDon") HoaDon hoaDon,
                           Model model) {
        List<DoiTra> list = doiTraService.getAll2();
        model.addAttribute("listKhachHang", khachHangService.findAll00());
        model.addAttribute("listNhanVien", nhanVienService.findAll());
        model.addAttribute("contentPage", "../doi-tra/doi-tra-thanh-cong.jsp");
        model.addAttribute(("list"), list);

        return "home/layout";

    }

//    @GetMapping("/modal")
//    public String hienthi2(@ModelAttribute("sanpham")SanPham sanpham, @ModelAttribute("NhanVien")NhanVien nhanVien,
//                           @ModelAttribute("KhachHang")KhachHang khachHang,
//                           @ModelAttribute("HoaDon")HoaDon hoaDon,
//                           Model model,@RequestParam("num") Optional<Integer> num,
//                           @RequestParam(name = "size", defaultValue = "10", required = false) Integer size){
//        Pageable pageable= PageRequest.of(num.orElse(0),size );
//        Page<HoaDon> listt=doiTraService.getAllhoadon(pageable);
//        model.addAttribute("contentPage", "../doi-tra/hien-thi.jsp");
//        model.addAttribute(("listmodal"),listt.getContent());
//        model.addAttribute("total",listt.getTotalPages());
//        return "home/layout";
//
//    }
//@GetMapping("/detail/{id}")
//@ResponseBody
//public List<HoaDonChiTiet> detail(@PathVariable("id") UUID id) {
//    List<HoaDonChiTiet> hdct = doiTraService.getHoaDonChiTiet(id);
//    return hdct;
//}

    public List<DoiTraChiTiet> filterDoiTraChiTietByImeiNotNull(List<DoiTraChiTiet> dtctList) {
        return dtctList.stream()
                .filter(dtct -> dtct.getImei() != null)
                .collect(Collectors.toList());
    }


    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") UUID id, Model model, @RequestParam("doitraId") UUID doitraId, @RequestParam("hoadonId") UUID hoadonId, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "20") Integer pageSize) {
        List<UUID> idList = new ArrayList<>();
        List<DoiTraChiTiet> doiTraChiTietList = doiTraChiTietService.getDoiTraChiTietByDoiTraId(doitraId);
        for (DoiTraChiTiet doiTraChiTiet : doiTraChiTietList
        ) {
            idList.add(doiTraChiTiet.getHoaDonChiTiet().getId());

        }


        List<HoaDonChiTiet> hdctdt = doiTraChiTietService.getHoaDonChiTietByIdList(idList);
        List<DoiTraChiTiet> dtctlist = doiTraChiTietService.getDoiTraChiTietByIdList(idList);
        model.addAttribute("check", dtctlist);


        model.addAttribute("dtct", dtctlist);

        List<DoiTraChiTiet> loc = filterDoiTraChiTietByImeiNotNull(dtctlist);

        System.out.println(hdctdt.toString());
        System.out.println("lisst" + dtctlist);
        model.addAttribute("dtctlist", loc);

//        model.addAttribute("dtct",hdctdt);


        List<HoaDonChiTiet> hdct = doiTraService.getHoaDonChiTiet(id);

        model.addAttribute("doitraId", doitraId);
        model.addAttribute("hoadonId", hoadonId);

        model.addAttribute("hdctne", hdct);

        model.addAttribute("hangds", hangSanPhamService.findAll0());
        model.addAttribute("dulieu", doiTraService.findById(doitraId));
        System.out.println(doitraId + "id doi tra day ne hoho hi h ih");
        System.out.println("dữ liệu " + doiTraService.findById(doitraId).toString()
        );


        model.addAttribute("camds", cameraService.findAll0());
        model.addAttribute("mands", manHinhService.findAll0());
        model.addAttribute("mauds", mauSacService.findAll0());
        model.addAttribute("ramds", ramService.findAll0());
        model.addAttribute("romds", romService.findAll0());
        model.addAttribute("pinds", pinService.findAll0());
        model.addAttribute("dungds", dungLuongPinService.findAll0());
        model.addAttribute("chipds", chipService.findAll0());
        model.addAttribute("sands", sanPhamService.findAll0());
        model.addAttribute("listChiTietSanPham", chiTietSanPhamService.findAll0());
        model.addAttribute("contentPage", "../doi-tra/detail.jsp");
        return "home/layout";
    }

    @GetMapping("/detail-thanh-cong/{id}")
    public String detailthanhcong(@PathVariable("id") UUID id, Model model, @RequestParam("doitraId") UUID doitraId, @RequestParam("hoadonId") UUID hoadonId, @RequestParam("pageNum") Optional<Integer> pageNum,
                                  @RequestParam(name = "pageSize", required = false, defaultValue = "20") Integer pageSize) {
        List<UUID> idList = new ArrayList<>();
        List<DoiTraChiTiet> doiTraChiTietList = doiTraChiTietService.getDoiTraChiTietByDoiTraId(doitraId);
        for (DoiTraChiTiet doiTraChiTiet : doiTraChiTietList
        ) {
            idList.add(doiTraChiTiet.getHoaDonChiTiet().getId());

        }

//
//        List<HoaDonChiTiet> hdctdt=doiTraChiTietService.getHoaDonChiTietByIdList(idList);
        List<DoiTraChiTiet> dtctlist = doiTraChiTietService.getDoiTraChiTietByIdList(idList);
        model.addAttribute("listdtct", dtctlist);
//        model.addAttribute("check",dtctlist);
//
//
//        model.addAttribute("dtct",dtctlist);
//
//        List<DoiTraChiTiet> loc = filterDoiTraChiTietByImeiNotNull(dtctlist);
//
//        System.out.println(hdctdt.toString());
//        System.out.println("lisst"+dtctlist);
//        model.addAttribute("dtctlist",loc);

//        model.addAttribute("dtct",hdctdt);


        List<HoaDonChiTiet> hdct = doiTraService.getHoaDonChiTiet(id);

        model.addAttribute("doitraId", doitraId);
        model.addAttribute("hoadonId", hoadonId);

        model.addAttribute("hdctne", hdct);

        model.addAttribute("hangds", hangSanPhamService.findAll0());
        model.addAttribute("dulieu", doiTraService.findById(doitraId));

        System.out.println("dữ liệu " + doiTraService.findById(doitraId).toString()
        );


        model.addAttribute("camds", cameraService.findAll0());
        model.addAttribute("mands", manHinhService.findAll0());
        model.addAttribute("mauds", mauSacService.findAll0());
        model.addAttribute("ramds", ramService.findAll0());
        model.addAttribute("romds", romService.findAll0());
        model.addAttribute("pinds", pinService.findAll0());
        model.addAttribute("dungds", dungLuongPinService.findAll0());
        model.addAttribute("chipds", chipService.findAll0());
        model.addAttribute("sands", sanPhamService.findAll0());
        model.addAttribute("listChiTietSanPham", chiTietSanPhamService.findAll0());
        model.addAttribute("contentPage", "../doi-tra/detail-thanh-cong.jsp");
        return "home/layout";
    }

    @GetMapping("/hien-thi-san-pham")
    public String hienThiSanPham(Model model) {
        model.addAttribute("listHang", hangSanPhamService.findAll0());
        model.addAttribute("listMauSac", mauSacService.findAll0());
        model.addAttribute("listChip", chipService.findAll0());
        model.addAttribute("listRam", ramService.findAll0());
        model.addAttribute("listRom", romService.findAll0());
        model.addAttribute("dungLuongPin", dungLuongPinService.findAll0());
        model.addAttribute("listManHinh", manHinhService.findAll0());
        model.addAttribute("listCamera", cameraService.findAll0());
        model.addAttribute("listChiTietSanPham", chiTietSanPhamService.findAll0());
//        model.addAttribute("listNhanVien", nhanVienService.findAll());
        model.addAttribute("listKhachHang", khachHangService.findAll0());
        model.addAttribute("listDiaChi", diaChiService.findAll0());
        model.addAttribute("listHangKhachHang", hangKhachHangService.findAll0());
        model.addAttribute("contentPage", "../doi-tra/detail.jsp");
        return "home/layout";
    }


    @PostMapping("/add-doi-tra")
    public String addHoaDon(Model model, @RequestParam("hoadonId") UUID hoadonId) {
        // Xử lý dữ liệu từ hoadonId và tạo đổi trả mới
        DoiTra hd = new DoiTra();
        hd.setMa("DT" + String.valueOf(doiTraService.findAll().size() + 1));
        hd.setTinhTrang(0);
        hd.setNhanVien(nhanVienService.findById(SecurityUtil.getId().getId()));
        hd.setNgayDoiTra(Date.valueOf(LocalDate.now()));
        HoaDon hoaDon = hoaDonService.findById(hoadonId);
        hd.setHoaDon(hoaDon); // Sử dụng hoadonId ở đây
        hd.setKhachHang(hoaDon.getKhachHang());
        doiTraService.add(hd);
        System.out.println("id này" +
                hd.getId());
        model.addAttribute("doitraId", hd.getId());
        // Trả về dữ liệu nếu cần (không biết cụ thể gì bạn muốn trả về)
        return "redirect:/doi-tra/hien-thi/";
    }


    @GetMapping("/them-imei/{imeiId}/{doitraId}/{hdctId}")
    public String themImei(@PathVariable UUID imeiId, Model model, @PathVariable UUID hdctId, @PathVariable UUID doitraId) {
        DoiTra doiTra = doiTraService.findById(doitraId);
        DoiTraChiTiet doiTraChiTiet = doiTraChiTietService.findByHDCT(hdctId);
        IMEI imei = imeiService.findById(imeiId);
        doiTraChiTiet.setImei(imei);
        doiTraChiTiet.setTinhTrang(0);
        doiTraChiTietService.update(doiTraChiTiet.getId(), doiTraChiTiet);
        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        imeiService.updatImeiChoXuLy(date, imeiId);
        model.addAttribute("doitraId", doitraId);
        return "redirect:/doi-tra/detail/" + doiTra.getHoaDon().getId() + "?doitraId=" + doitraId + "&hoadonId=" + doiTra.getHoaDon().getId();

    }


    @ResponseBody
    @GetMapping("/search-imei")
    public List<IMEI> searchIMEI(Model model, @RequestParam("search-imei") String search,
                                 @ModelAttribute("HoaDon") HoaDon hoaDon, @ModelAttribute("modalAddKhachHang") KhachHang khachHang) {
        List<IMEI> listIMEI = imeiService.searchOn(search);
        System.out.println(listIMEI);
//        model.addAttribute("HoaDon", hoaDonnn);
        model.addAttribute("listImei", listIMEI);
        List<HoaDon> list = hoaDonService.find();
        model.addAttribute("listHoaDon", list);
        return listIMEI;
    }

    @GetMapping("/loc/{x1}/{x2}/{x3}/{x4}/{x5}/{x6}/{x7}/{x8}/{x9}/{x10}")
    public String locbanhang(
            Model model,
            @PathVariable("x1") String x1,
            @PathVariable("x2") String x2,
            @PathVariable("x3") String x3,
            @PathVariable("x4") String x4,
            @PathVariable("x5") String x5,
            @PathVariable("x6") String x6,
            @PathVariable("x7") String x7,
            @PathVariable("x8") String x8,
            @PathVariable("x9") String x9,
            @PathVariable("x10") String x10
    ) {
        model.addAttribute("banhangonline", doiTraService);
        model.addAttribute("listChiTietSanPham", doiTraService.locbanhang(x1, x2, x3, x4, x5, x6, x7, x8, x9, x10));
        return "/doi-tra/bang-loc";
    }

    @PostMapping("/update/{doitraId}")
    public String update(Model model, @ModelAttribute("dulieuxem") DoiTra dulieuxem,
                         @PathVariable UUID doitraId, @RequestParam UUID hdctId, HttpServletRequest request
    ) {
        HoaDonChiTiet hoaDonChiTiet = hoaDonChiTietService.findById(hdctId);
        DoiTra doiTra1 = doiTraService.findById(doitraId);
        doiTra1.setTinhTrang(2);
        System.out.println("id đổi trả nữa là " + doitraId);
        doiTraService.update(doitraId, doiTra1);
        return "redirect:/doi-tra/hien-thi";
    }
//    @GetMapping("/chinh-sach")
//    public String chinhsach(Model model){
//        model.addAttribute("contentPage", "../doi-tra/chinh-sach.jsp");
//        return "home/layout";
//    }

    @GetMapping("/delete-hdct/{doitraId}/{hdctxoaId}")
    public String deleteHDCT(Model model, @ModelAttribute("modalAddKhachHang") KhachHang khachHang, @PathVariable UUID doitraId, @PathVariable UUID hdctxoaId) {
        DoiTra doiTra = doiTraService.findById(doitraId);
        DoiTraChiTiet doiTraChiTiet = doiTraChiTietService.findByHDCT(hdctxoaId);

        if (doiTraChiTiet != null && doiTraChiTiet.getImei() != null) {
            IMEI imei = doiTraChiTiet.getImei();
            imei.setTinhTrang(0);
            imeiService.update(imei.getId(), imei);
        }

        doiTraChiTietService.delete(doiTraChiTiet.getId());
        return "redirect:/doi-tra/detail/" + doiTra.getHoaDon().getId() + "?doitraId=" + doitraId + "&hoadonId=" + doiTra.getHoaDon().getId();
    }

    @GetMapping("/them-dtct")
    public String updatethemhdct(Model model, @ModelAttribute("dulieuxem") DoiTraChiTiet dulieuxem,
                                 @RequestParam UUID doitraId, @RequestParam UUID hdctId, @RequestParam String lyDo,
                                 @RequestParam int hienTrang,
                                 @RequestParam int hinhThuc, HttpServletRequest request) {

        System.out.println("hdct id đây này ok" + hdctId);
        DoiTra doiTra = doiTraService.findById(doitraId);
        HoaDonChiTiet hoaDonChiTiet = hoaDonChiTietService.findById(hdctId);

        // Kiểm tra xem HoaDonChiTiet đã tồn tại trong DoiTraChiTiet chưa
        if (!doiTraChiTietService.existsByDoiTraAndHoaDonChiTiet(doiTra, hoaDonChiTiet)) {
            DoiTraChiTiet doiTraChiTiet = new DoiTraChiTiet();
            doiTraChiTiet.setTinhTrang(0);
            doiTraChiTiet.setHoaDonChiTiet(hoaDonChiTiet);
            doiTraChiTiet.setDoiTra(doiTra);
            doiTraChiTiet.setHienTrangSanPham(hienTrang);
            doiTraChiTiet.setHinhThucDoiTra(hinhThuc);
            doiTraChiTiet.setLyDo(lyDo);

            doiTraChiTietService.add(doiTraChiTiet);
        }

        return "redirect:/doi-tra/detail/" + doiTra.getHoaDon().getId() + "?doitraId=" + doitraId + "&hoadonId="
                + doiTra.getHoaDon().getId();
    }

    @PostMapping("/xac-nhan/{doitraId}")
    public String xacnhan(Model model, @ModelAttribute("dulieuxem") DoiTra dulieuxem,
                          @PathVariable UUID doitraId, HttpServletRequest request
    ) {
        DoiTra doiTra = doiTraService.findById(doitraId);
        List<DoiTraChiTiet> listCHiTietDoiTra = doiTraChiTietService.getDoiTraChiTietByDoiTraId(doitraId);
        for (DoiTraChiTiet dtct : listCHiTietDoiTra
        ) {
            if (dtct.getHienTrangSanPham() == 0) {

                IMEI imei = imeiService.findById(dtct.getHoaDonChiTiet().getImei().getId());
                imei.setTinhTrang(4);
                imeiService.update(dtct.getHoaDonChiTiet().getImei().getId(), imei);
                IMEI imei1 = imeiService.findById(dtct.getImei().getId());
                imei1.setTinhTrang(1);
                imeiService.update(dtct.getImei().getId(), imei1);
                dtct.setTinhTrang(2);
                doiTraChiTietService.update(dtct.getId(), dtct);
                System.out.println("imei là" + dtct.getHoaDonChiTiet().getImei().getTinhTrang());
            } else if (dtct.getHienTrangSanPham() == 1) {
                IMEI imei = imeiService.findById(dtct.getHoaDonChiTiet().getImei().getId());
                imei.setTinhTrang(0);
                imeiService.update(dtct.getHoaDonChiTiet().getImei().getId(), imei);
                IMEI imei1 = imeiService.findById(dtct.getImei().getId());
                imei1.setTinhTrang(1);
                imeiService.update(dtct.getImei().getId(), imei1);
                dtct.setTinhTrang(2);
                doiTraChiTietService.update(dtct.getId(), dtct);
            }
        }
        doiTra.setTinhTrang(2);
        doiTraService.update(doitraId, doiTra);
        return "redirect:/doi-tra/hien-thi";
    }

    @ResponseBody
    @GetMapping("/search-hoa-don")
    public List<HoaDon> searchHoaDon(@RequestParam("search-hoa-don") String search) {
        if (search.isEmpty()) {
            List<HoaDon> list = doiTraService.getAllHD();
            return list;
        } else {
            List<HoaDon> list = hoaDonService.searchDoiTra(search);
            return list;
        }
    }

    @PostMapping("/loc0")
    public String locDoiTra0(Model model,
                             @RequestParam(value = "nhanVien", required = false) UUID idNV,
                             @RequestParam(value = "khachHang", required = false) UUID idKH,
                             @RequestParam(value = "startDate", required = false) String startDate,
                             @RequestParam(value = "endDate", required = false) String endDate,
                             @RequestParam(value = "ngayTao0", required = false) String ngayTao0,
                             @RequestParam(value = "ngayTao1", required = false) String ngayTao1,
                             @ModelAttribute("nhanVien") NhanVien nhanVien,
                             @ModelAttribute("khachHang") KhachHang khachHang,
                             @ModelAttribute("doiTra") DoiTra doiTra) {

        if (startDate.isEmpty() && endDate.isEmpty() && ngayTao0.isEmpty() && ngayTao1.isEmpty()) {
            List<DoiTra> list = doiTraService.locDoiTraTrangThai0(idKH, idNV,
                    null, null, null, null
            );
            model.addAttribute(("list"), list);
            model.addAttribute("listKhachHang", khachHangService.findAll00());
            model.addAttribute("listNhanVien", nhanVienService.findAll());
            model.addAttribute("contentPage", "../doi-tra/hien-thi.jsp");
            return "home/layout";
        } else if (ngayTao0.isEmpty() && ngayTao1.isEmpty()) {
            List<DoiTra> list = doiTraService.locDoiTraTrangThai0(idKH, idNV,
                    Date.valueOf(startDate), Date.valueOf(endDate), null, null
            );
            model.addAttribute(("list"), list);
            model.addAttribute("listKhachHang", khachHangService.findAll00());
            model.addAttribute("listNhanVien", nhanVienService.findAll());
            model.addAttribute("contentPage", "../doi-tra/hien-thi.jsp");
            return "home/layout";
        } else if (endDate.isEmpty() && startDate.isEmpty()) {
            List<DoiTra> list = doiTraService.locDoiTraTrangThai0(idKH, idNV,
                    null, null, Date.valueOf(ngayTao0), Date.valueOf(ngayTao1)
            );
            model.addAttribute(("list"), list);
            model.addAttribute("listKhachHang", khachHangService.findAll00());
            model.addAttribute("listNhanVien", nhanVienService.findAll());
            model.addAttribute("contentPage", "../doi-tra/hien-thi.jsp");
            return "home/layout";
        } else {
            List<DoiTra> list = doiTraService.locDoiTraTrangThai0(idKH, idNV,
                    Date.valueOf(startDate), Date.valueOf(endDate), Date.valueOf(ngayTao0), Date.valueOf(ngayTao1)
            );
            model.addAttribute(("list"), list);
            model.addAttribute("listKhachHang", khachHangService.findAll00());
            model.addAttribute("listNhanVien", nhanVienService.findAll());
            model.addAttribute("contentPage", "../doi-tra/hien-thi.jsp");
            return "home/layout";
        }
    }

    @PostMapping("/loc1")
    public String locDoiTra1(Model model,
                             @RequestParam(value = "nhanVien", required = false) UUID idNV,
                             @RequestParam(value = "khachHang", required = false) UUID idKH,
                             @RequestParam(value = "startDate", required = false) String startDate,
                             @RequestParam(value = "endDate", required = false) String endDate,
                             @RequestParam(value = "ngayTao0", required = false) String ngayTao0,
                             @RequestParam(value = "ngayTao1", required = false) String ngayTao1,
                             @ModelAttribute("nhanVien") NhanVien nhanVien,
                             @ModelAttribute("khachHang") KhachHang khachHang,
                             @ModelAttribute("doiTra") DoiTra doiTra) {

        if (startDate.isEmpty() && endDate.isEmpty() && ngayTao0.isEmpty() && ngayTao1.isEmpty()) {
            List<DoiTra> list = doiTraService.locDoiTraTrangThai1(idKH, idNV,
                    null, null, null, null
            );
            model.addAttribute(("list"), list);
            model.addAttribute("listKhachHang", khachHangService.findAll00());
            model.addAttribute("listNhanVien", nhanVienService.findAll());
            model.addAttribute("contentPage", "../doi-tra/tu-choi-tra-hang.jsp");
            return "home/layout";
        } else if (ngayTao0.isEmpty() && ngayTao1.isEmpty()) {
            List<DoiTra> list = doiTraService.locDoiTraTrangThai1(idKH, idNV,
                    Date.valueOf(startDate), Date.valueOf(endDate), null, null
            );
            model.addAttribute(("list"), list);
            model.addAttribute("listKhachHang", khachHangService.findAll00());
            model.addAttribute("listNhanVien", nhanVienService.findAll());
            model.addAttribute("contentPage", "../doi-tra/tu-choi-tra-hang.jsp");
            return "home/layout";
        } else if (endDate.isEmpty() && startDate.isEmpty()) {
            List<DoiTra> list = doiTraService.locDoiTraTrangThai1(idKH, idNV,
                    null, null, Date.valueOf(ngayTao0), Date.valueOf(ngayTao1)
            );
            model.addAttribute(("list"), list);
            model.addAttribute("listKhachHang", khachHangService.findAll00());
            model.addAttribute("listNhanVien", nhanVienService.findAll());
            model.addAttribute("contentPage", "../doi-tra/tu-choi-tra-hang.jsp");
            return "home/layout";
        } else {
            List<DoiTra> list = doiTraService.locDoiTraTrangThai1(idKH, idNV,
                    Date.valueOf(startDate), Date.valueOf(endDate), Date.valueOf(ngayTao0), Date.valueOf(ngayTao1)
            );
            model.addAttribute(("list"), list);
            model.addAttribute("listKhachHang", khachHangService.findAll00());
            model.addAttribute("listNhanVien", nhanVienService.findAll());
            model.addAttribute("contentPage", "../doi-tra/tu-choi-tra-hang.jsp");
            return "home/layout";
        }
    }

    @PostMapping("/loc2")
    public String locDoiTra2(Model model,
                             @RequestParam(value = "nhanVien", required = false) UUID idNV,
                             @RequestParam(value = "khachHang", required = false) UUID idKH,
                             @RequestParam(value = "startDate", required = false) String startDate,
                             @RequestParam(value = "endDate", required = false) String endDate,
                             @RequestParam(value = "ngayTao0", required = false) String ngayTao0,
                             @RequestParam(value = "ngayTao1", required = false) String ngayTao1,
                             @ModelAttribute("nhanVien") NhanVien nhanVien,
                             @ModelAttribute("khachHang") KhachHang khachHang,
                             @ModelAttribute("doiTra") DoiTra doiTra) {

        if (startDate.isEmpty() && endDate.isEmpty() && ngayTao0.isEmpty() && ngayTao1.isEmpty()) {
            List<DoiTra> list = doiTraService.locDoiTraTrangThai2(idKH, idNV,
                    null, null, null, null
            );
            model.addAttribute(("list"), list);
            model.addAttribute("listKhachHang", khachHangService.findAll00());
            model.addAttribute("listNhanVien", nhanVienService.findAll());
            model.addAttribute("contentPage", "../doi-tra/doi-tra-thanh-cong.jsp");
            return "home/layout";
        } else if (ngayTao0.isEmpty() && ngayTao1.isEmpty()) {
            List<DoiTra> list = doiTraService.locDoiTraTrangThai2(idKH, idNV,
                    Date.valueOf(startDate), Date.valueOf(endDate), null, null
            );
            model.addAttribute(("list"), list);
            model.addAttribute("listKhachHang", khachHangService.findAll00());
            model.addAttribute("listNhanVien", nhanVienService.findAll());
            model.addAttribute("contentPage", "../doi-tra/doi-tra-thanh-cong.jsp");
            return "home/layout";
        } else if (endDate.isEmpty() && startDate.isEmpty()) {
            List<DoiTra> list = doiTraService.locDoiTraTrangThai2(idKH, idNV,
                    null, null, Date.valueOf(ngayTao0), Date.valueOf(ngayTao1)
            );
            model.addAttribute(("list"), list);
            model.addAttribute("listKhachHang", khachHangService.findAll00());
            model.addAttribute("listNhanVien", nhanVienService.findAll());
            model.addAttribute("contentPage", "../doi-tra/doi-tra-thanh-cong.jsp");
            return "home/layout";
        } else {
            List<DoiTra> list = doiTraService.locDoiTraTrangThai2(idKH, idNV,
                    Date.valueOf(startDate), Date.valueOf(endDate), Date.valueOf(ngayTao0), Date.valueOf(ngayTao1)
            );
            model.addAttribute(("list"), list);
            model.addAttribute("listKhachHang", khachHangService.findAll00());
            model.addAttribute("listNhanVien", nhanVienService.findAll());
            model.addAttribute("contentPage", "../doi-tra/doi-tra-thanh-cong.jsp");
            return "home/layout";
        }
    }

    @PostMapping("/search0")
    public String search0(Model model, @ModelAttribute("nhanVien") NhanVien nhanVien,
                          @ModelAttribute("khachHang") KhachHang khachHang,
                          @ModelAttribute("doiTra") DoiTra doiTra, @RequestParam("search") String search) {
        List<DoiTra> list = doiTraService.searchDoiTraTrangThai0(search);
        model.addAttribute("list", list);
        model.addAttribute("listKhachHang", khachHangService.findAll00());
        model.addAttribute("listNhanVien", nhanVienService.findAll());
        model.addAttribute("contentPage", "../doi-tra/hien-thi.jsp");
        return "home/layout";
    }

    @PostMapping("/search1")
    public String search1(Model model, @ModelAttribute("nhanVien") NhanVien nhanVien,
                          @ModelAttribute("khachHang") KhachHang khachHang,
                          @ModelAttribute("doiTra") DoiTra doiTra, @RequestParam("search") String search) {
        List<DoiTra> list = doiTraService.searchDoiTraTrangThai1(search);
        model.addAttribute("list", list);
        model.addAttribute("listKhachHang", khachHangService.findAll00());
        model.addAttribute("listNhanVien", nhanVienService.findAll());
        model.addAttribute("contentPage", "../doi-tra/tu-choi-tra-hang.jsp");
        return "home/layout";
    }

    @PostMapping("/search2")
    public String search2(Model model, @ModelAttribute("nhanVien") NhanVien nhanVien,
                          @ModelAttribute("khachHang") KhachHang khachHang,
                          @ModelAttribute("doiTra") DoiTra doiTra, @RequestParam("search") String search) {
        List<DoiTra> list = doiTraService.searchDoiTraTrangThai2(search);
        model.addAttribute("list", list);
        model.addAttribute("listKhachHang", khachHangService.findAll00());
        model.addAttribute("listNhanVien", nhanVienService.findAll());
        model.addAttribute("contentPage", "../doi-tra/doi-tra-thanh-cong.jsp");
        return "home/layout";
    }
}
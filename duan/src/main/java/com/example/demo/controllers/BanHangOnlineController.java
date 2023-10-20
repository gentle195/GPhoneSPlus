package com.example.demo.controllers;

import com.example.demo.models.*;
import com.example.demo.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Component
@Controller
public class BanHangOnlineController {
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
    private BanHangOnlineService banHangOnlineService;
    @Autowired
    private GioHangChiTietService gioHangChiTietService ;
    @Autowired
    private GioHangService gioHangService ;
    @Autowired
    private DataIntermediateService dataService;




    // Bắt đầu bán hàng
    public Integer kt(Integer so){
        if(so==Integer.valueOf(0)){
            return Integer.valueOf(1);
        }
        return so;
    }


    private String idkhachhang="1";

    @GetMapping("/ban-hang-online/hien-thi")
    public String hienThitrangchu(
            Model model
    ) {
        double tong=0;
        Integer lamchon=0;
        for (ChiTietSanPham ct:banHangOnlineService.ctspbanhang()) {
            if(banHangOnlineService.soluongcon(String.valueOf(ct.getId()))>0){
                tong=tong+1;
                lamchon=lamchon+1;
            }
        }

        double tb=tong/3;
        lamchon=lamchon/3;
        if(tb % 1 >0){
            lamchon=lamchon+1;
        }
        model.addAttribute("lamchon",lamchon);
        model.addAttribute("giamgia",banHangOnlineService);
        model.addAttribute("banhangonline",banHangOnlineService);
        model.addAttribute("listsp",banHangOnlineService.ctspbanhang());
        idkhachhang="1";
        model.addAttribute("idkhachhang",idkhachhang);
        return "ban-hang-online/trang-chu";
    }

    @GetMapping("/ban-hang-online/dang-nhap/hien-thi")
    public String hienThitrangchudn(
            Model model
    ) {
        double tong=0;
        Integer lamchon=0;
        for (ChiTietSanPham ct:banHangOnlineService.ctspbanhang()) {
            if(banHangOnlineService.soluongcon(String.valueOf(ct.getId()))>0){
                tong=tong+1;
                lamchon=lamchon+1;
            }
        }

        double tb=tong/3;
        lamchon=lamchon/3;
        if(tb % 1 >0){
            lamchon=lamchon+1;
        }
        model.addAttribute("lamchon",lamchon);
        model.addAttribute("giamgia",banHangOnlineService);
        model.addAttribute("banhangonline",banHangOnlineService);

      KhachHang khachHang=  dataService.getSharedData();
        System.out.println("id:"+khachHang.getId());
        idkhachhang=String.valueOf(khachHang.getId());
//        idkhachhang="f33013f5-993b-45d3-9806-dd74f2007522";
        model.addAttribute("khachhangdangnhap",khachHangService.findById(UUID.fromString(idkhachhang)));
        model.addAttribute("listsp",banHangOnlineService.ctspbanhang());
        model.addAttribute("idkhachhang",UUID.fromString(idkhachhang));
        return "ban-hang-online/trang-chu";
    }

    @GetMapping("/ban-hang-online/giao-dien-trang-chu")
    public String hienThitrangchu1(
            Model model
    ) {

        double tong=0;
        Integer lamchon=0;
        for (ChiTietSanPham ct:banHangOnlineService.ctspbanhang()) {
            if(banHangOnlineService.soluongcon(String.valueOf(ct.getId()))>0){
                tong=tong+1;
                lamchon=lamchon+1;
            }
        }

        double tb=tong/3;
        lamchon=lamchon/3;
        if(tb % 1 >0){
            lamchon=lamchon+1;
        }

        model.addAttribute("lamchon",lamchon);
        model.addAttribute("giamgia",banHangOnlineService);
        model.addAttribute("banhangonline",banHangOnlineService);
        model.addAttribute("listsp",banHangOnlineService.ctspbanhang());
        return "ban-hang-online/giao-dien-trang-chu";


    }

    @GetMapping("/ban-hang-online/dien-thoai-thong-minh")
    public String hienThitrangchudienthoai(
            Model model
    ) {

        model.addAttribute("hangds",hangSanPhamService.findAll0());
        model.addAttribute("camds",cameraService.findAll0());
        model.addAttribute("mands",manHinhService.findAll0());
        model.addAttribute("mauds",mauSacService.findAll0());
        model.addAttribute("ramds",ramService.findAll0());
        model.addAttribute("romds",romService.findAll0());
        model.addAttribute("pinds",pinService.findAll0());
        model.addAttribute("dungds",dungLuongPinService.findAll0());
        model.addAttribute("chipds",chipService.findAll0());
        model.addAttribute("sands",sanPhamService.findAll0());


        double tong=0;
        Integer lamchon=0;
        for (ChiTietSanPham ct:banHangOnlineService.ctspbanhang()) {
            if(banHangOnlineService.soluongcon(String.valueOf(ct.getId()))>0){
                tong=tong+1;
                lamchon=lamchon+1;
            }
        }

        double tb=tong/8;
      lamchon=lamchon/8;
        if(tb % 1 >0){
            lamchon=lamchon+1;
        }

        model.addAttribute("lamchon1",lamchon);
        model.addAttribute("giamgia",banHangOnlineService);
        model.addAttribute("banhangonline",banHangOnlineService);
        model.addAttribute("listsp",banHangOnlineService.ctspbanhang());


        return "ban-hang-online/trang-loc-sanpham";


    }

    @GetMapping("/ban-hang-online/loc-ban-hang/{x1}/{x2}/{x3}/{x4}/{x5}/{x6}/{x7}/{x8}/{x9}/{x10}")
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


        double tong=0;
        Integer lamchon=0;
        for (ChiTietSanPham ct:banHangOnlineService.locbanhang(x1,x2,x3,x4,x5,x6,x7,x8,x9,x10)) {
            if(banHangOnlineService.soluongcon(String.valueOf(ct.getId()))>0){
                tong=tong+1;
                lamchon=lamchon+1;
            }
        }

        double tb=tong/8;
      lamchon=lamchon/8;
        if(tb % 1 >0){
            lamchon=lamchon+1;
        }
        model.addAttribute("lamchon1",lamchon);
        model.addAttribute("giamgia",banHangOnlineService);
        model.addAttribute("banhangonline",banHangOnlineService);
        model.addAttribute("listsp",banHangOnlineService.locbanhang(x1,x2,x3,x4,x5,x6,x7,x8,x9,x10));
        return "ban-hang-online/giao-dien-loc";
    }

    @GetMapping("/ban-hang-online/chi-tiet-san-pham/{idctsp}")
    public String giohang(
            Model model,
            @PathVariable("idctsp") UUID idctsp

    ) {

        model.addAttribute("ktcokhong",1);
        model.addAttribute("listsp",banHangOnlineService.ctspbanhang());
        model.addAttribute("banhangonline",banHangOnlineService);
        model.addAttribute("motctsp",chiTietSanPhamService.findById(idctsp));
        if(idkhachhang=="1"){
            model.addAttribute("idkhachhang",idkhachhang);
        }else {
            model.addAttribute("idkhachhang", UUID.fromString(idkhachhang));
        }
        return "ban-hang-online/trang-chi-tiet-san-pham";


    }
    @GetMapping("/ban-hang-online/thanh-loc-ctsp/{idctsp}")
    public String giohang1(
            Model model,
            @PathVariable("idctsp") UUID idctsp

    ) {

        model.addAttribute("listsp",banHangOnlineService.ctspbanhang());
        model.addAttribute("banhangonline",banHangOnlineService);
        model.addAttribute("motctsp",chiTietSanPhamService.findById(idctsp));
        return "ban-hang-online/trang-thanh-loc-ctsp";


    }




    @GetMapping("/ban-hang-online/loc-chi-tiet-san-pham/{x1}/{x2}/{x3}/{x4}/{x5}")
    public String locbanhangctsp(
            Model model,
            @PathVariable("x1") String x1,
            @PathVariable("x2") String x2,
            @PathVariable("x3") String x3,
            @PathVariable("x4") String x4,
            @PathVariable("x5") String x5

    ) {




        List<ChiTietSanPham> listctsp=new ArrayList<>();
        listctsp=banHangOnlineService.locbanhang("null", "null", "null", x1, x3, x2, "null", "null", x4, x5);

        ChiTietSanPham motctsp=new ChiTietSanPham();
        int kt=0;
        for (ChiTietSanPham ht:listctsp) {
           if( banHangOnlineService.soluongcon(String.valueOf(ht.getId()))>0){
               kt=1;
               motctsp=ht;
               break;
           }
        }
        System.out.println("taco-"+listctsp.size());
        model.addAttribute("tensp",x5);
        model.addAttribute("ktcokhong",kt);
        model.addAttribute("motctsp",motctsp);
        model.addAttribute("listsp",banHangOnlineService.ctspbanhang());
        model.addAttribute("banhangonline",banHangOnlineService);
        if(idkhachhang=="1"){
            model.addAttribute("idkhachhang",idkhachhang);
        }else {
            model.addAttribute("idkhachhang", UUID.fromString(idkhachhang));
        }
        return "ban-hang-online/trang-chi-tiet-san-pham";
    }

    @GetMapping("/ban-hang-online/trang-chi-tiet-san-pham/thanh-toan/{idkh}/{idctsp}/{solg}")
    public String nutthanhtoanctsp(
            Model model,
            @PathVariable("idkh") String idkh,
            @PathVariable("idctsp") UUID idctsp,
            @PathVariable("solg") Integer soluong
    ) {

        if(banHangOnlineService.ListghctTheoIdghvsIdctsp(banHangOnlineService.ListghTheoidkh(idkh).get(0).getId(),idctsp).size()>0){
             GioHangChiTiet ghctud=banHangOnlineService.ListghctTheoIdghvsIdctsp(banHangOnlineService.ListghTheoidkh(idkh).get(0).getId(),idctsp).get(0);
             Integer slud=  ghctud.getSoLuong()+soluong;
             ghctud.setSoLuong(slud);
           gioHangChiTietService.add(ghctud);
        }else {
        GioHangChiTiet ghct=new GioHangChiTiet();
        ghct.setGioHang(banHangOnlineService.ListghTheoidkh(idkh).get(0));
        ghct.setChiTietSanPham(chiTietSanPhamService.findById(idctsp));
        ghct.setSoLuong(soluong);
        ghct.setDonGia(chiTietSanPhamService.findById(idctsp).getGiaBan());
            BigDecimal giaban = chiTietSanPhamService.findById(idctsp).getGiaBan();
            Integer giaban1=Integer.valueOf(String.valueOf(giaban));
            Integer phantramgiam =banHangOnlineService.tonggiamgia(String.valueOf(idctsp));
            Integer dgkg =giaban1- giaban1/100*phantramgiam;
            BigDecimal dgkg1=BigDecimal.valueOf(Long.valueOf(String.valueOf(dgkg)));
            ghct.setDonGiaKhiGiam(dgkg1);
        gioHangChiTietService.add(ghct);
        }
        model.addAttribute("listghct",banHangOnlineService.ListghctTheoidgh(banHangOnlineService.ListghTheoidkh(idkh).get(0).getId()));
        model.addAttribute("tttong",1);
        model.addAttribute("banhangonline",banHangOnlineService);
        return "ban-hang-online/trang-gio-hang-chi-tiet";
    }


    @GetMapping("/ban-hang-online/trang-gio-hang-chi-tiet/so-luong/{idghct}/{solg}")
    public String updateslghct(
            Model model,
            @PathVariable("idghct") UUID idghct,
            @PathVariable("solg") Integer soluong
    ) {


        GioHangChiTiet ghct = gioHangChiTietService.findById(idghct);
        ghct.setSoLuong(soluong);
        gioHangChiTietService.add(ghct);
        model.addAttribute("listghct", banHangOnlineService.ListghctTheoidgh(banHangOnlineService.ListghTheoidkh(String.valueOf(ghct.getGioHang().getKhachHang().getId())).get(0).getId()));
        model.addAttribute("banhangonline", banHangOnlineService);
        model.addAttribute("tttong",1);
        return "ban-hang-online/trang-gio-hang-chi-tiet";
    }

    @GetMapping("/ban-hang-online/trang-gio-hang-chi-tiet/chon-san-pham/{idghct}/{trangthai}/{idgh}")
    public String chonspghct(
            Model model,

            @PathVariable("idghct") String idghct,
            @PathVariable("trangthai") String trangthai,
            @PathVariable("idgh") UUID idgh
    ) {
        if(idghct.equals("full")){
            if(trangthai.equals("0")){
            banHangOnlineService.trangthaighct(0,idgh);
                model.addAttribute("tttong",0);
            }else {
                banHangOnlineService.trangthaighct(1,idgh);
                model.addAttribute("tttong",1);
            }
        }else {
            GioHangChiTiet ghct=gioHangChiTietService.findById(UUID.fromString(idghct));
            if(trangthai.equals("0")){
                ghct.setTinhTrang(0);
                gioHangChiTietService.add(ghct);
            }else {
                ghct.setTinhTrang(1);
                gioHangChiTietService.add(ghct);
            }
        }

        model.addAttribute("listghct", banHangOnlineService.ListghctTheoidgh(idgh));
        model.addAttribute("banhangonline", banHangOnlineService);
        return "ban-hang-online/trang-gio-hang-chi-tiet";
    }

    @GetMapping("/ban-hang-online/trang-gio-hang-chi-tiet/xoa-mot-ghct/{idghct}/{idgh}")
    public String xoamotghct(
            Model model,
            @PathVariable("idghct") UUID idghct,
            @PathVariable("idgh") UUID idgh
    ) {
      gioHangChiTietService.delete(idghct);
        model.addAttribute("tttong",1);
        model.addAttribute("listghct", banHangOnlineService.ListghctTheoidgh(idgh));
        model.addAttribute("banhangonline", banHangOnlineService);
        return "ban-hang-online/trang-gio-hang-chi-tiet";
    }

    @GetMapping("/ban-hang-online/san-pham-duoc-chon-thanh-toan/nut-thanh-toan/{idgh}")
    public String nutthanhtoantrangghct(
            Model model,
            @PathVariable("idgh") UUID idgh
    ) {

        model.addAttribute("listghct", banHangOnlineService.ListghTheoidghvsTT1(idgh));
        model.addAttribute("banhangonline", banHangOnlineService);
        return "ban-hang-online/trang-san-pham-duoc-chon-thanh-toan";
    }

    @GetMapping("/ban-hang-online/san-pham-duoc-chon-thanh-toan/nut-them-dia-chi/{diachi}/{quan}/{huyen}/{thanhpho}/{idgh}")
    public String nutthemdiachi(
            Model model,
            @PathVariable("diachi") String diachi1,@PathVariable("quan") String quan,
            @PathVariable("huyen") String huyen,@PathVariable("thanhpho") String thanhpho,
            @PathVariable("idgh") UUID idgh
    ) {
        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        DiaChi diaChi=new DiaChi();
        Integer sl = diaChiService.findAll().size();
        String mhd="";
        if(sl<10){
            mhd = "MDC0" + sl;
        }else {
            mhd = "MDC" + sl;
        }
        diaChi.setMa(mhd);
        diaChi.setNgayTao(date);
        diaChi.setNgayCapNhat(date);
        diaChi.setTinhTrang(0);
       diaChi.setDiaChi(diachi1);
        diaChi.setQuan(quan);
        diaChi.setHuyen(huyen);
        diaChi.setThanhPho(thanhpho);
       KhachHang kh=khachHangService.findById(gioHangService.findById(idgh).getKhachHang().getId());
       diaChi.setKhachHang(kh);
        diaChiService.add(diaChi);

        return  "redirect:/ban-hang-online/san-pham-duoc-chon-thanh-toan/nut-thanh-toan/"+idgh;
    }


    @GetMapping("/ban-hang-online/san-pham-duoc-chon-thanh-toan/nut-dat-hang/{idgh}/{tongtien}/{iddc}")
    public String nutdathang(
            Model model,
            @PathVariable("idgh") UUID idgh,
            @PathVariable("tongtien") BigDecimal tongtien,
            @PathVariable("iddc") UUID iddc
    ) {
//        them hd
        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        HoaDon hd=new HoaDon();
        Integer sl = hoaDonService.findAll().size();
        String mhd="";
        if(sl<10){
            mhd = "MHD0" + sl;
        }else {
            mhd = "MHD" + sl;
        }
        hd.setMa(mhd);
        hd.setSdt(gioHangService.findById(idgh).getKhachHang().getSdt());
        hd.setTongTien(tongtien);
        hd.setNgayTao(date);
        hd.setNgayCapNhat(date);
        hd.setTinhTrang(3);
        hd.setLoai(1);
        KhachHang kh=khachHangService.findById(gioHangService.findById(idgh).getKhachHang().getId());
        hd.setKhachHang(kh);
        DiaChi dc= diaChiService.findById(iddc);
        hd.setDiaChi(dc);
        hoaDonService.add(hd);
//    them hdct
        List<GioHangChiTiet> listghct=banHangOnlineService.ListghTheoidghvsTT1(idgh);
            for (int a=0;a<listghct.size();a=a+1){
                for (int b=0;b<listghct.get(a).getSoLuong();b=b+1){
                    HoaDonChiTiet hdct=new HoaDonChiTiet();
                    hdct.setSoLuong(1);
                    hdct.setTinhTrang(0);
                    hdct.setDonGia(listghct.get(a).getDonGiaKhiGiam());
                    HoaDon hd1=banHangOnlineService.timhdtheomahd(mhd);
                    hdct.setHoaDon(hd1);
                    List<IMEI> listimei=banHangOnlineService.timimeitheoidctspVSttO(listghct.get(a).getChiTietSanPham().getId());

                    hdct.setImei(listimei.get(b));
                    hoaDonChiTietService.add(hdct);
// cập nhật trạng thái imei

                }
            }
//xoa ghct TT=0 theo idgh
        banHangOnlineService.xoaghcttheoIDGHvsTTO(idgh);
//
        model.addAttribute("listghct",banHangOnlineService.ListghctTheoidgh(banHangOnlineService.ListghTheoidkh(String.valueOf(gioHangService.findById(idgh).getKhachHang().getId())).get(0).getId()));
        model.addAttribute("tttong",1);
        model.addAttribute("banhangonline",banHangOnlineService);
        return "ban-hang-online/trang-gio-hang-chi-tiet";
    }




//@Scheduled(cron = "0 35 18 30 9 *")
//public void  inlinhtinh(){
//////         0 giây.
//////         35 phút.
//////         18 giờ.
//////         30 ngày (ngày 5).
//////         9 tháng (tháng 5).
// //          *  ngày cho mặc định
//    System.out.println("Chạy vào ngày 30/9/2023 lúc 18:35:00");
//}


//    @Scheduled(fixedRate = 1)
//    void pk(){
//        System.out.println("-------");
//    };



}

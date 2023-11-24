package com.example.demo.config;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.*;


import com.example.demo.models.*;
import com.example.demo.repositories.KhachHangRepository;
import com.example.demo.services.*;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@Controller
public class PaymentController {


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
    @Autowired
    private KhachHangRepository khachHangRepository;

    //    String idhoadon="oo";
    Long tienthanhtoan=Long.valueOf(0);
    UUID iddc=null;
    String sdt="";
    UUID idgh=null;
    String nguoinhan="";
    @GetMapping("/pay/{idgh}/{tienthanhtoan}/{iddc}/{sdt}/{nguoinhan}")
    public  String getPay(Model model,

                          @PathVariable("idgh") UUID idgh1,
                          @PathVariable("tienthanhtoan") Long tienthanhtoan1,
                          @PathVariable("iddc") UUID iddc1,
                          @PathVariable("sdt") String sdt1,
                          @PathVariable("nguoinhan") String nguoinhan1
//                          @PathVariable("idhd") UUID idhd

    ) throws UnsupportedEncodingException {
        idgh=idgh1;
        tienthanhtoan=tienthanhtoan1;
        iddc=iddc1;
        sdt=sdt1;
        nguoinhan=nguoinhan1;
//        idhoadon=String.valueOf(idhd);
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String orderType = "other";
        long amount = tienthanhtoan*100;
        String bankCode = "NCB";

        String vnp_TxnRef = Config.getRandomNumber(8);
        String vnp_IpAddr = "127.0.0.1";

        String vnp_TmnCode = Config.vnp_TmnCode;

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");

        vnp_Params.put("vnp_BankCode", bankCode);
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
        vnp_Params.put("vnp_OrderType", orderType);

        vnp_Params.put("vnp_Locale", "vn");
//        vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl+"?contractId="+contractId);
        vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl+"?contractId=");
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }

        String queryUrl = query.toString();
        String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;

        return "redirect:"+paymentUrl;

    }


    @GetMapping("ketquathanhtoan")
    public String paymentCallback(
            Model model,
            @RequestParam Map<String, String> queryParams,HttpServletResponse response) throws IOException {
        String vnp_ResponseCode = queryParams.get("vnp_ResponseCode");
        String contractId = queryParams.get("contractId");
        String registerServiceId = queryParams.get("registerServiceId");
        System.out.println("vnp_ResponseCode----"+vnp_ResponseCode);
        System.out.println("contractId----"+contractId);
        System.out.println("registerServiceId----"+registerServiceId);
        System.out.println("madonhang: "+queryParams.get("vnp_TxnRef"));

        // giao dien

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

        UUID idkh=gioHangService.findById(idgh).getKhachHang().getId();
        model.addAttribute("khachhangdangnhap",khachHangService.findById(idkh));
        model.addAttribute("listsp",banHangOnlineService.ctspbanhang());
        model.addAttribute("idkhachhang",idkh);
        model.addAttribute("kh",khachHangService.findById(idkh));
        model.addAttribute("hkh", hangKhachHangService.getALL0());
//        giohan
        model.addAttribute("listghct",banHangOnlineService.ListghctTheoidgh(idgh));
        model.addAttribute("tttong",1);

//        het giao dien
        // that bai: 24,rỗng, null
        // thành công:00,rỗng,null
        //hết thời gian :15,rỗng,null

        if ("00".equals(vnp_ResponseCode)) {

            // Giao dịch thành công
            // Thực hiện các xử lý cần thiết, ví dụ: cập nhật CSDL
//hoadon
            long millis = System.currentTimeMillis();
            Date date = new Date(millis);
            HoaDon hd = new HoaDon();
            Integer sl = hoaDonService.findAll().size();
            String mhd = "";
            if (sl < 10) {
                mhd = "MHD0" + sl;
            } else {
                mhd = "MHD" + sl;
            }
            hd.setMa(mhd);
//        hd.setSdt(gioHangService.findById(idgh).getKhachHang().getSdt());
            hd.setSdt(sdt);
            hd.setMaGiaoDich(queryParams.get("vnp_TxnRef"));
            hd.setTongTien(BigDecimal.valueOf(tienthanhtoan));
            hd.setNgayTao(date);
            hd.setNguoiNhan(nguoinhan);
            hd.setNgayCapNhat(date);
            hd.setTinhTrang(0);
            hd.setLoai(1);
            hd.setHinhThucThanhToan(2);
            hd.setTinhTrangGiaoHang(0);
            KhachHang kh = khachHangService.findById(gioHangService.findById(idgh).getKhachHang().getId());
            hd.setKhachHang(kh);
            DiaChi dc = diaChiService.findById(iddc);
            hd.setDiaChi(dc);
            hoaDonService.add(hd);
//    them hdct
            List<GioHangChiTiet> listghct = banHangOnlineService.ListghTheoidghvsTT1(idgh);
            for (int a = 0; a < listghct.size(); a = a + 1) {
                for (int b = 0; b < listghct.get(a).getSoLuong(); b = b + 1) {
                    HoaDonChiTiet hdct = new HoaDonChiTiet();
                    hdct.setSoLuong(1);
                    hdct.setTinhTrang(0);
                    hdct.setDonGia(listghct.get(a).getDonGiaKhiGiam());
                    HoaDon hd1 = banHangOnlineService.timhdtheomahd(mhd);
                    hdct.setHoaDon(hd1);
                    List<IMEI> listimei = banHangOnlineService.timimeitheoidctspVSttO(listghct.get(a).getChiTietSanPham().getId());
                    hdct.setImei(listimei.get(0));
                    hoaDonChiTietService.add(hdct);
// cập nhật trạng thái imei
                    IMEI imei = listimei.get(0);
                    imei.setTinhTrang(3);
                    imei.setNgayCapNhat(date);
                    imeiService.add(imei);
                }
            }
//xoa ghct TT=0 theo idgh
            banHangOnlineService.xoaghcttheoIDGHvsTTO(idgh);
            //cập nhật hóa đơn; thanh toán khi thanh toán online
            HoaDon hd1=banHangOnlineService.timhdtheomahd(mhd);
            hd1.setNgayThanhToan(date);
            hd1.setNgayCapNhat(date);
            hd1.setTinhTrang(2);
            hd1.setLoai(1);
            hd1.setHinhThucThanhToan(1);
            hd1.setHinhThucThanhToan(1);
            hd1.setTinhTrangGiaoHang(0);
            hoaDonService.add(hd1);
//hoadonchitiet
            List<HoaDonChiTiet> hdct=banHangOnlineService.timhoadonchitiettheoidhd(hd1.getId());
            for (HoaDonChiTiet hdct1:hdct
            ) {
                hdct1.setTinhTrang(1);
                hoaDonChiTietService.add(hdct1);
            }
//imei
            List<HoaDonChiTiet> hdctchoimei=banHangOnlineService.timhoadonchitiettheoidhd(hd1.getId());

            for (HoaDonChiTiet hdct2:hdctchoimei
            ) {
                IMEI imei1=hdct2.getImei();
                imei1.setTinhTrang(1);
                imeiService.add(imei1);
            }


            model.addAttribute("ketquathanhtoan", 1);
            return "ban-hang-online/ket_qua_thanh_toan";
        } else {
            // Giao dịch thất bại
            // Thực hiện các xử lý cần thiết, ví dụ: không cập nhật CSDL\

            model.addAttribute("ketquathanhtoan", 0);
            return "ban-hang-online/ket_qua_thanh_toan";

        }





    }




}

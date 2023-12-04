package com.example.demo.controllers;

import com.example.demo.models.ChiTietSanPham;
import com.example.demo.models.GioHangChiTiet;
import com.example.demo.models.KhuyenMai;
import com.example.demo.repositories.KhuyenMaiRepository;
import com.example.demo.services.BanHangOnlineService;
import com.example.demo.services.ChiTietSanPhamService;
import com.example.demo.services.GioHangChiTietService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Optional;
import java.util.UUID;

@Component
@Controller
public class KhuyenMaiController {
    @Autowired
    private GioHangChiTietService gioHangChiTietService;
    @Autowired
    private ChiTietSanPhamService chiTietSanPhamService;
    @Autowired
    private KhuyenMaiRepository khuyenMaiRepository;
    @Autowired
    private BanHangOnlineService banHangOnlineService;
    @Scheduled(fixedRate = 1000)
    public void soCTSPbangsoIMEI(){
        for (ChiTietSanPham km:chiTietSanPhamService.findAll()) {
            km.setSoLuong(banHangOnlineService.soluongcon(String.valueOf(km.getId())));
            chiTietSanPhamService.add(km);
        }
        khuyenMaiRepository.xoalienketKM1();
    };
    @Scheduled(fixedRate = 1000)
    public void kiemtrangayhientaiVSkhoangtimegiamgia(){
        for (KhuyenMai km:khuyenMaiRepository.findAll()) {
            String batdau = km.getNgayBatDau();
            String ketthuc = km.getNgayKetThuc();

// Chuyển đổi chuỗi abc thành đối tượng LocalDateTime
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
            LocalDateTime batdauDateTime = LocalDateTime.parse(batdau, formatter);
            LocalDateTime ketthucDateTime = LocalDateTime.parse(ketthuc, formatter);

// Lấy thời gian hiện tại và định dạng nó
            LocalDateTime currentDateTime = LocalDateTime.now();
            String formattedDateTime = currentDateTime.format(formatter);


            // Kiểm tra xem currentDateTime có nằm trong khoảng [batdauDateTime, ketthucDateTime] không
            if (currentDateTime.isAfter(batdauDateTime) && currentDateTime.isBefore(ketthucDateTime)) {
                km.setTinhTrang(0);
                khuyenMaiRepository.save(km);
            } else  if (currentDateTime.isBefore(batdauDateTime)) {
                km.setTinhTrang(2); // hoặc làm gì đó tương ứng với trường hợp này
                khuyenMaiRepository.save(km);
            }
            else {
                km.setTinhTrang(1);
                khuyenMaiRepository.save(km);
            }
        }
        khuyenMaiRepository.xoalienketKM1();
    };

    @Scheduled(fixedRate = 1000)
    public    void loadtiengiamghct(){
        for (GioHangChiTiet ghct : gioHangChiTietService.findAll()) {

            ChiTietSanPham ctsp = chiTietSanPhamService.findById(ghct.getChiTietSanPham().getId());
            UUID idkm=null;
            try {
                idkm=ctsp.getKhuyenMai().getId();
            }catch (Exception e){
                idkm=null;
            }
            if (idkm == null) {
                ghct.setDonGiaKhiGiam(ctsp.getGiaBan());
                gioHangChiTietService.add(ghct);
            } else {
                KhuyenMai km=khuyenMaiRepository.findById(idkm).get();
                if (km.getTinhTrang() == 0) {
                    Long giagoc = Long.valueOf(String.valueOf(ctsp.getGiaBan()));
                    Long phamtramgiam = Long.valueOf(String.valueOf(km.getSoTienGiam()));
                    ghct.setDonGiaKhiGiam(BigDecimal.valueOf(giagoc - giagoc / 100 * phamtramgiam));
                    gioHangChiTietService.add(ghct);
                } else {
                    ghct.setDonGiaKhiGiam(ctsp.getGiaBan());
                    gioHangChiTietService.add(ghct);
                }
            }
        }
    };



    public String dinhangCHUOIsangJSP(String ngaycan) {
        // Input date and time string
//        String inputDateTime = "29-11-2023 17:09:00";
        String inputDateTime =ngaycan;

        // Define the input format
        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");

        // Parse the input string
        LocalDateTime dateTime = LocalDateTime.parse(inputDateTime, inputFormatter);

        // Define the output format
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");

        // Format the LocalDateTime to the desired output format
        return  dateTime.format(outputFormatter);

    }

    public Integer kt(Integer so){
        if(so==Integer.valueOf(0)){
            return Integer.valueOf(1);
        }
        return so;
    }
    public String dinhdangngaytujsp( String inputString) {


        // Tạo đối tượng LocalDateTime từ chuỗi
        LocalDateTime dateTime = LocalDateTime.parse(inputString, DateTimeFormatter.ISO_LOCAL_DATE_TIME);

        // Định dạng lại theo định dạng mong muốn
        return dateTime.format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss"));


    }


    public boolean isNgayKetThucAfterNgayBatDau(String ngayBatDau,String ngayKetThuc) {
        // Tạo đối tượng LocalDateTime từ chuỗi
        LocalDateTime ngayBT = LocalDateTime.parse(ngayBatDau, DateTimeFormatter.ISO_LOCAL_DATE_TIME);
        LocalDateTime ngayKT = LocalDateTime.parse(ngayKetThuc, DateTimeFormatter.ISO_LOCAL_DATE_TIME);

        // Định dạng lại theo định dạng mong muốn
        String ngayBT1=ngayBT.format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss"));
        String ngayKT1=ngayKT.format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss"));


        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");

        // Chuyển đổi chuỗi ngayBatDau và ngayKetThuc thành đối tượng LocalDateTime
        LocalDateTime batDauDateTime = LocalDateTime.parse(ngayBT1, formatter);
        LocalDateTime ketThucDateTime = LocalDateTime.parse(ngayKT1, formatter);

        // Kiểm tra xem ngayKetThuc có lớn hơn ngayBatDau không
        return ketThucDateTime.isAfter(batDauDateTime);
    }

    public boolean isNgayKetThucAfterNgayBatDauupdate(String ngayBatDau,String ngayKetThuc) {


        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");

        // Chuyển đổi chuỗi ngayBatDau và ngayKetThuc thành đối tượng LocalDateTime
        LocalDateTime batDauDateTime = LocalDateTime.parse(ngayBatDau, formatter);
        LocalDateTime ketThucDateTime = LocalDateTime.parse(ngayKetThuc, formatter);

        // Kiểm tra xem ngayKetThuc có lớn hơn ngayBatDau không
        return ketThucDateTime.isAfter(batDauDateTime);
    }
    public boolean isNgayKetThucAfterNgayHienTai(String ngayKetThuc) {
        // Tạo đối tượng LocalDateTime từ chuỗi

        LocalDateTime ngayKT = LocalDateTime.parse(ngayKetThuc, DateTimeFormatter.ISO_LOCAL_DATE_TIME);

        // Định dạng lại theo định dạng mong muốn
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        LocalDateTime currentDateTime = LocalDateTime.now();
        String ngayHT1 = currentDateTime.format(formatter);
        String ngayKT1=ngayKT.format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss"));




        // Chuyển đổi chuỗi ngayBatDau và ngayKetThuc thành đối tượng LocalDateTime
        LocalDateTime hienTaiDateTime = LocalDateTime.parse(ngayHT1, formatter);
        LocalDateTime ketThucDateTime = LocalDateTime.parse(ngayKT1, formatter);

        // Kiểm tra xem ngayKetThuc có lớn hơn ngayBatDau không
        return ketThucDateTime.isAfter(hienTaiDateTime);
    }

    public boolean isNgayKetThucAfterNgayHienTaiupdate(String ngayKetThuc) {
        // Tạo đối tượng LocalDateTime từ chuỗi


        // Định dạng lại theo định dạng mong muốn
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        LocalDateTime currentDateTime = LocalDateTime.now();
        String ngayHT1 = currentDateTime.format(formatter);




        // Chuyển đổi chuỗi ngayBatDau và ngayKetThuc thành đối tượng LocalDateTime
        LocalDateTime hienTaiDateTime = LocalDateTime.parse(ngayHT1, formatter);
        LocalDateTime ketThucDateTime = LocalDateTime.parse(ngayKetThuc, formatter);

        // Kiểm tra xem ngayKetThuc có lớn hơn ngayBatDau không
        return ketThucDateTime.isAfter(hienTaiDateTime);
    }

    @GetMapping("/khuyen-mai/hien-thi")
    public String hienThi(
            Model model,

            @ModelAttribute("km") KhuyenMai khuyenMai,
            @ModelAttribute("kmupdate") KhuyenMai khuyenMaiupdate,
            @RequestParam("num") Optional<Integer> num,
            @RequestParam(name = "size", defaultValue = "5", required = false) Integer size
//            @ModelAttribute("khmodal") KhachHang khachHang1
    ) {
        model.addAttribute("khuyenMaiRepository",khuyenMaiRepository);

        Sort sort = Sort.by("ma").descending();
        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
        Page<KhuyenMai> list = khuyenMaiRepository.fillalllPageable(pageable);
        model.addAttribute("dulieu", list.getContent());
        model.addAttribute("total", kt(list.getTotalPages()));
        model.addAttribute("contentPage","../khuyen-mai/khuyen-mai.jsp");
        return "home/layout";
    }

//    @GetMapping("/khuyen-mai/hien-thi1")
//    public String hienThi11(
//            Model model
//
//
//    ) {
//
//        model.addAttribute("contentPage","../khuyen-mai/vi-du.jsp");
//        return "khuyen-mai/vi-du";
//    }



    @PostMapping("/khuyen-mai/add")
    public String updateadd(Model model,
//
//
                            @ModelAttribute("km") @Valid KhuyenMai khuyenMai,
                            BindingResult bindingResult,
                            @RequestParam("num") Optional<Integer> num,
                            @RequestParam(name = "size", defaultValue = "5", required = false) Integer size,
                            @ModelAttribute("kmupdate") KhuyenMai khuyenMaiupdate
//
    ) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        LocalDateTime currentDateTime = LocalDateTime.now();
        String formattedDateTime = currentDateTime.format(formatter);
        if (bindingResult.hasErrors()) {
            model.addAttribute("khuyenMaiRepository",khuyenMaiRepository);
            Sort sort = Sort.by("ma").descending();
            Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
            Page<KhuyenMai> list = khuyenMaiRepository.fillalllPageable(pageable);
            model.addAttribute("dulieu", list.getContent());
            model.addAttribute("total", kt(list.getTotalPages()));

            model.addAttribute("contentPage","../khuyen-mai/khuyen-mai.jsp");
            model.addAttribute("momdalthemkm",0);
            return "home/layout";
        }

        if(isNgayKetThucAfterNgayBatDau(khuyenMai.getNgayBatDau(),khuyenMai.getNgayKetThuc())==false){
            model.addAttribute("khuyenMaiRepository",khuyenMaiRepository);
            Sort sort = Sort.by("ma").descending();
            Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
            Page<KhuyenMai> list = khuyenMaiRepository.fillalllPageable(pageable);

            model.addAttribute("dulieu", list.getContent());
            model.addAttribute("total", kt(list.getTotalPages()));

            model.addAttribute("momdalthongbaongayKT","Ngày kết thúc phải sau ngày bắt đầu");
            model.addAttribute("contentPage","../khuyen-mai/khuyen-mai.jsp");
            model.addAttribute("momdalthemkm",0);
            return "home/layout";
        }


        if(isNgayKetThucAfterNgayHienTai(khuyenMai.getNgayKetThuc())==false){
            model.addAttribute("khuyenMaiRepository",khuyenMaiRepository);
            Sort sort = Sort.by("ma").descending();
            Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
            Page<KhuyenMai> list = khuyenMaiRepository.fillalllPageable(pageable);

            model.addAttribute("dulieu", list.getContent());
            model.addAttribute("total", kt(list.getTotalPages()));

            model.addAttribute("momdalthongbaongayKT","Ngày kết thúc phải sau ngày hiện tại");
            model.addAttribute("contentPage","../khuyen-mai/khuyen-mai.jsp");
            model.addAttribute("momdalthemkm",0);
            return "home/layout";
        }


        Integer sl = khuyenMaiRepository.findAll().size();
        String mhd="";
        if(sl<10){
            mhd = "MKM0" + sl;
        }else {
            mhd = "MKM" + sl;
        }
        khuyenMai.setMa(mhd);
        khuyenMai.setLoaiGiamGia("%");
        khuyenMai.setHinhThucGiamGia("%");
        khuyenMai.setNgayTao(formattedDateTime);
        khuyenMai.setNgayCapNhat(formattedDateTime);
        khuyenMai.setNgayBatDau(dinhdangngaytujsp(khuyenMai.getNgayBatDau()));
        khuyenMai.setNgayKetThuc(dinhdangngaytujsp(khuyenMai.getNgayKetThuc()));
        khuyenMai.setTinhTrang(0);
        khuyenMaiRepository.save(khuyenMai);


        model.addAttribute("khuyenMaiRepository",khuyenMaiRepository);
        Sort sort = Sort.by("ma").descending();
        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
        Page<KhuyenMai> list = khuyenMaiRepository.fillalllPageable(pageable);
        model.addAttribute("dulieu", list.getContent());
        model.addAttribute("total", kt(list.getTotalPages()));
        model.addAttribute("km",new KhuyenMai());
        model.addAttribute("contentPage","../khuyen-mai/khuyen-mai.jsp");
        model.addAttribute("tbThemKMOK", 0);
        return "home/layout";
    }


    @GetMapping("/khuyen-mai/ap-dung-khuyen-mai/{idkm}")
    public String apdungkhuyenmai(
            Model model,
            @PathVariable("idkm") UUID idkm,
            @ModelAttribute("km") KhuyenMai khuyenMai,
            @ModelAttribute("kmupdate") KhuyenMai khuyenMaiupdate,
            @RequestParam("num") Optional<Integer> num,
            @RequestParam(name = "size", defaultValue = "5", required = false) Integer size

    ) {
        KhuyenMai kmchon=khuyenMaiRepository.findById(idkm).orElse(null);
        model.addAttribute("kmchon",kmchon);
        model.addAttribute("batmodalapdungkm",0);
        model.addAttribute("khuyenMaiRepository",khuyenMaiRepository);
        Sort sort = Sort.by("ma").descending();
        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
        Page<KhuyenMai> list = khuyenMaiRepository.fillalllPageable(pageable);
        model.addAttribute("dulieu", list.getContent());
        model.addAttribute("total", kt(list.getTotalPages()));
        model.addAttribute("contentPage","../khuyen-mai/khuyen-mai.jsp");
        return "home/layout";
    }

    @GetMapping("/khuyen-mai/chi-tiet-san-pham-ap-dung-khuyen-mai/{idctsp}/{idkm}")
    public String apdungkmVSctsp(
            Model model,
            @PathVariable("idctsp") UUID idctsp,
            @PathVariable("idkm") UUID idkm,
            @ModelAttribute("km") KhuyenMai khuyenMai,
            @ModelAttribute("kmupdate") KhuyenMai khuyenMaiupdate,
            @RequestParam("num") Optional<Integer> num,
            @RequestParam(name = "size", defaultValue = "5", required = false) Integer size

    ) {
        ChiTietSanPham ctsp=chiTietSanPhamService.findById(idctsp);
        ctsp.setKhuyenMai(khuyenMaiRepository.findById(idkm).orElse(null));
        chiTietSanPhamService.add(ctsp);
        model.addAttribute("tbapdungKMvsCTSP",0);
        model.addAttribute("khuyenMaiRepository",khuyenMaiRepository);


        KhuyenMai kmchon=khuyenMaiRepository.findById(idkm).orElse(null);
        model.addAttribute("kmchon",kmchon);
        model.addAttribute("batmodalapdungkm",0);
        model.addAttribute("khuyenMaiRepository",khuyenMaiRepository);
        Sort sort = Sort.by("ma").descending();
        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
        Page<KhuyenMai> list = khuyenMaiRepository.fillalllPageable(pageable);
        model.addAttribute("dulieu", list.getContent());
        model.addAttribute("total", kt(list.getTotalPages()));
        model.addAttribute("contentPage","../khuyen-mai/khuyen-mai.jsp");
        return "home/layout";
    }


    @GetMapping("/khuyen-mai/detail-khuyen-mai/{idkm}")
    public String detaidkmdeupdate(
            Model model,
            @PathVariable("idkm") UUID idkm,
            @ModelAttribute("km") KhuyenMai khuyenMai,
            @ModelAttribute("kmupdate") KhuyenMai khuyenMaiupdate,
            @RequestParam("num") Optional<Integer> num,
            @RequestParam(name = "size", defaultValue = "5", required = false) Integer size

    ) {
        khuyenMaiupdate=khuyenMaiRepository.findById(idkm).orElse(null);
        String NBTCC=khuyenMaiupdate.getNgayBatDau();
        String NKTCC=khuyenMaiupdate.getNgayKetThuc();

        model.addAttribute("NBTCC",dinhangCHUOIsangJSP(NBTCC));
        model.addAttribute("NKTCC",dinhangCHUOIsangJSP(NKTCC));

        model.addAttribute("kmupdate",khuyenMaiupdate);
        model.addAttribute("kmupdate",khuyenMaiupdate);
        model.addAttribute("kmchon",khuyenMaiupdate);
        model.addAttribute("batmodaldetailupdatekm",0);
        model.addAttribute("khuyenMaiRepository",khuyenMaiRepository);
        Sort sort = Sort.by("ma").descending();
        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
        Page<KhuyenMai> list = khuyenMaiRepository.fillalllPageable(pageable);
        model.addAttribute("dulieu", list.getContent());
        model.addAttribute("total", kt(list.getTotalPages()));
        model.addAttribute("contentPage","../khuyen-mai/khuyen-mai.jsp");
        return "home/layout";
    }


    @PostMapping("/khuyen-mai/update")
    public String updateKM(Model model,
//
//
                           @ModelAttribute("kmupdate") @Valid KhuyenMai khuyenMaiupdate,
                           BindingResult bindingResult,
                           @RequestParam("num") Optional<Integer> num,
                           @RequestParam(name = "size", defaultValue = "5", required = false) Integer size,
                           @ModelAttribute("km")  KhuyenMai khuyenMai
//                           @RequestParam("NBDupdate") String NBDupdate,
//                           @RequestParam("NKTupdate") String NKTupdate
//
    ) {
//        khuyenMaiupdate.setNgayBatDau(NBDupdate);
//        khuyenMaiupdate.setNgayKetThuc(NKTupdate);


        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        LocalDateTime currentDateTime = LocalDateTime.now();
        String formattedDateTime = currentDateTime.format(formatter);
        if (bindingResult.hasErrors()) {
//            model.addAttribute("NBTCC",dinhangCHUOIsangJSP(khuyenMaiupdate.getNgayBatDau()));
//            model.addAttribute("NKTCC",dinhangCHUOIsangJSP(khuyenMaiupdate.getNgayKetThuc()));
            if(khuyenMaiupdate.getNgayBatDau().isEmpty()==true && khuyenMaiupdate.getNgayKetThuc().isEmpty()==false  ){
                model.addAttribute("NKTCC",dinhangCHUOIsangJSP(khuyenMaiupdate.getNgayKetThuc()));
            }else  if (khuyenMaiupdate.getNgayBatDau().isEmpty()==false && khuyenMaiupdate.getNgayKetThuc().isEmpty()==true){
                model.addAttribute("NBTCC",dinhangCHUOIsangJSP(khuyenMaiupdate.getNgayBatDau()));
            }else  if (khuyenMaiupdate.getNgayBatDau().isEmpty()==false && khuyenMaiupdate.getNgayKetThuc().isEmpty()==false){
                model.addAttribute("NBTCC",dinhangCHUOIsangJSP(khuyenMaiupdate.getNgayBatDau()));
                model.addAttribute("NKTCC",dinhangCHUOIsangJSP(khuyenMaiupdate.getNgayKetThuc()));
            }

            else {}
            model.addAttribute("khuyenMaiRepository",khuyenMaiRepository);
            Sort sort = Sort.by("ma").descending();
            Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
            Page<KhuyenMai> list = khuyenMaiRepository.fillalllPageable(pageable);
            model.addAttribute("dulieu", list.getContent());
            model.addAttribute("total", kt(list.getTotalPages()));

            model.addAttribute("contentPage","../khuyen-mai/khuyen-mai.jsp");
            model.addAttribute("batmodaldetailupdatekm",0);
            return "home/layout";
        }

        if(isNgayKetThucAfterNgayBatDauupdate(khuyenMaiupdate.getNgayBatDau(),khuyenMaiupdate.getNgayKetThuc())==false){
            model.addAttribute("NBTCC",dinhangCHUOIsangJSP(khuyenMaiupdate.getNgayBatDau()));
            model.addAttribute("NKTCC",dinhangCHUOIsangJSP(khuyenMaiupdate.getNgayKetThuc()));
            model.addAttribute("khuyenMaiRepository",khuyenMaiRepository);
            Sort sort = Sort.by("ma").descending();
            Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
            Page<KhuyenMai> list = khuyenMaiRepository.fillalllPageable(pageable);

            model.addAttribute("dulieu", list.getContent());
            model.addAttribute("total", kt(list.getTotalPages()));

            model.addAttribute("momdalthongbaongayKT1","Ngày kết thúc phải sau ngày bắt đầu");
            model.addAttribute("contentPage","../khuyen-mai/khuyen-mai.jsp");
            model.addAttribute("batmodaldetailupdatekm",0);
            return "home/layout";
        }


        if(isNgayKetThucAfterNgayHienTaiupdate(khuyenMaiupdate.getNgayKetThuc())==false){
            model.addAttribute("NBTCC",dinhangCHUOIsangJSP(khuyenMaiupdate.getNgayBatDau()));
            model.addAttribute("NKTCC",dinhangCHUOIsangJSP(khuyenMaiupdate.getNgayKetThuc()));
            model.addAttribute("khuyenMaiRepository",khuyenMaiRepository);
            Sort sort = Sort.by("ma").descending();
            Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
            Page<KhuyenMai> list = khuyenMaiRepository.fillalllPageable(pageable);

            model.addAttribute("dulieu", list.getContent());
            model.addAttribute("total", kt(list.getTotalPages()));

            model.addAttribute("momdalthongbaongayKT1","Ngày kết thúc phải sau ngày hiện tại");
            model.addAttribute("contentPage","../khuyen-mai/khuyen-mai.jsp");
            model.addAttribute("batmodaldetailupdatekm",0);
            return "home/layout";
        }


        khuyenMaiupdate.setNgayCapNhat(formattedDateTime);
        khuyenMaiRepository.save(khuyenMaiupdate);


        model.addAttribute("khuyenMaiRepository",khuyenMaiRepository);
        Sort sort = Sort.by("ma").descending();
        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
        Page<KhuyenMai> list = khuyenMaiRepository.fillalllPageable(pageable);
        model.addAttribute("dulieu", list.getContent());
        model.addAttribute("total", kt(list.getTotalPages()));
        model.addAttribute("km",new KhuyenMai());
        model.addAttribute("contentPage","../khuyen-mai/khuyen-mai.jsp");
        model.addAttribute("tbUPDATEkmOK", 0);
        return "home/layout";
    }




    @PostMapping("/khuyen-mai/tim-kiem")
    public String timmt(
            Model model,
            @ModelAttribute("kmupdate")  KhuyenMai khuyenMaiupdate,
            @RequestParam("num") Optional<Integer> num,
            @RequestParam(name = "size", defaultValue = "5", required = false) Integer size,
            @ModelAttribute("km")  KhuyenMai khuyenMai,
            @RequestParam("matk") String mt

    ) {

        Sort sort = Sort.by("ma").descending();
        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
        Page<KhuyenMai> list = khuyenMaiRepository.fillalllPageable(pageable);

        model.addAttribute("dulieu",khuyenMaiRepository.timkiemKM(mt));
        model.addAttribute("total", kt(list.getTotalPages()));
        model.addAttribute("khuyenMaiRepository", khuyenMaiRepository);


        model.addAttribute("contentPage","../khuyen-mai/khuyen-mai.jsp");
        return "home/layout";
    }
}

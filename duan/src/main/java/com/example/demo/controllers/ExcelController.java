//package com.example.demo.controllers;
//
//import java.io.ByteArrayOutputStream;
//import java.io.IOException;
//import java.io.InputStream;
//import java.io.OutputStream;
//import java.util.Base64;
//import java.util.List;
//
//
//import com.example.demo.models.Pin;
//import com.example.demo.services.PinService;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import org.apache.poi.ss.usermodel.Cell;
//import org.apache.poi.ss.usermodel.Row;
//import org.apache.poi.ss.usermodel.Sheet;
//import org.apache.poi.ss.usermodel.Workbook;
//import org.apache.poi.xssf.usermodel.XSSFSheet;
//import org.apache.poi.xssf.usermodel.XSSFWorkbook;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//
//public class ExcelController extends HttpServlet {
//
//    @Autowired
//    private PinService pinService;
//
//    @GetMapping("/export-excel")
//    public String exportExcel(Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Lấy dữ liệu từ database
//        List<Pin> listPin = pinService.findAll();
//
//        // Tạo đối tượng XSSFWorkbook
//        XSSFWorkbook workbook = new XSSFWorkbook();
//
//        // Tạo bảng dữ liệu
//        XSSFSheet sheet = workbook.createSheet("Danh sách pin");
//
//        // Tạo tiêu đề bảng
//        Row row = sheet.createRow(0);
//        Cell cell;
//        cell = row.createCell(0);
//        cell.setCellValue("Mã");
//        cell = row.createCell(1);
//        cell.setCellValue("Loại pin");
//        cell = row.createCell(2);
//        cell.setCellValue("Công nghệ pin");
//        cell = row.createCell(3);
//        cell.setCellValue("Ngày tạo");
//        cell = row.createCell(4);
//        cell.setCellValue("Ngày cập nhật");
//        cell = row.createCell(5);
//        cell.setCellValue("Tình trạng");
//        cell = row.createCell(6);
//        cell.setCellValue("Mô tả");
//        cell = row.createCell(7);
//        cell.setCellValue("Dung lượng");
//
//        // Thêm dữ liệu vào bảng
//        int rowNum = 1;
//        for (Pin pin : listPin) {
//            row = sheet.createRow(rowNum);
//            cell = row.createCell(0);
//            cell.setCellValue(pin.getMa());
//            cell = row.createCell(1);
//            cell.setCellValue(pin.getLoaiPin());
//            cell = row.createCell(2);
//            cell.setCellValue(pin.getCongNghePin());
//            cell = row.createCell(3);
//            cell.setCellValue(pin.getNgayTao());
//            cell = row.createCell(4);
//            cell.setCellValue(pin.getNgayCapNhat());
//            cell = row.createCell(5);
//            cell.setCellValue(pin.getTinhTrang());
//            cell = row.createCell(6);
//            cell.setCellValue(pin.getMoTa());
//            cell = row.createCell(7);
//            cell.setCellValue(pin.getDungLuongPin().getThongSo());
//
//            rowNum++;
//        }
//
//        // Lưu tệp excel
//        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
//        workbook.write(outputStream);
//        byte[] bytes = outputStream.toByteArray();
//
//        // Chuyển đổi đối tượng XSSFWorkbook thành chuỗi
//        String excelString = workbook.toString();
//
//        // Mã hóa chuỗi kết quả thành base64
//        String base64String = Base64.getEncoder().encodeToString(excelString.getBytes());
//
//        // Trả về chuỗi base64 cho trình duyệt web
//        model.addAttribute("contentPage", "../pin/pin.jsp");
//        return "/home/layout";
//    }
//}

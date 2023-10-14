package com.example.demo.controllers;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


import com.example.demo.models.HoaDon;
import com.example.demo.services.HoaDonService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ExcelController {

    @Autowired
    private HoaDonService hoaDonService;


    @GetMapping("/hoa-don/export-excel")
    public String exportExcel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // thời gian theo 3 tháng gần nhẩt
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.MONTH, -3);
        Date startDate = calendar.getTime();

        // Lấy dữ liệu từ database
        List<HoaDon> listHoaDon = hoaDonService.findAllByCreatedAtAfter(startDate);

        // Tạo đối tượng XSSFWorkbook
        XSSFWorkbook workbook = new XSSFWorkbook();

        // Tạo bảng dữ liệu
        XSSFSheet sheet = workbook.createSheet("Danh sách hoá đơn đã thanh toán");

        CellStyle borderStyle = workbook.createCellStyle();
        borderStyle.setBorderBottom(BorderStyle.THIN);
        borderStyle.setBorderLeft(BorderStyle.THIN);
        borderStyle.setBorderRight(BorderStyle.THIN);
        borderStyle.setBorderTop(BorderStyle.THIN);

        // Tăng độ rộng excel
        sheet.setDefaultColumnWidth(14);

        // Tạo tiêu đề bảng
        Row row = sheet.createRow(0);

        Cell cell;

        cell = row.createCell(0);
        cell.setCellValue("Mã hoá đơn");
        cell = row.createCell(1);
        cell.setCellValue("Tên khách hàng");
        cell = row.createCell(2);
        cell.setCellValue("Tên nhân viên");
        cell = row.createCell(3);
        cell.setCellValue("Địa chỉ");
//        cell = row.createCell(4);
//        cell.setCellValue("Điểm quy đổi");
        cell = row.createCell(4);
        cell.setCellValue("SĐT nhận hàng");
        cell = row.createCell(5);
        cell.setCellValue("Tổng tiền");
        cell = row.createCell(6);
        cell.setCellValue("Tình trạng");
        cell = row.createCell(7);
        cell.setCellValue("Ngày tạo");
        cell = row.createCell(8);
        cell.setCellValue("Ngày thanh toán");
        cell = row.createCell(9);
        cell.setCellValue("Ngày nhận");
        cell = row.createCell(10);
        cell.setCellValue("Ngày ship");

        // Tạo kiểu font đậm
        Font boldFont = workbook.createFont();
        boldFont.setBold(true);

        // Tạo kiểu cell
        CellStyle headerStyle = workbook.createCellStyle();
        headerStyle.setFont(boldFont);

        // Áp dụng kiểu cell cho dòng đầu
        Row headerRow = sheet.getRow(0);
        for (int i = 0; i < headerRow.getLastCellNum(); i++) {
            headerRow.getCell(i).setCellStyle(headerStyle);
        }

        // Thêm dữ liệu vào bảng
        int rowNum = 1;
        for (HoaDon hoadon : listHoaDon) {
            // Tạo ô kiểu date
            XSSFCellStyle dateStyle = workbook.createCellStyle();
            dateStyle.setDataFormat(workbook.createDataFormat().getFormat("yyyy/mm/dd"));

            row = sheet.createRow(rowNum);
            cell = row.createCell(0);
            cell.setCellValue(hoadon.getMa());

            String hoTen = null;
            if (hoadon.getKhachHang() != null) {
                hoTen = hoadon.getKhachHang().getHoTen();
            }
            if (hoTen == null) {
                hoTen = " ";
            } else {
                cell = row.createCell(1);
                cell.setCellValue(hoTen);
            }


            cell = row.createCell(2);
            cell.setCellValue(hoadon.getNhanVien().getHoTen());

            String diaChi = null;
            if (hoadon.getDiaChi() != null) {
                diaChi = hoadon.getDiaChi().getDiaChi();
            }
            if (diaChi == null) {
                diaChi = " ";
            } else {
                cell = row.createCell(3);
                cell.setCellValue(diaChi);
            }
//            cell = row.createCell(4);
//            cell.setCellValue(hoadon.getQuyDoi().getDiemQuyDoi());

            String sdt = null;
            if (hoadon.getSdt() != null) {
                sdt = hoadon.getSdt();
            }
            if (sdt == null) {
                sdt = " ";
            } else {
                cell = row.createCell(4);
                cell.setCellValue(sdt);
            }

            String tongTien = null;
            if (hoadon.getSdt() != null) {
                tongTien = String.valueOf(hoadon.getTongTien());
            }
            if (tongTien == null) {
                tongTien = " ";
            } else {
                cell = row.createCell(5);
                cell.setCellValue(tongTien);
            }

            cell = row.createCell(6);
            cell.setCellValue(hoadon.getTinhTrang());

            cell = row.createCell(7);
            cell.setCellValue(hoadon.getNgayTao());
            cell.setCellStyle(dateStyle);

            cell = row.createCell(8);
            cell.setCellValue(hoadon.getNgayThanhToan());
            cell.setCellStyle(dateStyle);

            cell = row.createCell(9);
            cell.setCellValue(hoadon.getNgayNhan());
            cell.setCellStyle(dateStyle);

            cell = row.createCell(10);
            cell.setCellStyle(dateStyle);
            cell.setCellValue(hoadon.getNgayShip());

            rowNum++;

        }


        // Lưu tệp excel
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        workbook.write(outputStream);
        byte[] bytes = outputStream.toByteArray();

        // Trả về tệp excel
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=danh-sach-hoa-don-theo-ngay-thanh-toan.xlsx");
        response.getOutputStream().write(bytes);
        response.getOutputStream().flush();
        response.getOutputStream().close();

        return null;
    }

    @GetMapping("/hoa-don/export-excel-ngay-nhan")
    public String exportExcelNgayNhan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // thời gian theo 3 tháng gần nhẩt
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.MONTH, -3);
        Date startDate = calendar.getTime();

        // Lấy dữ liệu từ database
        List<HoaDon> listHoaDon = hoaDonService.findAllByNgayNhan(startDate);

        // Tạo đối tượng XSSFWorkbook
        XSSFWorkbook workbook = new XSSFWorkbook();

        // Tạo bảng dữ liệu
        XSSFSheet sheet = workbook.createSheet("Danh sách hoá đơn theo ngày nhận");

        CellStyle borderStyle = workbook.createCellStyle();
        borderStyle.setBorderBottom(BorderStyle.THIN);
        borderStyle.setBorderLeft(BorderStyle.THIN);
        borderStyle.setBorderRight(BorderStyle.THIN);
        borderStyle.setBorderTop(BorderStyle.THIN);

        // Tăng độ rộng excel
        sheet.setDefaultColumnWidth(14);

        // Tạo tiêu đề bảng
        Row row = sheet.createRow(0);

        Cell cell;

        cell = row.createCell(0);
        cell.setCellValue("Mã hoá đơn");
        cell = row.createCell(1);
        cell.setCellValue("Tên khách hàng");
        cell = row.createCell(2);
        cell.setCellValue("Tên nhân viên");
        cell = row.createCell(3);
        cell.setCellValue("Địa chỉ");
//        cell = row.createCell(4);
//        cell.setCellValue("Điểm quy đổi");
        cell = row.createCell(4);
        cell.setCellValue("SĐT nhận hàng");
        cell = row.createCell(5);
        cell.setCellValue("Tổng tiền");
        cell = row.createCell(6);
        cell.setCellValue("Tình trạng");
        cell = row.createCell(7);
        cell.setCellValue("Ngày tạo");
        cell = row.createCell(8);
        cell.setCellValue("Ngày thanh toán");
        cell = row.createCell(9);
        cell.setCellValue("Ngày nhận");
        cell = row.createCell(10);
        cell.setCellValue("Ngày ship");

        // Tạo kiểu font đậm
        Font boldFont = workbook.createFont();
        boldFont.setBold(true);

        // Tạo kiểu cell
        CellStyle headerStyle = workbook.createCellStyle();
        headerStyle.setFont(boldFont);

        // Áp dụng kiểu cell cho dòng đầu
        Row headerRow = sheet.getRow(0);
        for (int i = 0; i < headerRow.getLastCellNum(); i++) {
            headerRow.getCell(i).setCellStyle(headerStyle);
        }

        // Thêm dữ liệu vào bảng
        int rowNum = 1;
        for (HoaDon hoadon : listHoaDon) {
            // Tạo ô kiểu date
            XSSFCellStyle dateStyle = workbook.createCellStyle();
            dateStyle.setDataFormat(workbook.createDataFormat().getFormat("yyyy/mm/dd"));

            row = sheet.createRow(rowNum);
            cell = row.createCell(0);
            cell.setCellValue(hoadon.getMa());

            String hoTen = null;
            if (hoadon.getKhachHang() != null) {
                hoTen = hoadon.getKhachHang().getHoTen();
            }
            if (hoTen == null) {
                hoTen = " ";
            } else {
                cell = row.createCell(1);
                cell.setCellValue(hoTen);
            }


            cell = row.createCell(2);
            cell.setCellValue(hoadon.getNhanVien().getHoTen());

            String diaChi = null;
            if (hoadon.getDiaChi() != null) {
                diaChi = hoadon.getDiaChi().getDiaChi();
            }
            if (diaChi == null) {
                diaChi = " ";
            } else {
                cell = row.createCell(3);
                cell.setCellValue(diaChi);
            }
//            cell = row.createCell(4);
//            cell.setCellValue(hoadon.getQuyDoi().getDiemQuyDoi());

            String sdt = null;
            if (hoadon.getSdt() != null) {
                sdt = hoadon.getSdt();
            }
            if (sdt == null) {
                sdt = " ";
            } else {
                cell = row.createCell(4);
                cell.setCellValue(sdt);
            }

            String tongTien = null;
            if (hoadon.getSdt() != null) {
                tongTien = String.valueOf(hoadon.getTongTien());
            }
            if (tongTien == null) {
                tongTien = " ";
            } else {
                cell = row.createCell(5);
                cell.setCellValue(tongTien);
            }

            cell = row.createCell(6);
            cell.setCellValue(hoadon.getTinhTrang());

            cell = row.createCell(7);
            cell.setCellValue(hoadon.getNgayTao());
            cell.setCellStyle(dateStyle);

            cell = row.createCell(8);
            cell.setCellValue(hoadon.getNgayThanhToan());
            cell.setCellStyle(dateStyle);

            cell = row.createCell(9);
            cell.setCellValue(hoadon.getNgayNhan());
            cell.setCellStyle(dateStyle);

            cell = row.createCell(10);
            cell.setCellStyle(dateStyle);
            cell.setCellValue(hoadon.getNgayShip());

            rowNum++;

        }


        // Lưu tệp excel
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        workbook.write(outputStream);
        byte[] bytes = outputStream.toByteArray();

        // Trả về tệp excel
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=danh-sach-hoa-don-theo-ngay-nhan.xlsx");
        response.getOutputStream().write(bytes);
        response.getOutputStream().flush();
        response.getOutputStream().close();

        return null;
    }

    @GetMapping("/hoa-don/export-excel-ngay-ship")
    public String exportExcelNgayShip(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // thời gian theo 3 tháng gần nhẩt
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.MONTH, -3);
        Date startDate = calendar.getTime();

        // Lấy dữ liệu từ database
        List<HoaDon> listHoaDon = hoaDonService.findAllByNgayShip(startDate);

        // Tạo đối tượng XSSFWorkbook
        XSSFWorkbook workbook = new XSSFWorkbook();

        // Tạo bảng dữ liệu
        XSSFSheet sheet = workbook.createSheet("Danh sách hoá đơn theo ngày ship");

        CellStyle borderStyle = workbook.createCellStyle();
        borderStyle.setBorderBottom(BorderStyle.THIN);
        borderStyle.setBorderLeft(BorderStyle.THIN);
        borderStyle.setBorderRight(BorderStyle.THIN);
        borderStyle.setBorderTop(BorderStyle.THIN);

        // Tăng độ rộng excel
        sheet.setDefaultColumnWidth(14);

        // Tạo tiêu đề bảng
        Row row = sheet.createRow(0);

        Cell cell;

        cell = row.createCell(0);
        cell.setCellValue("Mã hoá đơn");
        cell = row.createCell(1);
        cell.setCellValue("Tên khách hàng");
        cell = row.createCell(2);
        cell.setCellValue("Tên nhân viên");
        cell = row.createCell(3);
        cell.setCellValue("Địa chỉ");
//        cell = row.createCell(4);
//        cell.setCellValue("Điểm quy đổi");
        cell = row.createCell(4);
        cell.setCellValue("SĐT nhận hàng");
        cell = row.createCell(5);
        cell.setCellValue("Tổng tiền");
        cell = row.createCell(6);
        cell.setCellValue("Tình trạng");
        cell = row.createCell(7);
        cell.setCellValue("Ngày tạo");
        cell = row.createCell(8);
        cell.setCellValue("Ngày thanh toán");
        cell = row.createCell(9);
        cell.setCellValue("Ngày nhận");
        cell = row.createCell(10);
        cell.setCellValue("Ngày ship");

        // Tạo kiểu font đậm
        Font boldFont = workbook.createFont();
        boldFont.setBold(true);

        // Tạo kiểu cell
        CellStyle headerStyle = workbook.createCellStyle();
        headerStyle.setFont(boldFont);

        // Áp dụng kiểu cell cho dòng đầu
        Row headerRow = sheet.getRow(0);
        for (int i = 0; i < headerRow.getLastCellNum(); i++) {
            headerRow.getCell(i).setCellStyle(headerStyle);
        }

        // Thêm dữ liệu vào bảng
        int rowNum = 1;
        for (HoaDon hoadon : listHoaDon) {
            // Tạo ô kiểu date
            XSSFCellStyle dateStyle = workbook.createCellStyle();
            dateStyle.setDataFormat(workbook.createDataFormat().getFormat("yyyy/mm/dd"));

            row = sheet.createRow(rowNum);
            cell = row.createCell(0);
            cell.setCellValue(hoadon.getMa());

            String hoTen = null;
            if (hoadon.getKhachHang() != null) {
                hoTen = hoadon.getKhachHang().getHoTen();
            }
            if (hoTen == null) {
                hoTen = " ";
            } else {
                cell = row.createCell(1);
                cell.setCellValue(hoTen);
            }


            cell = row.createCell(2);
            cell.setCellValue(hoadon.getNhanVien().getHoTen());

            String diaChi = null;
            if (hoadon.getDiaChi() != null) {
                diaChi = hoadon.getDiaChi().getDiaChi();
            }
            if (diaChi == null) {
                diaChi = " ";
            } else {
                cell = row.createCell(3);
                cell.setCellValue(diaChi);
            }
//            cell = row.createCell(4);
//            cell.setCellValue(hoadon.getQuyDoi().getDiemQuyDoi());

            String sdt = null;
            if (hoadon.getSdt() != null) {
                sdt = hoadon.getSdt();
            }
            if (sdt == null) {
                sdt = " ";
            } else {
                cell = row.createCell(4);
                cell.setCellValue(sdt);
            }

            String tongTien = null;
            if (hoadon.getSdt() != null) {
                tongTien = String.valueOf(hoadon.getTongTien());
            }
            if (tongTien == null) {
                tongTien = " ";
            } else {
                cell = row.createCell(5);
                cell.setCellValue(tongTien);
            }

            cell = row.createCell(6);
            cell.setCellValue(hoadon.getTinhTrang());

            cell = row.createCell(7);
            cell.setCellValue(hoadon.getNgayTao());
            cell.setCellStyle(dateStyle);

            cell = row.createCell(8);
            cell.setCellValue(hoadon.getNgayThanhToan());
            cell.setCellStyle(dateStyle);

            cell = row.createCell(9);
            cell.setCellValue(hoadon.getNgayNhan());
            cell.setCellStyle(dateStyle);

            cell = row.createCell(10);
            cell.setCellStyle(dateStyle);
            cell.setCellValue(hoadon.getNgayShip());

            rowNum++;

        }


        // Lưu tệp excel
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        workbook.write(outputStream);
        byte[] bytes = outputStream.toByteArray();

        // Trả về tệp excel
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=danh-sach-hoa-don-theo-ngay-ship.xlsx");
        response.getOutputStream().write(bytes);
        response.getOutputStream().flush();
        response.getOutputStream().close();

        return null;
    }
}

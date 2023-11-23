<%@ page import="java.util.UUID" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Focus - Bootstrap Admin Dashboard </title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css"/>
</head>
<style>
    #detailTable {
        width: 100%;
        /* Điều chỉnh kích thước tối đa của bảng */
        background-color: #f5f5f5; /* Màu nền */
        border: 1px solid #ddd; /* Biên */
    }

    #detailTable th {
        background-color: blue; /* Màu nền của tiêu đề cột */
        color: #fff; /* Màu chữ tiêu đề cột */
    }

    #detailTable th, #detailTable td {
        padding: 10px; /* Khoảng cách bên trong ô */
        text-align: center; /* Căn giữa nội dung */
    }

    /* Tùy chỉnh kích thước modal */
    .modal-dialog {
        max-width: 90%; /* Điều chỉnh kích thước modal tối đa theo ý muốn */
    }


    /* Tùy chỉnh các nút hoặc các phần tử khác trong bảng */





</style>
<body>
<div>
    <ul class="nav nav-tabs border-top" id="setting-panel" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="description-tab" data-toggle="tab" href="/doi-tra/hien-thi" role="tab"
               aria-controls="description" aria-selected="true">Chờ xác nhận trả hàng</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/doi-tra/hien-thi-tu-choi-tra" role="tab">Từ chối trả hàng </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/doi-tra/thanh-cong" role="tab">Đổi trả thành công </a>
        </li>
    </ul>
</div>
<div class="tab-content" id="myTabContent">
    <div class="tab-pane fade show active" id="description" role="tabpanel"
         aria-labelledby="description-tab">
        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <div>
                        <h4 class="card-title" style="float: left">Danh sách hóa đơn chờ đổi trả
                        </h4>
                        <div class="basic-dropdown" style="float: right">
                            <div class="dropdown">

                                <div class="dropdown-menu">
                                    <a href="/hoa-don/export-excel" class="dropdown-item" tabindex="-1">Theo ngày thanh
                                        toán</a>
                                    <a href="/hoa-don/export-excel-ngay-nhan" class="dropdown-item" tabindex="-1">Theo
                                        ngày nhận</a>
                                    <a href="/hoa-don/export-excel-ngay-ship" class="dropdown-item" tabindex="-1">Theo
                                        ngày ship</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                    <br>

                    <div class="loc" style="color:black;">
                        <form:form action="/hoa-don/loc" method="post" modelAttribute="hoaDon">

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label">Từ ngày đổi trả:</label>
                                        <div class="col-sm-8">
                                            <input type="date" id="ngayTao" name="startDate" class="form-control"
                                                   placeholder="Từ ngày">
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group row">
                                        <label class="col-sm-5 col-form-label">Từ ngày nhận:</label>
                                        <div class="col-sm-7">
                                            <input type="date" id="ngayNhan" name="receiveStartDate"
                                                   class="form-control"
                                                   placeholder="Từ ngày">
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label">Từ ngày ship:</label>
                                        <div class="col-sm-8">
                                            <input type="date" id="ngayShip" name="shipStartDate" class="form-control"
                                                   placeholder="Từ ngày  ">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label">Đến ngày thanh toán:</label>
                                        <div class="col-sm-8">
                                            <input type="date" id="ngayTao1" name="endDate" class="form-control"
                                                   placeholder="Đến ngày">
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group row">
                                        <label class="col-sm-5 col-form-label">Đến ngày nhận:</label>
                                        <div class="col-sm-7">
                                            <input type="date" id="ngayNhan1" name="receiveEndDate" class="form-control"
                                                   placeholder="Đến ngày">
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label">Đến ngày ship:</label>
                                        <div class="col-sm-8">
                                            <input type="date" id="ngayShip1" name="shipEndDate" class="form-control"
                                                   placeholder="Đến ngày  ">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-3">
                                <button type="button" style="background-color: green" data-bs-toggle="modal" class="btn btn-warning" data-bs-target="#exampleModalTaoMoi" >
                                    Tạo mới
                                </button>


                            </div>


                            <div align="center">
                                <BUTTON type="submit" class="btn btn-warning" style="" id="bt">
                                    Lọc hóa đơn
                                </BUTTON>
                            </div>
                        </form:form>
                    </div>
                    <br>
                    <div class="search">
                        <form action="/hoa-don/search" method="post">
                            <div class="input-group" style="width: 30%; float: right">
                                <input type="text" class="form-control" placeholder="Bạn tìm gì..."
                                       aria-label="Bạn tìm gì..." name="search">
                                <div class="input-group-append">
                                    <button class="btn btn-sm btn-primary" type="submit">Search</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <%--           kết thúc tìm kiếm         --%>
                    <div class="table-responsive">
                        <table id="example" class="display" style="color: black; width: 1000px">
                            <thead>
                            <tr>
                                <th>Mã đổi trả</th>
                                <th>Mã hóa đơn</th>
                                <th>Tên khách hàng</th>
                                <th>Tên nhân viên</th>
                                <th>Tình trạng</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <i class="mdi mdi-border-color"></i>
                            <c:forEach items="${list}" var="doitra">
                                <tr>
                                    <td>${doitra.ma}</td>
                                    <td>${doitra.hoaDon.ma}</td>
                                    <td>${doitra.hoaDon.khachHang.hoTen}</td>
                                    <td>${doitra.nhanVien.hoTen}</td>
                                    <td>
                                        <c:if test="${doitra.tinhTrang == 0}">Đang chờ</c:if>
                                        <c:if test="${doitra.tinhTrang == 1}">Đã xác nhận</c:if>
                                        <c:if test="${doitra.tinhTrang == 2}">Đã từ chối</c:if>
                                    </td>
                                    <td>
                                        <a href="/doi-tra/detail/${doitra.hoaDon.id}?doitraId=${doitra.id}&hoadonId=${doitra.hoaDon.id}" class="btn btn-warning btn-icon-text"
                                           tabindex="-1"
                                           role="button"
                                           onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                            <i class="ti-file btn-icon-prepend"></i>
                                            Detail
                                        </a>

                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <br>
                    <br>
                    <%--phân trang--%>
                    <%--                    <c:if test="${dem==0}">--%>
                    <%--                        <div align="center">--%>
                    <%--                            <div class="btn-group" role="group" aria-label="Basic example">--%>
                    <%--                                <ul class="pagination justify-content-center pagination-lg">--%>
                    <%--                                    <li class="page-item"><a class="page-link" href="/hoa-don/hien-thi?pageNum=0"><</a>--%>
                    <%--                                    </li>--%>
                    <%--                                    <c:forEach begin="1" end="${total}" varStatus="status">--%>
                    <%--                                        <li class="page-item">--%>
                    <%--                                            <a href="${pageContext.request.contextPath}/hoa-don/hien-thi?pageNum=${status.index -1}"--%>
                    <%--                                               class="page-link">${status.index}</a>--%>
                    <%--                                        </li>--%>
                    <%--                                    </c:forEach>--%>
                    <%--                                    <li class="page-item"><a class="page-link"--%>
                    <%--                                                             href="/hoa-don/hien-thi?pageNum=${total-1}">></a>--%>
                    <%--                                    </li>--%>
                    <%--                                </ul>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                    </c:if>--%>
                    <%--                    <c:if test="${dem==1}">--%>
                    <%--                        <div align="center">--%>
                    <%--                            <div class="btn-group" role="group" aria-label="Basic example">--%>
                    <%--                                <ul class="pagination justify-content-center pagination-lg">--%>
                    <%--                                    <li class="page-item"><a class="page-link" href="/hoa-don/search?pageNum=0"><</a>--%>
                    <%--                                    </li>--%>
                    <%--                                    <c:forEach begin="1" end="${total}" varStatus="status">--%>
                    <%--                                        <li class="page-item">--%>
                    <%--                                            <a href="${pageContext.request.contextPath}/hoa-don/search?pageNum=${status.index -1}"--%>
                    <%--                                               class="page-link">${status.index}</a>--%>
                    <%--                                        </li>--%>
                    <%--                                    </c:forEach>--%>
                    <%--                                    <li class="page-item"><a class="page-link"--%>
                    <%--                                                             href="/hoa-don/search?pageNum=${total-1}">></a>--%>
                    <%--                                    </li>--%>
                    <%--                                </ul>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                    </c:if>--%>
                    <%--                    <c:if test="${dem==2}">--%>
                    <%--                        <div align="center">--%>
                    <%--                            <div class="btn-group" role="group" aria-label="Basic example">--%>
                    <%--                                <ul class="pagination justify-content-center pagination-lg">--%>
                    <%--                                    <li class="page-item"><a class="page-link" href="/hoa-don/loc?pageNum=0"><</a></li>--%>
                    <%--                                    <c:forEach begin="1" end="${total}" varStatus="status">--%>
                    <%--                                        <li class="page-item">--%>
                    <%--                                            <a href="${pageContext.request.contextPath}/hoa-don/loc?pageNum=${status.index -1}"--%>
                    <%--                                               class="page-link">${status.index}</a>--%>
                    <%--                                        </li>--%>
                    <%--                                    </c:forEach>--%>
                    <%--                                    <li class="page-item"><a class="page-link"--%>
                    <%--                                                             href="/hoa-don/loc?pageNum=${total-1}">></a>--%>
                    <%--                                    </li>--%>
                    <%--                                </ul>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                    </c:if>--%>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="exampleModalTaoMoiImei" tabindex="-1" aria-labelledby="exampleModalLabelTaoMoi" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-lg modal-dialog-centered"> <!-- Sử dụng lớp 'modal-lg' để làm cho modal lớn hơn -->
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabelAnh">Imei đã bán</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="card">
                    <div class="card-body">
                        <table id="example" class="table table-bordered table-striped" style="width: 100%">
                            <thead>
                            <tr>
                                <th>Số imei</th>
                                <th>Tên sản phẩm</th>
                                <th>Ảnh</th>
                                <th>Giá bán</th>
                                <th>Tình trạng</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${imeiii}" var="hoadon">
                                <tr>
                                    <td>${hoadon.soImei}</td>
                                    <td>${hoadon.chiTietSanPham.sanPham.ten}</td>
                                    <td align="center">
                                        <img src="/uploads/${hoadon.chiTietSanPham.urlAnh}" width="40" height="40">
                                    </td>
                                    <td>${hoadon.chiTietSanPham.giaBan}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${hoadon.tinhTrang == 0}">Chưa bán</c:when>
                                            <c:when test="${hoadon.tinhTrang == 1}">Đã bán</c:when>
                                            <c:when test="${hoadon.tinhTrang == 2}">Đã xóa</c:when>
                                            <c:when test="${hoadon.tinhTrang == 3}">Chờ xử lí</c:when>
                                            <c:otherwise>Không xác định</c:otherwise>
                                        </c:choose>c
                                    </td>
                                    <td>
                                        <a  class="btn btn-warning btn-icon-text" tabindex="-1" role="button" data-hoadonid="${hoadon.id}" onclick="showChiTietModal(this);">
                                            <i class="ti-file btn-icon-prepend"></i>
                                            Chọn
                                        </a>








                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>



<div class="modal fade" id="exampleModalTaoMoi" tabindex="-1" aria-labelledby="exampleModalLabelTaoMoi" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-lg modal-dialog-centered"> <!-- Sử dụng lớp 'modal-lg' để làm cho modal lớn hơn -->
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabelAnh">Chọn hóa đơn đổi trả</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="card">
                    <div class="card-body">
                        <table id="example" class="table table-bordered table-striped" style="width: 100%">
                            <thead>
                            <tr>
                                <th>Mã hóa đơn</th>
                                <th>Tên khách hàng</th>
                                <th>Tên nhân viên</th>
                                <th>Tình trạng</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listt}" var="hoadon">
                                <tr>
                                    <td>${hoadon.ma}</td>
                                    <td>${hoadon.khachHang.hoTen}</td>
                                    <td>${hoadon.nhanVien.hoTen}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${hoadon.tinhTrang == 0}">Đang chờ</c:when>
                                            <c:when test="${hoadon.tinhTrang == 1}">Đã xác nhận</c:when>
                                            <c:when test="${hoadon.tinhTrang == 2}">Đã thanh toán</c:when>
                                            <c:otherwise>Không xác định</c:otherwise>
                                        </c:choose>c
                                    </td>
                                    <td>
                                        <a  class="btn btn-warning btn-icon-text" tabindex="-1" role="button" data-hoadonid="${hoadon.id}" onclick="showChiTietModal(this);">
                                            <i class="ti-file btn-icon-prepend"></i>
                                            Chọn
                                        </a>








                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
    <div class="modal fade" id="exampleModalChiTiet" tabindex="-1" aria-labelledby="exampleModalLabelChiTiet" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-xl modal-dialog-centered"> <!-- Sử dụng lớp 'modal-lg' để làm cho modal lớn hơn -->
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabelChiTiet">Chọn sản phẩm cần đổi trả</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="card">
                        <div class="card-body">
                            <table id="detailTable" class="ta   ble table-bordered table-striped" style="width: 100%">
                                <thead>
                                <tr>
                                    <th>Sản phẩm </th>
                                    <th>Imei</th>
                                    <th>Đơn giá</th>
                                    <th>Ghi chú </th>
                                    <th>Hiện trạng sản phẩm</th>
                                    <th>Hình thức đổi </th>


                                </tr>
                                </thead>
                                <tbody>

                            </table>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button">Trả hàng</button>
                </div>
            </div>
        </div>
    </div>

<%--modal chọn sản phẩm đây--%>

<%--<div class="modal fade" id="exampleModalChonSanPham" tabindex="-1" aria-labelledby="exampleModalLabelChonSanPham" aria-hidden="true">--%>
<%--    <div class="modal-dialog">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class="modal-title" id="exampleModalLabelChonSanPham">Chọn sản phẩm</h5>--%>
<%--                <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                    <span aria-hidden="true">&times;</span>--%>
<%--                </button>--%>
<%--            </div>--%>
<%--            <div class="modal-body">--%>
<%--                <!-- Thêm nội dung cho modal chọn sản phẩm ở đây -->--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>



<%--modal sản phẩm--%>
<div class="modal fade" id="exampleModalChonSanPham" tabindex="-1" aria-labelledby="modal-1-label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-body">
                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <form class="forms-sample">
                            <div class="container px-0 px-lg-5 mt-0">
                                <div class="row gx-0 gx-lg-5 row-cols-0 row-cols-md-0 row-cols-xl-5 justify-content-center"
                                     style="width: 100%">
                                    <div style="height: 1.5cm">
                                        <select class="form-control" id="hangds1" onchange="clickcombobox()">
                                            <option selected value="null">Hãng sản phẩm</option>
                                            <c:forEach items="${hangds}" var="ht">
                                                <option value="${ht.ten}">${ht.ten}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div>
                                        <select class="form-control" id="camds1" onchange="clickcombobox()">
                                            <option selected value="null">Camera</option>
                                            <c:forEach items="${camds}" var="ht">
                                                <option value="${ht.thongSo}">${ht.thongSo}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div>
                                        <select class="form-control" id="mands1" onchange="clickcombobox()">
                                            <option selected value="null">Màn hình</option>
                                            <c:forEach items="${mands}" var="ht">
                                                <option value="${ht.thongSo}">${ht.thongSo}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div style="height: 1.5cm">
                                        <select class="form-control" id="mauds1" onchange="clickcombobox()">
                                            <option selected value="null">Màu sắc</option>
                                            <c:forEach items="${mauds}" var="ht">
                                                <option value="${ht.ten}">${ht.ten}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div>
                                        <select class="form-control" id="ramds1" onchange="clickcombobox()">
                                            <option selected value="null">Ram</option>
                                            <c:forEach items="${ramds}" var="ht">
                                                <option value="${ht.dungLuong}">${ht.dungLuong}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div>
                                        <select class="form-control" id="romds1" onchange="clickcombobox()">
                                            <option selected value="null">Rom</option>
                                            <c:forEach items="${romds}" var="ht">
                                                <option value="${ht.dungLuong}">${ht.dungLuong}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div>
                                        <select class="form-control" id="dungds1" onchange="clickcombobox()">
                                            <option selected value="null">Dung lượng pin</option>
                                            <c:forEach items="${dungds}" var="ht">
                                                <option value="${ht.thongSo}">${ht.thongSo}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div>
                                        <select class="form-control" id="chipds1" onchange="clickcombobox()">
                                            <option selected value="null">Chip</option>
                                            <c:forEach items="${chipds}" var="ht">
                                                <option value="${ht.ten}">${ht.ten}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div>
                                        <select class="form-control" id="sands1" onchange="clickcombobox()">
                                            <option selected value="null">Sản phẩm</option>
                                            <c:forEach items="${sands}" var="ht">
                                                <option value="${ht.ten}">${ht.ten}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <div>
                            <div class="card-body">
                                <h4 class="card-title" style="float: left">Danh sách sản phẩm</h4>
                                <%--            Tìm kiếm               --%>
                                <div class="input-group" style="width: 30%; float: right">
                                    <input type="text" class="form-control" placeholder="Bạn tìm gì..."
                                           aria-label="Bạn tìm gì..." name="search-san-pham" id="sanPhamSearchInput">
                                    <div class="input-group-append">
                                        <button class="btn btn-sm btn-primary" type="button" id="searchSanPham">Search
                                        </button>
                                    </div>
                                </div>
                                <%--           kết thúc tìm kiếm         --%>
                                <div class="table-responsive">
                                    <div>
                                        <table id="example" class="display" style="min-width: 845px; color: black">
                                            <thead>
                                            <tr>
                                                <th>Mã Sản Phẩm</th>
                                                <th>Tên Sản Phẩm</th>
                                                <th>Ảnh</th>
                                                <th>Hãng</th>
                                                <th>Màu Sắc</th>
                                                <th>Ram</th>
                                                <th>Bộ Nhớ</th>
                                                <th>Đơn Giá</th>
                                                <th>Số Lượng</th>
                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody class="san_pham_search" style="text-align: center"
                                                   id="banglocthaydoi">
                                            <c:forEach items="${listChiTietSanPham}" var="ctsp">
                                                <tr>
                                                    <td>${ctsp.sanPham.ma}</td>
                                                    <td>${ctsp.sanPham.ten}</td>
                                                    <td align="center">
                                                        <img src="/uploads/${ctsp.urlAnh}" width="40" height="40">
                                                    </td>
                                                    <td>${ctsp.sanPham.hangSanPham.ten}</td>
                                                    <td>${ctsp.mauSac.ten}</td>
                                                    <td>${ctsp.ram.dungLuong}</td>
                                                    <td>${ctsp.rom.dungLuong}</td>
                                                    <td>${ctsp.giaBan}</td>
                                                    <td>${ctsp.soLuong}</td>
                                                    <td>
                                                        <a class="btn btn-warning btn-icon-text"
                                                           data-bs-toggle="modal" data-bs-target="#nhapImei">Nhập
                                                            IMEI</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<%--imei--%>
<div class="modal fade" id="nhapImei" tabindex="-1"
     aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header">
            </div>
            <div class="modal-body">
                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title" style="float: left">Danh sách IMEI</h4>
                            <%--            Tìm kiếm               --%>
                            <div class="row">
                                <div class="col-4">
                                    <label id="thongBaoImei" style="float: right"></label>
                                </div>
                                <div class="col-8">
                                    <div class="input-group" style="width: 50%; float: right">
                                        <input type="text" class="form-control"
                                               name="search-imei" id="imeiSearchInput" placeholder="Tìm kiếm IMEI">
                                        <div class="input-group-append">
                                            <button class="btn btn-sm btn-primary" type="button" id="searchImei"
                                            >Tìm kiếm
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%--           kết thúc tìm kiếm         --%>
                            <div class="table-responsive">
                                <table class="table table-striped" style="color: black" id="table_id">
                                    <thead>
                                    <tr>
                                        <th>Tên Sản Phẩm</th>
                                        <th>Số IMEI</th>
                                        <th>Trạng Thái</th>
                                        <th>Chức năng</th>
                                    </tr>
                                    </thead>
                                    <tbody id="listImei_${ctsp.id}"
                                           class="imei_search">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary"
                        data-bs-toggle="modal" data-bs-target="#newSanPham">
                    Quay về
                </button>
                <button type="button" class="btn btn-secondary"
                        data-bs-dismiss="modal">
                    Close
                </button>
            </div>
        </div>
    </div>
</div>


</body>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.full.min.js"></script>
<script>

    $('#selectKhachHang1').select2({
        theme: 'bootstrap-5'
    });
    $('#selectNhanVien1').select2({
        theme: 'bootstrap-5'
    });
    $('#selectDiaChi1').select2({
        theme: 'bootstrap-5'
    });
</script>




<%--<script>--%>
<%--    function showChiTietModal(button) {--%>
<%--        var hoadonId = $(button).data("hoadonid");--%>
<%--        console.log(hoadonId)--%>


<%--            $("#exampleModalTaoMoi").modal("hide");--%>

<%--            // Hiển thị modal mới--%>
<%--            $("#exampleModalChiTiet").modal("show");--%>

<%--    }--%>
<%--</script>--%>

<script>
    function createDoiTra(hoadonId) {
        // Gọi Controller để tạo đổi trả mới và truyền hoadonId
        $.ajax({
            url: "/doi-tra/add-doi-tra?hoadonId=" + hoadonId,
            type: "POST",
            success: function (data) {
                // Xử lý kết quả nếu cần
            },
            error: function (error) {
                console.log("Lỗi khi tạo đổi trả mới: " + error);
            }
        });
    }
</script>



<%--<script>--%>
<%--    function showChiTietModal(button) {--%>
<%--        var hoadonId = $(button).data("hoadonid");--%>
<%--        console.log("hoadonId: " + hoadonId);--%>



<%--        // Tạo đổi trả mới và truyền hoadonId--%>
<%--        createDoiTra(hoadonId);--%>

<%--        // Đóng modal cũ--%>
<%--        $("#exampleModalTaoMoi").modal("hide");--%>

<%--        // Xóa nội dung cũ của bảng--%>
<%--        $("#detailTable tbody").empty();--%>

<%--        // Gọi Controller để lấy thông tin hdct--%>
<%--        $.ajax({--%>
<%--            url: "/doi-tra/detail/" + hoadonId,--%>
<%--            type: "GET",--%>
<%--            success: function (data) {--%>
<%--                console.log("Kiểu dữ liệu của data: " + typeof data);--%>
<%--                console.log("Dữ liệu trả về từ Controller: " + JSON.stringify(data));--%>

<%--                // Xử lý dữ liệu nếu cần--%>
<%--                // Hiển thị dữ liệu lên bảng--%>
<%--                if (Array.isArray(data)) {--%>
<%--                    data.forEach(function (chiTiet) {--%>
<%--                        var row = "<tr>" +--%>
<%--                            "<td>" + chiTiet.imei.chiTietSanPham.sanPham.ten + "</td>" +--%>
<%--                            "<td>" + chiTiet.imei.soImei + "</td>" +--%>
<%--                            "<td>" + chiTiet.donGia + "</td>" +--%>
<%--                            "<td><textarea name='ghiChu' class='form-control' rows='2' placeholder='Ghi chú'></textarea></td>" +--%>
<%--                            "<td>" +--%>
<%--                            "<select name='hienTrang' class='form-select'>" +--%>
<%--                            "<option value='0'>Sản phẩm lỗi</option>" +--%>
<%--                            "<option value='1'>Sản phẩm đổi trả</option>" +--%>
<%--                            "</select>" +--%>
<%--                            "</td>" +--%>
<%--                            "<td>" +--%>
<%--                            "<select name='hinhThucDoi' class='form-select'>" +--%>
<%--                            "<option value='0'>Đổi trả</option>" +--%>
<%--                            "<option value='1'>Hoàn trả</option>" +--%>
<%--                            "</select>" +--%>
<%--                            "<button class='btn btn-primary chonSanPhamButton' onclick='showChonSanPhamModal()' >Chọn sản phẩm</button>" +--%>
<%--                            "</td>" +--%>
<%--                            "</tr>";--%>

<%--                        $("#detailTable tbody").append(row);--%>
<%--                    });--%>

<%--                    // Hiển thị modal mới--%>
<%--                    $("#exampleModalChiTiet").modal("show");--%>
<%--                } else {--%>
<%--                    console.log("Dữ liệu không hợp lệ");--%>
<%--                }--%>

<%--            },--%>
<%--            error: function (error) {--%>
<%--                console.log("Lỗi khi tải dữ liệu: " + error);--%>
<%--            }--%>
<%--        });--%>
<%--    }--%>




<%--</script>--%>



<script>
    function showChiTietModal(button) {
        var hoadonId = $(button).data("hoadonid");
        console.log("hoadonId: " + hoadonId);

        // Tạo đổi trả mới và truyền hoadonId
        createDoiTra(hoadonId);

        // Đóng modal cũ
        $("#exampleModalTaoMoi").on('hidden.bs.modal', function (e) {
            // Xóa nội dung cũ của bảng
            $("#detailTable tbody").empty();

            // Load lại trang
            window.location.reload();
        }).modal('hide');
    }




</script>


<script>
    function showChonSanPhamModal() {
        // Hiển thị modal chọn sản phẩm
        $("#exampleModalChonSanPham").modal("show");
    }

</script>


<script>
    $(document).ready(function() {
        // Sự kiện click vào nút "Chọn sản phẩm"
        $(".chonSanPhamButton").on("click", function() {
            // Hiển thị modal mới
            $('#exampleModalChonSanPham').modal('show');
        });
    });
</script>
<script>
    $('div[id^="nhapImei_"]').on('show.bs.modal', async function (e) {
        const ctspId = e.currentTarget.id.split("_")[1];
        const url = "http://localhost:8080/doi-tra/them-san-pham/" + ctspId;
        console.log(ctspId, url);
        try {
            const resp = await fetch(url);
            const data = await resp.json();
            console.log(data)
            let html = '';
            for (let i = 0; i < data.length; i++) {
                const imei = data[i];
                const tr = `
            <tr>
                <td>` + (i + 1) + `</td>
                <td>` + imei.soImei + `</td>
                <td>` + (imei.tinhTrang == 0 ? "Chưa bán" : "Đã bán") + `</td>
                <td><a href="/doi-tra/them-imei/` + imei.id + `">Thêm IMEI</a></td>
            </tr>
            `;
                html += tr;
            }

            $("#listImei_" + ctspId).html(html);
        } catch (err) {
            console.error(err)
        }
    });
</script>







<%--<script>--%>
<%--    function createAndOpenModal() {--%>
<%--        // Gọi Ajax để tạo đổi trả--%>
<%--        $.ajax({--%>
<%--            url: "/doi-tra/add-doi-tra",--%>
<%--            type: "POST",--%>
<%--            success: function (data) {--%>
<%--                // Đoạn mã để xử lý kết quả trả về (nếu cần)--%>

<%--                // Mở modal mới--%>
<%--                $('#exampleModalTaoMoi').modal('show');--%>
<%--            },--%>
<%--            error: function (error) {--%>
<%--                console.log("Lỗi khi tạo đổi trả: " + error);--%>
<%--            }--%>
<%--        });--%>
<%--    }--%>
<%--</script>--%>




<script>
    $('button[id^="searchImei"]').on('click', async function (e) {
        const btn = $(this);
        const parentModal = btn.closest('.modal'); // Lấy modal cha gần nhất của nút "Tìm kiếm" được nhấn
        const search = parentModal.find("#imeiSearchInput").val();
        const url = "http://localhost:8080/doi-tra/search-imei?search-imei=" + search;
        if (search === "") {
            let html = `
                <tr>
                    <td colspan="4" style="text-align: center; color: red"><strong>Vui lòng nhập IMEI trước khi tìm kiếm.</strong></td>
                </tr>`;
            parentModal.find(".imei_search").html(html);
            return;
        }
        try {
            const resp = await fetch(url);
            const data = await resp.json();
            console.log(data)
            if (data.length === 0) {
                let html = `
                <tr>
                    <td colspan="4" style="text-align: center; color: red"><strong>IMEI đang chờ xử lý hoặc đã bán!</strong></td>
                </tr>`;
                parentModal.find(".imei_search").html(html);
            } else {
                // Hiển thị dữ liệu tìm kiếm
                let html = ``;
                for (let i = 0; i < data.length; i++) {
                    const imei = data[i];
                    console.log(imei.id)
                    const tr = `
            <tr>
                <td>` + imei.chiTietSanPham.sanPham.ten + `</td>
                <td>` + imei.soImei + `</td>
                <td>` + (imei.tinhTrang == 0 ? "Chưa bán" : "Đã bán") + `</td>
                <td><a href="/doi-tra/them-imei/` + imei.id + `">Thêm IMEI</a></td>
            </tr>
            `;
                    html += tr;
                }
                parentModal.find(".imei_search").html(html);
            }
        } catch (err) {
            console.error(err)
        }
    });
</script>


<%--<script>--%>
<%--    $('button[id^="searchImei"]').on('click', async function (e) {--%>
<%--        const btn = $(this);--%>
<%--        const parentModal = btn.closest('.modal'); // Lấy modal cha gần nhất của nút "Tìm kiếm" được nhấn--%>
<%--        const search = parentModal.find("#imeiSearchInput").val();--%>
<%--        const url = "http://localhost:8080/doi-tra/search-imei?search-imei=" + search;--%>
<%--        if (search === "") {--%>
<%--            let html = `--%>
<%--                <tr>--%>
<%--                    <td colspan="4" style="text-align: center; color: red"><strong>Vui lòng nhập IMEI trước khi tìm kiếm.</strong></td>--%>
<%--                </tr>`;--%>
<%--            parentModal.find(".imei_search").html(html);--%>
<%--            return;--%>
<%--        }--%>
<%--        try {--%>
<%--            const resp = await fetch(url);--%>
<%--            const data = await resp.json();--%>
<%--            console.log(data)--%>
<%--            if (data.length === 0) {--%>
<%--                let html = `--%>
<%--                <tr>--%>
<%--                    <td colspan="4" style="text-align: center; color: red"><strong>IMEI đang chờ xử lý hoặc đã bán!</strong></td>--%>
<%--                </tr>`;--%>
<%--                parentModal.find(".imei_search").html(html);--%>
<%--            } else {--%>
<%--                // Hiển thị dữ liệu tìm kiếm--%>
<%--                let html = ``;--%>
<%--                for (let i = 0; i < data.length; i++) {--%>
<%--                    const imei = data[i];--%>
<%--                    console.log(imei.id)--%>

<%--                    const tr = `--%>
<%--            <tr>--%>
<%--                <td>` + imei.chiTietSanPham.sanPham.ten + `</td>--%>
<%--                <td>` + imei.soImei + `</td>--%>
<%--                <td>` + (imei.tinhTrang == 0 ? "Chưa bán" : "Đã bán") + `</td>--%>
<%--                <td><a href="/doi-tra/them-imei/` + imei.id + `?doitraId=${parentModal && parentModal.find("#doitraId").val()}">Thêm IMEI</a></td>--%>
<%--            </tr>--%>
<%--    `;--%>
<%--                    html += tr;--%>
<%--                }--%>
<%--                parentModal.find(".imei_search").html(html);--%>

<%--                // Gắn sự kiện click cho các liên kết "Thêm IMEI"--%>
<%--                $('.addImeiLink').on('click', function (e) {--%>
<%--                    e.preventDefault();--%>
<%--                    const imeiId = $(this).data("imeiId");--%>
<%--                    const doitraId = parentModal && parentModal.find("#doitraId").val();--%>
<%--                    addImei(imeiId, doitraId);--%>
<%--                });--%>
<%--            }--%>
<%--        } catch (err) {--%>
<%--            console.error(err)--%>
<%--        }--%>
<%--    });--%>

<%--    // Phương thức thêm IMEI bằng Ajax--%>
<%--    function addImei(imeiId, doitraId) {--%>
<%--        // Lấy id đổi trả từ modal--%>
<%--        if (parentModal) {--%>
<%--            doitraId = parentModal.find("#doitraId").val();--%>
<%--        } else {--%>
<%--            doitraId = null;--%>
<%--        }--%>

<%--        // Sử dụng tham số doitraId để truyền vào hàm AJAX--%>
<%--        $.ajax({--%>
<%--            type: 'POST',--%>
<%--            url: '/doi-tra/them-imei/' + imeiId + '/' + doitraId,--%>
<%--            success: function (response) {--%>
<%--                // Xử lý phản hồi từ Server (nếu cần)--%>
<%--                console.log(response);--%>

<%--                // Đóng modal sau khi thêm IMEI thành công--%>
<%--                $('#myModal').modal('hide');--%>
<%--            },--%>
<%--            error: function (error) {--%>
<%--                console.error('Lỗi khi thêm IMEI:', error);--%>
<%--            }--%>
<%--        });--%>
<%--    }--%>
<%--</script>--%>









<script>
    function loadInterface(interfaceUrl) {
        fetch(interfaceUrl)
            .then(response => response.text())
            .then(data => {
                const content = document.getElementById('banglocthaydoi');
                content.innerHTML = data;

                loadScripts();
                // loadSelect2();
            })
            .catch(error => {
                console.error('Error loading interface:', error);
            });
    }

    function loadScripts() {
        const scriptsToLoad = [
            '../../../vendor/datatables/js/jquery.dataTables.min.js',
            '../../../js/plugins-init/datatables.init.js'


        ];

        const head = document.head || document.getElementsByTagName('head')[0];

        function loadScript(index) {
            if (index < scriptsToLoad.length) {
                const script = document.createElement('script');
                script.src = scriptsToLoad[index];
                script.onload = function () {
                    loadScript(index + 1);
                };
                head.appendChild(script);
                // loadSelect2();
            }
        }

        // Bắt đầu quá trình tải script
        loadScript(0);
    }

    function clickcombobox() {
        var x1 = encodeURIComponent(document.getElementById("hangds1").value);
        var x2 = encodeURIComponent(document.getElementById("camds1").value);
        var x3 = encodeURIComponent(document.getElementById("mands1").value);
        var x4 = encodeURIComponent(document.getElementById("mauds1").value);
        var x5 = encodeURIComponent(document.getElementById("ramds1").value);
        var x6 = encodeURIComponent(document.getElementById("romds1").value);
        // var x7 = encodeURIComponent(document.getElementById("pinds1").value);
        var x8 = encodeURIComponent(document.getElementById("dungds1").value);
        var x9 = encodeURIComponent(document.getElementById("chipds1").value);
        var x10 = encodeURIComponent(document.getElementById("sands1").value);

        var link = '/doi-tra/loc/' + x1 + '/' + x2 + '/' + x3 + '/' + x4 + '/' + x5 + '/' + x6 + '/' + 'null' + '/' + x8 + '/' + x9 + '/' + x10;
        // document.getElementById("vt").innerHTML=link
        loadInterface(link);
        // document.getElementById("demo").innerHTML = "You selected: " + x;
    }


    function loadSelect2() {
        // Gọi .select2() cho các phần tử sau khi tất cả các tệp script đã được nạp
        $('#hangds1').select2({
            theme: 'bootstrap-5'
        });
        $('#camds1').select2({
            theme: 'bootstrap-5'
        });
        $('#mands1').select2({
            theme: 'bootstrap-5'
        });
        $('#mauds1').select2({
            theme: 'bootstrap-5'
        });
        $('#ramds1').select2({
            theme: 'bootstrap-5'
        });
        $('#romds1').select2({
            theme: 'bootstrap-5'
        });

        $('#pinds1').select2({
            theme: 'bootstrap-5'
        });
        $('#dungds1').select2({
            theme: 'bootstrap-5'
        });

        $('#chipds1').select2({
            theme: 'bootstrap-5'
        });

        $('#sands1').select2({
            theme: 'bootstrap-5'
        });

        // Gọi .select2() cho các phần tử khác ở đây (tương tự)
    }

    loadSelect2();
</script>

<script>
    var doitraId = document.querySelector('a[data-doitra-id]').dataset.doitraId;
    console.log(doitraId); // In giá trị ra console để kiểm tra
</script>
<script>
    var hoadonId = document.querySelector('a[data-hoadon-id]').dataset.hoadonId;
    console.log(hoadonId); // In giá trị ra console để kiểm tra
</script>
<script>
    var doitraId = "${doitra.id}";
    localStorage.setItem("doitraId", doitraId);
</script>

<script>
    var hoadonId = "${doitra.hoaDon.id}";
    localStorage.setItem("hoadonId", hoadonId);
</script>




<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>

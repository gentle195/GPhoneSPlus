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
    <style>
        .stepwizard-step p {
            margin-top: 10px;

        }

        .stepwizard-row {
            display: table-row;

        }

        .stepwizard {
            display: table;
            width: 100%;
            position: relative;

        }

        .stepwizard-step button[disabled] {
            opacity: 1 !important;
            filter: alpha(opacity=100) !important;
        }

        .stepwizard-row:before {
            top: 14px;
            bottom: 0;
            position: absolute;
            content: " ";
            width: 100%;
            height: 7px;
            background-color: red;
            z-order: 0;


        }

        .stepwizard-step-linear a:active .btn-circle {
            background-color: red;
        }

        .stepwizard-step {
            display: table-cell;
            text-align: center;
            position: relative;
        }

        .btn-circle {
            width: 30px;
            height: 30px;
            text-align: center;
            padding: 6px 0;
            font-size: 12px;
            line-height: 1.428571429;
            border-radius: 15px;
            background-color: #999999;
        }

        .stepwizard-step-linear {

            font-size: 20px;
            color: black;
        }

        .custom-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .custom-table th, .custom-table td {
            border: 1px solid #ddd;
            padding: 12px; /* Tăng kích thước padding */
            text-align: center; /* Căn giữa nội dung */
        }

        .custom-table th {
            background-color: #f2f2f2; /* Màu nền cho tiêu đề cột */
        }

        .custom-table td img {
            max-width: 60px; /* Giảm kích thước ảnh */
            max-height: 60px;
        }

        .custom-table button {
            padding: 8px 12px; /* Điều chỉnh kích thước của nút */
            background-color: #4CAF50; /* Màu nền */
            color: white; /* Màu chữ */
            border: none;
            border-radius: 4px; /* Góc bo tròn */
            cursor: pointer;
        }

        .custom-table button:hover {
            background-color: #45a049; /* Màu nền khi di chuột qua */
        }

    </style>
</head>
<body>

<div>

    <!-- Trong trang detail.jsp -->
<%--    <input type="text" id="doitraIdInput" name="doitraId" readonly />--%>

<%--    <input type="text" id="hoadonIdInput" name="hoadonId" readonly />--%>




    <ul class="nav nav-tabs border-top" id="setting-panel" role="tablist">
        <li class="nav-item">
            <a href="/doi-tra/hien-thi" class="nav-link"
               tabindex="-1"
               role="button">
                Trang Hóa đơn</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab"
               aria-controls="description" aria-selected="true">Xem hóa đơn</a>
        </li>
    </ul>
</div>
<div class="tab-content" id="myTabContent">
    <div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab">
        <div class="col-12 grid-margin">
            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                    <div>
                        <div class="card-body">
                            <br>
                            <h3 style="text-align: center;">Hóa đơn chi tiết</h3>
                            <br>

                            <div class="table-responsive custom-table">
                                <table class="display custom-table">
                                    <thead>
                                    <tr>
                                        <th>Tên Sản Phẩm</th>
                                        <th>Ảnh</th>
                                        <th>Hãng</th>
                                        <th>Số IMEI</th>
                                        <th>Giá Bán</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody id="table-search">
                                    <!-- Dữ liệu của bảng 1 -->
                                    <c:forEach items="${hdctne}" var="hdct">
                                        <tr>
                                            <td>${hdct.imei.chiTietSanPham.sanPham.ten}</td>
                                            <td align="center">
                                                <img src="/uploads/${hdct.imei.chiTietSanPham.urlAnh}" width="40"
                                                     height="40">
                                            </td>
                                            <td>${hdct.imei.chiTietSanPham.sanPham.hangSanPham.ten}</td>
                                            <td>${hdct.imei.soImei}</td>
                                            <td>${hdct.donGia}</td>


                                            <td>
<%--                                                <c:choose>--%>
<%--&lt;%&ndash;                                                    <c:when test="${not empty dulieu.imei.id}">&ndash;%&gt;--%>
<%--                                                        <!-- Nếu hdct.imei.id tồn tại, thì nút sẽ không ấn được -->--%>
<%--                                                        <button class='btn btn-primary chonSanPhamButton' disabled>Chọn sản phẩm</button>--%>
<%--                                                    </c:when>--%>
<%--                                                    <c:otherwise>--%>
                                                        <!-- Nếu hdct.imei.id không tồn tại, thì nút sẽ ấn được -->
<%--                                                        <button class='btn btn-primary chonSanPhamButton' onclick='showChonSanPhamModalWithDonGia(${hdct.donGia})'  >Chọn sản phẩm</button>--%>
                                                        <button class='btn btn-primary chonSanPhamButton'  data-idhdct="${hdct.id}"   >Chọn sản phẩm</button>
<%--                                                    </c:otherwise>--%>
<%--                                                </c:choose>--%>
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

        <div class="col-12 grid-margin">
            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                    <div>
                        <div class="card-body">
                            <br>
                            <h3 style="text-align: center;">Sản phẩm cần đổi trả</h3>
                            <br>

                            <div class="table-responsive custom-table">
                                <table class="display custom-table">
                                    <thead>
                                    <tr>
                                        <th>Tên Sản Phẩm</th>
                                        <th>Ảnh</th>
                                        <th>Hãng</th>
                                        <th>Số IMEI</th>
                                        <th>Đơn Giá</th>
                                        <th colspan="2">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody id="table-search1">
                                    <tr>
                                        <c:forEach items="${dtct}" var="hdct">
                                    <tr>
                                        <td>${hdct.hoaDonChiTiet.imei.chiTietSanPham.sanPham.ten}</td>
                                        <td align="center">
                                            <img src="/uploads/${hdct.hoaDonChiTiet.imei.chiTietSanPham.urlAnh}" width="40" height="40">
                                        </td>
                                        <td>${hdct.hoaDonChiTiet.imei.chiTietSanPham.sanPham.hangSanPham.ten}</td>
                                        <td>${hdct.hoaDonChiTiet.imei.soImei}</td>
                                        <td>${hdct.hoaDonChiTiet.donGia}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${hdct.hinhThucDoiTra ==0 }">
                                                    <button class='btn btn-primary chonSanPhamDoiTraButton' data-idhdctmoi="${hdct.hoaDonChiTiet.id}" onclick='showChonSanPhamModalWithDonGia(${hdct.hoaDonChiTiet.donGia})'>Chọn </button>
                                                    <button class='btn btn-primary xoaSanPhamDoiTraButton' data-idhdctmoixoa="${hdct.hoaDonChiTiet.id}" onclick="xoaSanPham('${hdct.hoaDonChiTiet.id}')">Xóa</button>
                                                </c:when>
                                                <c:when test="${hdct.hinhThucDoiTra == 1}">
                                                    <button class='btn btn-primary xoaSanPhamDoiTraButton' data-idhdctmoixoa="${hdct.hoaDonChiTiet.id}" onclick="xoaSanPham('${hdct.hoaDonChiTiet.id}')">Xóa</button>
                                                </c:when>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    </tr>

                                    </tbody>
                                </table>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>



        <div class="col-12 grid-margin">
            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                    <div>
                        <div class="card-body">
                            <br>
                            <h3 ${not empty dtctlist ? '' : 'style="display: none;"'} style="text-align: center;">Sản phẩm đổi trả</h3>
                            <br>

                            <div class="table-responsive custom-table">
                                <table class="display custom-table" ${not empty dtctlist ? '' : 'style="display: none;"'} >
                                    <thead>
                                    <tr>
                                        <th>Sản phẩm cần đổi trả</th>
                                        <th>Tên Sản Phẩm</th>
                                        <th>Ảnh</th>
                                        <th>Hãng</th>
                                        <th>Số IMEI</th>

                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody id="table-search1">
                                    <tr>
                                        <c:forEach items="${dtctlist}" var="hdct">
                                    <tr>
                                        <td>${hdct.hoaDonChiTiet.imei.chiTietSanPham.sanPham.ten}</td>
                                        <td>${hdct.imei.chiTietSanPham.sanPham.ten}</td>
                                        <td align="center">
                                            <img src="/uploads/${hdct.imei.chiTietSanPham.urlAnh}" width="40"
                                                 height="40">
                                        </td>
                                        <td>${hdct.imei.chiTietSanPham.sanPham.hangSanPham.ten}</td>
                                        <td>${hdct.imei.soImei}</td>

                                        <td>
                                            <button class='btn btn-primary chonSanPhamDoiTraButton' data-idhdctmoi="${hdct.id}"  >Xóa </button>
                                        </td>
                                    </tr>




                                    </c:forEach>
                                    </tr>
                                    </tbody>
                                </table>


                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>

<%--        <div class="col-12 grid-margin">--%>
<%--            <div class="col-lg-12 grid-margin stretch-card">--%>
<%--                <div class="card">--%>
<%--                    <div>--%>
<%--                        <div class="card-body">--%>
<%--                            <br>--%>
<%--                            <h3 style="text-align: center;">Sản phẩm đổi trả</h3>--%>
<%--                            <br>--%>

<%--                            <div class="table-responsive custom-table">--%>
<%--                                <table class="display custom-table" ${not empty dulieu.imei ? '' : 'style="display: none;"'}>--%>
<%--                                    <thead>--%>
<%--                                    <tr>--%>
<%--                                        <th>Tên Sản Phẩm</th>--%>
<%--                                        <th>Ảnh</th>--%>
<%--                                        <th>Hãng</th>--%>
<%--                                        <th>Số IMEI</th>--%>
<%--                                        <th>Đơn Giá</th>--%>
<%--                                        <th>Action</th>--%>
<%--                                    </tr>--%>
<%--                                    </thead>--%>
<%--                                    <tbody id="table-search1">--%>
<%--                                    <tr>--%>
<%--                                        <td>${dulieu.imei.chiTietSanPham.sanPham.ten}</td>--%>
<%--                                        <td align="center">--%>
<%--                                            <img src="/uploads/${dulieu.imei.chiTietSanPham.urlAnh}" width="40" height="40">--%>
<%--                                        </td>--%>
<%--                                        <td>${dulieu.imei.chiTietSanPham.sanPham.hangSanPham.ten}</td>--%>
<%--                                        <td>${dulieu.imei.soImei}</td>--%>
<%--                                        <td>${dulieu.imei.chiTietSanPham.giaBan}</td>--%>
<%--                                        <td>--%>
<%--                                            <a href="/doi-tra/delete-san-pham/${dulieu.id}" tabindex="-1" role="button"--%>
<%--                                               onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">Xóa</a>--%>
<%--                                        </td>--%>
<%--                                    </tr>--%>
<%--                                    </tbody>--%>
<%--                                </table>--%>


<%--

<%--                            </div>--%>

<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
        <div class='btn btn-primary' id='xacNhanButton'>Xác nhận</div>





    </div>


    </div>

</div>


<%--modal chọn sp--%>
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
                                                           data-bs-toggle="modal" data-bs-target="#nhapImei"   data-giaban="${ctsp.giaBan}"  onclick="kiemTraGia()">Nhập
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


<%--modal xac nhan--%>
<div class="modal fade" id="doiTra" tabindex="-1"
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
<%--nhập imei--%>
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

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Thông Tin Đổi Trả</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Form để nhập thông tin đổi trả -->
                <form id="doiTraForm">
                    <div class="form-group">
                        <label for="lyDo">Lý Do Đổi Trả</label>
                        <input type="text" class="form-control" id="lyDo" placeholder="Lý do đổi trả">
                    </div>
                    <div class="form-group">
                        <label for="hienTrangSanPham">Hiện Trạng Sản Phẩm</label>
                        <select class="form-control" id="hienTrangSanPham">
                            <option value="0">Sản phẩm lỗi</option>
                            <option value="1">Sản phẩm đổi trả</option>
                            <!-- Thêm các option khác nếu cần -->
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="hinhThucDoiTra">Hình Thức Đổi Trả</label>
                        <select class="form-control" id="hinhThucDoiTra">
                            <option value="0">Đổi hàng</option>
                            <option value="1">Trả hàng</option>
                            <!-- Thêm các option khác nếu cần -->
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary" onclick="themThongTinDoiTra()">Thêm Thông Tin</button>
            </div>
        </div>
    </div>
</div>


</body>

<script>
    document.getElementById('xacNhanButton').addEventListener('click', function (event) {
        event.preventDefault();

        // Lấy giá trị doitraId từ thuộc tính data-doitraid


        // Gửi yêu cầu POST đến đường dẫn cụ thể với doitraId
        fetch("/doi-tra/xac-nhan/" + doitraId, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                // Các dữ liệu khác nếu cần
            }),
        }).then(response => {
            if (response.ok) {
                // Xử lý khi yêu cầu thành công
                console.log('Xác nhận thành công');

                // Chuyển hướng trình duyệt web sau khi xác nhận thành công
                window.location.href = "/doi-tra/hien-thi";
            } else {
                // Xử lý khi yêu cầu không thành công
                console.error('Xác nhận không thành công');
            }
        }).catch(error => {
            console.error('Lỗi:', error);
        });
    });


</script>


<script>
    function xoaSanPham(hdctId) {
        // Gửi yêu cầu xóa bất đồng bộ
        $.ajax({
            url: '/doi-tra/delete-hdct/' + doitraId + '/' + hdctId,
            type: 'GET',
            success: function(data) {
                // Load lại trang sau khi xóa thành công
                location.reload();
            },
            error: function(error) {
                console.error('Lỗi khi xóa', error);
            }
        });
    }
</script>




<%--//Xóa sp cần đổi trả--%>

<script>
    var xoahdctId; // Biến toàn cục để lưu giá trị hdctId

    // Lắng nghe sự kiện click trên button
    document.querySelectorAll('.xoaSanPhamDoiTraButton').forEach(button => {
        button.addEventListener('click', function() {
            // Lấy giá trị hdct.id từ thuộc tính data
            var hdctId = this.getAttribute('data-idhdctmoixoa');

            // Lưu giá trị hdctId vào biến toàn cục
            xoahdctId = hdctId;

            // Gọi hàm để xử lý với giá trị hdct.id
            chonSanPham();
        });
    });

    // Hàm xử lý khi click
    function chonSanPham() {
        // Sử dụng giá trị hdct.id từ biến toàn cục
        console.log('Selected hdct.id:', xoahdctId);

        // Gửi giá trị hdct.id đến trang khác thông qua Ajax
        // Có thể thực hiện gửi giá trị này trong hàm fetch
    }
</script>



<%--// chọn sản phẩm--%>
<script>
    var globalHdctId; // Biến toàn cục để lưu giá trị hdctId

    // Lắng nghe sự kiện click trên button
    document.querySelectorAll('.chonSanPhamDoiTraButton').forEach(button => {
        button.addEventListener('click', function() {
            // Lấy giá trị hdct.id từ thuộc tính data
            var hdctId = this.getAttribute('data-idhdctmoi');

            // Lưu giá trị hdctId vào biến toàn cục
            globalHdctId = hdctId;

            // Gọi hàm để xử lý với giá trị hdct.id
            chonSanPham();
        });
    });

    // Hàm xử lý khi click
    function chonSanPham() {
        // Sử dụng giá trị hdct.id từ biến toàn cục
        console.log('Selected hdct.id:', globalHdctId);

        // Gửi giá trị hdct.id đến trang khác thông qua Ajax
        // Có thể thực hiện gửi giá trị này trong hàm fetch
    }
</script>



<%--<script>--%>
<%--    // Lắng nghe sự kiện click trên button--%>
<%--    document.querySelectorAll('.chonSanPhamButton').forEach(button => {--%>
<%--        button.addEventListener('click', function() {--%>
<%--            // Lấy giá trị hdct.id từ thuộc tính data--%>
<%--            var hdctId = this.getAttribute('data-idhdct');--%>
<%--            console.log(doitraId)--%>

<%--            // Lấy giá trị doitraId từ URL--%>
<%--            // var doitraId = window.location.pathname.split('/').pop();--%>

<%--            // Chuyển hướng đến controller và truyền hdctId qua RequestParam--%>
<%--            window.location.href = "/doi-tra/them-dtct?hdctId=" + hdctId + "&doitraId=" + doitraId;--%>

<%--        });--%>
<%--    });--%>

<%--</script>--%>

<script>
    document.querySelectorAll('.chonSanPhamButton').forEach(button => {
        button.addEventListener('click', function() {
            var hdctId = this.getAttribute('data-idhdct');
            var doitraId = window.location.pathname.split('/').pop();

            // Hiển thị modal
            $('#myModal').modal('show');

            // Lưu thông tin hdctId và doitraId trong form để sử dụng khi thêm
            $('#doiTraForm').data('hdctId', hdctId);
            $('#doiTraForm').data('doitraId', doitraId);
        });
    });

    function themThongTinDoiTra() {
        var lyDo = $('#lyDo').val();
        var hienTrang = $('#hienTrangSanPham').val();
        var hinhThuc = $('#hinhThucDoiTra').val();
        var hdctId = $('#doiTraForm').data('hdctId');




        // Thực hiện thêm thông tin và chuyển hướng đến đường dẫn /doi-tra/them-dtct với các tham số truyền vào
        window.location.href = "/doi-tra/them-dtct?hdctId=" + hdctId + "&doitraId=" + doitraId + "&lyDo=" + lyDo + "&hienTrang=" + hienTrang + "&hinhThuc=" + hinhThuc;
    }
</script>




<script>
    function kiemTraGia() {
        // Lấy giá trị hdct.donGia từ biến toàn cục
        var hdctDonGia = selectedDonGia;

        // Lấy giá trị ctsp.giaBan từ dữ liệu HTML
        var ctspGiaBan = parseFloat(document.querySelector('[data-bs-target="#nhapImei"]').getAttribute('data-giaban'));

        // In ra console để kiểm tra giá trị
        console.log("hdctDonGia:", hdctDonGia);
        console.log("ctspGiaBan:", ctspGiaBan);

        // Kiểm tra điều kiện so sánh giá trị
        if (hdctDonGia === ctspGiaBan) {
            // Thực hiện hành động nếu giá trị bằng nhau
            console.log("Giá trị hợp lệ. Thực hiện thêm các hành động khác ở đây.");
        } else {
            // Thực hiện hành động nếu giá trị không bằng nhau
            console.log("Giá trị không hợp lệ. Thực hiện hành động khác nếu cần.");
        }
    }
</script>
<%--<script>--%>
<%--    function kiemTraGia() {--%>
<%--        var hdctDonGia = selectedDonGia;--%>
<%--        // Lấy giá trị ctsp.giaBan từ dữ liệu HTML--%>
<%--        var ctspGiaBan = parseFloat(document.querySelector('[data-bs-target="#nhapImei"]').getAttribute('data-giaban'));--%>

<%--        // In ra console để kiểm tra giá trị--%>
<%--        console.log("selectedDonGia:", selectedDonGia);--%>
<%--        console.log("ctspGiaBan:", ctspGiaBan);--%>

<%--        // Kiểm tra điều kiện so sánh giá trị--%>
<%--        if (selectedDonGia >= ctspGiaBan) {--%>
<%--            // Thông báo lỗi nếu giá trị không hợp lệ--%>
<%--            alert("Giá không được lớn hơn hoặc bằng " + ctspGiaBan);--%>
<%--        } else {--%>
<%--            // Thực hiện hành động nếu giá trị hợp lệ--%>
<%--            // Mở modal nhập IMEI--%>
<%--            $('#nhapImei').modal('show');--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>


<script>
    function showDoiTraModal() {
        // Hiển thị modal đổi trả
        $("#doiTra").modal("show");
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
    // Định nghĩa một biến toàn cục để lưu giá trị hdct.donGia
    var selectedDonGia;

    function showChonSanPhamModalWithDonGia(donGia) {
        // Lưu giá trị hdct.donGia vào biến toàn cục
        selectedDonGia = donGia;

        // Gọi hàm hiển thị modal chọn sản phẩm ở đây
        showChonSanPhamModal();
    }

</script>

<script>
    function showChonSanPhamModal() {
        // Hiển thị modal chọn sản phẩm
        $("#exampleModalChonSanPham").modal("show");
    }

</script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"
        integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
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

                    const tr = `
            <tr>
                <td>` + imei.chiTietSanPham.sanPham.ten + `</td>
                <td>` + imei.soImei + `</td>
                <td>` + (imei.tinhTrang == 0 ? "Chưa bán" : "Đã bán") + `</td>
               <td><a href="/doi-tra/them-imei/` + imei.id + `/`+doitraId+`/`+globalHdctId+`">Thêm IMEI</a></td>
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


<script>
    // Lấy giá trị doitraId từ tham số truyền vào URL
    var doitraId = '${param.doitraId}';

    // Thiết lập giá trị vào ô input khi trang được tải
    document.addEventListener('DOMContentLoaded', function() {
        document.getElementById('doitraIdInput').value = doitraId;
    });
</script>

<script>
    // Lấy giá trị doitraId từ tham số truyền vào URL
    var hoadonId = '${param.hoadonId}';


    // Thiết lập giá trị vào ô input khi trang được tải
    document.addEventListener('DOMContentLoaded', function() {
        document.getElementById('hoadonIdInput').value = hoadonId;
    });
</script>

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
</html>

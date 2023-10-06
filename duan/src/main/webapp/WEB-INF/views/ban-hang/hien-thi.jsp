<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Bán Hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <link rel="stylesheet" href="../../vendors/feather/feather.css">
    <link rel="stylesheet" href="../../vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" href="../../vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="../../css/vertical-layout-light/style.css">
    <link rel="shortcut icon" href="../../images/favicon.png"/>
    <style>
        .btn-group {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 75%;
        }

        .btn-group .btn {
            text-align: center;
            margin: 0 auto;
        }

        .btn-group .btn:nth-child(1) {
            width: 100%;
        }

        .btn-group .btn:nth-child(2) {
            width: 20%;
        }
    </style>
</head>
<body>
<section style="text-align: center">
    <div class="row outer-border border border-secondary" style="height: 47px">
        <div class="col-3">
            <form action="/ban-hang/add-hoa-don" method="post" style="text-align: center;margin-top: 6px">
                <button type="submit"><img src="/uploads/plus.png"></button>
            </form>
        </div>
        <div class="col-9">
            <div class="row">
                <c:forEach items="${listHoaDon}" var="hd" varStatus="i">
                    <div class="col-4">
                        <div class="btn-group">
                            <a href="/ban-hang/thong-tin-hoa-don/${hd.id}" class="btn btn-info"
                               style="width: 100%;height: 47px">Hóa Đơn Chờ ${i.index+1}</a>
                            <a href="/ban-hang/remove/${hd.id}" class="btn btn-danger" style="width: 20%;height: 47px">
                                <i class="mdi mdi-close">X</i>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <br>
    <div class="row">
        <h4 style="color: red;margin: 10px;text-align: center">${thongBaoHoaDon}</h4>
    </div>
    <br>
    <c:if test="${hoaDon==null}">
        <div class="row outer-border border border-secondary" style="text-align: center">
            <h3 style="color: red;margin: 10px">Mời chọn hóa đơn</h3>
        </div>
    </c:if>
    <c:if test="${hoaDon!=null}">
        <div class="row">
            <div class="outer-border p-3 border border-secondary">
                <div class="row">
                    <div class="col-12">
                        <div class="outer-border p-3 border border-secondary">
                            <div class="row">
                                <div class="col-7">
                                    <div class="row">
                                        <div class="col-6">
                                            <form method="post" action="/ban-hang/search-san-pham">
                                                <input type="text" name="search-san-pham"
                                                       placeholder="Tìm kiếm sản phẩm">
                                                <button type="submit">Tìm kiếm</button>
                                            </form>
                                        </div>
                                        <div class="col-6"><h6
                                                style="float: left;color: red;margin: 10px">${thongBao}</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-5">
                                    <a href="/ban-hang/hien-thi-san-pham" class="btn btn-info" data-bs-toggle="modal"
                                       data-bs-target="#hienThiSanPham">Lọc sản phẩm</a>
                                </div>
                            </div>
                            <br>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>Mã Sản Phẩm</th>
                                        <th>Tên Sản Phẩm</th>
                                        <th>Ảnh</th>
                                        <th>Hãng</th>
                                        <th>Đơn Giá</th>
                                        <th>Số Lượng</th>
                                        <th>Trạng Thái</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listChiTietSanPham}" var="ctsp">
                                        <tr>
                                            <td>${ctsp.sanPham.ma}</td>
                                            <td>${ctsp.sanPham.ten}</td>
                                            <td align="center">
                                                <img src="/uploads/${ctsp.urlAnh}" width="40" height="40">
                                            </td>
                                            <td>${ctsp.sanPham.hangSanPham.ten}</td>
                                            <td>${ctsp.giaBan}</td>
                                            <td>${ctsp.soLuong}</td>
                                            <td>
                                                <c:if test="${ctsp.tinhTrang==0}">Còn hàng</c:if>
                                                <c:if test="${ctsp.tinhTrang==1}">Hết hàng</c:if>
                                            </td>
                                            <td>
                                                <a href="/ban-hang/them-san-pham/${ctsp.id}"
                                                   class="btn btn-warning btn-icon-text"
                                                   data-bs-toggle="modal" data-bs-target="#nhapImei_${ctsp.id}"
                                                    <%--                                           onclick="openModal('nhapImei_${ctsp.id}')"--%>
                                                >Nhập IMEI</a>
                                                <div class="modal fade" id="nhapImei_${ctsp.id}" tabindex="-1"
                                                     aria-labelledby="exampleModalLabel"
                                                     aria-hidden="true" data-backdrop="static">
                                                    <div class="modal-dialog modal-dialog-centered">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h1 class="modal-title fs-5"
                                                                    id="exampleModalLabel">Danh sách IMEI</h1>
                                                            </div>
                                                            <div class="modal-body">
                                                                <table class="table">
                                                                    <tr>
                                                                            <%--                                                                <form method="post" action="/ban-hang/search-imei"--%>
                                                                            <%--                                                                      id="searchImeiForm">--%>
                                                                        <div>
                                                                            <th>Tìm kiếm IMEI: <input
                                                                                    type="text"
                                                                                    name="search-imei"
                                                                                    placeholder="Tìm kiếm IMEI"
                                                                                    id="imeiSearchInput"></th>
                                                                            <th>
                                                                                <button id="searchImei"
                                                                                        type="button">
                                                                                    Tìm kiếm
                                                                                </button>
                                                                            </th>
                                                                        </div>
                                                                            <%--                                                                </form>--%>

                                                                        <h6 style="text-align: center"
                                                                            id="thongBaoIMEI">${thongBaoIMEI}</h6>
                                                                    </tr>
                                                                </table>
                                                                <div>
                                                                    <table class="table" id="table_id">
                                                                        <thead>
                                                                        <tr>
                                                                            <th>STT</th>
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
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary"
                                                                        data-bs-dismiss="modal">
                                                                    Close
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-12">
                        <div class="outer-border p-3 border border-secondary">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>Tên Sản Phẩm</th>
                                        <th>Số IMEI</th>
                                        <th>Đơn Giá</th>
                                        <th>Số Lượng</th>
                                        <th>Thành tiền</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listHoaDonChiTiet}" var="hdct" varStatus="i">
                                        <tr>
                                            <td>${hdct.imei.chiTietSanPham.sanPham.ten}</td>
                                            <td>${hdct.imei.soImei}</td>
                                            <td>${hdct.donGia}</td>
                                            <td>${hdct.soLuong}</td>
                                            <td>${hdct.donGia * hdct.soLuong}</td>
                                            <td>
                                                <button class="btn btn-warning btn-icon-text"><a
                                                        href="/ban-hang/delete-hoa-don-chi-tiet/${hdct.id}"
                                                        style="text-decoration: none">Xóa sản phẩm</a>
                                                </button>
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
        <br>
        <c:if test="${not listHoaDonChiTiet.isEmpty()}">
            <div class="row">
                <div class="col-12 outer-border p-3 border border-secondary">
                    <form:form action="/ban-hang/thanh-toan/${hoaDon.id}" modelAttribute="hoaDon" method="post">
                        <div class="col-12 grid-margin">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Thông Tin Hóa Đơn</h4>
                                    <form class="form-sample">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <form:label class="col-sm-3 col-form-label"
                                                                path="ma">Mã Hóa Đơn:</form:label>
                                                    <div class="col-sm-9">
                                                        <form:input class="form-control" path="ma" readonly="true"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <form:label class="col-sm-3 col-form-label"
                                                                path="nhanVien">Nhân Viên:</form:label>
                                                    <div class="col-sm-9">
                                                        <form:select path="nhanVien" class="form-control">
                                                            <form:options items="${listNhanVien}" itemLabel="hoTen"
                                                                          itemValue="id"/>
                                                        </form:select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <form:label class="col-sm-3 col-form-label"
                                                                path="khachHang">Khách Hàng:</form:label>
                                                    <div class="col-sm-9">
                                                        <div class="row">
                                                            <div class="d-flex align-items-center">
                                                                <div class="col-10">
                                                                    <form:select path="khachHang" class="form-control"
                                                                                 id="selectKhachHang">
                                                                        <option selected disabled>Khách hàng</option>
                                                                        <form:options items="${listKhachHang}"
                                                                                      itemLabel="hoTen" itemValue="id"/>
                                                                    </form:select>
                                                                </div>
                                                                <div class="col-2">
                                                                    <a href="/ban-hang/modal-khach-hang"
                                                                       class="btn btn-secondary"
                                                                       data-bs-toggle="modal"
                                                                       data-bs-target="#newKhachHang"><img
                                                                            src="/uploads/plus.png" alt=""></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <form:label class="col-sm-3 col-form-label"
                                                                path="diaChi">Địa Chỉ:</form:label>
                                                    <div class="col-sm-9">
                                                        <form:select path="diaChi" class="form-control"
                                                                     id="selectDiaChi">
                                                            <option selected disabled>Địa chỉ</option>
                                                            <form:options items="${listDiaChi}" itemLabel="diaChi"
                                                                          itemValue="id"/>
                                                        </form:select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <form:label class="col-sm-3 col-form-label"
                                                                path="sdt">Số điện thoại:</form:label>
                                                    <div class="col-sm-9">
                                                        <form:input class="form-control" path="sdt"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <form:label class="col-sm-3 col-form-label" path="tongTien"
                                                                for="tienCanThanhToan">Tổng tiền:</form:label>
                                                    <div class="col-sm-9">
                                                        <form:input class="form-control" path="tongTien" readonly="true"
                                                                    value="${tong}"
                                                                    id="tienCanThanhToan"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Tiền Khách Gửi:</label>
                                                    <div class="col-sm-9">
                                                        <input class="form-control" type="text" id="tienKhachDua"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label" for="ketQua">Tiền
                                                        Thừa:</label>
                                                    <div class="col-sm-9">
                                                        <input class="form-control" type="text" id="ketQua" readonly/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="row">
                                                    <form:label class="col-sm-1 col-form-label"
                                                                path="ghiChu">Ghi Chú:</form:label>
                                                    <div class="col-sm-11">
                                                        <form:textarea class="form-control" path="ghiChu"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <button type="submit" class="btn btn-primary"
                                                        onclick="return myFunction4()">Thanh
                                                    Toán
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </c:if>
    </c:if>
</section>
<div class="modal fade" id="newKhachHang" tabindex="-1" aria-labelledby="khachHangLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
            </div>
            <div class="modal-body">
                <form:form modelAttribute="modalAddKhachHang"
                           action="/ban-hang/add-khach-hang" method="post">
                    <div class="col-12 grid-margin">
                        <div class="card">
                            <div class="card-body">
                                <form class="form-sample">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <form:label class="col-sm-3 col-form-label"
                                                            path="hoTen">Tên khách hàng:<label id="tenkh1" style="color: red"></label>
                                                </form:label>
                                                <div class="col-sm-9">
                                                    <form:input class="form-control" placeholder="" path="hoTen"
                                                                id="tenkh"/>
                                                    <form:errors path="hoTen" cssStyle="color: red"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <form:label class="col-sm-3 col-form-label"
                                                            path="email">Email:<label id="email1"
                                                    style="color: red"></label></form:label>
                                                <div class="col-sm-9">
                                                    <form:input class="form-control" placeholder=""
                                                                path="email" id="emailkh"/>
                                                    <form:errors path="email"
                                                                 cssStyle="color: red"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <form:label class="col-sm-3 col-form-label"
                                                            path="sdt">SĐT:<label id="sdtkh1" style="color: red"></label></form:label>
                                                <div class="col-sm-9">
                                                    <form:input class="form-control" placeholder="" path="sdt"
                                                                id="sdtkh"/>
                                                    <form:errors path="sdt"
                                                                 cssStyle="color: red"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <form:label class="col-sm-3 col-form-label"
                                                            path="ngaySinh">Ngày Sinh Khách Hàng:</form:label>
                                                <div class="col-sm-9">
                                                    <form:input class="form-control" placeholder=""
                                                                path="ngaySinh" type="date"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <form:label class="col-sm-3 col-form-label"
                                                            path="diem">Điểm:<label id="diem1" style="color: red"></label></form:label>
                                                <div class="col-sm-9">
                                                    <form:input class="form-control" placeholder=""
                                                                type="number"
                                                                path="diem" id="diemkh"/>
                                                    <form:errors path="diem"
                                                                 cssStyle="color: red"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <form:label class="col-sm-3 col-form-label"
                                                            path="gioiTinh">Giới Tính:</form:label>
                                                <div class="col-sm-9">
                                                    <form:radiobutton path="gioiTinh"
                                                                      value="true" checked="true"/>Nam
                                                    <form:radiobutton path="gioiTinh"
                                                                      value="false"/>Nữ
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <form:label class="col-sm-3 col-form-label"
                                                            path="taiKhoan" for="tkkh">Tài Khoản:</form:label>
                                                <div class="col-sm-9">
                                                    <form:input class="form-control" placeholder=""
                                                                path="taiKhoan" id="tkkh" readonly="true"/>
                                                    <form:errors path="taiKhoan"
                                                                 cssStyle="color: red"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <form:label class="col-sm-3 col-form-label"
                                                            path="matKhau" for="mkkh">Mật Khẩu:</form:label>
                                                <div class="col-sm-9">
                                                    <form:input class="form-control" placeholder=""
                                                                path="matKhau" id="mkkh" readonly="true"/>
                                                    <form:errors path="matKhau"
                                                                 cssStyle="color: red"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group row">
                                                <form:label class="col-sm-3 col-form-label"
                                                            path="hangKhachHang">Hạng Khách Hàng:</form:label>
                                                <div class="col-sm-12">
                                                    <form:select path="hangKhachHang" class="form-control">
                                                        <form:options items="${listHangKhachHang}"
                                                                      itemLabel="ten"
                                                                      itemValue="id"/>
                                                    </form:select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div style="text-align: center">
                                                <button type="submit" class="btn btn-primary mr-2"
                                                        id="btkh" onclick="return checkhkh()">
                                                    Thêm khách hàng
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </form:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                    Close
                </button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="hienThiSanPham" tabindex="-1"
     aria-labelledby="hienThiSanPhamLable"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-body">
                <form action="/ban-hang/loc" method="post"
                      onsubmit="return checkLoc()">
                    <div class="card">
                        <div class="card-body">
                            <form class="forms-sample">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <select name="hang" class="form-control"
                                                    style="font-weight: bold; width: 100%">
                                                <option selected disabled>Hãng</option>
                                                <c:forEach items="${listHang}" var="hang" varStatus="i">
                                                    <option value="${hang.id}">${hang.ten}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <select name="ram" class="form-control"
                                                    style="font-weight: bold; width: 100%">
                                                <option selected disabled>Ram</option>
                                                <c:forEach items="${listRam}" var="ram" varStatus="i">
                                                    <option value="${ram.id}">${ram.dungLuong}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <select name="rom" class="form-control"
                                                    style="font-weight: bold; width: 100%">
                                                <option selected disabled>Rom</option>
                                                <c:forEach items="${listRom}" var="rom" varStatus="i">
                                                    <option value="${rom.id}">${rom.dungLuong}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <select name="chip" class="form-control"
                                                    style="font-weight: bold; width: 100%">
                                                <option selected disabled>Chip</option>
                                                <c:forEach items="${listChip}" var="chip" varStatus="i">
                                                    <option value="${chip.id}">${chip.ten}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <select name="manHinh" class="form-control"
                                                    style="font-weight: bold; width: 100%">
                                                <option selected disabled>Màn Hình</option>
                                                <c:forEach items="${listManHinh}" var="man" varStatus="i">
                                                    <option value="${man.id}">${man.thongSo}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <select name="camera" class="form-control"
                                                    style="font-weight: bold; width: 100%">
                                                <option selected disabled>Camera</option>
                                                <c:forEach items="${listCamera}" var="cam" varStatus="i">
                                                    <option value="${cam.id}">${cam.thongSo}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <select name="dungLuongPin" class="form-control"
                                                    style="font-weight: bold; width: 100%">
                                                <option selected disabled>Dung Lượng Pin</option>
                                                <c:forEach items="${dungLuongPin}" var="pin" varStatus="i">
                                                    <option value="${pin.id}">${pin.thongSo}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="number" name="giaBanMin"
                                                   placeholder="Giá min">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="number" name="giaBanMax"
                                                   placeholder="Giá max">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div style="text-align: center">
                                            <button type="submit" class="btn btn-primary mr-2">Lọc</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"
        integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
        integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
        crossorigin="anonymous"></script>
<script src="../../vendors/js/vendor.bundle.base.js"></script>
<script src="../../js/off-canvas.js"></script>
<script src="../../js/hoverable-collapse.js"></script>
<script src="../../js/template.js"></script>
<script src="../../js/settings.js"></script>
<script src="../../js/todolist.js"></script>
<script>
    function myFunction1() {
        let text = "Bạn chắc chắn muốn thêm";
        let kt = confirm(text);
        if (kt == true) {
            return true
        } else {
            return false;
        }
    }

    function myFunction2() {
        let text = "Bạn chắc chắn muốn sửa";
        let kt = confirm(text);
        if (kt == true) {
            return true
        } else {
            return false;
        }
    }

    function myFunction3() {
        let text = "Bạn chắc chắn muốn xóa";
        let kt = confirm(text);
        if (kt == true) {
            confirm("Xóa thành công");
            return true
        } else {
            return false;
        }
    }

    function myFunction4() {
        let text = "Bạn chắc chắn muốn thanh toán không";
        let kt = confirm(text);
        if (kt == true) {
            confirm("Thanh toán thành công");
            return true
        } else {
            return false;
        }
    }

    document.getElementById("tienKhachDua").addEventListener("keyup", function () {
        tinhTienThua();
    });

    function tinhTienThua() {
        var tongTien = parseFloat(document.getElementById("tienCanThanhToan").value);
        var tienKhachDua = parseFloat(document.getElementById("tienKhachDua").value);
        var tienThua = tienKhachDua - tongTien;

        var ketQuaElement = document.getElementById("ketQua");
        if (tienThua >= 0) {
            ketQuaElement.value = tienThua.toFixed(2);
        } else {
            ketQuaElement.value = "Khách đưa không đủ tiền.";
        }
    }

    document.getElementById("emailkh").addEventListener("keyup", function () {
        taiKhoan();
    });

    function taiKhoan() {
        var email = document.getElementById("emailkh").value;
        var tk = email;

        var ketQuaElement = document.getElementById("tkkh");
        if (email == '') {
            ketQuaElement.value = "Hãy nhập email";
        } else {
            ketQuaElement.value = tk;
        }
    }

    document.getElementById("emailkh").addEventListener("keyup", function () {
        matKhau();
    });

    function matKhau() {
        var email = document.getElementById("emailkh").value;
        var matKhau = "12345678";

        var ketQuaElement = document.getElementById("mkkh");
        if (email == '') {
            ketQuaElement.value = "Hãy nhập email";
        } else {
            ketQuaElement.value = matKhau;
        }
    }

    function checkhkh() {
        var tenhkh = document.getElementById("tenkh").value;
        var sdtkh = document.getElementById("sdtkh").value;
        var email = document.getElementById("emailkh").value;
        var diem = document.getElementById("diemkh").value;
        var tk = document.getElementById("tkkh").value;
        var mk = document.getElementById("mkkh").value;

        if (
            tenhkh.trim().length < 6 || tenhkh == ''
        ) {
            document.getElementById("btkh").type = "button";
            document.getElementById("tenkh1").innerHTML = "Không để trống ,Tên ít nhất 6 ký tự";
            return false;
        } else {
            document.getElementById("tenkh1").innerHTML = "";
            var regex = /^0\d{9}$/;
            var regexemail = /^.{8,}@gmail\\.com$/

            if (regex.test(sdtkh)) {
                document.getElementById("sdtkh1").innerHTML = "";
                document.getElementById("btkh").type = "submit";
                return true;
            } else {
                document.getElementById("sdtkh1").innerHTML = "SDT phải 10 số và bắt đầu là số 0";
                if (regexemail.test(email)) {
                    document.getElementById("email1").innerHTML = "";
                    document.getElementById("btkh").type = "submit";
                    return true;
                } else {
                    document.getElementById("email1").innerHTML = "email chưa đúng";
                    if (diem == '') {
                        document.getElementById("btkh").type = "button";
                        document.getElementById("diem1").innerHTML = "Điểm ít nhất là 1";
                        return false;
                    } else {
                        document.getElementById("diem1").innerHTML = "";
                        document.getElementById("btkh").type = "submit";
                        return true;
                    }
                }
            }
        }
    }
</script>
<script>
    $('div[id^="nhapImei_"]').on('show.bs.modal', async function (e) {
        const ctspId = e.currentTarget.id.split("_")[1];
        const url = "http://localhost:8080/ban-hang/them-san-pham/" + ctspId;
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
                <td><a href="/ban-hang/them-imei/` + imei.id + `">Thêm IMEI</a></td>
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
<script>
    $('button[id^="searchImei"]').on('click', async function (e) {
        const btn = $(this);
        const parentModal = btn.closest('.modal'); // Lấy modal cha gần nhất của nút "Tìm kiếm" được nhấn
        const search = parentModal.find("#imeiSearchInput").val();
        const url = "http://localhost:8080/ban-hang/search-imei?search-imei=" + search;
        try {
            const resp = await fetch(url);
            const data = await resp.json();
            console.log(data)
            let html = ``;
            for (let i = 0; i < data.length; i++) {
                const imei = data[i];
                const tr = `
            <tr>
                <td>` + (i + 1) + `</td>
                <td>` + imei.soImei + `</td>
                <td>` + (imei.tinhTrang == 0 ? "Chưa bán" : "Đã bán") + `</td>
                <td><a href="/ban-hang/them-imei/` + imei.id + `">Thêm IMEI</a></td>
            </tr>
            `;
                html += tr;
            }
            parentModal.find(".imei_search").html(html);
        } catch (err) {
            console.error(err)
        }
    });
</script>
<!-- jQuery -->
<script src="/vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!-- FastClick -->
<script src="/vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="/vendors/nprogress/nprogress.js"></script>
<!-- Chart.js -->
<script src="/vendors/Chart.js/dist/Chart.min.js"></script>
<!-- gauge.js -->
<script src="/vendors/gauge.js/dist/gauge.min.js"></script>
<!-- bootstrap-progressbar -->
<script src="/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<!-- iCheck -->
<script src="/vendors/iCheck/icheck.min.js"></script>
<!-- Skycons -->
<script src="/vendors/skycons/skycons.js"></script>
<!-- Flot -->
<script src="/vendors/Flot/jquery.flot.js"></script>
<script src="/vendors/Flot/jquery.flot.pie.js"></script>
<script src="/vendors/Flot/jquery.flot.time.js"></script>
<script src="/vendors/Flot/jquery.flot.stack.js"></script>
<script src="/vendors/Flot/jquery.flot.resize.js"></script>
<!-- Flot plugins -->
<script src="/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
<script src="/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
<script src="/vendors/flot.curvedlines/curvedLines.js"></script>
<!-- DateJS -->
<script src="/vendors/DateJS/build/date.js"></script>
<!-- JQVMap -->
<script src="/vendors/jqvmap/dist/jquery.vmap.js"></script>
<script src="/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
<script src="/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
<!-- bootstrap-daterangepicker -->
<script src="/vendors/moment/min/moment.min.js"></script>
<script src="/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

<!-- Custom Theme Scripts -->
<script src="/build/js/custom.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

</html>
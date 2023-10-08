<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Skydash Admin</title>
    <link rel="stylesheet" href="../../vendors/feather/feather.css">
    <link rel="stylesheet" href="../../vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" href="../../vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="../../css/vertical-layout-light/style.css">
    <link rel="shortcut icon" href="../../images/favicon.png"/>
</head>
<body>

<div class="main" style="border: 2px solid black; border-radius: 1.8% 0% 0% 0%">
    <div>
        <ul class="nav nav-tabs border-top" id="setting-panel" role="tablist">
            <li class="nav-item">
                <a href="/hoa-don/hien-thi" class="btn btn-danger btn-icon-text"
                   tabindex="-1"
                   role="button">
                    <i class="ti-reload btn-icon-prepend"></i>
                    Trang Hóa đơn</a>
            </li>
            <li class="nav-item" style="border-radius: 2%">
                <a class="nav-link" role="tab">Xem hóa đơn</a>
            </li>
        </ul>
    </div>

    <div class="container">
        <div class="col-12 grid-margin">
            <h3 style="text-align: center">Hóa đơn</h3>
            <div class="card">
                <div class="card-body">
                    <form:form action="/hoa-don/detail/${hoaDon.id}" method="get" modelAttribute="hoaDon">
<%--                        <form class="form-sample">--%>
<%--                            <br>--%>
<%--                            --%>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Mã:</label>
                                        <div class="col-sm-9">
                                            <form:input class="form-control" id="form-control" readonly="true"
                                                        placeholder=""
                                                        path="ma"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Khách hàng:
                                        </label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="khachHangInput" name="khachHang" value="${hoaDon.khachHang.hoTen}" readonly>
                                        <%--                                            <form:input  class="form-control"  path="hoTen">${hoaDon.khachHang.hoTen}</form:input>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Nhân viên:
                                        </label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="nhanVienInput" name="nhanVien" value="${hoaDon.nhanVien.hoTen}" readonly>
                                        <%--                                            <form:label class="form-label" path="khachHang">Hãng khách hàng: ${hoaDon.khachHang.hoTen}</form:label>--%>
                                        <%--                                            <form:input  class="form-control" path="hoTen"--%>
<%--                                            >${hoaDon.nhanVien.hoTen}</form:input>--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">SĐT:
                                        </label>
                                        <div class="col-sm-9">
                                            <form:input class="form-control" placeholder="" readonly="true"
                                                        path="sdt"></form:input>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row" style="display: none">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Quy đổi:
                                        </label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="quyDoiInput" name="quyDoi" value="${hoaDon.quyDoi.soTienQuyDoi}" readonly>

                                        <%--                                            <form:input class="form-control" path="quyDoi" readonly="true"--%>
<%--                                            >${hoaDon.quyDoi.soTienQuyDoi}</form:input>--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Địa chỉ:</label>
                                            <div class="col-sm-9">

                                                <input type="text" class="form-control" id="diaChiInput" name="diaChi" value="${hoaDon.diaChi.hoTen}" readonly>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Tổng tiền:
                                        </label>
                                        <div class="col-sm-9">
                                            <form:input class="form-control" placeholder="" readonly="true"
                                                        path="tongTien"></form:input>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Ngày tạo:
                                            <div id="tb" style="color: crimson;float: right"></div>
                                        </label>
                                        <div class="col-sm-9">
                                            <form:input readonly="true" class="form-control" type="date"
                                                        value="${hoaDon.ngayTao}"
                                                        placeholder=""
                                                        path="ngayTao"></form:input>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Ngày nhận:
                                            <div style="color: crimson;float: right"></div>
                                        </label>
                                        <div class="col-sm-9">
                                            <form:input readonly="true" class="form-control" type="date"
                                                        value="${hoaDon.ngayNhan}"
                                                        placeholder=""
                                                        path="ngayNhan"></form:input>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Ngày ship:
                                            <div style="color: crimson;float: right"></div>
                                        </label>
                                        <div class="col-sm-9">
                                            <form:input readonly="true" class="form-control" type="date"
                                                        value="${hoaDon.ngayShip}"
                                                        placeholder=""
                                                        path="ngayShip"></form:input>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </form:form>
                </div>
            </div>
        </div>

        <br>
        <h3 style="text-align: center;">Hóa đơn chi tiết</h3>
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>Mã hóa đơn</th>
                    <th>Tên sản phẩm</th>
                    <th>Số lượng</th>
                    <th>Tình trạng</th>
                    <th>Đơn giá</th>
                    <th>Thành tiền</th>
                </tr>
                </thead>
                <tbody>
                <i class="mdi mdi-border-color"></i>
                <c:forEach items="${listHoaDonChiTiet}" var="hdct">
                    <tr>
                        <td>${hdct.hoaDon.ma}</td>
                        <td>${hdct.imei.chiTietSanPham.sanPham.ten}</td>
                        <td>${hdct.soLuong}</td>
                        <td>
                            <c:if test="${hoaDon.tinhTrang == 0}">Đang chờ</c:if>
<%--                            <c:if test="${hoaDon.tinhTrang == 1}">Đã xác nhận</c:if>--%>
                            <c:if test="${hoaDon.tinhTrang == 2}">Đã thanh toán</c:if>
<%--                            <c:if test="${hoaDon.tinhTrang == 3}">Chờ thanh toán</c:if>--%>
<%--                            <c:if test="${hoaDon.tinhTrang == 4}">Chờ vận chuyển</c:if>--%>
<%--                            <c:if test="${hoaDon.tinhTrang == 5}">Đang vận chuyển</c:if>--%>
<%--                            <c:if test="${hoaDon.tinhTrang == 6}">Vận chuyển hoàn tất</c:if>--%>
<%--                            <c:if test="${hoaDon.tinhTrang == 7}">Giao trễ</c:if>--%>
                            <c:if test="${hoaDon.tinhTrang == 8}">Đã hủy</c:if>
                        </td>
                        <td>${hdct.donGia}</td>
                        <td>${hdct.donGia * hdct.soLuong}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>





    </div>
</div>
</body>
<script src="../../vendors/js/vendor.bundle.base.js"></script>
<script src="../../js/off-canvas.js"></script>
<script src="../../js/hoverable-collapse.js"></script>
<script src="../../js/template.js"></script>
<script src="../../js/settings.js"></script>
<script src="../../js/todolist.js"></script>

</html>

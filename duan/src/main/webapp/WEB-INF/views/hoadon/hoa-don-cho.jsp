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
    <!-- Thêm CSS và JS của Select2 -->

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css"/>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css"/>
    <!-- Or for RTL support -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.rtl.min.css"/>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.full.min.js"></script>

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
                <a class="nav-link" href="/hoa-don/view-add" role="tab">Thêm hóa đơn chờ</a>
            </li>
            <li class="nav-item" style="border-radius: 2%">
                <a class="nav-link" href="/hoa-don/view-loc" role="tab">Lọc hóa đơn</a>
            </li>
        </ul>
    </div>

    <div class="container">
        <div class="col-12 grid-margin">
            <div class="card">
                <div class="card-body">
                    <form:form action="/hoa-don/add" method="post" modelAttribute="hoaDon">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">

                                    <form:label path="khachHang"
                                                class="col-sm-3 col-form-label">khách hàng:</form:label>
                                    <div class="col-sm-9">
                                        <form:select path="khachHang" items="${listKhachHang}"
                                                     class="form-control select2"
                                                     itemLabel="hoTen"
                                                     itemValue="id" id="searchKhachHang">
                                        </form:select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Nhân viên:
                                    </label>
                                    <div class="col-sm-9">
                                        <form:select path="nhanVien" items="${listNhanVien}"
                                                     class="form-control select2"
                                                     itemLabel="hoTen"
                                                     itemValue="id" id="searchNhanVien">
                                        </form:select>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">SĐT:</label>
                                    <div class="col-sm-9">
                                        <form:input class="form-control" placeholder=""
                                                    path="sdt"></form:input>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Tổng tiền:
                                    </label>
                                    <div class="col-sm-9">
                                        <form:input class="form-control" placeholder=""
                                                    path="tongTien"></form:input>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row" style="display: none">
                            <div class="col-md-6">
                                <div class="form-group row">
                                </div>
                                <label class="col-sm-3 col-form-label">Quy đổi:
                                </label>
                                <div class="col-sm-9">
                                        <%--                                    <select id="searchQuyDoi" class="form-control select2"--%>
                                        <%--                                            style="font-weight: bold; width: 100%">--%>
                                        <%--                                        <option value="null">Nhập hoặc chọn trong danh sách</option>--%>
                                        <%--                                        <c:forEach items="${listQuyDoi}" var="quyDoi">--%>
                                        <%--                                            <option value="${quyDoi.id}">${quyDoi.hoTen}</option>--%>
                                        <%--                                        </c:forEach>--%>
                                        <%--                                    </select>--%>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Ngày tạo:
                                        <div id="tb" style="color: crimson;float: right"></div>
                                    </label>
                                    <div class="col-sm-9">
                                        <form:input class="form-control" type="date"
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
                                        <form:input class="form-control" type="date"
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
                                        <form:input class="form-control" type="date"
                                                    value="${hoaDon.ngayShip}"
                                                    placeholder=""
                                                    path="ngayShip"></form:input>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div align="center">
                            <BUTTON type="submit" class="btn btn-warning" style="" id="bt"
                                    onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                add
                            </BUTTON>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>

    $('#searchKhachHang').select2({
        theme: 'bootstrap-5'
    });
    $('#searchNhanVien').select2({
        theme: 'bootstrap-5'
    });
    $('#searchDiaChi').select2({
        theme: 'bootstrap-5'
    });


</script>

<script src="../../vendors/js/vendor.bundle.base.js"></script>
<script src="../../js/off-canvas.js"></script>
<script src="../../js/hoverable-collapse.js"></script>
<script src="../../js/template.js"></script>
<script src="../../js/settings.js"></script>
<script src="../../js/todolist.js"></script>

</html>

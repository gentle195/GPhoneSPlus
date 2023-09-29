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
<div>
    <ul class="nav nav-tabs border-top" id="setting-panel" role="tablist">
        <li class="nav-item">
            <a class="nav-link" href="/san-pham/hien-thi" role="tab">Thông tin sản phẩm </a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab"
               aria-controls="description" aria-selected="true">Update</a>
        </li>
    </ul>
</div>
<form:form action="/san-pham/update/${dulieuxem.id}" method="post" modelAttribute="dulieuxem">
    <%--    <div class="col-md-6 grid-margin stretch-card" >--%>
    <%--    <div class="col-md-6 grid-margin stretch-card" >--%>
    <div class="col-12 grid-margin">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Sản Phẩm</h4>
                <form class="form-sample">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label" for="ten">Tên:</label>
                                <div class="col-sm-9">
                                    <form:input type="text" class="form-control" path="ten" id="ten"/>
                                    <form:errors path="ten" cssClass="error text-danger"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label" for="heDieuHanh">Hệ điều hành:</label>
                                <div class="col-sm-9">
                                    <form:input type="text" class="form-control" path="heDieuHanh" id="heDieuHanht"/>
                                    <form:errors path="heDieuHanh" cssClass="error text-danger"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label" for="soSim">Số khe sim:</label>
                                <div class="col-sm-9">
                                    <form:input class="form-control" path="soSim" type="number"/>
                                    <form:errors path="soSim" cssClass="error text-danger"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label" for="bluetooth">Kết nối bluetooth:</label>
                                <div class="col-sm-9">
                                    <form:input type="text" class="form-control" path="bluetooth"/>
                                    <form:errors path="bluetooth" cssClass="error text-danger"/>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Hỗ trợ mạng:</label>
                                <div class="col-sm-9">
                                    <form:input type="text" class="form-control" path="hoTroMang"/>
                                    <form:errors path="hoTroMang" cssClass="error text-danger"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Cổng giao tiếp:</label>
                                <div class="col-sm-9">
                                    <form:input type="text" class="form-control" path="congGiaoTiep"/>
                                    <form:errors path="congGiaoTiep" cssClass="error text-danger"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label" for="thongSoWifi">Thông số Wifi:</label>
                                <div class="col-sm-9">
                                    <form:input type="text" class="form-control" path="thongSoWifi"/>
                                    <form:errors path="thongSoWifi" cssClass="error text-danger"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label" for="kichThuoc">Kích thước </label>
                                <div class="col-sm-9">
                                    <form:input type="text" class="form-control" path="kichThuoc"/>
                                    <form:errors path="kichThuoc" cssClass="error text-danger"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label" for="trongLuong">Trọng lượng:</label>
                                <div class="col-sm-9">
                                    <form:input type="text" class="form-control" path="trongLuong"/>
                                    <form:errors path="trongLuong" cssClass="error text-danger"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label" for="chatLieu">Chất liệu:</label>
                                <div class="col-sm-9">
                                    <form:input type="text" class="form-control" path="chatLieu"/>
                                    <form:errors path="chatLieu" cssClass="error text-danger"/>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label" for="moTa">Mô tả::</label>
                                <div class="col-sm-9">
                                    <form:textarea type="text" class="form-control" path="moTa"/>
                                    <form:errors path="moTa" cssClass="error text-danger"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label" for="hangSanPham">Hãng Sản Phẩm:</label>
                                <div class="col-sm-9">
                                    <div class="d-flex align-items-center"> <!-- Sử dụng d-flex để cùng một dòng -->
                                        <form:select class="form-control" path="hangSanPham" items="${listHangSP}"
                                                     itemValue="id" itemLabel="ten"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label" for="manHinh">Màn Hình:</label>
                                <div class="col-sm-9">
                                    <div class="d-flex align-items-center"> <!-- Sử dụng d-flex để cùng một dòng -->
                                        <form:select class="form-control" path="manHinh" items="${listManHinh}"
                                                     itemValue="id" itemLabel="thongSo"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label" for="camera">Camera:</label>
                                <div class="col-sm-9">
                                    <div class="d-flex align-items-center"> <!-- Sử dụng d-flex để cùng một dòng -->
                                        <form:select class="form-control" path="camera" items="${listCamera}"
                                                     itemValue="id" itemLabel="thongSo"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div style="text-align: center">
                        <button type="submit" class="btn btn-primary mr-2"
                                onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                            UPDATE
                        </button>
                    </div>

                </form>
            </div>
        </div>
    </div>
    <%--    </div>--%>
</form:form>

<script src="../../vendors/js/vendor.bundle.base.js"></script>
<script src="../../js/off-canvas.js"></script>
<script src="../../js/hoverable-collapse.js"></script>
<script src="../../js/template.js"></script>
<script src="../../js/settings.js"></script>
<script src="../../js/todolist.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>

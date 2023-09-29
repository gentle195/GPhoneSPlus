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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>

</head>
<body>
<div>
    <ul class="nav nav-tabs border-top" id="setting-panel" role="tablist">
        <li class="nav-item">
            <a class="nav-link" href="/san-pham/hien-thi" role="tab">Thông tin Sản Phẩm</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" id="description-tab" data-toggle="tab" href="/san-pham/hien-thi" role="tab"
               aria-controls="description" aria-selected="true">Thêm sản phẩm</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/san-pham/hien-thi-tung-xoa" role="tab">Sản Phẩm đã xoá</a>
        </li>
    </ul>
</div>
<div class="tab-content" id="myTabContent">
    <div class="tab-pane fade show active" id="description" role="tabpanel"
         aria-labelledby="description-tab">
        <form:form action="/san-pham/add" method="post" modelAttribute="dulieuxem">
            <%--    <div class="col-md-6 grid-margin stretch-card" >--%>
            <div class="col-12 grid-margin">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Sản Phẩm</h4>
                        <form class="form-sample">
                            <p class="card-description">

                            </p>
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
                                            <form:input type="text" class="form-control" path="heDieuHanh"
                                                        id="heDieuHanht"/>
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
                                        <label class="col-sm-3 col-form-label" for="bluetooth">Kết nối
                                            bluetooth:</label>
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
                                            <div class="d-flex align-items-center">
                                                <!-- Sử dụng d-flex để cùng một dòng -->
                                                <form:select class="form-control" path="hangSanPham"
                                                             items="${listHangSP}" itemValue="id" itemLabel="ten"/>
                                                <a type="button" data-bs-toggle="modal" data-bs-toggle="modal"
                                                   data-bs-target="#exampleModalHangSanPham" style="margin: 10px">
                                                    <img src="/uploads/plus.png" alt="">
                                                </a>
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
                                            <div class="d-flex align-items-center">
                                                <!-- Sử dụng d-flex để cùng một dòng -->
                                                <form:select class="form-control" path="manHinh" items="${listManHinh}"
                                                             itemValue="id" itemLabel="thongSo"/>
                                                <a type="button" data-bs-toggle="modal" data-bs-toggle="modal"
                                                   data-bs-target="#exampleModalManHinh" style="margin: 10px">
                                                    <img src="/uploads/plus.png" alt="">
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label" for="camera">Camera:</label>
                                        <div class="col-sm-9">
                                            <div class="d-flex align-items-center">
                                                <!-- Sử dụng d-flex để cùng một dòng -->
                                                <form:select class="form-control" path="camera" items="${listCamera}"
                                                             itemValue="id" itemLabel="thongSo"/>
                                                <a type="button" data-bs-toggle="modal" data-bs-toggle="modal"
                                                   data-bs-target="#exampleModalCamera" style="margin: 10px">
                                                    <img src="/uploads/plus.png" alt="">
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div style="text-align: center">
                                <button type="submit" class="btn btn-primary mr-2"
                                        onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                    ADD
                                </button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>

            <%--    </div>--%>
        </form:form>
    </div>
</div>
</body>

<div class="modal fade" id="exampleModalManHinh" tabindex="-1" aria-labelledby="exampleModalLabelManHinh"
     aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabelManHinh">Màn Hình</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="imeiList">
                    <table class="table">
                        <form:form action="/san-pham/modal-add-man-hinh" method="post" modelAttribute="manHinh">
                            <h1 style="text-align: center">ADD Thông Tin Màn Hình</h1>
                            <table class="table " style="border: aliceblue 1px">
                                <tbody>
                                <tr>
                                    <td><form:label path="thongSo">Thông số màn hình</form:label></td>
                                    <th><form:input path="thongSo" id="tent"></form:input></th>
                                    <th><form:errors path="thongSo" cssClass="error text-danger"></form:errors></th>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td><form:label path="loaiCamUng">Loại cảm ứng màn hình</form:label></td>
                                    <th><form:input path="loaiCamUng" id="tent"></form:input></th>
                                    <th><form:errors path="loaiCamUng" cssClass="error text-danger"></form:errors></th>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td><form:label path="tiLeKhungHinh">Tỉ lệ khung hình</form:label></td>
                                    <th><form:input path="tiLeKhungHinh" id="tent"></form:input></th>
                                    <th><form:errors path="tiLeKhungHinh"
                                                     cssClass="error text-danger"></form:errors></th>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td><form:label path="congNghe">Công nghệ màn hình</form:label></td>
                                    <th><form:input path="congNghe" id="tent"></form:input></th>
                                    <th><form:errors path="congNghe" cssClass="error text-danger"></form:errors></th>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td><form:label path="doPhanGiai">Độ phân giải</form:label></td>
                                    <th><form:input path="doPhanGiai" id="tent"></form:input></th>
                                    <th><form:errors path="doPhanGiai" cssClass="error text-danger"></form:errors></th>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td><form:label path="tanSoQuet">Tần số quét</form:label></td>
                                    <th><form:input path="tanSoQuet" id="tent"></form:input></th>
                                    <th><form:errors path="tanSoQuet" cssClass="error text-danger"></form:errors></th>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td><form:label path="tinhTrang">Trạng thái</form:label></td>
                                    <th><form:radiobutton path="tinhTrang" value="0" label="Hoạt động"/>
                                        <form:radiobutton path="tinhTrang" value="1" label="Ngừng hoạt động"/>
                                    </th>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td><form:label path="moTa">Mô tả</form:label></td>
                                    <th><form:textarea path="moTa"></form:textarea></th>
                                    <th><form:errors path="moTa" cssClass="error text-danger"></form:errors></th>
                                </tr>
                                </tbody>
                                <tr>
                                    <td>
                                        <button type="submit" style="float: right" class="btn btn-success"
                                                id="btt" onclick="return myFunction1()">Add
                                        </button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </form:form>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="exampleModalHangSanPham" tabindex="-1" aria-labelledby="exampleModalLabelHangSanPham"
     aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabelHangSanPham">Hãng SP</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="imeiList">
                    <table class="table">
                        <form:form action="/san-pham/modal-add-hang-sp" method="post" modelAttribute="hangSP">
                            <h1 style="text-align: center">Add Hãng Sản Phẩm</h1>

                            <table class="table " style="border: aliceblue 1px">
                                <tbody>
                                <tr>
                                    <td> Tên:</td>
                                    <th><form:input path="ten" id="tent"></form:input></th>
                                    <td><form:errors path="ten" cssClass="error text-danger"/></td>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td> Xuất Sứ:</td>
                                    <th><form:input path="xuatSu" id="tent"></form:input></th>
                                    <td><form:errors path="xuatSu" cssClass="error text-danger"/></td>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td> Trang thai:</td>
                                    <th><form:radiobutton path="tinhTrang" value="0"
                                                          label="Hoạt động"></form:radiobutton>
                                        <form:radiobutton path="tinhTrang" value="1"
                                                          label="Ngừng hoạt động"></form:radiobutton>
                                    </th>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td>Mo ta:</td>
                                    <th><form:textarea path="moTa"></form:textarea></th>
                                    <td><form:errors path="moTa" cssClass="error text-danger"/></td>
                                </tr>
                                </tbody>
                                <tr>
                                    <td>

                                        <button type="submit" style="float: right" class="btn btn-success"
                                                id="btt" onclick="return myFunction1()">Add
                                        </button>
                                    </td>
                                    <th></th>
                                </tr>
                                </tbody>

                            </table>
                        </form:form>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="exampleModalCamera" tabindex="-1" aria-labelledby="exampleModalLabelCamera"
     aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabelCamera">Camera</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="imeiList">
                    <table class="table">
                        <form:form action="/san-pham/modal-add-camera" method="post" modelAttribute="camera">
                            <h1 style="text-align: center">ADD Thông Tin Camera</h1>
                            <table class="table " style="border: aliceblue 1px">
                                <tbody>
                                <tr>
                                    <td><form:label path="thongSo">Thông số camera</form:label></td>
                                    <th><form:input path="thongSo" id="tent"></form:input></th>
                                    <th><form:errors path="thongSo" cssClass="error text-danger"></form:errors></th>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td><form:label path="tinhTrang">Trạng thái</form:label></td>
                                    <th><form:radiobutton path="tinhTrang" value="0" label="Hoạt động"/>
                                        <form:radiobutton path="tinhTrang" value="1" label="Ngừng hoạt động"/>
                                    </th>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td><form:label path="moTa">Mô tả</form:label></td>
                                    <th><form:textarea path="moTa"></form:textarea></th>
                                    <th><form:errors path="moTa" cssClass="error text-danger"></form:errors></th>
                                </tr>
                                </tbody>
                                <tr>
                                    <td>
                                        <button type="submit" style="float: right" class="btn btn-success"
                                                id="btt" onclick="return myFunction1()">Add
                                        </button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </form:form>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<script src="../../vendors/js/vendor.bundle.base.js"></script>
<script src="../../js/off-canvas.js"></script>
<script src="../../js/hoverable-collapse.js"></script>
<script src="../../js/template.js"></script>
<script src="../../js/settings.js"></script>
<script src="../../js/todolist.js"></script>
</html>

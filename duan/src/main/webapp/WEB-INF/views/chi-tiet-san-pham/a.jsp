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
            <a class="nav-link" href="/chi-tiet-san-pham/hien-thi" role="tab">Quay lại</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab"
               aria-controls="description" aria-selected="true" role="tab">Thông tin chi tiết sản phẩm</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/chi-tiet-san-pham/hien-thi-da-xoa" role="tab">Sản phẩm đã xóa</a>
        </li>


    </ul>
</div>
<div class="tab-content" id="myTabContent">
    <div class="tab-pane fade show active" id="description" role="tabpanel"
         aria-labelledby="description-tab">
        <form:form action="/chi-tiet-san-pham/update/${chitietsanphamupdate.id}" method="post"
                   modelAttribute="chitietsanphamupdate" enctype="multipart/form-data">
            <%--    <div class="col-md-6 grid-margin stretch-card" >--%>
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Thông tin chi tiết sản phẩm</h4>
                    <form class="forms-sample">
                        <div class="row">
                            <div class="col-md-12 mx-auto">
                                <div class="form-group">

                                    <div id="image-container"
                                         style=" max-width: 300px;max-height: 300px;overflow: hidden;">
                                        <img id="preview-image" src="" alt="Ảnh xem trước"
                                             style="max-width: 40%; max-height: 40%;">
                                    </div>

                                    <input type="file" class="form-control" name="images" id="image-input"
                                           accept="image/*" style="border: none;"
                                           required>
                                </div>

                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-6">

                                <div class="form-group">

                                    <div class="row">
                                        <div class="col-11">
                                            <form:select path="sanPham" class="form-control" id="selectSanPham"
                                                         cssStyle="font-weight: bold; width: 100%">
                                                <option selected disabled>Sản phẩm</option>
                                                <form:options items="${listSanPham}" itemLabel="ten" itemValue="id"/>
                                            </form:select>
                                            <form:errors path="sanPham"/>
                                        </div>
                                        <div class="col-1">
                                            <a type="button" data-bs-toggle="modal"
                                               data-bs-target="#exampleModalSanPham">
                                                <img src="../img/plus.png">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-11">
                                            <form:select path="mauSac" class="form-control" id="selectMauSac"
                                                         cssStyle="font-weight: bold; width: 100%">
                                                <option selected disabled>Màu sắc</option>
                                                <form:options items="${listMauSac}" itemLabel="ten" itemValue="id"/>
                                            </form:select>
                                        </div>
                                        <div class="col-1">
                                            <a type="button" data-bs-toggle="modal"
                                               data-bs-target="#exampleModalMauSac">
                                                <img src="../img/plus.png">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-11">
                                            <form:select path="chip" class="form-control" id="selectChip"
                                                         cssStyle="font-weight: bold; width: 100%">
                                                <option selected disabled>Chip</option>
                                                <form:options items="${listChip}" itemLabel="ten" itemValue="id"/>
                                            </form:select>
                                        </div>
                                        <div class="col-1">
                                            <a type="button" data-bs-toggle="modal" data-bs-target="#exampleModalChip">
                                                <img src="../img/plus.png">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-11">
                                            <form:select path="ram" class="form-control" id="selectRam"
                                                         cssStyle="font-weight: bold; width: 100%">
                                                <option selected disabled>Dung lượng bộ nhớ</option>
                                                <form:options items="${listRam}" itemLabel="dungLuong" itemValue="id"/>
                                            </form:select>
                                        </div>
                                        <div class="col-1">
                                            <a type="button" data-bs-toggle="modal" data-bs-target="#exampleModalRam">
                                                <img src="../img/plus.png">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-11">
                                            <form:select path="rom" class="form-control" id="selectRom"
                                                         cssStyle="font-weight: bold; width: 100%">
                                                <option selected disabled>Dung lượng lưu trữ</option>
                                                <form:options items="${listRom}" itemLabel="dungLuong" itemValue="id"/>
                                            </form:select>
                                        </div>
                                        <div class="col-1">
                                            <a type="button" data-bs-toggle="modal" data-bs-target="#exampleModalRom">
                                                <img src="../img/plus.png">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-11">
                                            <form:select path="pin" class="form-control" id="selectPin"
                                                         cssStyle="font-weight: bold; width: 100%">
                                                <option selected disabled>Pin</option>
                                                <form:options items="${listPin}" itemLabel="dungLuongPin.thongSo"
                                                              itemValue="id"/>
                                            </form:select>
                                        </div>
                                        <div class="col-1">
                                            <a type="button" data-bs-toggle="modal" data-bs-target="#exampleModalPin">
                                                <img src="../img/plus.png">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                                <%--                            <div class="form-group">--%>
                                <%--                                <form:label class="form-label" path="tinhTrang">Tình Trạng:</form:label>--%>
                                <%--                                <form:radiobutton path="tinhTrang" value="0"/>Ngừng kinh doanh--%>
                                <%--                                <form:radiobutton path="tinhTrang" value="1" checked="true"/> Còn kinh doanh--%>
                                <%--                            </div>--%>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <form:label class="form-label" path="giaNhap">Giá nhập:</form:label>
                                    <form:input class="form-control" placeholder="" path="giaNhap"/>
                                    <form:errors path="giaNhap" cssStyle="color: red"/>
                                </div>
                                <div class="form-group">
                                    <form:label class="form-label" path="giaBan">Giá bán:</form:label>
                                    <form:input class="form-control" placeholder="" path="giaBan"/>
                                    <form:errors path="giaBan" cssStyle="color: red"/>
                                </div>

                                <div class="form-group">
                                    <form:label class="form-label" path="namBaoHanh">Năm bảo hành:</form:label>
                                    <form:input class="form-control" placeholder="" path="namBaoHanh"/>
                                    <form:errors path="namBaoHanh" cssStyle="color: red"/>
                                </div>
                                <div class="form-group">
                                    <form:label class="form-label" path="soLuong">Số lượng tồn:</form:label>
                                    <form:input class="form-control" placeholder="" path="soLuong"/>
                                    <form:errors path="soLuong" cssStyle="color: red"/>
                                </div>

                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <form:label class="form-label" path="moTa">Mô tả:</form:label>
                                    <form:textarea class="form-control" placeholder="" path="moTa"/>
                                    <form:errors path="moTa" cssStyle="color: red"/>
                                </div>
                            </div>

                        </div>

                        <div style="text-align: center">
                            <button type="submit" class="btn btn-primary mr-2"
                                    onclick="if(!(confirm('Bạn có muốn cập nhật sản phẩm này ? ')))return false;">
                                Update
                            </button>
                        </div>


                    </form>
                </div>
            </div>
            <%--    </div>--%>
        </form:form>

        <%--kết thúc phân trang--%>
    </div>
</div>
<div class="modal fade" id="exampleModalPin" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabelPin">Pin</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div>
                    <table class="table">
                        <form:form action="/chi-tiet-san-pham/modal-add-pin" method="post" modelAttribute="Pin">
                            <div class="row">
                                <div class="col">
                                    <form:label path="loaiPin"><b>Loại Pin:</b></form:label>
                                    <form:input path="loaiPin" class="form-control"/>
                                    <form:errors path="loaiPin"/>
                                </div>
                                <div class="col">
                                    <form:label path="congNghePin"><b>Công nghệ Pin:</b></form:label>
                                    <form:input path="congNghePin" class="form-control"/>
                                    <form:errors path="congNghePin"/>
                                </div>
                                <div class="col">
                                    <form:label path="moTa"><b>Mô Tả:</b></form:label>
                                    <form:textarea path="moTa" class="form-control"/>
                                    <form:errors path="moTa"/>
                                </div>
                                <div class="col">
                                    <form:label path="dungLuongPin"><b>Dung Lượng:</b></form:label>
                                    <form:select path="dungLuongPin" items="${dungLuongPin}" class="form-control"
                                                 itemLabel="thongSo"
                                                 itemValue="id"/>
                                </div>
                                <div style="margin-top: 20px; margin-bottom: 20px">
                                    <button type="submit" class="btn btn-primary"
                                            onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                        ADD
                                    </button>
                                </div>
                            </div>
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
<%--Chip--%>
<div class="modal fade" id="exampleModalChip" tabindex="-1" aria-labelledby="exampleModalLabelChip"
     aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabelChip">Chip</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div>
                    <table class="table">
                        <form:form action="/chi-tiet-san-pham/modal-add-chip" method="post" modelAttribute="chip">
                            <div class="row">
                                <div class="col">
                                    <form:label path="ten"><b>Tên:</b></form:label>
                                    <form:input path="ten" class="form-control"/>
                                    <form:errors path="ten"/>
                                </div>
                                <div class="col">
                                    <form:label path="loaiChip"><b>Loại Chip:</b></form:label>
                                    <form:input path="loaiChip" class="form-control"/>
                                    <form:errors path="loaiChip"/>
                                </div>
                                <div class="col">
                                    <form:label path="soNhan"><b>Số nhân:</b></form:label>
                                    <form:input path="soNhan" class="form-control" type="number"/>
                                    <form:errors path="soNhan"/>
                                </div>
                                <div class="col">
                                    <form:label path="tinhTrang"><b>Tình Trạng:</b></form:label>
                                    <br>
                                    <form:radiobutton path="tinhTrang" label="Thế hệ mới"
                                                      value="0"/>
                                    <form:radiobutton path="tinhTrang" label="thế hệ cũ"
                                                      value="1"/>
                                </div>
                                <div class="col">
                                    <form:label path="moTa"><b>Mô Tả:</b></form:label>
                                    <form:textarea path="moTa" class="form-control"/>
                                    <form:errors path="moTa"/>
                                </div>
                                <div style="margin-top: 20px;margin-bottom: 20px">
                                    <button type="submit" class="btn btn-primary"
                                            onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                        ADD
                                    </button>
                                </div>
                            </div>

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
<%--Màu sắc--%>
<div class="modal fade" id="exampleModalMauSac" tabindex="-1" aria-labelledby="exampleModalLabelMauSac"
     aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabelMauSac">Màu Sắc</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div>
                    <table class="table">
                        <form:form action="/chi-tiet-san-pham/modal-add-mau-sac" method="post"
                                   modelAttribute="mauSac">
                            <div class="row">
                                <div class="col">
                                    <form:label path="ten"><b>Tên:</b></form:label>
                                    <form:input path="ten" class="form-control"/>
                                    <form:errors path="ten"/>
                                </div>
                                <div class="col">
                                    <form:label path="moTa"><b>Mô Tả:</b></form:label>
                                    <form:textarea path="moTa" class="form-control"/>
                                    <form:errors path="moTa"/>
                                </div>
                                <div style="margin-top: 20px;margin-bottom: 20px">
                                    <button type="submit" class="btn btn-primary"
                                            onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                        ADD
                                    </button>
                                </div>
                            </div>

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
<div class="modal fade" id="exampleModalRam" tabindex="-1" aria-labelledby="exampleModalLabelRam"
     aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabelRam">Ram</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div>
                    <table class="table">
                        <form:form action="/chi-tiet-san-pham/modal-add-ram" method="post" modelAttribute="ram">
                            <div class="row">
                                <div class="col">
                                    <form:label path="dungLuong"><b>Dung Lượng:</b></form:label>
                                    <form:input path="dungLuong" class="form-control"/>
                                    <form:errors path="dungLuong"/>
                                </div>
                                <div class="col">
                                    <form:label path="tinhTrang"><b>Tình Trạng:</b></form:label>
                                    <br>
                                    <form:radiobutton path="tinhTrang" label="Còn dùng"
                                                      value="0"/>
                                    <form:radiobutton path="tinhTrang" label="Không còn dùng"
                                                      value="1"/>
                                </div>
                                <div class="col">
                                    <form:label path="moTa"><b>Mô Tả:</b></form:label>
                                    <form:textarea path="moTa" class="form-control"/>
                                    <form:errors path="moTa"/>
                                </div>
                                <div style="margin-top: 20px;margin-bottom: 20px">
                                    <button type="submit" class="btn btn-primary"
                                            onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                        ADD
                                    </button>
                                </div>
                            </div>
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
<div class="modal fade" id="exampleModalRom" tabindex="-1" aria-labelledby="exampleModalLabelRom"
     aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabelRom">Rom</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div>
                    <table class="table">
                        <form:form action="/chi-tiet-san-pham/modal-add-rom" method="post" modelAttribute="rom">
                            <div class="row">
                                <div class="col">
                                    <form:label path="dungLuong"><b>Dung Lượng:</b></form:label>
                                    <form:input path="dungLuong" class="form-control"/>
                                    <form:errors path="dungLuong"/>
                                </div>
                                <div class="col">
                                    <form:label path="tinhTrang"><b>Tình Trạng:</b></form:label>
                                    <br>
                                    <form:radiobutton path="tinhTrang" label="Còn dùng"
                                                      value="0"/>
                                    <form:radiobutton path="tinhTrang" label="Không còn dùng"
                                                      value="1"/>
                                </div>
                                <div class="col">
                                    <form:label path="moTa"><b>Mô Tả:</b></form:label>
                                    <form:textarea path="moTa" class="form-control"></form:textarea>
                                    <form:errors path="moTa"/>
                                </div>
                                <div style="margin-top: 20px;margin-bottom: 20px">
                                    <button type="submit" class="btn btn-primary"
                                            onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                        ADD
                                    </button>
                                </div>
                            </div>
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
<div class="modal fade" id="exampleModalSanPham" tabindex="-1" aria-labelledby="exampleModalLabelSanPham"
     aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabelSanPham">Sản Phẩm</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div>
                    <table class="table"><form:form action="/chi-tiet-san-pham/modal-add-san-pham" method="post"
                                                    modelAttribute="sanPham">
                        <h1 style="text-align: center">Add Sản Phẩm</h1>

                        <table class="table " style="border: aliceblue 1px">
                            <tbody>
                            <tr>
                                <td><form:label path="ten">Tên:</form:label></td>
                                <th><form:input path="ten" id="tent"/></th>
                                <th><form:errors path="ten" cssClass="error text-danger"/></th>
                            </tr>
                            </tbody>
                            <tbody>
                            <tr>
                                <td><form:label path="heDieuHanh">Hệ điều hành:</form:label></td>
                                <th><form:input path="heDieuHanh" id="heDieuHanht"/></th>
                                <th><form:errors path="heDieuHanh" cssClass="error text-danger"/></th>
                            </tr>
                            </tbody>
                            <tbody>
                            <tr>
                                <td><form:label path="soSim">Số khe sim:</form:label></td>
                                <th><form:input path="soSim" type="number"/></th>
                                <th><form:errors path="soSim" cssClass="error text-danger"/></th>
                            </tr>
                            </tbody>
                            <tbody>
                            <tr>
                                <td><form:label path="bluetooth">Kết nối bluetooth:</form:label></td>
                                <th><form:input path="bluetooth"/></th>
                                <th><form:errors path="bluetooth" cssClass="error text-danger"/></th>
                            </tr>
                            </tbody>
                            <tbody>
                            <tr>
                                <td><form:label path="hoTroMang">Hỗ trợ mạng:</form:label></td>
                                <th><form:input path="hoTroMang"/></th>
                                <th><form:errors path="hoTroMang" cssClass="error text-danger"/></th>
                            </tr>
                            </tbody>
                            <tbody>
                            <tr>
                                <td><form:label path="congGiaoTiep">Cổng giao tiếp:</form:label></td>
                                <th><form:input path="congGiaoTiep"/></th>
                                <th><form:errors path="congGiaoTiep"
                                                 cssClass="error text-danger"/></th>
                            </tr>
                            </tbody>
                            <tbody>
                            <tr>
                                <td><form:label path="thongSoWifi">Thông số Wifi:</form:label></td>
                                <th><form:input path="thongSoWifi"/></th>
                                <th><form:errors path="thongSoWifi" cssClass="error text-danger"/></th>
                            </tr>
                            </tbody>
                            <tbody>
                            <tr>
                                <td><form:label path="kichThuoc">Kích thước sản phẩm:</form:label></td>
                                <th><form:input path="kichThuoc"/></th>
                                <th><form:errors path="kichThuoc" cssClass="error text-danger"/></th>
                            </tr>
                            </tbody>
                            <tbody>
                            <tr>
                                <td><form:label path="trongLuong">Trọng lượng:</form:label></td>
                                <th><form:input path="trongLuong"/></th>
                                <th><form:errors path="trongLuong" cssClass="error text-danger"/></th>
                            </tr>
                            </tbody>
                            <tbody>
                            <tr>
                                <td><form:label path="chatLieu">Chất liệu:</form:label></td>
                                <th><form:input path="chatLieu"/></th>
                                <th><form:errors path="chatLieu" cssClass="error text-danger"/></th>
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
                                <th><form:errors path="moTa" cssClass="error text-danger"/></th>
                            </tr>
                            </tbody>
                            <tbody>
                            <tr>
                                <td><form:label path="hangSanPham">Hãng Sản Phẩm</form:label></td>
                                <th><form:select path="hangSanPham" items="${listHang}" itemValue="id"
                                                 itemLabel="ten"/></th>
                            </tr>
                            </tbody>
                            <tbody>
                            <tr>
                                <td><form:label path="manHinh">Màn Hình</form:label></td>
                                <th><form:select path="manHinh" items="${listManHinh}" itemValue="id"
                                                 itemLabel="thongSo"/></th>
                            </tr>
                            </tbody>
                            <tbody>
                            <tr>
                                <td><form:label path="camera">Camera</form:label></td>
                                <th><form:select path="camera" items="${listCamera}" itemValue="id"
                                                 itemLabel="thongSo"/></th>
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
</body>
<script>
    const imageInput = document.getElementById('image-input');
    const previewImage = document.getElementById('preview-image');

    imageInput.addEventListener('change', function () {
        const file = imageInput.files[0];
        if (file) {
            const reader = new FileReader();

            reader.onload = function (e) {
                previewImage.src = e.target.result;
            };

            reader.readAsDataURL(file);
        } else {
            // Xóa ảnh xem trước nếu không có tệp được chọn
            previewImage.src = '';
        }
    });
</script>
<script src="../../vendors/js/vendor.bundle.base.js"></script>
<script src="../../js/off-canvas.js"></script>
<script src="../../js/hoverable-collapse.js"></script>
<script src="../../js/template.js"></script>
<script src="../../js/settings.js"></script>
<script src="../../js/todolist.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</html>

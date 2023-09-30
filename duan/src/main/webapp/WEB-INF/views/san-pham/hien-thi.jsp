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
            <a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab"
               aria-controls="description" aria-selected="true">Thông tin Sản Phẩm</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/san-pham/hien-thi-tung-xoa" role="tab">Sản Phẩm đã xoá</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/san-pham/view-add" role="tab">Thêm mới sản phẩm</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/san-pham/hien-thi-loc" role="tab">Lọc</a>
        </li>
    </ul>
</div>
<div class="tab-content" id="myTabContent">
    <div class="tab-pane fade show active" id="description" role="tabpanel"
         aria-labelledby="description-tab">
        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title" style="float: left">Danh sách sản phẩm</h4>
                    <%--            Tìm kiếm               --%>
                    <form action="/san-pham/search" method="post">
                        <div class="input-group" style="width: 30%; float: right">
                            <input type="text" class="form-control" placeholder="Bạn tìm gì..."
                                   aria-label="Bạn tìm gì..." name="search">
                            <div class="input-group-append">
                                <button class="btn btn-sm btn-primary" type="submit">Search</button>
                            </div>
                        </div>
                    </form>
                    <%--           kết thúc tìm kiếm         --%>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>Mã SP</th>
                                <th>Tên SP</th>
                                <th>Hãng</th>
                                <th>Màn hình</th>
                                <th>Camera</th>
                                <th>Thông số bluetooth</th>
                                <th>Hỗ trợ mạng</th>
                                <th>Cổng giao tiếp</th>
                                <th>Thông số wifi</th>
                                <th>Kich thước</th>
                                <th>Trọng lượng</th>
                                <th>Chất liệu máy</th>
                                <th>Hệ điều hành</th>
                                <th>Số khe sim</th>
                                <th>Ngày tạo</th>
                                <th>Ngày cập nhật</th>
                                <th>Tình trạng</th>
                                <th>Mô tả</th>

                                <th colspan="2">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${hsp}" var="list" varStatus="i">
                                <tr>
                                    <td>${list.ma}</td>
                                    <td>${list.ten}</td>
                                    <td>${list.hangSanPham.ten}</td>
                                    <td>${list.manHinh.thongSo}</td>
                                    <td>${list.camera.thongSo}</td>
                                    <td>${list.bluetooth}</td>
                                    <td>${list.hoTroMang}</td>
                                    <td>${list.congGiaoTiep}</td>
                                    <td>${list.thongSoWifi}</td>
                                    <td>${list.kichThuoc}</td>
                                    <td>${list.trongLuong}</td>
                                    <td>${list.chatLieu}</td>
                                    <td>${list.heDieuHanh}</td>
                                    <td>${list.soSim}</td>
                                    <td>${list.ngayTao}</td>
                                    <td>${list.ngayCapNhat}</td>
                                    <td><c:if test="${list.tinhTrang==0}">Hoạt động</c:if>
                                        <c:if test="${list.tinhTrang==1}">Ngừng hoạt động</c:if>
                                    </td>
                                    <td>${list.moTa}</td>
                                    <td>
                                        <a href="/san-pham/detail/${list.id}" class="btn btn-warning btn-icon-text"
                                           tabindex="-1"
                                           role="button"
                                           onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                            <i class="ti-file btn-icon-prepend"></i>
                                            Update</a>
                                        <a href="/san-pham/delete/${list.id}" class="btn btn-danger btn-icon-text"
                                           tabindex="-1"
                                           role="button"
                                           onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                            <i class="ti-reload btn-icon-prepend"></i>
                                            Status</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <%--phân trang--%>
        <div align="center">
            <div class="btn-group" role="group" aria-label="Basic example">
                <ul class="pagination justify-content-center pagination-lg">
                    <li class="page-item"><a class="page-link" href="/rom/hien-thi?num=0">First</a></li>

                    <c:forEach begin="1" end="${total}" varStatus="status">
                        <li class="page-item">
                            <a href="${pageContext.request.contextPath}/rom/hien-thi?num=${status.index -1}"
                               class="page-link">${status.index}</a>
                        </li>
                    </c:forEach>

                    <li class="page-item"><a class="page-link" href="/rom/hien-thi?num=${total-1}">Last</a></li>
                </ul>
            </div>
        </div>
        <%--kết thúc phân trang--%>
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

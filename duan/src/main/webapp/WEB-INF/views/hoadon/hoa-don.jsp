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
            <a class="nav-link active" id="description-tab" data-toggle="tab" href="hoa-don/hien-thi" role="tab"
               aria-controls="description" aria-selected="true">Thông tin hóa đơn</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/hoa-don/view-add" role="tab">Thêm hóa đơn chờ</a>
        </li>
        <li class="nav-item" style="border-radius: 2%">
            <a class="nav-link" href="/hoa-don/view-loc" role="tab">Lọc hóa đơn</a>
        </li>
    </ul>
</div>
<div class="tab-content" id="myTabContent">
    <div class="tab-pane fade show active" id="description" role="tabpanel"
         aria-labelledby="description-tab">
        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title" style="float: left">Danh sách hóa đơn</h4>
                    <%--            Tìm kiếm               --%>
                    <form action="/hoa-don/search" method="post">
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
                                <th>Mã hóa đơn</th>
                                <th>Tên khách hàng</th>
                                <th>Tên nhân viên</th>
                                <th>Địa chỉ</th>
                                <th>Điểm quy đổi</th>
                                <th>SĐT</th>
                                <th>Tổng tiền</th>
                                <th>Tình trạng</th>
                                <th>Ngày Tạo</th>
                                <th>Ngày nhận</th>
                                <th>Ngày ship</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <i class="mdi mdi-border-color"></i>
                            <c:forEach items="${listHoaDon}" var="hoaDon">
                                <tr>
                                    <td>${hoaDon.ma}</td>
                                    <td>${hoaDon.khachHang.hoTen}</td>
                                    <td>${hoaDon.nhanVien.hoTen}</td>
                                    <td>${hoaDon.diaChi.diaChi}</td>

                                    <td>${hoaDon.quyDoi.soTienQuyDoi}</td>
                                    <td>${hoaDon.sdt}</td>
                                    <td>${hoaDon.tongTien}</td>
                                    <td>
                                        <c:if test="${hoaDon.tinhTrang == 0}">Đang chờ</c:if>
                                        <c:if test="${hoaDon.tinhTrang == 1}">Đã xác nhận</c:if>
                                        <c:if test="${hoaDon.tinhTrang == 2}">Đã thanh toán</c:if>
                                        <c:if test="${hoaDon.tinhTrang == 3}">Chờ thanh toán</c:if>
                                        <c:if test="${hoaDon.tinhTrang == 4}">Chờ vận chuyển</c:if>
                                        <c:if test="${hoaDon.tinhTrang == 5}">Đang vận chuyển</c:if>
                                        <c:if test="${hoaDon.tinhTrang == 6}">Vận chuyển hoàn tất</c:if>
                                        <c:if test="${hoaDon.tinhTrang == 7}">Giao trễ</c:if>
                                        <c:if test="${hoaDon.tinhTrang == 8}">Đã hủy</c:if>

                                    </td>

                                    <td>${hoaDon.ngayTao}</td>
                                    <td>${hoaDon.ngayNhan}</td>
                                    <td>${hoaDon.ngayShip}</td>
                                    <td>
                                        <a href="/hoa-don/detail/${hoaDon.id}" class="btn btn-warning btn-icon-text"
                                           tabindex="-1"
                                           role="button"
                                           onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                            <i class="ti-file btn-icon-prepend"></i>
                                            Detail</a>
                                        <a href="/hoa-don/update-status/${hoaDon.id}"
                                           class="btn btn-danger btn-icon-text"
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
                    <li class="page-item"><a class="page-link" href="/hoa-don/hien-thi?pageNum=0"><</a></li>
                    <c:forEach begin="1" end="${total}" varStatus="status">
                        <li class="page-item">
                            <a href="${pageContext.request.contextPath}/hoa-don/hien-thi?pageNum=${status.index -1}"
                               class="page-link">${status.index}</a>
                        </li>
                    </c:forEach>
                    <li class="page-item"><a class="page-link" href="/hoa-don/hien-thi?pageNum=${total-1}">></a></li>
                </ul>
            </div>
        </div>
        <%--kết thúc phân trang--%>
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

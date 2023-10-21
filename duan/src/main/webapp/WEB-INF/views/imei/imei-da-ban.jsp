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
    <!-- Favicon icon -->
</head>
<body>
<div>
    <ul class="nav nav-tabs border-top" id="setting-panel" role="tablist">
        <li class="nav-item">
            <a class="nav-link" href="/imei/hien-thi" role="tab">Thông tin Imei</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab"
               aria-controls="description" aria-selected="true">Imei đã bán</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/imei/hien-thi-da-xoa" role="tab">Imei đã xoá</a>
        </li>
    </ul>
</div>
<div class="tab-content" id="myTabContent">
    <div class="tab-pane fade show active" id="description" role="tabpanel"
         aria-labelledby="description-tab">

        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title" style="float: left">Danh sách Imei đã bán</h4>
                    <%--            Tìm kiếm               --%>
                    <form action="/imei/search-off-1" method="post">
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
                        <table class="table table-striped" style="color: black">
                            <thead>
                            <tr>
                                <th scope="col">Mã</th>
                                <th scope="col">Tên sản phẩm</th>
                                <th scope="col">Số imei</th>
                                <th scope="col">Mã QR</th>
                                <th scope="col">Ngày tạo</th>
                                <th scope="col">Ngày cập nhật</th>
                                <th scope="col">Tình trạng</th>
                                <th scope="col">Mô tả</th>
                            </tr>
                            </thead>
                            <tbody>
                            <i class="mdi mdi-border-color"></i>
                            <c:forEach items="${listImei}" var="imei" varStatus="index">
                                <tr>
                                    <td>${imei.ma}</td>
                                    <td>${imei.chiTietSanPham.sanPham.ten}</td>
                                    <td>${imei.soImei}</td>
                                    <td>
                                        <img src="../maqr/${imei.maQr}" width="70" height="70">
                                    </td>
                                    <td>${imei.ngayTao}</td>
                                    <td>${imei.ngayCapNhat}</td>
                                    <td>
                                        <c:if test="${imei.tinhTrang == 0}">Chưa bán</c:if>
                                        <c:if test="${imei.tinhTrang == 1}">Đã bán</c:if>
                                        <c:if test="${imei.tinhTrang == 2}">Đã hủy</c:if>
                                        <c:if test="${imei.tinhTrang == 3}">Chờ xử lý</c:if>
                                    </td>
                                    <td>${imei.moTa}</td>
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
                    <li class="page-item"><a class="page-link" href="/imei-da-xoa/hien-thi?pageNum=0"><</a></li>
                    <c:forEach begin="1" end="${total}" varStatus="status">
                        <li class="page-item">
                            <a href="${pageContext.request.contextPath}/imei-da-xoa/hien-thi?pageNum=${status.index -1}"
                               class="page-link">${status.index}</a>
                        </li>
                    </c:forEach>
                    <li class="page-item"><a class="page-link" href="/imei-da-xoa/hien-thi?pageNum=${total-1}">></a>
                    </li>
                </ul>
            </div>
        </div>
        <%--kết thúc phân trang--%>
    </div>
</div>
</body>
</html>

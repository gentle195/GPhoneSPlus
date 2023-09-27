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
            <a class="nav-link" href="/pin/hien-thi" role="tab">Thông tin dung lượng Pin </a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab"
               aria-controls="description" aria-selected="true">Chip đã xoá</a>
        </li>
        <a href="/pin/update-tt" class="btn btn-outline-danger btn-icon-text" style="float: right; margin-left: 720px"
           tabindex="-1"
           role="button"
           onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
            <i class="ti-reload btn-icon-prepend"></i>
            Status All
        </a>
    </ul>
</div>
<div class="col-lg-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title" style="float: left">Danh sách Pin</h4>
            <%--            Tìm kiếm               --%>
            <form action="/pin/search-1" method="post">
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
                        <th>Mã</th>
                        <th>Loại Pin</th>
                        <th>Công nghệ Pin</th>
                        <th>Ngày Tạo</th>
                        <th>Ngày Cập Nhật</th>
                        <th>Tình Trạng</th>
                        <th>Mô Tả</th>
                        <th>Dung Lượng</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <i class="mdi mdi-border-color"></i>
                    <c:forEach items="${listPin}" var="p">
                        <tr>
                            <td>${p.ma}</td>
                            <td>${p.loaiPin}</td>
                            <td>${p.congNghePin}</td>
                            <td>${p.ngayTao}</td>
                            <td>${p.ngayCapNhat}</td>
                            <td>
                                <c:if test="${p.tinhTrang == 0}">Còn</c:if>
                                <c:if test="${p.tinhTrang == 1}">Hết</c:if>
                            </td>
                            <td>${p.moTa}</td>
                            <td>${p.dungLuongPin.thongSo}</td>
                            <td>
                                <a href="/pin/reset-status/${p.id}"
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
<%--phân trang--%>
<div align="center">
    <div class="btn-group" role="group" aria-label="Basic example">
        <ul class="pagination justify-content-center pagination-lg">
            <li class="page-item"><a class="page-link" href="/pin/hien-thi?pageNum=0"><</a></li>
            <c:forEach begin="1" end="${total}" varStatus="status">
                <li class="page-item">
                    <a href="${pageContext.request.contextPath}/pin/hien-thi?pageNum=${status.index -1}"
                       class="page-link">${status.index}</a>
                </li>
            </c:forEach>
            <li class="page-item"><a class="page-link" href="/pin/hien-thi?pageNum=${total-1}">></a></li>
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

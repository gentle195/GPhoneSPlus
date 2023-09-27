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
            <a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab"
               aria-controls="description" aria-selected="true">Thông tin Chip</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/chip/hien-thi-delete" role="tab">Chip đã xoá</a>
        </li>
    </ul>
</div>
<div class="tab-content" id="myTabContent">
    <div class="tab-pane fade show active" id="description" role="tabpanel"
         aria-labelledby="description-tab">
        <form:form action="/chip/add" method="post" modelAttribute="chip">
            <%--    <div class="col-md-6 grid-margin stretch-card" >--%>
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Thêm Chip</h4>
                    <form class="forms-sample">
                        <div class="form-group">
                            <form:label path="ten"><b>Tên:</b></form:label>
                            <form:input path="ten" class="form-control"/>
                            <form:errors path="ten" cssStyle="color: red"/>
                        </div>
                        <div class="form-group">
                            <form:label path="loaiChip"><b>Loại Chip:</b></form:label>
                            <form:input path="loaiChip" class="form-control"/>
                            <form:errors path="loaiChip" cssStyle="color: red"/>
                        </div>
                        <div class="form-group">
                            <form:label path="soNhan"><b>Số nhân:</b></form:label>
                            <form:input path="soNhan" class="form-control" type="number"/>
                            <form:errors path="soNhan" cssStyle="color: red"/>
                        </div>
                        <div class="form-group">
                            <form:label path="moTa"><b>Mô Tả:</b></form:label>
                            <form:textarea path="moTa" class="form-control"/>
                            <form:errors path="moTa" cssStyle="color: red"/>
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
            <%--    </div>--%>
        </form:form>
        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title" style="float: left">Danh sách Chip</h4>
                    <%--            Tìm kiếm               --%>
                    <form action="/chip/search-0" method="post">
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
                                <th>Tên</th>
                                <th>Loại Chip</th>
                                <th>Số Nhân</th>
                                <th>Tình Trạng</th>
                                <th>Ngày Tạo</th>
                                <th>Ngày Cập Nhật</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <i class="mdi mdi-border-color"></i>
                            <c:forEach items="${listChip}" var="chip">
                                <tr>
                                    <td>${chip.ma}</td>
                                    <td>${chip.ten}</td>
                                    <td>${chip.loaiChip}</td>
                                    <td>${chip.soNhan}</td>
                                    <td>
                                        <c:if test="${chip.tinhTrang == 0}">Còn</c:if>
                                        <c:if test="${chip.tinhTrang == 1}">Hết</c:if>
                                    </td>
                                    <td>${chip.ngayTao}</td>
                                    <td>${chip.ngayCapNhat}</td>
                                    <td>
                                        <a href="/chip/detail/${chip.id}" class="btn btn-warning btn-icon-text"
                                           tabindex="-1"
                                           role="button"
                                           onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                            <i class="ti-file btn-icon-prepend"></i>
                                            Update</a>
                                        <a href="/chip/update-status/${chip.id}" class="btn btn-danger btn-icon-text"
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
                <li class="page-item"><a class="page-link" href="/chip/hien-thi?pageNum=0"><</a></li>
                <c:forEach begin="1" end="${total}" varStatus="status">
                    <li class="page-item">
                        <a href="${pageContext.request.contextPath}/chip/hien-thi?pageNum=${status.index -1}"
                           class="page-link">${status.index}</a>
                    </li>
                </c:forEach>
                <li class="page-item"><a class="page-link" href="/chip/hien-thi?pageNum=${total-1}">></a></li>
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
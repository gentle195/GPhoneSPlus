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
               aria-controls="description" aria-selected="true">Thông tin nhân viên</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/nhan-vien/view-add" role="tab">Thêm nhân viên</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/nhan-vien/hien-thi-delete" role="tab">Nhân viên đã xoá</a>
        </li>
    </ul>
</div>

<div class="tab-content" id="myTabContent">
    <div class="tab-pane fade show active" id="description" role="tabpanel"
         aria-labelledby="description-tab">
        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title" style="float: left">Danh sách Nhân viên</h4>

<%--                    <div class="row">--%>
<%--                        <div class="col-md-6">--%>
<%--                            <div class="form-group row">--%>
<%--                                <label class="col-sm-3 col-form-label">Giới tính:</label>--%>
<%--                                <div class="col-sm-9" style="margin-top: 0.5cm">--%>
<%--&lt;%&ndash;                                    <form:radiobutton path="gioiTinh" value="true" checked="true"/>Nam&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <form:radiobutton path="gioiTinh" value="false"&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                      cssStyle="margin-left: 1cm"/> Nữ&ndash;%&gt;--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-md-6">--%>
<%--                            <div class="form-group row">--%>
<%--                                <label class="col-sm-3 col-form-label">Chức vụ:</label>--%>
<%--                                <div class="col-sm-9" style="margin-top: 0.4cm; font-size: 20px">--%>
<%--&lt;%&ndash;                                    <form:select          path="chucVu">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <form:options items="${listChucVu}" itemValue="id" itemLabel="ten"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </form:select></div>&ndash;%&gt;--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>

                        <br>

                <%--            Tìm kiếm               --%>
                    <form action="/nhan-vien/search-0" method="post">
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
                                <th>STT</th>
                                <th>Mã</th>
                                <th>Ảnh</th>
                                <th>Họ tên</th>
                                <th>Giới tính</th>
                                <th>SĐT</th>
                                <th>Chức vụ</th>
                                <th>Lương</th>
                                <th>Quê quán</th>
                                <th>Trạng thái</th>
<%--                                <th>Mô tả</th>--%>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <i class="mdi mdi-border-color"></i>
                            <c:forEach items="${listNhanVien}" var="nhanVien" varStatus="i">
                                <tr>
                                    <th scope="row">${i.index+1}</th>
                                    <td>${nhanVien.ma}</td>
                                    <td align="center">
                                        <img src="/uploads/${nhanVien.urlAnh}" width="40" height="40"></td>
                                    <td>${nhanVien.hoTen}</td>
                                    <td>
                                        <c:if test="${nhanVien.gioiTinh == true}">Nam</c:if>
                                        <c:if test="${nhanVien.gioiTinh == false}">Nữ</c:if>
                                    </td>
                                    <td>${nhanVien.sdt}</td>
                                    <td>${nhanVien.chucVu.ten}</td>
                                    <td>${nhanVien.luong}</td>
                                    <td>${nhanVien.queQuan}</td>
                                    <td>${nhanVien.trangThai()}</td>
                                    <td>
                                        <a href="/nhan-vien/detail/${nhanVien.id}"
                                           class="btn btn-warning btn-icon-text"
                                           tabindex="-1"
                                           role="button"
                                           onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                            <i class="ti-file btn-icon-prepend"></i>
                                            Update</a>
                                        <a href="/nhan-vien/update-status/${nhanVien.id}"
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
                    <li class="page-item"><a class="page-link" href="/nhan-vien/hien-thi?pageNum=0"><</a></li>
                    <c:forEach begin="1" end="${total}" varStatus="status">
                        <li class="page-item">
                            <a href="${pageContext.request.contextPath}/nhan-vien/hien-thi?pageNum=${status.index -1}"
                               class="page-link">${status.index}</a>
                        </li>
                    </c:forEach>
                    <li class="page-item"><a class="page-link" href="/nhan-vien/hien-thi?pageNum=${total-1}">></a></li>
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

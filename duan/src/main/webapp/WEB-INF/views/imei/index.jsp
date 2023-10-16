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
            <a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab"
               aria-controls="description" aria-selected="true">Thông tin Imei</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/imei/hien-thi-da-ban" role="tab">Imei đã bán</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/imei/hien-thi-da-xoa" role="tab">Imei đã xoá</a>
        </li>
    </ul>
</div>
<div class="tab-content" id="myTabContent">
    <div class="tab-pane fade show active" id="description" role="tabpanel"
         aria-labelledby="description-tab">
        <form:form action="/imei/add" method="post" modelAttribute="imei">
            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <form class="forms-sample">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-11">
                                        <form:select path="chiTietSanPham" class="form-control"
                                                     cssStyle="font-weight: bold; width: 100%" id="selectSanPham">
                                            <option selected disabled>Sản phẩm</option>
                                            <form:options items="${listCTSP}" itemLabel="sanPham.ten" itemValue="id"/>
                                        </form:select>
                                    </div>
                                    <div class="col-1">
                                        <a type="button" href="/chi-tiet-san-pham/view-add">
                                            <img src="/uploads/plus.png">
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <form:label class="form-label" path="ma">Ma:</form:label>
                                <form:input class="form-control" placeholder="" path="ma" value="${ma}"
                                            readonly="true"/>
                                <form:errors path="ma" cssStyle="color: red"></form:errors>
                            </div>
                            <div class="form-group">
                                <form:label class="form-label" path="soImei">Imei:</form:label>
                                <form:input class="form-control" placeholder="Imei" path="soImei"/>
                                <form:errors path="soImei" cssStyle="color: red"></form:errors>
                            </div>
                            <div class="form-group">
                                <form:label path="moTa"><b>Mô Tả:</b></form:label>
                                <form:textarea path="moTa" class="form-control"></form:textarea>
                                <form:errors path="moTa" cssStyle="color: red"></form:errors>
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
        </form:form>
        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title" style="float: left">Danh sách IMEI
                        <div class="basic-dropdown">
                            <div class="dropdown">
                                <button type="button" class="btn btn-primary dropdown-toggle"
                                        data-toggle="dropdown">
                                    <i class="ti-export btn-icon-prepend"></i>
                                    Xuất Excel
                                </button>
                                <div class="dropdown-menu">
                                    <a href="/imei/export-excel" class="dropdown-item" tabindex="-1">IMEI chưa bán</a>
                                    <a href="/imei/export-excel-imei-da-ban" class="dropdown-item" tabindex="-1">IMEI đã
                                        bán</a>
                                </div>
                            </div>
                        </div>
                    </h4>
                    <%--            Tìm kiếm               --%>
                    <form action="/imei/search-on" method="post">
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
                                <th scope="col">Action</th>
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
                                    <td>${imei.tinhTrang==0?"Chưa bán":"Đã bán"}</td>
                                    <td>${imei.moTa}</td>
                                    <td>
                                        <a href="/imei/view-update/${imei.id}"
                                           class="btn btn-warning btn-icon-text"
                                           tabindex="-1"
                                           role="button"
                                           onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                            <i class="ti-file btn-icon-prepend"></i>
                                            Update</a>
                                        <a href="/imei/delete/${imei.id}"
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
                    <li class="page-item"><a class="page-link" href="/imei/hien-thi?pageNum=0"><</a></li>
                    <c:forEach begin="1" end="${total}" varStatus="status">
                        <li class="page-item">
                            <a href="${pageContext.request.contextPath}/imei/hien-thi?pageNum=${status.index -1}"
                               class="page-link">${status.index}</a>
                        </li>
                    </c:forEach>
                    <li class="page-item"><a class="page-link" href="/imei/hien-thi?pageNum=${total-1}">></a></li>
                </ul>
            </div>
        </div>
        <%--kết thúc phân trang--%>
    </div>
</div>
</body>
</html>

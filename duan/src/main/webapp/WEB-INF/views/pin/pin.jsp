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
               aria-controls="description" aria-selected="true">Thông tin dung lượng Pin</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/pin/hien-thi-delete" role="tab">Dung lượng Pin đã xoá</a>
        </li>
    </ul>
</div>
<div class="tab-content" id="myTabContent">
    <div class="tab-pane fade show active" id="description" role="tabpanel"
         aria-labelledby="description-tab">
        <form:form action="/pin/add" method="post" modelAttribute="pin">
            <%--    <div class="col-md-6 grid-margin stretch-card" >--%>
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Thêm Pin</h4>
                    <form class="forms-sample">
                        <div class="form-group">
                            <form:label path="loaiPin"><b>Loại Pin:</b></form:label>
                            <form:input path="loaiPin" class="form-control"></form:input>
                            <form:errors path="loaiPin"></form:errors>
                        </div>
                        <div class="form-group">
                            <form:label path="congNghePin"><b>Công nghệ Pin:</b></form:label>
                            <form:input path="congNghePin" class="form-control"></form:input>
                            <form:errors path="congNghePin"></form:errors>
                        </div>
                        <div class="form-group">
                            <form:label path="moTa"><b>Mô Tả:</b></form:label>
                            <form:textarea path="moTa" class="form-control"></form:textarea>
                            <form:errors path="moTa"></form:errors>
                        </div>
                        <div class="form-group">
                            <form:label path="dungLuongPin"><b>Dung Lượng:</b></form:label>
                            <div class="row">
                                <div class="col-11">
                                    <form:select path="dungLuongPin" items="${listDungLuongPin}" class="form-control"
                                                 itemLabel="thongSo"
                                                 itemValue="id"></form:select>
                                </div>
                                <div class="col-1">
                                    <button type="button" class="btn btn-inverse-primary btn-fw" data-bs-toggle="modal"
                                            data-bs-target="#exampleModalDungLuongPin">Thêm nhanh
                                    </button>
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
            <%--    </div>--%>
        </form:form>
        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title" style="float: left">Danh sách Pin</h4>
                    <%--            Tìm kiếm               --%>
                    <form action="/pin/search-0" method="post">
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
                                        <a href="/pin/detail/${p.id}" class="btn btn-warning btn-icon-text"
                                           tabindex="-1"
                                           role="button"
                                           onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                            <i class="ti-file btn-icon-prepend"></i>
                                            Update</a>
                                        <a href="/pin/update-status/${p.id}" class="btn btn-danger btn-icon-text"
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
    <div class="modal fade" id="exampleModalDungLuongPin" tabindex="-1" aria-labelledby="exampleModalLabelDungLuongPin"
         aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <div>
                        <table class="table">
                            <form:form action="/pin/modal-add" method="post" modelAttribute="dungLuongPin">
                                <%--    <div class="col-md-6 grid-margin stretch-card" >--%>
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Thêm dung lượng pin</h4>
                                        <form class="forms-sample">
                                            <div class="form-group">
                                                <form:label path="thongSo"><b>Thông số:</b></form:label>
                                                <form:input path="thongSo" class="form-control"></form:input>
                                                <form:errors path="thongSo"></form:errors>
                                            </div>
                                            <div class="form-group">
                                                <form:label path="moTa"><b>Mô Tả:</b></form:label>
                                                <form:textarea path="moTa" class="form-control"></form:textarea>
                                                <form:errors path="moTa"></form:errors>
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
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="../../vendors/js/vendor.bundle.base.js"></script>
<script src="../../js/off-canvas.js"></script>
<script src="../../js/hoverable-collapse.js"></script>
<script src="../../js/template.js"></script>
<script src="../../js/settings.js"></script>
<script src="../../js/todolist.js"></script>
</html>

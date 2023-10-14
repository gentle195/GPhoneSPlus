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
                                                 id="selectDungLuongPin"
                                                 itemLabel="thongSo"
                                                 itemValue="id"></form:select>
                                </div>
                                <div class="col-1">
                                    <a type="button" data-bs-toggle="modal"
                                       data-bs-target="#exampleModalDungLuongPin" style="margin: 10px">
                                        <img src="/uploads/plus.png">
                                    </a>
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
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Pin</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="example" class="display" style="min-width: 845px; color: black">
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
        </div>
    </div>
</div>
</body>
<script>
    $(document).ready(function () {
        $('#selectDungLuongPin').select2();
    });
</script>
</html>

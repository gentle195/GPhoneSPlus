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
        <form:form action="/pin/update/${pin.id}" method="post" modelAttribute="pin">
            <%--    <div class="col-md-6 grid-margin stretch-card" >--%>
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Thêm Pin</h4>
                    <form class="forms-sample">
                        <div class="form-group" style="display: none">
                            <form:label path="ma"><b>Mã:</b></form:label>
                            <form:input path="ma" class="form-control"></form:input>
                            <form:errors path="ma"></form:errors>
                        </div>
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
                        <div class="form-group" style="display: none">
                            <form:label path="ngayTao"><b>Ngày tạo:</b></form:label>
                            <form:input path="ngayTao" class="form-control"></form:input>
                            <form:errors path="ngayTao"></form:errors>
                        </div>
                        <div class="form-group">
                            <form:label path="moTa"><b>Mô Tả:</b></form:label>
                            <form:textarea path="moTa" class="form-control"></form:textarea>
                            <form:errors path="moTa"></form:errors>
                        </div>
                        <div class="form-group">
                            <form:label path="dungLuongPin"><b>Dung Lượng:</b></form:label>
                            <form:select path="dungLuongPin" items="${dungLuongPin}" class="form-control"
                                         itemLabel="thongSo"
                                         itemValue="id"></form:select>
                        </div>
                        <div style="text-align: center">
                            <button type="submit" class="btn btn-primary mr-2"
                                    onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                Save
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            <%--    </div>--%>
        </form:form>
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

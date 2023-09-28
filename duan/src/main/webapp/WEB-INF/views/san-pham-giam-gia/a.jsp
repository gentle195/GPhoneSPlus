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
            <a class="nav-link" href="/san-pham-giam-gia/hien-thi" role="tab">Thông tin sản phẩm giảm giá</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab"
               aria-controls="description" aria-selected="true">Xem sản phẩm giảm giá</a>
        </li>

    </ul>
</div>
<div class="tab-content" id="myTabContent">
    <div class="tab-pane fade show active" id="description" role="tabpanel"
         aria-labelledby="description-tab">
        <form:form action="/san-pham-giam-gia/update/${sanphamgiamgiaupdate.id}" class="container" method="post" modelAttribute="sanphamgiamgiaupdate">
            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Thêm Sản phẩm giảm giá</h4>
                        <form class="forms-sample">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-11">
                                        <form:select path="chiTietSanPham" class="form-control"
                                                     cssStyle="font-weight: bold; width: 100%">
                                            <option selected disabled>Sản phẩm</option>
                                            <form:options items="${listCTSP}" itemLabel="sanPham.ten" itemValue="id"/>
                                        </form:select>
                                    </div>
                                    <div class="col-1">
                                        <a type="button" data-bs-toggle="modal" data-bs-target="#exampleModalSanPham">
                                            <img src="../img/plus.png">
                                        </a>
                                    </div>
                                </div>

                            </div>
                            <div class="form-group">
                                <form:select path="khuyenMai" class="form-control">
                                    <form:options items="${listKM}" itemLabel="ma" itemValue="id"/>
                                </form:select>
                                <form:label class="form-label" path="khuyenMai">Khuyến mãi:</form:label>
                            </div>

                            <div class="form-group">
                                <form:label path="moTa"><b>Mô Tả:</b></form:label>
                                <form:textarea path="moTa" class="form-control"></form:textarea>
                                <form:errors path="moTa" cssStyle="color: red"></form:errors>
                            </div>
                            <div style="text-align: center">
                                <button type="submit" class="btn btn-primary mr-2"
                                        onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                    Update
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </form:form>

        <%--phân trang--%>

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

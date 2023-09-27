<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Màn hình</title>
    <link rel="stylesheet" href="../../vendors/feather/feather.css">
    <link rel="stylesheet" href="../../vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" href="../../vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="../../css/vertical-layout-light/style.css">
    <link rel="shortcut icon" href="../../images/favicon.png"/>
</head>
<body>
<div>
    <div>
        <ul class="nav nav-tabs border-top" id="setting-panel" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab"
                   aria-controls="description" aria-selected="true">Thông tin ảnh</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/anh/hien-thi-delete" role="tab">Ảnh đã xoá</a>
            </li>
        </ul>
    </div>
    <div>
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="description" role="tabpanel"
                 aria-labelledby="description-tab">
                <form:form action="/anh/add" method="post" modelAttribute="anh">
                    <div class="col-12 grid-margin">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Thêm ảnh</h4>
                                <form class="form-sample">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <form:label class="col-sm-3 col-form-label" path="thongSo"><b>Thông số
                                                    màn hình:</b></form:label>
                                                <div class="col-sm-9">
                                                    <form:input class="form-control" placeholder="" path="thongSo"/>
                                                    <form:errors path="thongSo" cssStyle="color: red"></form:errors>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <form:label class="col-sm-3 col-form-label" path="loaiCamUng"><b>Loại
                                                    cảm ứng màn hình:</b></form:label>
                                                <div class="col-sm-9">
                                                    <form:input class="form-control" placeholder="" path="loaiCamUng"/>
                                                    <form:errors path="loaiCamUng" cssStyle="color: red"></form:errors>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <form:label class="col-sm-3 col-form-label" path="tiLeKhungHinh"><b>Tỉ
                                                    lệ khung hình:</b></form:label>
                                                <div class="col-sm-9">
                                                    <form:input class="form-control" placeholder=""
                                                                path="tiLeKhungHinh"/>
                                                    <form:errors path="tiLeKhungHinh"
                                                                 cssStyle="color: red"></form:errors>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <form:label class="col-sm-3 col-form-label" path="doPhanGiai"><b>Độ phân
                                                    giải:</b></form:label>
                                                <div class="col-sm-9">
                                                    <form:input class="form-control" placeholder="" path="doPhanGiai"/>
                                                    <form:errors path="doPhanGiai" cssStyle="color: red"></form:errors>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <form:label class="col-sm-3 col-form-label" path="tanSoQuet"><b>Tần số
                                                    quét:</b></form:label>
                                                <div class="col-sm-9">
                                                    <form:input class="form-control" placeholder="" path="tanSoQuet"/>
                                                    <form:errors path="tanSoQuet" cssStyle="color: red"></form:errors>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <form:label class="col-sm-3 col-form-label" path="congNghe"><b>Công nghệ
                                                    màn hình:</b></form:label>
                                                <div class="col-sm-9">
                                                    <form:input class="form-control" placeholder="" path="congNghe"/>
                                                    <form:errors path="congNghe" cssStyle="color: red"></form:errors>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group row">
                                                <form:label class="col-sm-3 col-form-label" path="moTa"><b>Mô
                                                    tả:</b></form:label>
                                                <div class="col-sm-12">
                                                    <form:input class="form-control" placeholder="" path="moTa"/>
                                                    <form:errors path="moTa" cssStyle="color: red"></form:errors>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div style="text-align: center">
                                                <button type="submit" class="btn btn-primary mr-2"
                                                        onclick="return myFunction1()">
                                                    ADD
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </form:form>
                <br>
                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title" style="float: left">Danh sách Màn hình</h4>
                            <%--            Tìm kiếm               --%>
                            <form action="/man-hinh/search-0" method="post">
                                <div class="row">
                                    <div class="col-8">
                                        <h6 style="float: right; margin: 14px;color: red">${thongBao}</h6></div>
                                    <div class="col-4">
                                        <div class="input-group" style="width: 100%; float: left">
                                            <input type="text" class="form-control" placeholder="Bạn tìm gì..."
                                                   aria-label="Bạn tìm gì..." name="search">
                                            <div class="input-group-append">
                                                <button class="btn btn-sm btn-primary" type="submit"
                                                        onclick="return myFunction5()">Search
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <%--           kết thúc tìm kiếm         --%>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>Mã</th>
                                        <th>Thông số</th>
                                        <th>Loại cảm ứng</th>
                                        <th>Tỉ lệ khung hình</th>
                                        <th>Công nghệ màn hình</th>
                                        <th>Độ phân giải màn hình</th>
                                        <th>Tần số quét</th>
                                        <th>Ngày tạo</th>
                                        <th>Ngày cập nhật</th>
                                        <th>Tình trạng</th>
                                        <th>Mô tả</th>
                                        <th colspan="2">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="list" varStatus="i" items="${listManHinh}">
                                        <tr>
                                            <td>${list.ma}</td>
                                            <td>${list.thongSo}</td>
                                            <td>${list.loaiCamUng}</td>
                                            <td>${list.tiLeKhungHinh}</td>
                                            <td>${list.congNghe}</td>
                                            <td>${list.doPhanGiai}</td>
                                            <td>${list.tanSoQuet}</td>
                                            <td>${list.ngayTao}</td>
                                            <td>${list.ngayCapNhat}</td>
                                            <td>
                                                <c:if test="${list.tinhTrang==0}">Hoạt động</c:if>
                                                <c:if test="${list.tinhTrang==1}">Ngừng hoạt động</c:if>
                                            </td>
                                            <td>${list.moTa}</td>
                                            <td>
                                                <a class="btn btn-warning btn-icon-text"
                                                   href="/man-hinh/detail/${list.id}"
                                                   onclick="return myFunction2()">
                                                    <i class="ti-file btn-icon-prepend"></i>
                                                    Update</a>
                                                <a class="btn btn-danger btn-icon-text"
                                                   href="/man-hinh/update-status/${list.id}"
                                                   onclick="return myFunction3()"><i
                                                        class="ti-reload btn-icon-prepend"></i>
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
                <div align="center">
                    <div class="btn-group" role="group" aria-label="Basic example">
                        <c:if test="${total!= 0}">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center pagination-lg">
                                    <li class="page-item"><a class="page-link" href="/man-hinh/hien-thi?num=0"><</a>
                                    </li>

                                    <c:forEach begin="1" end="${total}" varStatus="status">
                                        <li class="page-item">
                                            <a href="${pageContext.request.contextPath}/man-hinh/hien-thi?num=${status.index -1}"
                                               class="page-link">${status.index}</a>
                                        </li>
                                    </c:forEach>

                                    <li class="page-item"><a class="page-link" href="/man-hinh/hien-thi?num=${total-1}">></a>
                                    </li>
                                </ul>
                            </nav>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    function myFunction1() {
        let text = "Bạn chắc chắn muốn thêm";
        let kt = confirm(text);
        if (kt == true) {
            return true
        } else {
            return false;
        }
    }

    function myFunction2() {
        let text = "Bạn chắc chắn muốn sửa";
        let kt = confirm(text);
        if (kt == true) {
            return true
        } else {
            return false;
        }
    }

    function myFunction3() {
        let text = "Bạn chắc chắn muốn thay đổi trạng thái";
        let kt = confirm(text);
        if (kt == true) {
            confirm("Thay đổi trạng thái thành công");
            return true
        } else {
            return false;
        }
    }

    function myFunction4() {
        let text = "Bạn chắc chắn muốn về lại trang hiển thị";
        let kt = confirm(text);
        if (kt == true) {
            return true
        } else {
            return false;
        }
    }

    function myFunction5() {
        let text = "Bạn chắc chắn muốn tìm kiếm thông tin";
        let kt = confirm(text);
        if (kt == true) {
            return true
        } else {
            return false;
        }
    }


</script>
<script src="../../vendors/js/vendor.bundle.base.js"></script>
<script src="../../js/off-canvas.js"></script>
<script src="../../js/hoverable-collapse.js"></script>
<script src="../../js/template.js"></script>
<script src="../../js/settings.js"></script>
<script src="../../js/todolist.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
</html>
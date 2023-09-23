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
    <link rel="icon" href="../../images/favicon.ico" type="image/ico"/>
    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">

    <!-- bootstrap-progressbar -->
    <link href="../vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="../vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../../build/css/custom.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1 style="text-align: center">Màn Hình</h1>
    <div>
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
                <a  href="/man-hinh/hien-thi" role="tab" onclick="return myFunction4()">
                    <h6>Thông tin màn hình</h6>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" id="review-tab" data-toggle="tab" href="#review" role="tab"
                   aria-controls="review" aria-selected="true">
                    <h6>Thêm mới màn hình</h6>
                </a>
            </li>
        </ul>
    </div>
    <div>
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab">
                <div>
                    <form:form action="/man-hinh/add" method="post" modelAttribute="manHinh">
                        <div class="row">
                            <div class="col-6">
                                <div class="form-floating mb-3 mt-3">
                                    <form:input class="form-control" placeholder="" path="thongSo"/>
                                    <form:label class="form-label" path="thongSo">Thông số màn hình:</form:label>
                                    <form:errors path="thongSo" cssStyle="color: red"></form:errors>
                                </div>
                                <div class="form-floating mb-3 mt-3">
                                    <form:input class="form-control" placeholder="" path="loaiCamUng"/>
                                    <form:label class="form-label" path="loaiCamUng">Loại cảm ứng màn hình:</form:label>
                                    <form:errors path="loaiCamUng" cssStyle="color: red"></form:errors>
                                </div>
                                <div class="form-floating mb-3 mt-3">
                                    <form:input class="form-control" placeholder="" path="tiLeKhungHinh"/>
                                    <form:label class="form-label" path="tiLeKhungHinh">Tỉ lệ khung hình:</form:label>
                                    <form:errors path="tiLeKhungHinh" cssStyle="color: red"></form:errors>
                                </div>
                                <div class="form-floating mb-3 mt-3">
                                    <form:input class="form-control" placeholder="" path="congNghe"/>
                                    <form:label class="form-label" path="congNghe">Công nghệ màn hình:</form:label>
                                    <form:errors path="congNghe" cssStyle="color: red"></form:errors>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-floating mb-3 mt-3">
                                    <form:input class="form-control" placeholder="" path="doPhanGiai"/>
                                    <form:label class="form-label" path="doPhanGiai">Độ phân giải:</form:label>
                                    <form:errors path="doPhanGiai" cssStyle="color: red"></form:errors>
                                </div>
                                <div class="form-floating mb-3 mt-3">
                                    <form:input class="form-control" placeholder="" path="tanSoQuet"/>
                                    <form:label class="form-label" path="tanSoQuet">Tần số quét:</form:label>
                                    <form:errors path="tanSoQuet" cssStyle="color: red"></form:errors>
                                </div>
                                <div class="form-floating mb-3 mt-3">
                                    <form:input class="form-control" placeholder="" path="moTa"/>
                                    <form:label class="form-label" path="moTa">Mô tả:</form:label>
                                    <form:errors path="moTa" cssStyle="color: red"></form:errors>
                                </div>
                                <div class="form-check mb-3 mt-3">
                                    <form:label class="form-label" path="tinhTrang">Tình Trạng:</form:label>
                                    <form:radiobutton path="tinhTrang" value="0"/>Hoạt động
                                    <form:radiobutton path="tinhTrang" value="1"/> Ngừng hoạt động

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12" style="text-align: center">
                                    <button type="submit" class="btn btn-success"
                                            id="btt" onclick="return myFunction1()">Add
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form:form>
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
        let text = "Bạn chắc chắn muốn xóa";
        let kt = confirm(text);
        if (kt == true) {
            confirm("Xóa thành công");
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
        let text = "Bạn chắc chắn muốn sang trang thêm thông tin";
        let kt = confirm(text);
        if (kt == true) {
            return true
        } else {
            return false;
        }
    }


</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
</html>
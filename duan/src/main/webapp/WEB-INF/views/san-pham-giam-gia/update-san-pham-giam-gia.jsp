<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.models.ChiTietSanPham" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet"/>
    <link rel="icon" href="/images/favicon.ico" type="image/ico"/>
    <!-- Bootstrap -->
    <link href="/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="/vendors/iCheck/skins/flat/green.css" rel="stylesheet">

    <!-- bootstrap-progressbar -->
    <link href="/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="/build/css/custom.min.css" rel="stylesheet">


    <title>Document</title>
</head>
<body>
<section style="text-align: center">
    <h3 style="color: black; text-align: center"><b>Update Sản phẩm giảm giá</b></h3>
    <br>

    <a href="/san-pham-giam-gia/hien-thi" class="btn btn-danger ">Close</a>

    <br>
    <div class="row outer-border border border-secondary">
        <form:form action="/san-pham-giam-gia/update/${sanphamgiamgiaupdate.id}" class="container" method="post" modelAttribute="sanphamgiamgiaupdate">
            <div class="row">

                <div class="form-floating mb-3 mt-3">
                    <div class="row">
                        <div class="col-11">
                            <form:select path="chiTietSanPham" class="form-control" cssStyle="font-weight: bold; width: 100%">
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
                <div class="form-floating mb-3 mt-3">
                    <form:select path="khuyenMai" class="form-control">
                        <form:options items="${listKM}" itemLabel="ma" itemValue="id"/>
                    </form:select>
                    <form:label class="form-label" path="khuyenMai">Khuyen mai:</form:label>
                </div>
                <div class="form-floating mb-3 mt-3">
                    <div class="row">
                        <div class="row-12">
                            <form:label class="form-label" path="tinhTrang">Tình Trạng:</form:label>
                            <form:radiobutton path="tinhTrang" value="0"/>Không hoạt động
                            <form:radiobutton path="tinhTrang" value="1" checked="true"/> Hoạt động
                            <form:errors path="tinhTrang" cssStyle="color: red"></form:errors>
                        </div>
                    </div>

                </div>
                <div class="form-floating mb-3 mt-3">

                    <form:textarea class="form-control" placeholder="" path="moTa"/>
                    <form:label class="form-label" path="moTa">Mota:</form:label>
                    <form:errors path="moTa" cssStyle="color: red"></form:errors>

                </div>



            </div>

            <form:button type="submit" class="btn btn-primary"
                         onclick="if(!(confirm('Bạn có muốn cập nhật ? ')))return false;else return true">Update</form:button>
        </form:form>
    </div>
    <br>





</section>
</body>

<script>
    function remove(url) {
        var confirmed = false;
        var message = confirm("ban co muon xoa?");
        if (message) {
            confirmed = true;
            alert("Xoa thanh cong");
        } else {
            confirmed = false;
        }
        if (confirmed) {
            window.location.href = url;
        }
    }

    function checkSearch() {
        var cf = confirm("Bạn có chắc chắn muốn tìm sản phẩm không?");
        if (cf == true) {
            return true;
        } else {
            return false;
        }
    }

    function checkLoc() {
        var cf = confirm("Bạn có chắc chắn muốn tìm sản phẩm không?");
        if (cf == true) {
            return true;
        } else {
            return false;
        }
    }
</script>
<script src="/vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!-- FastClick -->
<script src="/vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="/vendors/nprogress/nprogress.js"></script>
<!-- Chart.js -->
<script src="/vendors/Chart.js/dist/Chart.min.js"></script>
<!-- gauge.js -->
<script src="/vendors/gauge.js/dist/gauge.min.js"></script>
<!-- bootstrap-progressbar -->
<script src="/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<!-- iCheck -->
<script src="/vendors/iCheck/icheck.min.js"></script>
<!-- Skycons -->
<script src="/vendors/skycons/skycons.js"></script>
<!-- Flot -->
<script src="/vendors/Flot/jquery.flot.js"></script>
<script src="/vendors/Flot/jquery.flot.pie.js"></script>
<script src="/vendors/Flot/jquery.flot.time.js"></script>
<script src="/vendors/Flot/jquery.flot.stack.js"></script>
<script src="/vendors/Flot/jquery.flot.resize.js"></script>
<!-- Flot plugins -->
<script src="/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
<script src="/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
<script src="/vendors/flot.curvedlines/curvedLines.js"></script>
<!-- DateJS -->
<script src="/vendors/DateJS/build/date.js"></script>
<!-- JQVMap -->
<script src="/vendors/jqvmap/dist/jquery.vmap.js"></script>
<script src="/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
<script src="/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
<!-- bootstrap-daterangepicker -->
<script src="/vendors/moment/min/moment.min.js"></script>
<script src="/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

<!-- Custom Theme Scripts -->
<script src="/build/js/custom.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

<script>
    $(document).ready(function () {
        $('#selectSanPham').select2();
    });
    $(document).ready(function () {
        $('#selectRam').select2();
    });
    $(document).ready(function () {
        $('#selectRom').select2();
    });
    $(document).ready(function () {
        $('#selectPin').select2();
    });
    $(document).ready(function () {
        $('#selectMauSac').select2();
    });
    $(document).ready(function () {
        $('#selectChip').select2();
    });
</script>
</html>
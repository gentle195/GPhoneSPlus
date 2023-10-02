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
    <h3 style="color: black; text-align: center"><b>Add Imei</b></h3>
    <br>
    <a href="/imei/hien-thi" class="btn btn-danger ">Close</a>

    <br>
    <div class="row outer-border border border-secondary">
        <form:form action="/imei/add" class="container" method="post" modelAttribute="imei">
            <div class="row">

                <div class="form-floating mb-3 mt-3">
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
                                <img src="/uploads/plus.png">
                            </a>
                        </div>
                    </div>
                </div>
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="ma" value="${ma}" readonly="true"/>
                    <form:label class="form-label" path="ma">Ma:</form:label>
                    <form:errors path="ma" cssStyle="color: red"></form:errors>
                </div>
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="Imei" path="soImei"/>
                    <form:label class="form-label" path="soImei">Imei:</form:label>
                    <form:errors path="soImei" cssStyle="color: red"></form:errors>
                </div>
                <div class="form-floating mb-3 mt-3">
                    <div class="row">
                        <div class="col-12">
                            <form:label class="form-label" path="tinhTrang">Tình Trạng:</form:label>
                            <form:radiobutton path="tinhTrang" value="0" label="Chưa bán" checked="true"/>
                            <form:radiobutton path="tinhTrang" value="1" label="Đã bán"/>
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
                         onclick="if(!(confirm('Bạn có muốn thêm ? ')))return false;else return true">Add</form:button>
        </form:form>
    </div>
    <br>
    <div class="modal fade" id="exampleModalChiTietSanPham" tabindex="-1"
             aria-labelledby="exampleModalLabel" aria-hidden="true"
             data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title" id="exampleModalLabel">Add New Pin</h2>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form:form action="/chi-tiet-san-pham/add" method="post"
                           modelAttribute="chitietsanpham"
                           enctype="multipart/form-data">
                    <%--    <div class="col-md-6 grid-margin stretch-card" >--%>
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Thêm mới chi tiết sản phẩm</h4>
                        <form class="forms-sample" justify-content-center>
                            <div class="row">
                                <div class="col-md-12 mx-auto">
                                    <div class="form-group">

                                        <div align="center">
                                            <br>
                                            <label style="border: 5px solid white;width: 150px;height: 150px;border-radius:50% 50% 50% 50%;"
                                                   for="anhmoi">
                                                <img id="preview-image-2"
                                                     class="preview-image"
                                                     src="" alt=""
                                                     width="100%" height="100%"
                                                     style="border-radius:50% 50% 50% 50%;border: 2px solid #8c8c8c">

                                                <br><br>
                                                ẢNH
                                            </label>
                                            <br>
                                            <div style="display: none">
                                                <input type="file" name="images"
                                                       accept="image/jpeg, image/png"
                                                       id="anhmoi"
                                                       required>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-6">

                                    <div class="form-group">

                                        <div class="row">
                                            <div class="col-11">
                                                <form:select path="sanPham"
                                                             class="form-control"
                                                             id="selectSanPham"
                                                             cssStyle="font-weight: bold; width: 100%">
                                                    <option selected disabled>
                                                        Sản phẩm
                                                    </option>
                                                    <form:options
                                                            items="${listSanPham}"
                                                            itemLabel="ten"
                                                            itemValue="id"/>
                                                </form:select>
                                                <form:errors path="sanPham"/>
                                            </div>
                                            <div class="col-1">
                                                <a type="button"
                                                   data-bs-toggle="modal"
                                                   data-bs-target="#exampleModalSanPham">
                                                    <img src="../uploads/plus.png">
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-11">
                                                <form:select path="mauSac"
                                                             class="form-control"
                                                             id="selectMauSac"
                                                             cssStyle="font-weight: bold; width: 100%">
                                                    <option selected disabled>
                                                        Màu sắc
                                                    </option>
                                                    <form:options
                                                            items="${listMauSac}"
                                                            itemLabel="ten"
                                                            itemValue="id"/>
                                                </form:select>
                                            </div>
                                            <div class="col-1">
                                                <a type="button"
                                                   data-bs-toggle="modal"
                                                   data-bs-target="#exampleModalMauSac">
                                                    <img src="../uploads/plus.png">
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-11">
                                                <form:select path="chip"
                                                             class="form-control"
                                                             id="selectChip"
                                                             cssStyle="font-weight: bold; width: 100%">
                                                    <option selected disabled>
                                                        Chip
                                                    </option>
                                                    <form:options
                                                            items="${listChip}"
                                                            itemLabel="ten"
                                                            itemValue="id"/>
                                                </form:select>
                                            </div>
                                            <div class="col-1">
                                                <a type="button"
                                                   data-bs-toggle="modal"
                                                   data-bs-target="#exampleModalChip">
                                                    <img src="../uploads/plus.png">
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-11">
                                                <form:select path="ram"
                                                             class="form-control"
                                                             id="selectRam"
                                                             cssStyle="font-weight: bold; width: 100%">
                                                    <option selected disabled>
                                                        Dung lượng bộ nhớ
                                                    </option>
                                                    <form:options
                                                            items="${listRam}"
                                                            itemLabel="dungLuong"
                                                            itemValue="id"/>
                                                </form:select>
                                            </div>
                                            <div class="col-1">
                                                <a type="button"
                                                   data-bs-toggle="modal"
                                                   data-bs-target="#exampleModalRam">
                                                    <img src="../uploads/plus.png">
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-11">
                                                <form:select path="rom"
                                                             class="form-control"
                                                             id="selectRom"
                                                             cssStyle="font-weight: bold; width: 100%">
                                                    <option selected disabled>
                                                        Dung lượng lưu trữ
                                                    </option>
                                                    <form:options
                                                            items="${listRom}"
                                                            itemLabel="dungLuong"
                                                            itemValue="id"/>
                                                </form:select>
                                            </div>
                                            <div class="col-1">
                                                <a type="button"
                                                   data-bs-toggle="modal"
                                                   data-bs-target="#exampleModalRom">
                                                    <img src="../uploads/plus.png">
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-11">
                                                <form:select path="pin"
                                                             class="form-control"
                                                             id="selectPin"
                                                             cssStyle="font-weight: bold; width: 100%">
                                                    <option selected disabled>
                                                        Pin
                                                    </option>
                                                    <form:options
                                                            items="${listPin}"
                                                            itemLabel="dungLuongPin.thongSo"
                                                            itemValue="id"/>
                                                </form:select>
                                            </div>
                                            <div class="col-1">
                                                <a type="button"
                                                   data-bs-toggle="modal"
                                                   data-bs-target="#exampleModalPin">
                                                    <img src="../uploads/plus.png">
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <form:label class="form-label"
                                                    path="giaNhap">Giá nhập:</form:label>
                                        <form:input class="form-control"
                                                    placeholder=""
                                                    path="giaNhap"
                                                    type="number"/>
                                        <form:errors path="giaNhap"
                                                     cssStyle="color: red"/>
                                    </div>
                                    <div class="form-group">
                                        <form:label class="form-label"
                                                    path="giaBan">Giá bán:</form:label>
                                        <form:input class="form-control"
                                                    placeholder="" path="giaBan"
                                                    type="number"/>
                                        <form:errors path="giaBan"
                                                     cssStyle="color: red"/>
                                    </div>

                                    <div class="form-group">
                                        <form:label class="form-label"
                                                    path="namBaoHanh">Năm bảo hành:</form:label>
                                        <form:input class="form-control"
                                                    placeholder=""
                                                    path="namBaoHanh"
                                                    type="number"/>
                                        <form:errors path="namBaoHanh"
                                                     cssStyle="color: red"/>
                                    </div>
                                    <div class="form-group">
                                        <form:label class="form-label"
                                                    path="soLuong">Số lượng tồn:</form:label>
                                        <form:input class="form-control"
                                                    placeholder=""
                                                    path="soLuong"
                                                    type="number"/>
                                        <form:errors path="soLuong"
                                                     cssStyle="color: red"/>
                                    </div>

                                </div>

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <form:label class="form-label"
                                                    path="moTa">Mô tả:</form:label>
                                        <form:textarea class="form-control"
                                                       placeholder=""
                                                       path="moTa"/>
                                        <form:errors path="moTa"
                                                     cssStyle="color: red"/>
                                    </div>
                                </div>

                            </div>

                            <div style="text-align: center">
                                <button type="submit"
                                        class="btn btn-primary mr-2"
                                        onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                    ADD
                                </button>
                            </div>


                        </form>
                    </div>
                </div>
            </div>
            </form:form>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary"
                    data-bs-dismiss="modal">Close
            </button>
        </div>
    </div>
</div>

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
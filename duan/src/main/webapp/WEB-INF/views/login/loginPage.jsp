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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="../../../vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../../../vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="../../../vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="../../../vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="../../../css/style.css" rel="stylesheet">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>GPhoneS Store</title>
</head>

<body>
<section class="vh-100" style="background-color: #bccff9;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-xl-10">
                <div class="card" style="border-radius: 1rem;">
                    <div class="row g-0">
                        <div class="col-md-6 col-lg-5 d-none d-md-block">
                            <img src="https://scontent.fhan15-2.fna.fbcdn.net/v/t39.30808-6/394580810_718860170125362_1195120911846399491_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_ohc=m9GPq-RrupkAX8J8nTW&_nc_ht=scontent.fhan15-2.fna&oh=00_AfAVSW3LP9G54K_bAKV9jHHPwVmafvUvxQiccQRCz-XAhA&oe=653CB061"
                                 alt="login form" style="border-radius: 5rem 0 0 5rem;"/>
                        </div>
                        <div class="col-md-6 col-lg-7 d-flex align-items-center">
                            <div class="card-body p-4 p-lg-5 text-black">

                                <form action="/login" method="post">

                                    <div class="d-flex align-items-center mb-3 pb-1">

                                        <span class="h1 fw-bold mb-0">Xin chào</span>
                                    </div>

                                    <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Đăng nhập bằng tài
                                        khoản của bạn</h5>

                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="username" style="font-size: large">Tài
                                            khoản</label>
                                        <input type="text" id="username" class="form-control form-control-lg"
                                               name="username"/>

                                        <span class="text-danger" id="usernameError"></span>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="password" style="font-size: large">Mật
                                            khẩu</label>
                                        <input type="password" id="password" class="form-control form-control-lg"
                                               name="password"/>

                                        <span class="text-danger" id="passwordError"></span>
                                    </div>
                                    <div class="mb-4">
                                        <button class="btn btn-dark btn-lg btn-block" id="loginBtt"
                                                onclick="validate()">Đăng nhập
                                        </button>
                                        <div style="color: red">${tb}</div>
                                    </div>
                                    <a class="small text-muted" href="/quen-mat-khau"
                                       style="font-size: larger;color: #00A2FF">Quên
                                        mật khẩu?</a>
                                    <hr>
                                    <br>
                                    <p class="mb-5 pb-lg-2" >
                                        <a type="button" class="btn btn-info"
                                           style="font-size: larger" href="/dang-ky-tai-khoan">Đăng ký
                                            tài khoản</a>
                                        <%--                                        <button type="button"--%>
                                        <%--                                                data-bs-toggle="modal" class="btn btn-info"--%>
                                        <%--                                                data-bs-target="#dangKy" style="color: #393f81;">Đăng kí tài khoản--%>
                                        <%--                                        </button>--%>
                                    </p>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="modal fade" id="dangKy" tabindex="-1"
     aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered ">
        <div class="modal-content">
            <div class="modal-header">
                <h3>Đăng ký tài khoản</h3>
            </div>
            <div class="modal-body">
                <form:form action="/login/dang-ky-tai-khoan" method="post" modelAttribute="khachHang"
                           enctype="multipart/form-data">
                    <div class="col-12 grid-margin" style="color:#0b0b0b;">
                        <div class="card">
                            <div class="card-body">
                                <form class="form-sample">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group row">
                                                <form:label class="col-sm-3 col-form-label"
                                                            path="hoTen">Họ Tên :
                                                </form:label>
                                                <div class="col-sm-9">
                                                    <form:input class="form-control" placeholder="" path="hoTen"
                                                                id="tenkh"/>
                                                    <label id="tenkh1" style="color: red"></label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group row">
                                                <form:label class="col-sm-3 col-form-label"
                                                            path="email">Email:</form:label>
                                                <div class="col-sm-9">
                                                    <form:input class="form-control" placeholder=""
                                                                path="email" id="emailkh"/>
                                                    <label id="email1"
                                                           style="color: red"></label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group row">
                                                <form:label class="col-sm-3 col-form-label"
                                                            path="sdt">SĐT:</form:label>
                                                <div class="col-sm-9">
                                                    <form:input class="form-control" placeholder="" path="sdt"
                                                                id="sdtkh"/>
                                                    <label id="sdtkh1" style="color: red"></label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group row">
                                                <form:label class="col-sm-3 col-form-label"
                                                            path="ngaySinh">Ngày Sinh:</form:label>
                                                <div class="col-sm-9">
                                                    <form:input class="form-control" placeholder=""
                                                                path="ngaySinh" type="date"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group row">
                                                <form:label class="col-sm-3 col-form-label"
                                                            path="gioiTinh">Giới Tính:</form:label>
                                                <div class="col-sm-9">
                                                    <div class="form-control">
                                                        <form:radiobutton path="gioiTinh" value="true"/>Nam
                                                        <form:radiobutton path="gioiTinh" value="false"
                                                                          cssStyle="margin-left: 1cm"/> Nữ
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group row">
                                                <form:label class="col-sm-3 col-form-label"
                                                            path="taiKhoan" for="tkkh">Tài Khoản:</form:label>
                                                <div class="col-sm-9">
                                                    <form:input class="form-control" placeholder=""
                                                                path="taiKhoan" id="taiKhoanKhachHang"/>
                                                    <label id="taiKhoan1" style="color: red"></label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group row">
                                                <form:label class="col-sm-3 col-form-label"
                                                            path="matKhau" for="tkkh">Mật Khẩu:</form:label>
                                                <div class="col-sm-9">
                                                    <form:input class="form-control" placeholder=""
                                                                path="matKhau" id="matKhauKhachHang"/>
                                                    <label id="matKhau1" style="color: red"></label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div style="text-align: center">
                                                <button type="submit" class="btn btn-primary mr-2"
                                                        id="btkh" onclick="return checkhkh()">
                                                    Đăng ký
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </form:form>
            </div>

        </div>
    </div>
</div>
<div class="modal fade" id="quenMatKhau" tabindex="-1"
     aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered ">
        <div class="modal-content">
            <div class="modal-header">
                <div class="row">
                    <div class="col-12"><h3>Quên mật khẩu</h3></div>
                    <div class="col-12"><h5 style="color: red">Mời nhập tài khoản và email để chúng tôi có thể gửi lại
                        mật khẩu mới cho bạn</h5></div>
                </div>

            </div>
            <div class="modal-body">
                <form action="/login/quen-mat-khau" method="post">
                    <div class="col-12 grid-margin" style="color:#0b0b0b;">
                        <div class="card">
                            <div class="card-body">
                                <form class="form-sample">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label">Tài Khoản:
                                                </label>
                                                <div class="col-sm-9">
                                                    <input class="form-control" placeholder="" name="taiKhoan-quen"/>
                                                    <%--                                                    <label id="taiKhoan-quan" style="color: red"></label>--%>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label">Email:
                                                </label>
                                                <div class="col-sm-9">
                                                    <input class="form-control" placeholder="" name="email-quen"/>
                                                    <%--                                                    <label id="taiKhoan-quan" style="color: red"></label>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
<script>
    function validate() {
        var un = document.getElementById("username").value;
        var pw = document.getElementById("password").value;
        var bt = document.getElementById("loginBtt");
        if (un.trim() === "") {
            document.getElementById("usernameError").innerHTML = "Tài khoản không được để trống";
            bt.type = "button";
            return false;
        } else if (pw.trim() === "") {
            document.getElementById("usernameError").innerHTML = "";

            document.getElementById("passwordError").innerHTML = "Mật khẩu không được để trống";
            bt.type = "button";
            return false;
        } else {
            document.getElementById("passwordError").innerHTML = "";
            bt.type = "submit";
            return false;
        }
    }

    function checkhkh() {
        var tenhkh = document.getElementById("tenkh").value;
        var sdtkh = document.getElementById("sdtkh").value;
        var email = document.getElementById("emailkh").value;
        var taiKhoan = document.getElementById("taiKhoanKhachHang").value;
        var matKhau = document.getElementById("matKhauKhachHang").value;

        if (
            tenhkh.trim().length < 6 || tenhkh == ''
        ) {
            document.getElementById("btkh").type = "button";
            document.getElementById("tenkh1").innerHTML = "Không để trống ,Tên ít nhất 6 ký tự";
            return false;
        } else {
            document.getElementById("tenkh1").innerHTML = "";
            var regex = /^0\d{9}$/;
            var regexemail = /^.{8,}@gmail\\.com$/

            if (regex.test(sdtkh)) {
                document.getElementById("sdtkh1").innerHTML = "";
                document.getElementById("btkh").type = "submit";
                return true;
            } else {
                document.getElementById("sdtkh1").innerHTML = "SDT phải 10 số và bắt đầu là số 0";
                if (regexemail.test(email)) {
                    document.getElementById("email1").innerHTML = "";
                    document.getElementById("btkh").type = "submit";
                    return true;
                } else {
                    document.getElementById("email1").innerHTML = "email chưa đúng";
                    if (taiKhoan.trim().length < 6 || taiKhoan == '') {
                        document.getElementById("btkh").type = "button";
                        document.getElementById("taiKhoan1").innerHTML = "Tài khoản không được để trống và có ít nhất 6 ký tự ";
                        return false;
                    } else {
                        document.getElementById("taiKhoan1").innerHTML = "";
                        if (matKhau == '') {
                            document.getElementById("btkh").type = "button";
                            document.getElementById("matKhau1").innerHTML = "Mật khẩu không được để trống";
                            return false;
                        } else {
                            document.getElementById("matKhau1").innerHTML = "";
                            document.getElementById("btkh").type = "summit";
                            alert('Đăng ký tài khoản thành công.');
                            return true;
                        }
                    }
                }
            }
        }
    }
</script>
<script src="../../../vendor/global/global.min.js"></script>
<script src="../../../js/quixnav-init.js"></script>
<script src="../../../js/custom.min.js"></script>


<!-- Vectormap -->
<script src="../vendor/raphael/raphael.min.js"></script>
<%--    <script src="./vendor/morris/morris.min.js"></script>--%>


<script src="../../../vendor/circle-progress/circle-progress.min.js"></script>
<script src="../../../vendor/chart.js/Chart.bundle.min.js"></script>

<script src="../../../vendor/gaugeJS/dist/gauge.min.js"></script>

<!--  flot-chart js -->
<script src="../../../vendor/flot/jquery.flot.js"></script>
<script src="../../../vendor/flot/jquery.flot.resize.js"></script>

<!-- Owl Carousel -->
<script src="../../../vendor/owl-carousel/js/owl.carousel.min.js"></script>

<!-- Counter Up -->
<script src="../../../vendor/jqvmap/js/jquery.vmap.min.js"></script>
<script src="../../../vendor/jqvmap/js/jquery.vmap.usa.js"></script>
<script src="../../../vendor/jquery.counterup/jquery.counterup.min.js"></script>

<!-- Data table -->
<script src="../../../vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="../../../js/plugins-init/datatables.init.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
<script src="../../../js/select-2.js"></script>
</html>
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

    <style>
        .image-container {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
            border: 2px solid #ccc;
            margin: 0 auto;
            cursor: pointer; /* Bật con trỏ thành pointer để biểu thị tính năng nhấp vào */
        }

        .image-container img {
            max-width: 100%;
            max-height: 100%;
            object-fit: cover;
        }

        .input-hidden {
            display: none;
        }

        /*.image-container {*/
        /*    width: 200px;*/
        /*    height: 200px;*/
        /*    border-radius: 50%;*/
        /*    overflow: hidden;*/
        /*    display: flex;*/
        /*    justify-content: center;*/
        /*    align-items: center;*/
        /*    border: 2px solid #ccc;*/
        /*    margin: 0 auto;*/
        /*}*/

        /*.image-container img {*/
        /*    max-width: 100%;*/
        /*    max-height: 100%;*/
        /*    object-fit: cover;*/
        /*}*/
    </style>
</head>
<body>
<div class="main" style="border: 2px solid black; border-radius: 1.8% 0% 0% 0%">

    <div>
        <ul class="nav nav-tabs border-top" id="setting-panel" role="tablist">
            <li class="nav-item">
                <a href="/nhan-vien/hien-thi" class="btn btn-danger btn-icon-text"
                   tabindex="-1"
                   role="button">
                    <i class="ti-reload btn-icon-prepend"></i>
                    Trang thông tin nhân viên</a>
            </li>
            <li class="nav-item" style="border-radius: 2%">
                <a class="nav-link" role="tab">Thêm nhân viên</a>
            </li>
        </ul>
    </div>
    <%--    <div class="reload">--%>
    <%--        <a href="/nhan-vien/hien-thi" class="btn btn-danger btn-icon-text"--%>
    <%--           tabindex="-1"--%>
    <%--           role="button">--%>
    <%--            <i class="ti-reload btn-icon-prepend"></i>--%>
    <%--            Trang thông tin nhân viên</a>--%>
    <%--    </div>--%>

    <br>
    <div class="container">
        <form:form action="/nhan-vien/add" method="post" modelAttribute="nhanVien"
                   enctype="multipart/form-data">
            <div class="col-12 grid-margin">
                <div class="card">
                    <div class="card-body">
                            <%--                        <h4 class="card-title">Thêm nhân viên</h4>--%>
                        <form class="form-sample">

                            <div class="row">
                                <div class="col">
                                    <input type="file" class="form-control input-hidden" name="images"
                                           accept="image/jpeg, image/png, image/jpg"
                                           id="imageInput" required>
                                </div>
                            </div>
                            <div class="image-container" onclick="selectImage()">
                                <img id="selectedImage" src="/uploads/${nhanVien.urlAnh}"alt="Chọn ảnh">

                            </div>
                            <br>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Họ tên:</label>
                                        <div class="col-sm-9">
                                            <form:input class="form-control" id="form-control" placeholder=""
                                                        path="hoTen"/>
                                            <form:errors path="hoTen" cssStyle="color: red"></form:errors>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Tài khoản:</label>
                                        <div class="col-sm-9">
                                            <form:input class="form-control" placeholder="" path="taiKhoan"/>
                                            <form:errors path="taiKhoan" cssStyle="color: red"></form:errors>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Email:</label>
                                        <div class="col-sm-9">
                                            <input id="email" path="email" value="${nhanVien.email}" class="form-control" placeholder="" />
                                            <div id="email-error" style="color: red"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Mật khẩu:</label>
                                        <div class="col-sm-9 password-container">

                                            <input id="password" path="matKhau" value="${nhanVien.matKhau}" class="form-control" type="password" placeholder="*******" />
                                            <div id="password-error" style="color: red"></div>
                                            <div class="password-toggle" id="password-toggle" onclick="togglePassword()">Show</div>

                                        </div>
                                    </div>
                                </div>
                            </div>

<%--                            <div class="row">--%>
<%--                                <div class="col-md-6">--%>
<%--                                    <div class="form-group row">--%>
<%--                                        <label class="col-sm-3 col-form-label">Email:</label>--%>
<%--                                        <div class="col-sm-9">--%>
<%--                                            <form:input class="form-control" placeholder="" path="email"/>--%>
<%--                                            <form:errors path="email" cssStyle="color: red"></form:errors>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-md-6">--%>
<%--                                    <div class="form-group row">--%>
<%--                                        <label class="col-sm-3 col-form-label">Mật khẩu:</label>--%>
<%--                                        <div class="col-sm-9">--%>
<%--                                            <form:input class="form-control" placeholder="" path="matKhau"/>--%>
<%--                                            <form:errors path="matKhau" cssStyle="color: red"></form:errors>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">SĐT:</label>
                                        <div class="col-sm-9">
                                            <form:input class="form-control" placeholder="" path="sdt"></form:input>
                                            <form:errors path="sdt" cssStyle="color: red"></form:errors>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Ngày sinh:</label>
                                        <div class="col-sm-9">
                                            <form:input class="form-control" type="date" value="${nhanVien.ngaySinh}"
                                                        placeholder=""
                                                        path="ngaySinh"></form:input>
                                            <form:errors path="ngaySinh" cssStyle="color: red"></form:errors>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">CCCD:</label>
                                        <div class="col-sm-9">
                                            <form:input class="form-control" placeholder="" path="canCuoc"></form:input>
                                            <form:errors path="canCuoc" cssStyle="color: red"></form:errors>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Giới tính:</label>
                                        <div class="col-sm-9" style="margin-top: 0.5cm">
                                            <form:radiobutton path="gioiTinh" value="true" checked="true"/>Nam
                                            <form:radiobutton path="gioiTinh" value="false"
                                                              cssStyle="margin-left: 1cm"/> Nữ
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Quê quán:</label>
                                        <div class="col-sm-9">
                                            <form:input class="form-control" placeholder="" path="queQuan"></form:input>
                                            <form:errors path="queQuan" cssStyle="color: red"></form:errors>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Lương:</label>
                                        <div class="col-sm-9">
                                            <form:input type="number" class="form-control" value="5000000"
                                                        placeholder="" path="luong"/>
                                            <form:errors path="luong" cssStyle="color: red"></form:errors>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Chức vụ:</label>
                                        <div class="col-sm-9" style="margin-top: 0.4cm; font-size: 20px">
                                            <form:select path="chucVu">
                                                <form:options items="${listChucVu}" itemValue="id" itemLabel="ten"/>
                                            </form:select>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <br>
                            <div class="row">
                                <button style="text-align: center"
                                        type="submit" class="btn btn-primary mr-2"
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
</div>

</body>

<script>
    // Phần load ảnh
    const imageInput = document.getElementById('imageInput');
    const selectedImage = document.getElementById('selectedImage');

    function selectImage() {
        imageInput.click(); // Khi khung tròn được nhấp vào, kích hoạt sự kiện click của input file
    }

    imageInput.addEventListener('change', function () {
        const file = imageInput.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                selectedImage.src = e.target.result;
            };
            reader.readAsDataURL(file);
        } else {
            selectedImage.src = ''; // Xóa ảnh nếu không có tệp nào được chọn
        }
    });


    // Gmail/password
    const emailInput = document.getElementById('email');
    const emailError = document.getElementById('email-error');
    const passwordInput = document.getElementById('password');
    const passwordError = document.getElementById('password-error');
    const passwordToggle = document.getElementById('password-toggle');

    function togglePassword() {
        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            passwordToggle.innerText = 'Hide';
        } else {
            passwordInput.type = 'password';
            passwordToggle.innerText = 'Show';
        }
    }

    function validateEmail() {
        const email = emailInput.value;
        const emailRegex = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+([a-zA-Z]{2,7}|\w{2,7}\.edu)$/; // Điều kiện email
        if (!emailRegex.test(email)) {
            emailError.textContent = 'Email không hợp lệ';
        } else {
            emailError.textContent = '';
        }
    }

    emailInput.addEventListener('blur', validateEmail);


</script>
<%--<script>--%>
<%--    const imageInput = document.getElementById('imageInput');--%>
<%--    const selectedImage = document.getElementById('selectedImage');--%>

<%--    imageInput.addEventListener('change', function () {--%>
<%--        const file = imageInput.files[0];--%>
<%--        if (file) {--%>
<%--            const reader = new FileReader();--%>
<%--            reader.onload = function (e) {--%>
<%--                selectedImage.src = e.target.result;--%>
<%--            };--%>
<%--            reader.readAsDataURL(file);--%>
<%--        } else {--%>
<%--            selectedImage.src = ''; // Xóa ảnh nếu không có tệp nào được chọn--%>
<%--        }--%>
<%--    });--%>
<%--</script>--%>

<script src="../../vendors/js/vendor.bundle.base.js"></script>
<script src="../../js/off-canvas.js"></script>
<script src="../../js/hoverable-collapse.js"></script>
<script src="../../js/template.js"></script>
<script src="../../js/settings.js"></script>
<script src="../../js/todolist.js"></script>
</html>

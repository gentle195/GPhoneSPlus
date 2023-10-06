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
                <a class="nav-link" role="tab">Update nhân viên</a>
            </li>
        </ul>
    </div>
    <div class="container">
        <form:form action="/nhan-vien/update/${nhanVien.id}" method="post" modelAttribute="nhanVien"
                   enctype="multipart/form-data">
            <div class="col-12 grid-margin">
                <div class="card">
                    <div class="card-body">
                        <form class="form-sample">

                            <div class="row">
                                <div style="display: none">
                                    <input style="" type="text" name="checkanh" value="cu" id="cucheck">
                                    <br>
                                <div class="col" style="display: none">
                                    <input type="file" class="form-control input-hidden" name="images"
                                           accept="image/jpeg, image/png, image/jpg"
                                           id="imageInput">
                                </div>
                            </div>
<%--                                <label for="imageInput">--%>
                            <div class="image-container" onclick="selectImage()">
                                <img id="selectedImage" name="selectedImage" src="/../../uploads/${nhanVien.urlAnh}" alt="Chọn ảnh">
                            </div>

<%--                                </label>--%>
                            <br>
                            <div class="row" style="display: none">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Mã:</label>
                                        <div class="col-sm-9" style="display: none">
                                            <form:input cssStyle="display: none" class="form-control" id="form-control"
                                                        placeholder=""
                                                        path="ma"/>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Họ tên:<form:errors path="hoTen"
                                                                                                   cssStyle="color: red"></form:errors></label>
                                        <div class="col-sm-9">
                                            <form:input class="form-control" id="form-control" placeholder=""
                                                        path="hoTen"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Tài khoản:
                                            <form:errors path="taiKhoan" cssStyle="color: red"></form:errors>
                                        </label>
                                        <div class="col-sm-9">
                                            <form:input class="form-control" placeholder="" path="taiKhoan"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Email:
                                            <form:errors path="email"
                                                         cssStyle="color: red"></form:errors></label>
                                        <div class="col-sm-9">
                                            <input id="email" name="email" value="${nhanVien.email}"
                                                   class="form-control" placeholder=""/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Mật khẩu:
                                            <form:errors path="matKhau"
                                                         cssStyle="color: red"></form:errors></label>
                                        <div class="col-sm-9 password-container">
                                            <input id="password" name="matKhau" value="${nhanVien.matKhau}"
                                                   class="form-control" type="password"
                                                   placeholder="*******"/>
                                            <div id="password-error" style="color: red"></div>
                                            <div class="password-toggle" id="password-toggle"
                                                 onclick="togglePassword()">
                                                Show
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">SĐT:
                                            <form:errors path="sdt" cssStyle="color: red"></form:errors>
                                        </label>
                                        <div class="col-sm-9">
                                            <form:input class="form-control" placeholder="" path="sdt"></form:input>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Ngày sinh:
                                            <div id="tb" style="color: crimson;float: right"></div>
                                        </label>
                                        <div class="col-sm-9">
                                            <form:input class="form-control" type="date" value="${nhanVien.ngaySinh}"
                                                        placeholder=""
                                                        path="ngaySinh"></form:input>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">CCCD:
                                            <form:errors path="canCuoc" cssStyle="color: red"></form:errors>
                                        </label>
                                        <div class="col-sm-9">
                                            <form:input class="form-control" placeholder="" path="canCuoc"></form:input>
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
                                        <label class="col-sm-3 col-form-label">Quê quán:
                                            <form:errors path="queQuan" cssStyle="color: red"></form:errors>
                                        </label>
                                        <div class="col-sm-9">
                                            <form:input class="form-control" placeholder="" path="queQuan"></form:input>
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

                            <div style="text-align: center">
                                <button type="submit" class="btn btn-primary mr-2"
                                        onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                    SAVE
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <%--    </div>--%>
        </form:form>
    </div>
</div>
</body>

<script>
    // const emailInput = document.getElementById('email');
    // const emailError = document.getElementById('email-error');

    const passwordInput = document.getElementById('password');
    const passwordError = document.getElementById('password-error');
    const passwordToggle = document.getElementById('password-toggle');

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
    function togglePassword() {
        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            passwordToggle.innerText = 'Hide';
        } else {
            passwordInput.type = 'password';
            passwordToggle.innerText = 'Show';
        }
    };

    //
    // function validateEmail() {
    //     const email = emailInput.value;
    //     const emailRegex = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+([a-zA-Z]{2,7}|\w{2,7}\.edu)$/; // Điều kiện email
    //     if (!emailRegex.test(email)) {
    //         emailError.textContent = 'Email không hợp lệ';
    //     } else {
    //         emailError.textContent = '';
    //     }
    // }

    // emailInput.addEventListener('blur', validateEmail);

    function thongBao() {
        // if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;
        var ngaySinh = document.getElementById("check").value;
        if (confirm("Bạn muốn dùng trức năng này không") == true) {
            if (ngaySinh.trim() === '') {
                document.getElementById("tb").innerHTML = "Không để trống ngày sinh!";
                document.getElementById("bt").type = "button"
                return false;
            } else {
                document.getElementById("tb").innerHTML = "";
                document.getElementById("bt").type = "submit";
                return true;
            }
        } else {
            return false;
        }
    };

</script>
<script src="../../vendors/js/vendor.bundle.base.js"></script>
<script src="../../js/off-canvas.js"></script>
<script src="../../js/hoverable-collapse.js"></script>
<script src="../../js/template.js"></script>
<script src="../../js/settings.js"></script>
<script src="../../js/todolist.js"></script>

</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<style>
    .divider:after,
    .divider:before {
        content: "";
        flex: 1;
        height: 1px;
        background: #eee;
    }
</style>
<body>

<section class="vh-100">
    <div class="container py-5 h-100">
        <div class="row d-flex align-items-center justify-content-center h-100">
            <div class="col-md-8 col-lg-7 col-xl-6">
                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.svg"
                     class="img-fluid" alt="Phone image">
            </div>
            <div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">
                <form action="/login" method="post">
                    <!-- Email input -->
                    <div class="form-outline mb-4">
                        <input type="text" id="username" class="form-control form-control-lg" name="username"/>
                        <label class="form-label" for="username">Tài khoản</label>
                        <span class="text-danger" id="usernameError"></span>
                    </div>

                    <!-- Password input -->
                    <div class="form-outline mb-4">
                        <input type="password" id="password" class="form-control form-control-lg" name="password" />
                        <label class="form-label" for="password">Mật khẩu</label>
                        <span class="text-danger" id="passwordError"></span>
                        <div style="color: red">${tb}</div>

                    </div>

                    <div class="d-flex justify-content-around align-items-center mb-4">
                        <!-- Checkbox -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="form1Example3" checked />
                            <label class="form-check-label" for="form1Example3"> Remember me </label>
                        </div>
                        <a href="#!">Quên mật khẩu ?</a>
                    </div>

                    <!-- Submit button -->
                    <button id="loginBtt"  onclick="validate()" class="btn btn-primary btn-lg btn-block">Đăng nhập</button>

                    <div class="divider d-flex align-items-center my-4">
                        <p class="text-center fw-bold mx-3 mb-0 text-muted">Hoặc</p>
                    </div>

                    <a class="btn btn-primary btn-lg btn-block" style="background-color: #3b5998" href="#!"
                       role="button">
                        <i class="fab fa-facebook-f me-2"></i>Tiếp tục với facebook
                    </a>
                    <a class="btn btn-primary btn-lg btn-block" style="background-color: #55acee" href="#!"
                       role="button">
                        <i class="fab fa-twitter me-2"></i>Tiếp  tục với twitter</a>

                </form>
            </div>
        </div>
    </div>
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script>
    function validate(){
        var un=document.getElementById("username").value;
        var pw=document.getElementById("password").value;
        var bt=document.getElementById("loginBtt");
        if (un.trim()===""){
            document.getElementById("usernameError").innerHTML="Tài khoản không được để trống";
            bt.type="button";
            return false;
        }else if (pw.trim()===""){
            document.getElementById("usernameError").innerHTML="";

            document.getElementById("passwordError").innerHTML="Mật khẩu không được để trống";
            bt.type="button";
            return false;
        }
        else{
            document.getElementById("passwordError").innerHTML="";
            bt.type="submit";
            return false;
        }
    }

</script>
</body>
</html>
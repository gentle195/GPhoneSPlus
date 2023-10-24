<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
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
                                 alt="login form"  style="border-radius: 1rem 0 0 1rem;" />
                        </div>
                        <div class="col-md-6 col-lg-7 d-flex align-items-center">
                            <div class="card-body p-4 p-lg-5 text-black">

                                <form action="/login" method="post">

                                    <div class="d-flex align-items-center mb-3 pb-1">

                                        <span class="h1 fw-bold mb-0">Xin chào</span>
                                    </div>

                                    <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Đăng nhập bằng tài khoản của bạn</h5>

                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="username">Tài khoản</label>
                                        <input type="text" id="username" class="form-control form-control-lg" name="username" />

                                        <span class="text-danger" id="usernameError"></span>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="password">Mật khẩu</label>
                                        <input type="password" id="password" class="form-control form-control-lg" name="password" />

                                        <span class="text-danger" id="passwordError"></span>
                                    </div>

                                    <div class="mb-4">
                                        <button class="btn btn-dark btn-lg btn-block" id="loginBtt" onclick="validate()">Đăng nhập</button>
                                        <div style="color: red">${tb}</div>
                                    </div>

                                    <a class="small text-muted" href="#!">Quên mật khẩu?</a>
                                    <p class="mb-5 pb-lg-2" style="color: #393f81;">Bạn chưa có tài khoản? <a href="#!"
                                                                                                              style="color: #393f81;">Đăng kí </a></p>
                                    <a href="#!" class="small text-muted">Terms of use.</a>
                                    <a href="#!" class="small text-muted">Privacy policy</a>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
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
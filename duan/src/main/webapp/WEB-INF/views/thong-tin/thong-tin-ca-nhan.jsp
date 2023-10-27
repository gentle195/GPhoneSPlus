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

    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<div style="width: 100%;height: auto">
    <form:form action="/login/update-thong-tin/${us.id}" method="post" modelAttribute="us"
               enctype="multipart/form-data">
        <div class="card">
            <div class="card-body">
                <form class="form-sample">
                    <div class="row">
                        <div class="col-12">
                            <div style="display: none">
                                <input style="" type="text" name="checkanh1" value="cu1" id="cucheck1">
                                <br>
                            </div>
                            <div align="center">
                                <br>
                                <label style="border: 5px solid white;width: 150px;height: 150px;border-radius:50% 50% 50% 50%;"
                                       for="anhmoi1">
                                    <img id="preview-anh1-2" class="preview-image"
                                         src="/uploads/${us.urlAnh}" alt=""
                                         width="100%" height="100%"
                                         style="border-radius:50% 50% 50% 50%;border: 2px solid #8c8c8c">
                                    <br><br>
                                    ẢNH
                                </label>
                                <br>
                                <div style="display: none">
                                    <input type="file" name="anh1s" accept="image/jpeg, image/png"
                                           id="anhmoi1">
                                </div>
                            </div>
                            <div style="display: none">
                                <form:input path="urlAnh"/>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="card">
            <div class="card-body">
                <form class="form-sample">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group row">
                                <form:label path="hoTen" class="col-sm-3 col-form-label">Họ tên:</form:label>
                                <div class="col-sm-9">
                                    <form:input class="form-control" id="form-control" placeholder=""
                                                path="hoTen"/>
                                    <form:errors path="hoTen" cssStyle="color: red"/>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="col-md-12">
                            <div class="form-group row">
                                <form:label path="email" class="col-sm-3 col-form-label">Email:</form:label>
                                <div class="col-sm-9">
                                    <form:input class="form-control" id="form-control" placeholder=""
                                                path="email"/>
                                    <form:errors path="email"
                                                 cssStyle="color: red"/>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="col-md-12">
                            <div class="form-group row">
                                <form:label path="sdt" class="col-sm-3 col-form-label">SĐT:</form:label>
                                <div class="col-sm-9">
                                    <form:input class="form-control" placeholder="" path="sdt"/>
                                    <form:errors path="sdt" cssStyle="color: red"/>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="col-md-12">
                            <div class="form-group row">
                                <form:label path="ngaySinh" class="col-sm-3 col-form-label">Ngày sinh:
                                </form:label>
                                <div class="col-sm-9">
                                    <form:input class="form-control" type="date"
                                                placeholder=""
                                                path="ngaySinh"/>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="col-md-12">
                            <div class="form-group row">
                                <form:label path="canCuoc" class="col-sm-3 col-form-label">CCCD:</form:label>
                                <div class="col-sm-9">
                                    <form:input class="form-control" placeholder="" path="canCuoc"/>
                                    <form:errors path="canCuoc" cssStyle="color: red"/>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="col-md-12">
                            <div class="form-group row">
                                <form:label path="gioiTinh"
                                            class="col-sm-3 col-form-label">Giới tính:</form:label>
                                <div class="col-sm-9" style="margin-top: 0.5cm">
                                    <form:radiobutton path="gioiTinh" value="true" checked="true"/>Nam
                                    <form:radiobutton path="gioiTinh" value="false"
                                                      cssStyle="margin-left: 1cm"/> Nữ
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="col-md-12">
                            <div class="form-group row">
                                <form:label path="queQuan"
                                            class="col-sm-3 col-form-label">Quê quán:</form:label>
                                <div class="col-sm-9">
                                    <form:input class="form-control" placeholder="" path="queQuan"/>
                                    <form:errors path="queQuan" cssStyle="color: red"/>
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
    </form:form>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</html>
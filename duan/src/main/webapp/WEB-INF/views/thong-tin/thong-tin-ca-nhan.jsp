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
<form:form action="/login/update-thong-tin/${us.id}" method="post" modelAttribute="us"
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
                        <div class="image-container" onclick="selectImage()">
                            <img id="selectedImage" name="selectedImage" src="/../../uploads/${us.urlAnh}"
                                 alt="Chọn ảnh">
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
    </div>
</form:form>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</html>
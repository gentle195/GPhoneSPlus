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
    <title>Rom</title>
    <%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"--%>
    <%--          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">--%>
    <!-- Bootstrap -->
    <link rel="icon" href="/images/favicon.ico" type="image/ico"/>

    <title>Gentelella Alela!</title>
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
</head>

<body>
<form:form action="/pin/add" method="post" modelAttribute="pin">
    <div class="row">
        <div class="col">
            <form:label path="loaiPin"><b>Loại Pin:</b></form:label>
            <form:input path="loaiPin" class="form-control"></form:input>
            <form:errors path="loaiPin"></form:errors>
        </div>
        <div class="col">
            <form:label path="congNghePin"><b>Công nghệ Pin:</b></form:label>
            <form:input path="congNghePin" class="form-control"></form:input>
            <form:errors path="congNghePin"></form:errors>
        </div>
        <div class="col">
            <form:label path="moTa"><b>Mô Tả:</b></form:label>
            <form:textarea path="moTa" class="form-control"></form:textarea>
            <form:errors path="moTa"></form:errors>
        </div>
        <div class="col">
            <form:label path="dungLuongPin"><b>Dung Lượng:</b></form:label>
            <form:select path="dungLuongPin" items="${dungLuongPin}" class="form-control" itemLabel="thongSo"
                         itemValue="id"></form:select>
        </div>
        <div style="margin-top: 20px; margin-bottom: 20px">
            <button type="submit" class="btn btn-primary"
                    onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">ADD
            </button>
        </div>
    </div>
</form:form>
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
</head>
<body>
<h3 style="color: red; text-align: center"><b>Dung Lượng Pin</b></h3>
<a href="/dung-luong-pin/hien-thi" class="btn btn-outline-primary"
   tabindex="-1"
   role="button"
   onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">Quay lại</a>
<hr>
<form:form action="/dung-luong-pin/update/${dungLuongPin.id}" method="post" modelAttribute="dungLuongPin">
    <div class="row">
        <div class="col" style="display: none">
            <form:label path="ma"><b>Mã:</b></form:label>
            <form:input path="ma" class="form-control"></form:input>
        </div>
        <div class="col">
            <form:label path="thongSo"><b>Thông số:</b></form:label>
            <form:input path="thongSo" class="form-control"></form:input>
            <form:errors path="thongSo"></form:errors>
        </div>

        <div class="col" style="display: none">
            <form:label path="ngayTao"><b>Ngày Tạo:</b></form:label>
            <form:input path="ngayTao" class="form-control" type="date"></form:input>
        </div>
        <div class="col">
            <form:label path="moTa"><b>Mô Tả:</b></form:label>
            <form:textarea path="moTa" class="form-control"></form:textarea>
            <form:errors path="moTa"></form:errors>
        </div>

        <div style="margin-top: 20px; margin-bottom: 20px">
            <button type="submit" class="btn btn-primary" onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;else alert('Thành công')">SAVE</button>
        </div>
    </div>
</form:form>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
</html>
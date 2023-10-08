<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Focus - Bootstrap Admin Dashboard </title>
    <!-- Favicon icon -->
</head>
<body>
<div>
    <ul class="nav nav-tabs border-top" id="setting-panel" role="tablist">
        <li class="nav-item">
            <a class="nav-link" href="/dung-luong-pin/hien-thi" role="tab">Thông tin dung lượng Pin </a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab"
               aria-controls="description" aria-selected="true">Update</a>
        </li>
    </ul>
</div>
<div class="tab-content" id="myTabContent">
    <div class="tab-pane fade show active" id="description" role="tabpanel"
         aria-labelledby="description-tab">
        <form:form action="/dung-luong-pin/update/${dungLuongPin.id}" method="post" modelAttribute="dungLuongPin">
            <%--    <div class="col-md-6 grid-margin stretch-card" >--%>
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Update dung lượng Pin</h4>
                    <form class="forms-sample">
                        <div class="form-group" style="display: none">
                            <form:label path="ma"><b>Mã:</b></form:label>
                            <form:input path="ma" class="form-control"></form:input>
                            <form:errors path="ma"></form:errors>
                        </div>
                        <div class="form-group">
                            <form:label path="thongSo"><b>Thông số:</b></form:label>
                            <form:input path="thongSo" class="form-control"></form:input>
                            <form:errors path="thongSo"></form:errors>
                        </div>
                        <div class="form-group" style="display: none">
                            <form:label path="thongSo"><b>Ngày Tạo:</b></form:label>
                            <form:input path="thongSo" class="form-control"></form:input>
                            <form:errors path="thongSo"></form:errors>
                        </div>
                        <div class="form-group">
                            <form:label path="moTa"><b>Mô Tả:</b></form:label>
                            <form:textarea path="moTa" class="form-control"></form:textarea>
                            <form:errors path="moTa"></form:errors>
                        </div>
                        <div style="text-align: center">
                            <button type="submit" class="btn btn-primary mr-2"
                                    onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                Save
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            <%--    </div>--%>
        </form:form>
        <%--phân trang--%>
        <%--kết thúc phân trang--%>
    </div>
</div>
</body>
</html>

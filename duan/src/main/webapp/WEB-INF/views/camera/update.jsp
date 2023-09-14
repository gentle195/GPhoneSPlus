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
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Camera</title>
    <link rel="icon" href="../../images/favicon.ico" type="image/ico"/>
    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">

    <!-- bootstrap-progressbar -->
    <link href="../vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="../vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../../build/css/custom.min.css" rel="stylesheet">
</head>
<body>
<div class="container" >
    <h1 style="text-align: center">Camera</h1>
    <form:form action="/camera/update/${camera.id}" method="post" modelAttribute="camera">
        <table class="table ">
            <tbody>
            <tr>
                <td style="text-align: center"><form:label path="thongSo">Thông số Camera</form:label></td>
                <th style="text-align: center"><form:input path="thongSo" id="tent"/>
                    <form:errors path="thongSo" cssClass="error text-danger"/></th>
            </tr>

            <tr>
                <td style="text-align: center"><form:label path="tinhTrang">Trạng thái</form:label></td>
                <th style="text-align: center"><form:radiobutton path="tinhTrang" value="0" label="Hoạt động"/>
                    <form:radiobutton path="tinhTrang" value="1" label="Ngừng hoạt động"/>
                </th>
            </tr>

            <tr>
                <td style="text-align: center"><form:label path="moTa">Mô tả</form:label></td>
                <th style="text-align: center"><form:textarea path="moTa"/>
                    <form:errors path="moTa" cssClass="error text-danger"/></th>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <button type="submit" class="btn btn-success"
                            id="btt" onclick="return myFunction2()">Update
                    </button>
                </td>
            </tr>
            </tbody>
        </table>
    </form:form>
</div>
<br>
<div>
    <table class="table container">
        <tbody>
        <tr>
            <form action="/camera/search" method="post">
                <td colspan="2" style="text-align: center">Tìm kiếm: <input type="text" name="search">
                    <button type="submit">Tìm kiếm</button>
                </td>
            </form>
<%--            <td colspan="2" style="text-align: center">--%>
<%--                <a href="/camera/modal-camera" class="btn btn-info" data-bs-toggle="modal"--%>
<%--                   data-bs-target="#modalCamera">Thêm thông số camera</a>--%>
<%--                <div class="modal fade" id="modalCamera" tabindex="-1" aria-hidden="true">--%>
<%--                    <div class="modal-dialog modal-dialog-centered">--%>
<%--                        <div class="modal-content">--%>
<%--                            <div class="modal-body">--%>
<%--                                <form:form action="/camera/add" method="post" modelAttribute="camera">--%>
<%--                                    <table class="table " style="border: aliceblue 1px">--%>
<%--                                        <tbody>--%>
<%--                                        <tr>--%>
<%--                                            <td><form:label path="thongSo">Thông số camera</form:label></td>--%>
<%--                                            <th><form:input path="thongSo" id="tent"/>--%>
<%--                                                <form:errors path="thongSo" cssClass="error text-danger"/>--%>
<%--                                            </th>--%>
<%--                                        </tr>--%>
<%--                                        <tr>--%>
<%--                                            <td><form:label path="tinhTrang">Trạng thái</form:label></td>--%>
<%--                                            <th><form:radiobutton path="tinhTrang" value="0" label="Hoạt động"/>--%>
<%--                                                <form:radiobutton path="tinhTrang" value="1" label="Ngừng hoạt động"/>--%>
<%--                                            </th>--%>
<%--                                        </tr>--%>
<%--                                        <tr>--%>
<%--                                            <td><form:label path="moTa">Mô tả</form:label></td>--%>
<%--                                            <th><form:textarea path="moTa"/>--%>
<%--                                                <form:errors path="moTa" cssClass="error text-danger"/></th>--%>
<%--                                        </tr>--%>
<%--                                        <tr>--%>
<%--                                            <td colspan="2" style="text-align: center">--%>
<%--                                                <button type="submit" style="" class="btn btn-success"--%>
<%--                                                        id="btt" onclick="return myFunction1()">Add--%>
<%--                                                </button>--%>
<%--                                            </td>--%>
<%--                                        </tr>--%>
<%--                                        </tbody>--%>
<%--                                    </table>--%>
<%--                                </form:form>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </td>--%>
        </tr>
        </tbody>
    </table>
</div>
<br>
<div>
    <table class="table container">
        <thead>
        <tr>
            <th>STT</th>
            <th>Mã</th>
            <th>Thông số</th>
            <th>Ngày tạo</th>
            <th>Ngày cập nhật</th>
            <th>Tình trạng</th>
            <th>Mô tả</th>
            <th colspan="2">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="list" varStatus="i" items="${listCamera}">
            <tr>
                <td>${i.index+1}</td>
                <td>${list.ma}</td>
                <td>${list.thongSo}</td>
                <td>${list.ngayTao}</td>
                <td>${list.ngayCapNhat}</td>
                <td>
                    <c:if test="${list.tinhTrang==0}">Hoạt động</c:if>
                    <c:if test="${list.tinhTrang==1}">Ngừng hoạt động</c:if>
                </td>
                <td>${list.moTa}</td>
                <td>
                    <a class="btn btn-primary" href="/camera/delete/${list.id}"
                       onclick="return myFunction3()">Delete</a>
                    <a class="btn btn-primary" href="/camera/detail/${list.id}">Detail</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center pagination-lg">
            <li class="page-item"><a class="page-link" href="/camera/hien-thi?num=0">First</a>
            </li>

            <c:forEach begin="1" end="${total}" varStatus="status">
                <li class="page-item">
                    <a href="${pageContext.request.contextPath}/camera/hien-thi?num=${status.index -1}"
                       class="page-link">${status.index}</a>
                </li>
            </c:forEach>

            <li class="page-item"><a class="page-link" href="/camera/hien-thi?num=${total-1}">Last</a>
            </li>
        </ul>
    </nav>
</div>
</body>
<script>
    function myFunction1() {
        let text = "Bạn chắc chắn muốn thêm";
        let kt = confirm(text);
        if (kt == true) {
            return true
        } else {
            return false;
        }
    }

    function myFunction2() {
        let text = "Bạn chắc chắn muốn sửa";
        let kt = confirm(text);
        if (kt == true) {
            return true
        } else {
            return false;
        }
    }

    function myFunction3() {
        let text = "Bạn chắc chắn muốn xóa";
        let kt = confirm(text);
        if (kt == true) {
            confirm("Xóa thành công");
            return true
        } else {
            return false;
        }
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
</html>
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
    <br>
    <div class="row">
        <div class="col-12" style="text-align: center">
            <button class="btn btn-info">
                <a style="color: white;text-decoration: none" href="/camera/hien-thi"
                   onclick="return myFunction4()">Trở về</a>
            </button>
        </div>
    </div>
    <br>
    <form:form action="/camera/add" method="post" modelAttribute="camera">
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
                            id="btt" onclick="return myFunction1()">Add
                    </button>
                </td>
            </tr>
            </tbody>
        </table>
    </form:form>
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

    function myFunction4() {
        let text = "Bạn chắc chắn muốn về lại trang hiển thị";
        let kt = confirm(text);
        if (kt == true) {
            return true
        } else {
            return false;
        }
    }
    function myFunction5() {
        let text = "Bạn chắc chắn muốn sang trang thêm thông tin";
        let kt = confirm(text);
        if (kt == true) {
            return true
        } else {
            return false;
        }
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
</html>
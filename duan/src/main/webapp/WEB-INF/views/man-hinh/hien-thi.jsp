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
    <title>Màn hình</title>
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
<div class="container">
    <h1 style="text-align: center">Màn Hình</h1>
    <div>
        <table class="table container">
            <tbody>
            <tr>
                <form action="/man-hinh/search" method="post" style="text-align: center;margin-top: 6px">
                    <td colspan="2" style="text-align: center">Tìm kiếm: <input type="text" name="search">
                        <button type="submit">Tìm kiếm</button>
                    </td>
                </form>
                <td colspan="2" style="text-align: center">
                    <button class="btn btn-info">
                        <a style="color: white;text-decoration: none" href="/man-hinh/view-add"
                           onclick="return myFunction5()">Thêm mới</a>
                    </button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <br>
    <table class="table container">
        <thead>
        <tr>
            <th>STT</th>
            <th>Mã</th>
            <th>Thông số</th>
            <th>Loại cảm ứng</th>
            <th>Tỉ lệ khung hình</th>
            <th>Công nghệ màn hình</th>
            <th>Độ phân giải màn hình</th>
            <th>Tần số quét</th>
            <th>Ngày tạo</th>
            <th>Ngày cập nhật</th>
            <th>Tình trạng</th>
            <th>Mô tả</th>
            <th colspan="2">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="list" varStatus="i" items="${listManHinh}">
            <tr>
                <td>${i.index+1}</td>
                <td>${list.ma}</td>
                <td>${list.thongSo}</td>
                <td>${list.loaiCamUng}</td>
                <td>${list.tiLeKhungHinh}</td>
                <td>${list.congNghe}</td>
                <td>${list.doPhanGiai}</td>
                <td>${list.tanSoQuet}</td>
                <td>${list.ngayTao}</td>
                <td>${list.ngayCapNhat}</td>
                <td>
                    <c:if test="${list.tinhTrang==0}">Hoạt động</c:if>
                    <c:if test="${list.tinhTrang==1}">Ngừng hoạt động</c:if>
                </td>
                <td>${list.moTa}</td>
                <td>
                    <a class="btn btn-danger" href="/man-hinh/delete/${list.id}"
                       onclick="return myFunction3()"><img src="/img/remove.png"></a>
                    <a class="btn btn-light" href="/man-hinh/detail/${list.id}" onclick="return myFunction2()"><img
                            src="/img/file.png"></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <br>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center pagination-lg">
            <li class="page-item"><a class="page-link" href="/man-hinh/hien-thi?num=0">First</a></li>

            <c:forEach begin="1" end="${total}" varStatus="status">
                <li class="page-item">
                    <a href="${pageContext.request.contextPath}/man-hinh/hien-thi?num=${status.index -1}"
                       class="page-link">${status.index}</a>
                </li>
            </c:forEach>

            <li class="page-item"><a class="page-link" href="/man-hinh/hien-thi?num=${total-1}">Last</a></li>
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
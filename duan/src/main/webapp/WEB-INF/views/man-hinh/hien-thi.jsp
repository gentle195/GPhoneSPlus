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
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab"
                   aria-controls="description" aria-selected="true">
                    <h6>Thông tin màn hình</h6>
                </a>
            </li>
            <li class="nav-item">
                <a href="/man-hinh/view-add" role="tab" onclick="return myFunction5()">
                    <h6>Thêm mới màn hình</h6>
                </a>
            </li>
        </ul>
    </div>
    <div>
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="description" role="tabpanel"
                 aria-labelledby="description-tab">
                <div>
                    <table class="table container">
                        <tbody>
                        <tr>
                            <form action="/man-hinh/search" method="post">
                                <td style="text-align: right">
                                    <div class="row">
                                        <div class="col-9" style="text-align: right">
                                            <h6 style="color: red;margin-top: 10px">${thongBao}</h6>
                                        </div>
                                        <div class="col-3" style="text-align: left">
                                            Tìm kiếm: <input type="text" name="search">
                                            <button type="submit" class="btn btn-light">Tìm kiếm</button>
                                        </div>
                                    </div>
                                </td>
                            </form>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div>
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
                                    <a class="btn btn-light" href="/man-hinh/detail/${list.id}"
                                       onclick="return myFunction2()"><img
                                            src="/img/file.png"></a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <br>
                    <c:if test="${total!= 0}">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center pagination-lg">
                                <li class="page-item"><a class="page-link" href="/man-hinh/hien-thi?num=0">First</a>
                                </li>

                                <c:forEach begin="1" end="${total}" varStatus="status">
                                    <li class="page-item">
                                        <a href="${pageContext.request.contextPath}/man-hinh/hien-thi?num=${status.index -1}"
                                           class="page-link">${status.index}</a>
                                    </li>
                                </c:forEach>

                                <li class="page-item"><a class="page-link"
                                                         href="/man-hinh/hien-thi?num=${total-1}">Last</a>
                                </li>
                            </ul>
                        </nav>
                    </c:if>
                </div>
            </div>
            <%--            <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">--%>
            <%--                <div>--%>
            <%--                    <form:form action="/man-hinh/add" method="post" modelAttribute="manHinh">--%>
            <%--                        <div class="row">--%>
            <%--                            <div class="col-6">--%>
            <%--                                <div class="form-floating mb-3 mt-3">--%>
            <%--                                    <form:input class="form-control" placeholder="" path="thongSo"/>--%>
            <%--                                    <form:label class="form-label" path="thongSo">Thông số màn hình:</form:label>--%>
            <%--                                    <form:errors path="thongSo" cssStyle="color: red"></form:errors>--%>
            <%--                                </div>--%>
            <%--                                <div class="form-floating mb-3 mt-3">--%>
            <%--                                    <form:input class="form-control" placeholder="" path="loaiCamUng"/>--%>
            <%--                                    <form:label class="form-label" path="loaiCamUng">Loại cảm ứng màn hình:</form:label>--%>
            <%--                                    <form:errors path="loaiCamUng" cssStyle="color: red"></form:errors>--%>
            <%--                                </div>--%>
            <%--                                <div class="form-floating mb-3 mt-3">--%>
            <%--                                    <form:input class="form-control" placeholder="" path="tiLeKhungHinh"/>--%>
            <%--                                    <form:label class="form-label" path="tiLeKhungHinh">Tỉ lệ khung hình:</form:label>--%>
            <%--                                    <form:errors path="tiLeKhungHinh" cssStyle="color: red"></form:errors>--%>
            <%--                                </div>--%>
            <%--                                <div class="form-floating mb-3 mt-3">--%>
            <%--                                    <form:input class="form-control" placeholder="" path="congNghe"/>--%>
            <%--                                    <form:label class="form-label" path="congNghe">Công nghệ màn hình:</form:label>--%>
            <%--                                    <form:errors path="congNghe" cssStyle="color: red"></form:errors>--%>
            <%--                                </div>--%>
            <%--                            </div>--%>
            <%--                            <div class="col-6">--%>
            <%--                                <div class="form-floating mb-3 mt-3">--%>
            <%--                                    <form:input class="form-control" placeholder="" path="doPhanGiai"/>--%>
            <%--                                    <form:label class="form-label" path="doPhanGiai">Độ phân giải:</form:label>--%>
            <%--                                    <form:errors path="doPhanGiai" cssStyle="color: red"></form:errors>--%>
            <%--                                </div>--%>
            <%--                                <div class="form-floating mb-3 mt-3">--%>
            <%--                                    <form:input class="form-control" placeholder="" path="tanSoQuet"/>--%>
            <%--                                    <form:label class="form-label" path="tanSoQuet">Tần số quét:</form:label>--%>
            <%--                                    <form:errors path="tanSoQuet" cssStyle="color: red"></form:errors>--%>
            <%--                                </div>--%>
            <%--                                <div class="form-floating mb-3 mt-3">--%>
            <%--                                    <form:input class="form-control" placeholder="" path="moTa"/>--%>
            <%--                                    <form:label class="form-label" path="moTa">Mô tả:</form:label>--%>
            <%--                                    <form:errors path="moTa" cssStyle="color: red"></form:errors>--%>
            <%--                                </div>--%>
            <%--                                <div class="form-check mb-3 mt-3">--%>
            <%--                                    <form:label class="form-label" path="tinhTrang">Tình Trạng:</form:label>--%>
            <%--                                    <form:radiobutton path="tinhTrang" value="0"/>Hoạt động--%>
            <%--                                    <form:radiobutton path="tinhTrang" value="1"/> Ngừng hoạt động--%>

            <%--                                </div>--%>
            <%--                            </div>--%>
            <%--                            <div class="row">--%>
            <%--                                <div class="col-12" style="text-align: center">--%>
            <%--                                    <button type="submit" class="btn btn-success"--%>
            <%--                                            id="btt" onclick="return myFunction1()">Add--%>
            <%--                                    </button>--%>
            <%--                                </div>--%>
            <%--                            </div>--%>
            <%--                        </div>--%>
            <%--                    </form:form>--%>
            <%--                </div>--%>
            <%--            </div>--%>
        </div>
    </div>
    <%--    <table class="table container">--%>
    <%--        <tbody>--%>
    <%--        <tr>--%>
    <%--            <form action="/man-hinh/search" method="post">--%>
    <%--                <td colspan="2" style="text-align: center">Tìm kiếm: <input type="text" name="search">--%>
    <%--                    <button type="submit">Tìm kiếm</button>--%>
    <%--                </td>--%>
    <%--            </form>--%>
    <%--            <td colspan="2" style="text-align: center">--%>
    <%--                <button class="btn btn-info">--%>
    <%--                    <a style="color: white;text-decoration: none" href="/man-hinh/view-add"--%>
    <%--                       onclick="return myFunction5()">Thêm mới</a>--%>
    <%--                </button>--%>
    <%--            </td>--%>
    <%--        </tr>--%>
    <%--        </tbody>--%>
    <%--    </table>--%>
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
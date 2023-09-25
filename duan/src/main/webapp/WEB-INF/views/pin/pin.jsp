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
<a href="/pin/view-add" class="btn btn-outline-primary"
   tabindex="-1"
   role="button"
   onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">Add</a>
<div class="">
    <div class="clearfix"></div>
    <div class="col-md-12 col-sm-12 ">
        <div class="x_panel">
            <div class="x_title">
                <h2>Thông tin Pin</h2>
                <form action="/pin/search" method="post" style="float: right">
                    <td style="text-align: center" colspan="10">Tìm Kiếm: <input type="text" name="search" style="text-align: center ;">
                        <button type="submit">Search</button>
                    </td>
                </form>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box table-responsive">
                            <table id="datatable-responsive"
                                   class="table table-striped table-bordered dt-responsive nowrap"
                                   cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th>Mã</th>
                                    <th>Loại Pin</th>
                                    <th>Công nghệ Pin</th>
                                    <th>Ngày Tạo</th>
                                    <th>Ngày Cập Nhật</th>
                                    <th>Tình Trạng</th>
                                    <th>Mô Tả</th>
                                    <th>Dung Lượng</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${listPin}" var="p">
                                    <tr>
                                        <td>${p.ma}</td>
                                        <td>${p.loaiPin}</td>
                                        <td>${p.congNghePin}</td>
                                        <td>${p.ngayTao}</td>
                                        <td>${p.ngayCapNhat}</td>
                                        <td>
                                            <c:if test="${p.tinhTrang == 0}">Yes</c:if>
                                            <c:if test="${p.tinhTrang == 1}">No</c:if>
                                        </td>
                                        <td>${p.moTa}</td>
                                        <td>${p.dungLuongPin.thongSo}</td>
                                        <td>
                                            <a href="/pin/detail/${p.id}" class="btn btn-outline-primary"
                                               tabindex="-1"
                                               role="button"
                                               onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">Detail</a>
                                            <a href="/pin/remove/${p.id}" class="btn btn-outline-primary"
                                               tabindex="-1"
                                               role="button"
                                               onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center pagination-lg">
                <li class="page-item"><a class="page-link" href="/hien-thi?pageNum=0">First</a></li>
                <c:forEach begin="1" end="${total}" varStatus="status">
                    <li class="page-item">
                        <a href="${pageContext.request.contextPath}/hien-thi?pageNum=${status.index -1}"
                           class="page-link">${status.index}</a>
                    </li>
                </c:forEach>
                <li class="page-item"><a class="page-link" href="/hien-thi?pageNum=${total-1}">Last</a></li>
            </ul>
        </nav>
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
</html>
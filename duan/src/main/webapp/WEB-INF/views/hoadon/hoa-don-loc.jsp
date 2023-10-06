<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Skydash Admin</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

    <link rel="stylesheet" href="../../vendors/feather/feather.css">
    <link rel="stylesheet" href="../../vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" href="../../vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="../../css/vertical-layout-light/style.css">
    <link rel="shortcut icon" href="../../images/favicon.png"/>
    <!-- Thêm CSS và JS của Select2 -->

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css"/>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css"/>
    <!-- Or for RTL support -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.rtl.min.css"/>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.full.min.js"></script>

</head>
<body>

<div class="main" style="border: 2px solid black; border-radius: 1.8% 0% 0% 0%">
    <div>
        <ul class="nav nav-tabs border-top" id="setting-panel" role="tablist">
            <li class="nav-item">
                <a href="/hoa-don/hien-thi" class="btn btn-danger btn-icon-text"
                   tabindex="-1"
                   role="button">
                    <i class="ti-reload btn-icon-prepend"></i>
                    Trang Hóa đơn</a>
            </li>
            <li class="nav-item" style="border-radius: 2%">
                <a class="nav-link" href="/hoa-don/view-add" role="tab">Thêm hóa đơn chờ</a>
            </li>
            <li class="nav-item" style="border-radius: 2%">
                <a class="nav-link" href="/hoa-don/view-loc" role="tab">Lọc hóa đơn</a>
            </li>
        </ul>
    </div>

    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="description" role="tabpanel"
             aria-labelledby="description-tab">
            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">

                        <form:form action="/hoa-don/loc" method="get" modelAttribute="hoaDon">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group row">
<%--                                    <form:label path="khachHang"--%>
<%--                                                class="col-sm-3 col-form-label">khách hàng:</form:label>--%>
<%--                                    <div class="col-sm-9">--%>
<%--                                        <form:select path="khachHang" items="${listKhachHang}"--%>
<%--                                                     class="form-control select2"--%>
<%--                                                     itemLabel="hoTen"--%>
<%--                                                     itemValue="id" id="searchKhachHang">--%>
<%--                                        </form:select>--%>
<%--                                    </div>--%>
                                    <label class="col-sm-4 col-form-label">khách hàng:</label>
                                    <div class="col-sm-8">
                                        <select id="searchKhachHang" class="form-control select2"
                                                style="font-weight: bold; width: 100%">
                                            <option value="null" style="display: none">Nhập tên hoặc chọn</option>
                                            <c:forEach items="${listKhachHang}" var="khachHang">
                                                <option value="${khachHang.id}">${khachHang.hoTen}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group row">
<%--                                    <label class="col-sm-3 col-form-label">Nhân viên:--%>
<%--                                    </label>--%>
<%--                                    <div class="col-sm-9">--%>
<%--                                        <form:select path="nhanVien" items="${listNhanVien}"--%>
<%--                                                     class="form-control select2"--%>
<%--                                                     itemLabel="hoTen"--%>
<%--                                                     itemValue="id" id="searchNhanVien">--%>
<%--                                        </form:select>--%>
<%--                                        </select>--%>
<%--                                    </div>--%>
                                    <label class="col-sm-4 col-form-label">Nhân viên:
                                    </label>
                                    <div class="col-sm-8">
                                        <select id="searchNhanVien" class="form-control select2"
                                                style="font-weight: bold; width: 100%">
                                            <option value="null" style="display: none">Nhập tên hoặc chọn</option>
                                            <c:forEach items="${listNhanVien}" var="nhanVien">
                                                <option value="${nhanVien.id}">${nhanVien.hoTen}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Địa chỉ:
                                    </label>
                                    <div class="col-sm-8">
<%--                                        <select id="searchDiaChi" class="form-control select2"--%>
<%--                                                style="font-weight: bold; width: 100%">--%>
<%--                                            <option value="null" style="display: none">Nhập địa chỉ hoặc chọn</option>--%>
<%--                                            <c:forEach items="${listDiaChi}" var="diaChi">--%>
<%--                                                <option value="${diaChi.id}">${diaChi.diaChi}</option>--%>
<%--                                            </c:forEach>--%>
<%--                                        </select>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
<%--                        <div class="row">--%>
<%--                            <div class="col-md-4">--%>
<%--                                <div class="form-group row">--%>
<%--                                    <label class="col-sm-4 col-form-label">Tù ngày tạo:</label>--%>
<%--                                    <div class="col-sm-8">--%>
<%--                                        <input type="date" id="endDate" class="form-control"--%>
<%--                                               placeholder="Từ ngày">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <div class="col-md-4">--%>
<%--                                <div class="form-group row">--%>
<%--                                    <label class="col-sm-4 col-form-label">Từ ngày nhận:</label>--%>
<%--                                    <div class="col-sm-8">--%>
<%--                                        <input type="date" id="receiveEndDate" class="form-control"--%>
<%--                                               placeholder="Từ ngày">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <div class="col-md-4">--%>
<%--                                <div class="form-group row">--%>
<%--                                    <label class="col-sm-4 col-form-label">Từ ngày ship:</label>--%>
<%--                                    <div class="col-sm-8">--%>
<%--                                        <input type="date" id="shipEndDate" class="form-control"--%>
<%--                                               placeholder="Từ ngày  ">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="row">--%>
<%--                            <div class="col-md-4">--%>
<%--                                <div class="form-group row">--%>
<%--                                    <label class="col-sm-4 col-form-label">Đến ngày tạo:</label>--%>
<%--                                    <div class="col-sm-8">--%>
<%--                                        <input type="date" id="startDate" class="form-control"--%>
<%--                                               placeholder="Đến ngày">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <div class="col-md-4">--%>
<%--                                <div class="form-group row">--%>
<%--                                    <label class="col-sm-4 col-form-label">Đến ngày nhận:</label>--%>
<%--                                    <div class="col-sm-8">--%>
<%--                                        <input type="date" id="receiveStartDate" class="form-control"--%>
<%--                                               placeholder="Đến ngày">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <div class="col-md-4">--%>
<%--                                <div class="form-group row">--%>
<%--                                    <label class="col-sm-4 col-form-label">Đến ngày ship:</label>--%>
<%--                                    <div class="col-sm-8">--%>
<%--                                        <input type="date" id="shipStartDate" class="form-control"--%>
<%--                                               placeholder="Đến ngày  ">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                    </div>--%>
                    <div align="center">
                        <BUTTON type="submit" class="btn btn-warning" style="" id="bt">
                            Lọc hóa đơn
                        </BUTTON>
                        </form:form>

                        <h4 class="card-title" style="float: left">Danh sách hóa đơn</h4>

                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>Mã hóa đơn</th>
                                    <th>Tên khách hàng</th>
                                    <th>Tên nhân viên</th>
                                    <th>Địa chỉ</th>
                                    <th>SĐT</th>
                                    <th>Tổng tiền</th>
                                    <th>Ngày Tạo</th>
                                    <th>Ngày nhận</th>
                                    <th>Ngày ship</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <i class="mdi mdi-border-color"></i>
                                <c:forEach items="${listHoaDon}" var="hoaDon">
                                    <tr>
                                        <td>${hoaDon.ma}</td>
                                        <td>${hoaDon.khachHang.hoTen}</td>
                                        <td>${hoaDon.nhanVien.hoTen}</td>
                                        <td>${hoaDon.diaChi.diaChi}</td>

                                        <td>${hoaDon.sdt}</td>
                                        <td>${hoaDon.tongTien}</td>
                                            <%--                                    <td>--%>
                                            <%--                                        <c:if test="${hoaDon.tinhTrang == 0}">Đang chờ</c:if>--%>
                                            <%--                                        <c:if test="${hoaDon.tinhTrang == 1}">Đã xác nhận</c:if>--%>
                                            <%--                                        <c:if test="${hoaDon.tinhTrang == 2}">Đã thanh toán</c:if>--%>
                                            <%--                                        <c:if test="${hoaDon.tinhTrang == 3}">Chờ thanh toán</c:if>--%>
                                            <%--                                        <c:if test="${hoaDon.tinhTrang == 4}">Chờ vận chuyển</c:if>--%>
                                            <%--                                        <c:if test="${hoaDon.tinhTrang == 5}">Đang vận chuyển</c:if>--%>
                                            <%--                                        <c:if test="${hoaDon.tinhTrang == 6}">Vận chuyển hoàn tất</c:if>--%>
                                            <%--                                        <c:if test="${hoaDon.tinhTrang == 7}">Giao trễ</c:if>--%>
                                            <%--                                        <c:if test="${hoaDon.tinhTrang == 8}">Đã hủy</c:if>--%>

                                            <%--                                    </td>--%>

                                        <td>${hoaDon.ngayTao}</td>
                                        <td>${hoaDon.ngayNhan}</td>
                                        <td>${hoaDon.ngayShip}</td>
                                        <td>
                                            <a href="/hoa-don/detail/${hoaDon.id}" class="btn btn-warning btn-icon-text"
                                               tabindex="-1"
                                               role="button">
                                                <i class="ti-file btn-icon-prepend"></i>
                                                Detail</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <%--phân trang--%>
                    <div align="center">
                        <div class="btn-group" role="group" aria-label="Basic example">
                            <ul class="pagination justify-content-center pagination-lg">
                                <li class="page-item"><a class="page-link" href="/hoa-don/hien-thi?pageNum=0"><</a></li>
                                <c:forEach begin="1" end="${total}" varStatus="status">
                                    <li class="page-item">
                                        <a href="${pageContext.request.contextPath}/hoa-don/hien-thi?pageNum=${status.index -1}"
                                           class="page-link">${status.index}</a>
                                    </li>
                                </c:forEach>
                                <li class="page-item"><a class="page-link"
                                                         href="/hoa-don/hien-thi?pageNum=${total-1}">></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <%--kết thúc phân trang--%>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>

    $('#searchKhachHang').select2({
        theme: 'bootstrap-5'
    });
    $('#searchNhanVien').select2({
        theme: 'bootstrap-5'
    });
    $('#searchDiaChi').select2({
        theme: 'bootstrap-5'
    });

</script>

<script src="../../vendors/js/vendor.bundle.base.js"></script>
<script src="../../js/off-canvas.js"></script>
<script src="../../js/hoverable-collapse.js"></script>
<script src="../../js/template.js"></script>
<script src="../../js/settings.js"></script>
<script src="../../js/todolist.js"></script>

</html>
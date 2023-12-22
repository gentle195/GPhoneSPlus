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
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css"/>
</head>
<%--thắng làm--%>
<style>



    .notifications{
        position: absolute;
        top: 30px;
        right: 20px;
    }
    .toast1{

        position: relative;
        padding: 10px;
        color: #fff;
        margin-bottom: 10px;
        width: 400px;
        display: grid;
        grid-template-columns: 70px 1fr 70px;
        border-radius: 5px;
        --color: #0abf30;
        background-image:
                linear-gradient(
                        to right, #0abf3055, #22242f 30%
                );
        animation: show 0.3s ease 1 forwards
    }
    .toast1 i{
        color: var(--color);
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: x-large;
    }
    .toast1 .title{
        font-size: x-large;
        font-weight: bold;
    }
    .toast1 span, .toast1 i:nth-child(3){
        color: #fff;
        opacity: 0.6;
    }
    @keyframes show{
        0%{
            transform: translateX(100%);
        }
        40%{
            transform: translateX(-5%);
        }
        80%{
            transform: translateX(0%);
        }
        100%{
            transform: translateX(-10%);
        }
    }
    .toast1::before{
        position: absolute;
        bottom: 0;
        left: 0;
        background-color: seagreen;
        width: 100%;
        height: 3px;
        content: '';
        box-shadow: 0 0 10px var(--color);
        animation: timeOut 5s linear 1 forwards
    }
    @keyframes timeOut{
        to{
            width: 0;
        }
    }
    .toast1.error{
        --color: #f24d4c;
        background-image:
                linear-gradient(
                        to right, #f24d4c55, #22242F 30%
                );
    }
    .toast1.warning{
        --color: #e9bd0c;
        background-image:
                linear-gradient(
                        to right, #e9bd0c55, #22242F 30%
                );
    }
    .toast1.info{
        --color: #3498db;
        background-image:
                linear-gradient(
                        to right, #3498db55, #22242F 30%
                );
    }

    .dataTables_filter {
        display: block;
    }

    .dataTables_info {
        display: block;
    }
</style>
<%--hết thắng làm--%>
<body>
<div>
    <ul class="nav nav-tabs border-top" id="setting-panel" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="description-tab" data-toggle="tab" href="hoa-don/hien-thi" role="tab"
               aria-controls="description" aria-selected="true">Thông tin hóa đơn</a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="/hoa-don/add" role="tab">Thêm hóa đơn chờ</a>
        </li>
    </ul>
</div>
<div class="tab-content" id="myTabContent">
    <div class="tab-pane fade show active" id="description" role="tabpanel"
         aria-labelledby="description-tab">
        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <div>
                        <h4 class="card-title" style="float: left">Danh sách hóa đơn
                        </h4>
                        <div class="basic-dropdown" style="float: right">
                            <div class="dropdown">
                                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                    <i class="ti-export btn-icon-prepend"></i>
                                    Xuất Excel
                                </button>
                                <div class="dropdown-menu">
                                    <a href="/hoa-don/export-excel" class="dropdown-item" tabindex="-1">Theo ngày thanh
                                        toán</a>
                                    <a href="/hoa-don/export-excel-ngay-nhan" class="dropdown-item" tabindex="-1">Theo
                                        ngày nhận</a>
                                    <a href="/hoa-don/export-excel-ngay-ship" class="dropdown-item" tabindex="-1">Theo
                                        ngày ship</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                    <br>
                    <div class="loc" style="color:black;">
                        <form:form action="/hoa-don/loc" method="post" modelAttribute="hoaDon">
                            <div class="row" style="margin-top: 10px">
                                <div class="col-md-2">
                                    <div class="form-group row">
                                        <div class="col-sm-12">
                                            <select id="selectKhachHang1" name="khachHang" class="form-control select2"
                                                    style="font-weight: bold; width: 100%">
                                                <option selected disabled>Khách hàng</option>
                                                <c:forEach items="${listKhachHang}" var="khachHang">
                                                    <option value="${khachHang.id}">${khachHang.hoTen}</option>
                                                </c:forEach>
                                            </select>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group row">
                                        <div class="col-sm-12">
                                            <select id="selectNhanVien1" name="nhanVien" class="form-control select2"
                                                    style="font-weight: bold; width: 100%">
                                                <option selected disabled>Nhân viên</option>
                                                <c:forEach items="${listNhanVien}" var="nhanVien">
                                                    <option value="${nhanVien.id}">${nhanVien.hoTen}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group row">
                                        <div class="col-sm-12">
                                            <select id="selectTrangThai1" name="trangThai" class="form-control select2"
                                                    style="font-weight: bold; width: 100%">
                                                <option selected disabled>Trạng thái hóa đơn</option>
                                                <option value="0">Hóa đơn chờ</option>
                                                <option value="1">Hóa đơn đã xác nhận</option>
                                                <option value="3">Hóa đơn chờ thanh toán</option>
                                                <option value="2">Hóa đơn đã thanh toán</option>
                                                <option value="8">Hóa đơn đã hủy</option>
                                                <option value="9">Hóa đơn đã hủy và hoàn tiền</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group row">
                                        <div class="col-sm-12">
                                            <select id="selectTrangThai2" name="trangThaiGiaoHang"
                                                    class="form-control select2"
                                                    style="font-weight: bold; width: 100%">
                                                <option selected disabled>Trạng thái giao hàng</option>
                                                <option value="0">Chờ xử lý</option>
                                                <option value="1">Chờ giao hàng</option>
                                                <option value="2">Đang giao hàng</option>
                                                <option value="3">Giao hàng hoàn tất</option>
                                                <option value="8">Hóa đơn đã hủy</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group row">
                                        <div class="col-sm-12">
                                            <select name="loaiHoaDon" class="form-control select2"
                                                    style="font-weight: bold; width: 100%" id="selectLoai1">
                                                <option selected disabled>Loại hóa đơn</option>
                                                <option value="0">Tại quầy</option>
                                                <option value="1">Online</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label">Từ ngày thanh toán:</label>
                                        <div class="col-sm-8">
                                            <input type="date" id="ngayTao" name="startDate" class="form-control"
                                                   placeholder="Từ ngày">
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group row">
                                        <label class="col-sm-5 col-form-label">Từ ngày nhận:</label>
                                        <div class="col-sm-7">
                                            <input type="date" id="ngayNhan" name="receiveStartDate"
                                                   class="form-control"
                                                   placeholder="Từ ngày">
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label">Từ ngày ship:</label>
                                        <div class="col-sm-8">
                                            <input type="date" id="ngayShip" name="shipStartDate" class="form-control"
                                                   placeholder="Từ ngày  ">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label">Đến ngày thanh toán:</label>
                                        <div class="col-sm-8">
                                            <input type="date" id="ngayTao1" name="endDate" class="form-control"
                                                   placeholder="Đến ngày">
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group row">
                                        <label class="col-sm-5 col-form-label">Đến ngày nhận:</label>
                                        <div class="col-sm-7">
                                            <input type="date" id="ngayNhan1" name="receiveEndDate" class="form-control"
                                                   placeholder="Đến ngày">
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label">Đến ngày ship:</label>
                                        <div class="col-sm-8">
                                            <input type="date" id="ngayShip1" name="shipEndDate" class="form-control"
                                                   placeholder="Đến ngày  ">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div align="center">
                                <BUTTON type="submit" class="btn btn-warning" style="" id="bt">
                                    Lọc hóa đơn
                                </BUTTON>
                            </div>
                        </form:form>
                    </div>
                    <br>
                    <div class="search">
                        <form action="/hoa-don/search" method="post">
                            <div class="input-group" style="width: 30%; float: right">
                                <input type="text" class="form-control" placeholder="Bạn tìm gì..."
                                       aria-label="Bạn tìm gì..." name="search">
                                <div class="input-group-append">
                                    <button class="btn btn-sm btn-primary" type="submit">Search</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <%--           kết thúc tìm kiếm         --%>
                    <div class="table-responsive">
                        <table id="example" class="display" style="color: black; width: 3500px">
                            <thead>
                            <tr>
                                <th>Mã hóa đơn</th>
                                <th>Ngày Tạo</th>
                                <th>Tên khách hàng</th>
                                <th>Tên nhân viên</th>
                                <th>Địa chỉ</th>
                                <th>SĐT</th>
                                <th>Tổng tiền</th>
                                <th>Trạng thái hóa đơn</th>
                                <th>Trạng thái giao hàng</th>
                                <th>Loại HĐ</th>
                                <th>Hình thức thanh toán</th>
                                <th>Mã giao dịch</th>
                                <th>Ngày Thanh Toán</th>
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
                                    <td>${hoaDon.ngayTao}</td>
                                    <td>${hoaDon.khachHang.hoTen}</td>
                                    <td>${hoaDon.nhanVien.hoTen}</td>
                                    <td>${hoaDon.diaChi.diaChi}-${hoaDon.diaChi.quan}-${hoaDon.diaChi.huyen}-${hoaDon.diaChi.thanhPho}</td>
                                    <td>${hoaDon.sdt}</td>
                                    <td>${hoaDon.tongTien}</td>
                                    <td>
                                        <c:if test="${hoaDon.tinhTrang == 0}">Đang chờ</c:if>
                                        <c:if test="${hoaDon.tinhTrang == 1}">Đã xác nhận</c:if>
                                        <c:if test="${hoaDon.tinhTrang == 2}">Đã thanh toán</c:if>
                                        <c:if test="${hoaDon.tinhTrang == 3}">Chờ thanh toán</c:if>
                                        <c:if test="${hoaDon.tinhTrang == 8}">Đã hủy</c:if>
                                        <c:if test="${hoaDon.tinhTrang == 9}">Đã hủy và hoàn tiền</c:if>
                                    </td>
                                    <td>
                                        <c:if test="${hoaDon.tinhTrangGiaoHang == 0}">Chờ xử lý</c:if>
                                        <c:if test="${hoaDon.tinhTrangGiaoHang == 1}">Chờ giao hàng</c:if>
                                        <c:if test="${hoaDon.tinhTrangGiaoHang == 2}">Đang giao hàng</c:if>
                                        <c:if test="${hoaDon.tinhTrangGiaoHang == 3}">Giao hàng hoàn tất</c:if>
                                        <c:if test="${hoaDon.tinhTrangGiaoHang == 8}">Đã hủy</c:if>
                                    </td>
                                    <td><c:if test="${hoaDon.loai == 1}">HĐ online</c:if>
                                        <c:if test="${hoaDon.loai == 0}">HĐ quầy</c:if>
                                    </td>
                                    <td>
                                        <c:if test="${hoaDon.hinhThucThanhToan == 1}">Online</c:if>
                                        <c:if test="${hoaDon.hinhThucThanhToan == 0}">Tiền mặt</c:if>
                                    </td>
                                    <td>${hoaDon.maGiaoDich}</td>
                                    <td>${hoaDon.ngayThanhToan}</td>
                                    <td>${hoaDon.ngayNhan}</td>
                                    <td>${hoaDon.ngayShip}</td>
                                    <td>
                                        <a href="/hoa-don/detail/${hoaDon.id}" class="btn btn-warning btn-icon-text"
                                           tabindex="-1"
                                           role="button"
                                           onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                            <i class="ti-file btn-icon-prepend"></i>
                                            Detail</a>
                                        <c:if test="${hoaDon.loai== 1 && hoaDon.nhanVien== null && (hoaDon.tinhTrang == 2 || hoaDon.tinhTrang==3)}">
                                            <a href="/hoa-don/xac-nhan/${hoaDon.id}"
                                               class="btn btn-info btn-icon-text"
                                               tabindex="-1"
                                               role="button"
                                               onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                     fill="currentColor" class="bi bi-check-circle-fill"
                                                     viewBox="0 0 16 16">
                                                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                                                </svg>
                                                Xác nhận đơn hàng</a>
                                        </c:if>
                                        <c:if test="${hoaDon.loai== 1 && (hoaDon.tinhTrangGiaoHang == 1 || hoaDon.tinhTrangGiaoHang == 0) && hoaDon.nhanVien!= null && hoaDon.tinhTrang != 9}">
                                            <a href="/hoa-don/xac-nhan-giao-hang/${hoaDon.id}"
                                               class="btn btn-info btn-icon-text"
                                               tabindex="-1"
                                               role="button"
                                               onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                     fill="currentColor" class="bi bi-truck" viewBox="0 0 16 16">
                                                    <path d="M0 3.5A1.5 1.5 0 0 1 1.5 2h9A1.5 1.5 0 0 1 12 3.5V5h1.02a1.5 1.5 0 0 1 1.17.563l1.481 1.85a1.5 1.5 0 0 1 .329.938V10.5a1.5 1.5 0 0 1-1.5 1.5H14a2 2 0 1 1-4 0H5a2 2 0 1 1-3.998-.085A1.5 1.5 0 0 1 0 10.5zm1.294 7.456A1.999 1.999 0 0 1 4.732 11h5.536a2.01 2.01 0 0 1 .732-.732V3.5a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5v7a.5.5 0 0 0 .294.456M12 10a2 2 0 0 1 1.732 1h.768a.5.5 0 0 0 .5-.5V8.35a.5.5 0 0 0-.11-.312l-1.48-1.85A.5.5 0 0 0 13.02 6H12zm-9 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2m9 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2"/>
                                                </svg>
                                                Giao hàng</a>
                                        </c:if>

                                        <c:if test="${hoaDon.loai== 1 && hoaDon.tinhTrangGiaoHang == 2 && (hoaDon.tinhTrang==2||hoaDon.tinhTrang==3) && hoaDon.nhanVien!= null}">
                                            <a href="/hoa-don/xac-nhan-giao-hang-hoan-tat/${hoaDon.id}"
                                               class="btn btn-outline-success btn-icon-text"
                                               tabindex="-1"
                                               role="button"
                                               onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                                <img src="/uploads/shipped.png">
                                                Giao hàng hoàn tất
                                            </a>
                                        </c:if>
                                        <c:if test="${hoaDon.loai== 1 && (hoaDon.tinhTrangGiaoHang == 1||hoaDon.tinhTrangGiaoHang == 2) && hoaDon.hinhThucThanhToan == 0}">

                                            <a href="/hoa-don/xac-nhan-huy/${hoaDon.id}"
                                               class="btn btn-danger btn-icon-text"
                                               tabindex="-1"
                                               role="button"
                                               onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                                <i class="fas fa-times-circle"></i>
                                                Hủy đơn online thanh toán khi nhận hàng</a>

                                        </c:if>
                                        <c:if test="${hoaDon.loai== 1 && (hoaDon.tinhTrangGiaoHang == 1||hoaDon.tinhTrangGiaoHang == 2) && hoaDon.hinhThucThanhToan == 1}">

                                            <a href="/hoa-don/xac-nhan-huy-hoan-tien/${hoaDon.id}"
                                               class="btn btn-danger btn-icon-text"
                                               tabindex="-1"
                                               role="button"
                                               onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                                <i class="fas fa-times-circle"></i>
                                                Hủy đơn online thanh toán VNPay</a>
                                        </c:if>
                                        <c:if test="${hoaDon.loai== 0 && (hoaDon.tinhTrang == 0|| hoaDon.tinhTrang == 1|| hoaDon.tinhTrang == 3)}">
                                            <a href="/hoa-don/huy/${hoaDon.id}"
                                               class="btn btn-danger btn-icon-text"
                                               tabindex="-1"
                                               role="button"
                                               onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                                <i class="fas fa-times-circle"></i>
                                                Hủy đơn tại quầy</a>
                                        </c:if>
                                        <c:if test="${(hoaDon.tinhTrang == 0|| hoaDon.tinhTrang == 1|| hoaDon.tinhTrang == 3 &&
                                         hoaDon.tinhTrangGiaoHang != 2 && hoaDon.tinhTrangGiaoHang != 3 || (hoaDon.tinhTrang == 2 && hoaDon.loai==1  && hoaDon.tinhTrangGiaoHang != 2 && hoaDon.tinhTrangGiaoHang != 3))
                                          && hoaDon.tinhTrang != 9 && hoaDon.khachHang!= null && hoaDon.nhanVien!= null }">
                                            <a href="/hoa-don/view-update/${hoaDon.id}"
                                               class="btn btn-warning btn-icon-text"
                                               tabindex="-1"
                                               role="button"
                                               onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                                <i class="ti-reload btn-icon-prepend"></i>
                                                Update thông tin</a>
                                        </c:if>
                                        <c:if test="${(hoaDon.tinhTrang == 2||hoaDon.tinhTrang == 3) && hoaDon.nhanVien!= null}">
                                            <a href="/hoa-don/xuat-pdf/${hoaDon.id}"
                                               class="btn btn-outline-success btn-icon-text"
                                               tabindex="-1"
                                               role="button"
                                               onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                                <i class="ti-file btn-icon-prepend"></i>
                                                Xuất PDF</a>
                                        </c:if>
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
</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.full.min.js"></script>
<script>

    $('#selectKhachHang1').select2({
        theme: 'bootstrap-5'
    });
    $('#selectNhanVien1').select2({
        theme: 'bootstrap-5'
    });
    $('#selectDiaChi1').select2({
        theme: 'bootstrap-5'
    });
    $('#selectTrangThai1').select2({
        theme: 'bootstrap-5'
    });
    $('#selectTrangThai2').select2({
        theme: 'bootstrap-5'
    });
    $('#selectLoai1').select2({
        theme: 'bootstrap-5'
    });

    function soSanhNgayNhan(ngayNhan) {
        const ngayHienTai = Date.now();
        const soNgay = (ngayHienTai - new Date(ngayNhan).getTime()) / (1000 * 60 * 60 * 24);

        return soNgay <= 7;
    }
</script>
<%--thắng làm--%>

<button id="error" style="display: none">Error</button>
<script>
    let error = document.getElementById('error');
    let notifications = document.querySelector('.notifications');
    function createToast(){
        let newToast = document.createElement('div');
        newToast.innerHTML = `
            <div class="toast1 Success" style="height: 2cm;">
                <i class="fa-solid fa-circle-exclamation"></i>
                <div class="content">
                    <div class="title" style="font-size:20px">${batthongbaobenhoadon}</div>

                </div>
                <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
            </div>`;
        notifications.appendChild(newToast);
        newToast.timeOut = setTimeout(
            ()=>newToast.remove(), 5000
        )
    }
    error.onclick = function(){
        let type = 'error';
        let icon = 'fa-solid fa-circle-exclamation';
        let title = 'Error';
        let text = 'This is a error toast.';
        createToast(type, icon, title, text);
    }

    <c:if test="${batthongbaobenhoadon !=null}">document.getElementById('error').click()</c:if>
</script>
<%--hết thắng làm--%>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>

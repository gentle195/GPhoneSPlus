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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- SweetAlert2 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>
    <!-- Favicon icon -->
</head>

<body>
<div class="col-lg-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <form action="/thong-ke/loc-thoi-gian-sl-doi-tra" method="post" style="float: right">
                <div style="display: flex; justify-content: center; align-items: center;">
                    <div>
                        <label>Ngày bắt đầu
                            <input type="date" id="ngayTao" name="startDate" class="form-control" Required="true"
                                   placeholder="Từ ngày">
                        </label>
                    </div>
                    <div>
                        <label>Ngày kết thúc
                            <input type="date" id="ngayTao1" name="endDate" class="form-control" Required="true"
                                   placeholder="Kết thúc">
                        </label>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-primary mr-2" style="width: 100px; height: 38px;"
                                onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                            Lọc
                        </button>
                    </div>
                </div>
            </form>
            </h4>
        </div>
    </div>
</div>
<c:if test="${thongBao != null}">
    <div id="modalError" class="modal fade">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-12">
                            <div class="swal2-icon swal2-error swal2-animate-error-icon" style="display: block;">
                                    <span class="swal2-x-mark swal2-animate-x-mark"><span
                                            class="swal2-x-mark-line-left"></span><span
                                            class="swal2-x-mark-line-right"></span></span></div>
                            <h4 style="color: red;margin: 10px;text-align: center">${thongBao}</h4>
                        </div>
                        <div class="col-12" style="text-align: center;margin-top: 20px">
                            <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                                Xác nhận
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:if>
<div class="row">
    <div class="col-6"><h3>Biểu đồ thống kê số sản phẩm đổi hàng</h3>
        <div class="card">
            <div class="card-body">
                <canvas id="myChart"></canvas>
            </div>
        </div>
    </div>
    <div class="col-6"><h3>Biểu đồ thống kê số sản phẩm lỗi</h3>
        <div class="card">
            <div class="card-body">
                <canvas id="myChart2"></canvas>
            </div>
        </div>
    </div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"
        integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    $(document).ready(function () {
        $('#modalError').modal('show');
    });
</script>
<script>
    const ctx = document.getElementById('myChart');
    const data = [];

    <c:forEach items="${listSoLuongDoiTraHang}" var="SLDTH" varStatus="index">
    data.push({
        tenHang: "${SLDTH.getTenHang()}",
        soLuong:  ${SLDTH.getSoLuong()}
    });
    </c:forEach>

    new Chart(ctx, {
        type: 'pie',
        data: {
            labels: data.map(item => item.tenHang),
            datasets: [{
                label: 'Số lượng sản phẩm đổi hàng',
                data: data.map(item => item.soLuong),
                borderWidth: 1,
                percentage: true, // Thêm thuộc tính này để hiển thị phần trăm
            }],
        },
    });


    const ctx2 = document.getElementById('myChart2');
    const data2 = [];

    <c:forEach items="${listlocSoLuongSanPhamLoi}" var="SLDTH" >
    data2.push({
        tenHang: "${SLDTH.getTenHang()}",
        soLuong:  ${SLDTH.getSoLuong()}
    });
    </c:forEach>

    new Chart(ctx2, {
        type: 'pie',
        data: {
            labels: data2.map(item => item.tenHang),
            datasets: [{
                label: 'Số lượng sản phẩm hàng',
                data: data2.map(item => item.soLuong),
                borderWidth: 1,
                percentage: true, // Thêm thuộc tính này để hiển thị phần trăm
            }],
        },
    });
</script>
</html>

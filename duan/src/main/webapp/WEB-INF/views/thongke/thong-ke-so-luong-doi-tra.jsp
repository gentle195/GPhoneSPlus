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
<div class="col-lg-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
                <form action="/thong-ke/loc-thoi-gian-sl-doi-tra" method="post" style="float: right">
                    <div style="display: flex; justify-content: center; align-items: center;">
                        <div>
                            <label>Ngày bắt đầu
                                <input type="date" id="ngayTao" name="startDate" class="form-control"
                                       placeholder="Từ ngày">
                            </label>
                        </div>
                        <div>
                            <label>Ngày kết thúc
                                <input type="date" id="ngayTao1" name="endDate" class="form-control"
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

<div class="row">
<div class="col-6"><h3>Biểu đồ thống kê số sản phẩm đổi hàng</h3>
    <div class="card">
        <div class="card-body">
            <canvas id="myChart" ></canvas>
        </div>
    </div>
</div>
<div class="col-6"><h3>Biểu đồ thống kê số sản phẩm lỗi</h3>
    <div class="card">
        <div class="card-body">
            <canvas id="myChart2" ></canvas>
        </div>
    </div>
</div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
<%--<script src="../../js/thongke/char.js"></script>--%>
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

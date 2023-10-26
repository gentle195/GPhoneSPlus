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
            <h4 class="card-title">Doanh thu thương hiệu</h4>
            <div class="table-responsive">
                <table class="table table-striped" style="color: black">
                    <thead>
                    <tr>
                        <th>Thương hiệu</th>
                        <th>Số lượng sản phẩm</th>
                        <th>Doanh thu tháng</th>
                        <th>Giá mua thấp nhất</th>
                        <th>Giá mua cao nhất</th>
                        <th>Doanh thu trung bình</th>
                    </tr>
                    </thead>
                    <tbody>
                    <i class="mdi mdi-border-color"></i>
                    <c:forEach items="${listDoanhThuHang}" var="DTH" varStatus="index">
                        <tr>
                            <td>${DTH.getTen()}</td>
                            <td>${DTH.getSoLuongSP()}</td>
                            <td>${DTH.getDoanhThu()}</td>
                            <td>${DTH.getGiaMuaMin()}</td>
                            <td>${DTH.getGiaMuaMax()}</td>
                            <td>${DTH.getDoanhThuTrungBinh()}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


<canvas id="myChart"></canvas>
</body>
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
<%--<script src="../../js/thongke/char.js"></script>--%>
<script>
    const data = [];

    <c:forEach items="${listDoanhThuHang}" var="DTH" varStatus="index">
    data.push({
        tenHang: "${DTH.getTen()}",
        doanhThu: ${DTH.getDoanhThu()}
    });
    </c:forEach>

    const ctx = document.getElementById('myChart');

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: data.map(item => item.tenHang),
            datasets: [{
                label: 'Doanh Thu',
                data: data.map(item => item.doanhThu),
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>
</html>

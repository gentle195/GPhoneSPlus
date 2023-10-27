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

<div class="row">
    <div class="col-lg-4 col-sm-6">
        <div class="card">
            <div class="stat-widget-two card-body">
                <div class="stat-content">
                    <div class="stat-text">Tổng đơn hàng đã bán </div>
                    <div class="stat-digit">${listCount}</div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-4 col-sm-6">
        <div class="card">
            <div class="stat-widget-two card-body">
                <div class="stat-content">
                    <div class="stat-text">Tổng thu nhập</div>
                    <div class="stat-digit">${listAvg}<a>VNĐ</a></div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-4 col-sm-6">
        <div class="card">
            <div class="stat-widget-two card-body">
                <div class="stat-content">
                    <div class="stat-text">Tổng(..)</div>
                    <div class="stat-digit">500</div>
                </div>
            </div>
        </div>
    </div>
    <!-- /# column -->
</div>
<h1>Doanh thu theo năm ${year}</h1>

<canvas id="myChart"></canvas>

</body>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    const ctx = document.getElementById("myChart");

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: doanhThus.map(item => item.thang),
            datasets: [{
                label: '# of Votes',
                data: doanhThus.map(item => item.doanhThu),
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

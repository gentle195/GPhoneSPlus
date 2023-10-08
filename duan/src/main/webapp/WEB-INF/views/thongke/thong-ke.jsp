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
    <div class="col-md-4 mb-4 mb-lg-0 stretch-card transparent">
        <div class="card card-light-blue">
            <div class="card-body">
                <p class="mb-4"><b>Tổng Đơn Hàng</b></p>
                <p class="fs-30 mb-2">${listCount}</p>
                <p>Tăng 10.00% </p>
            </div>
        </div>
    </div>
    <div class="col-md-4 stretch-card transparent">
        <div class="card card-light-danger">
            <div class="card-body">
                <p class="mb-4"><b>Tổng Doanh Thu</b></p>
                <p class="fs-30 mb-2"> ${listAvg} <a>VNĐ</a> </p>
                <p>Tăng 1.00% </p>
            </div>
        </div>
    </div>
    <div class="col-md-4 stretch-card transparent">
        <div class="card card-tale">
            <div class="card-body">
                <p class="mb-4"><b>Tổng (...)</b></p>
                <p class="fs-30 mb-2">47033</p>
                <p>Tăng 10.00% </p>
            </div>
        </div>
    </div>
</div>


<div class="row">
    <div class="col-lg-6 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Line chart</h4>
                <canvas id="lineChart"></canvas>
            </div>
        </div>
    </div>
    <div class="col-lg-6 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Bar chart</h4>
                <canvas id="barChart"></canvas>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-lg-6 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Area chart</h4>
                <canvas id="areaChart"></canvas>
            </div>
        </div>
    </div>
    <div class="col-lg-6 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Doughnut chart</h4>
                <canvas id="doughnutChart"></canvas>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-lg-6 grid-margin grid-margin-lg-0 stretch-card">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Pie chart</h4>
                <canvas id="pieChart"></canvas>
            </div>
        </div>
    </div>
    <div class="col-lg-6 grid-margin grid-margin-lg-0 stretch-card">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Scatter chart</h4>
                <canvas id="scatterChart"></canvas>
            </div>
        </div>
    </div>
</div>

</body>
<script src="../../vendors/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page -->
<script src="../../vendors/chart.js/Chart.min.js"></script>
<!-- End plugin js for this page -->
<!-- inject:js -->
<script src="../../js/off-canvas.js"></script>
<script src="../../js/hoverable-collapse.js"></script>
<script src="../../js/template.js"></script>
<script src="../../js/settings.js"></script>
<script src="../../js/todolist.js"></script>
<!-- endinject -->
<!-- Custom js for this page-->
<script src="../../js/chart.js"></script>
<!-- End custom js for this page-->
</html>

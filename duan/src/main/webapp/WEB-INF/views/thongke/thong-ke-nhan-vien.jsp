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
                <form action="/thong-ke/loc-thoi-gian-nv" method="post" style="float: right">
                    <div style="display: flex; justify-content: center; align-items: center;">
                        <div>
                            <label>Ngày bắt đầu
                                <input type="date" id="ngayTao" name="startDate" class="form-control" Required ="true"
                                       placeholder="Từ ngày">
                            </label>
                        </div>
                        <div>
                            <label>Ngày kết thúc
                                <input type="date" id="ngayTao1" name="endDate" class="form-control" Required ="true"
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
        </div>
    </div>
</div>
<div><h3>Biểu đồ thống kê doanh thu nhân viên</h3></div>
<div class="card">
    <div class="card-body">
       <canvas id="myChart" ></canvas>
    </div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
<script>
    const data = [];

    <c:forEach items="${listDoanhThuNhanVien}" var="DT" varStatus="index">
    data.push({
        tenNhanVien: "${DT.getTenNhanVien()}",
        doanhThu: ${DT.getDoanhThu()},
        soLuong: ${DT.getSoLuongSP()}
    });
    </c:forEach>

    const ctx = document.getElementById('myChart');

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: data.map(item => item.tenNhanVien),
            datasets: [{
                label: 'Doanh Thu',
                data: data.map(item => item.doanhThu),
                borderWidth: 1,
                yAxisID: 'y'
            },
                {
                    label: 'Số Lượng',
                    data: data.map(item => item.soLuong),
                    borderWidth: 1,
                    yAxisID: 'y1'
                }
            ]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                    id: 'y'
                },
                y1: {
                    beginAtZero: true,
                    id: 'y1',
                    position: 'right',

                    // grid line settings
                    grid: {
                        drawOnChartArea: false, // only want the grid lines for one axis to show up
                    },
                },
            }
        }
    });
</script>
</html>

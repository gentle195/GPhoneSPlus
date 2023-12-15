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
                <form action="/thong-ke/loc-thoi-gian" method="post" style="float: right">
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
        </div>
    </div>
</div>


<div class="card" style="width: 50%; margin-left: 300px">
    <h4 class="card-title">Biểu đồ doanh thu hãng</h4>
    <div class="card-body">
        <canvas id="myChart" ></canvas>
    </div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
<%--<script src="../../js/thongke/char.js"></script>--%>
<script>
    const data = [];

    <c:forEach items="${listDoanhThuHang}" var="DTH" varStatus="index">
    data.push({
        tenHang: "${DTH.getTenHang()}",
        doanhThu: ${DTH.getDoanhThuThucTe()},
    });
    </c:forEach>

    const ctx = document.getElementById('myChart');

    new Chart(ctx, {
        type: 'pie',
        data: {
            labels: data.map(item => item.tenHang),
            datasets: [{
                label: 'Doanh Thu',
                data: data.map(item => item.doanhThu),
                borderWidth: 1,
                percentage: true, // Thêm thuộc tính này để hiển thị phần trăm
            }],
        },
    });

</script>
</html>

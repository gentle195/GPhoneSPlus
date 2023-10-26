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
<%--<div class="col-lg-12 grid-margin stretch-card">--%>
<%--    <div class="card">--%>
<%--        <div class="card-body">--%>
<%--            <h4 class="card-title">Doanh thu sản phẩm--%>
<%--                <form action="/thong-ke/loc-nam" method="post" style="float: right">--%>
<%--&lt;%&ndash;                    <select name="namSelect">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <option value="" disabled selected>Chọn năm</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <c:forEach items="${listYear}" var="nam">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <option value="${nam.getNam()}">${nam.getNam()}</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </c:forEach>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </select>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <button type="submit" class="btn btn-primary mr-2"&ndash;%&gt;--%>
<%--&lt;%&ndash;                            onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        Lọc&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </button>&ndash;%&gt;--%>
<%--                </form>--%>
<%--            </h4>--%>

<%--            <div class="table-responsive">--%>
<%--                <table class="table table-striped" style="color: black">--%>
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                        <th>Tên</th>--%>
<%--                        <th>Số lượng sản phẩm</th>--%>
<%--                    </tr>--%>
<%--                    </thead>--%>
<%--                    <tbody>--%>
<%--                    <i class="mdi mdi-border-color"></i>--%>
<%--                    <c:forEach items="${listDoanhThuSP}" var="DTSP" varStatus="index">--%>
<%--                        <tr>--%>
<%--                            <td>${DTSP.getTen()}</td>--%>
<%--                            <td>${DTSP.getSoLuongSP()}</td>--%>
<%--                        </tr>--%>
<%--                    </c:forEach>--%>
<%--                    </tbody>--%>
<%--                </table>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<div><h3>Biểu đồ thống kê doanh thu theo sản sản phẩm</h3></div>
<canvas id="myChart" ></canvas>
</body>
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
<script>
    const data = [];

    <c:forEach items="${listDoanhThuSP}" var="DTSP" varStatus="index">
    data.push({
        ten: "${DTSP.getTen()}",
        doanhThu: ${DTSP.getDoanhThu()},
        soLuong: ${DTSP.getSoLuongSP()}
    });
    </c:forEach>

    const ctx = document.getElementById('myChart');

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: data.map(item => item.ten),
            datasets: [{
                label: 'Doanh Thu',
                data: data.map(item => item.doanhThu),
                borderWidth: 1,
            }]
        },
    });
</script>
</html>

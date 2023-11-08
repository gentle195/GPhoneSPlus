<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            background-color: #f9f9f9;
            padding: 20px;
            margin-top: 50px;
        }

        h1 {
            color: #338dbc;
            text-align: center;
            font-size: 24px;
            margin-bottom: 10px;
        }

        p {
            margin-bottom: 10px;
            color: #333;
        }

        .thongbao {
            margin: 0 auto;
            width: 500px;
            text-align: center;
        }

        .thongbao h1 {
            font-size: 30px;
            font-weight: bold;
        }

        .thongbao p {
            font-size: 16px;
        }

        .nut {
            width: 100px;
            height: 30px;
            border-radius: 5px;
            background-color: #338dbc;
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .footer {
            text-align: center;
            margin-top: 50px;
            padding-top: 20px;
            border-top: 1px solid #ddd;
            color: #888;
        }
    </style>
</head>
<body>

<%--0; thất bại--%>
<c:if test="${ketquathanhtoan==0}">
    <div class="container shadow p-3 mb-5 bg-body-tertiary rounded">
        <div class="header">
            <h1>Thanh toán thất bại</h1>
        </div>
        <div class="thongbao">
            <h1>Giao dịch của bạn bị trục trặc!</h1>
            <p>Mời bạn thực hiện lại giao dịch mới.</p>
        </div>
        <div class="footer">
            <a href="/ban-hang-online/home" >
                <button class="nut" style="width: 170px">Trở về trang chủ</button>
            </a>
            <a href="/ban-hang-online/xem-gio-hang">
                <button class="nut" style="width: 170px">Tiếp tục mua hàng</button>
            </a>
        </div>
    </div>
</c:if>


<%--1; thành công--%>
<c:if test="${ketquathanhtoan==1}">
    <div class="container shadow p-3 mb-5 bg-body-tertiary rounded">
        <div class="header">
            <h1>Thanh toán thành công</h1>
        </div>
        <div class="thongbao">
            <h1>Chúc mừng bạn đã thanh toán thành công!</h1>
            <p>Đơn hàng của bạn sẽ được giao trong thời gian sớm nhất.</p>
        </div>
        <div class="footer">
            <a href="/ban-hang-online/home">
                <button class="nut" style="width: 170px">Trở về trang chủ</button>
            </a>
            <a href="/ban-hang-online/xem-gio-hang">
                <button class="nut" style="width: 170px">Tiếp tục mua hàng</button>
            </a>
        </div>
    </div>
</c:if>


</body>
</html>
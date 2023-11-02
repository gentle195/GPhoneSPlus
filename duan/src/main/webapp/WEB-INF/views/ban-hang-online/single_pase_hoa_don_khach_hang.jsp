<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<body>

<table class="table table-borderless">
    <thead>
    <tr>
        <th>STT</th>
        <th>Mã đơn hàng</th>
        <th>Ngày đặt</th>
        <th>Địa chỉ nhận</th>
        <th>Trạng thái đơn hàng</th>
        <th>Hình thức thanh toán</th>
        <th>Trạng thái giao hàng</th>
        <th>Chức năng</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${listhdkh}" var="ht" varStatus="stt" >
        <tr>
            <td>${stt.index}</td>
            <td>${ht.ma}</td>
            <td>${ht.ngayTao}</td>
            <td>Quận:${ht.diaChi.quan},<br>
                Huyện:${ht.diaChi.huyen},<br>
                Thành phố:${ht.diaChi.thanhPho}</td>
            <td>
                <c:if test="${ht.tinhTrang==0}">
                    <p>Chờ xử lý</p>
                </c:if>
                <c:if test="${ht.tinhTrang==1}">
                    <p>Đã xác nhận</p>
                </c:if>
                <c:if test="${ht.tinhTrang==2}">
                    <p>Đã Thanh toán</p>
                </c:if>
                <c:if test="${ht.tinhTrang==3}">
                    <p>Chờ thanh toán</p>
                </c:if>
                <c:if test="${ht.tinhTrang==8}">
                    <p>Đã hủy</p>
                </c:if>
            </td>
            <td>
                <c:if test="${ht.hinhThucThanhToan==2}">
                    <input type="text" value="Chưa chọn" disabled>
                </c:if>
                <c:if test="${ht.hinhThucThanhToan==0}">
                    <input type="text" value="Tiền mặt" disabled>
                </c:if>
                <c:if test="${ht.hinhThucThanhToan==1}">
                    <input type="text" value="Chuyển khoản" disabled>
                </c:if>
            </td>
            <td>
                <c:if test="${ht.trangThaiGiaoHang==0}">
                    <input type="text" value="Chưa giao" disabled>
                </c:if>
                <c:if test="${ht.trangThaiGiaoHang!=0}">
                    <input type="text" value="Chưa tìm hiểu" disabled>
                </c:if>
            </td>

            <td>
                <c:if test="${ht.tinhTrang==0}">
                    <a class="btn btn-primary" href="/ban-hang-online/xem-hoa-don-chi-tiet/${ht.id}">xem</a>|
                    <%--                    <a class="btn btn-primary" href="/ban-hang-online/xem-hoa-don-chi-tiet/huy-hoa-don/${ht.id}">HỦy</a>--%>
                    <a class="btn btn-primary" onclick="huyhoadonkhachhang('${ht.id}')">HỦy</a>
                </c:if>
                <c:if test="${ht.tinhTrang==1}">
                    <a class="btn btn-primary" href="/ban-hang-online/xem-hoa-don-chi-tiet/${ht.id}">xem</a>|
                    <a class="btn btn-primary" onclick="huyhoadonkhachhang('${ht.id}')">HỦy</a>
                </c:if>
                <c:if test="${ht.tinhTrang==2}">
                    <a class="btn btn-primary" href="/ban-hang-online/xem-hoa-don-chi-tiet/${ht.id}">xem</a>|
                </c:if>
                <c:if test="${ht.tinhTrang==3}">
                    <a class="btn btn-primary" href="/ban-hang-online/xem-hoa-don-chi-tiet/${ht.id}">xem</a>|
                </c:if>
                <c:if test="${ht.tinhTrang==8}">
                    <a class="btn btn-primary" href="/ban-hang-online/xem-hoa-don-chi-tiet/${ht.id}">xem</a>|
                </c:if>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>

</html>
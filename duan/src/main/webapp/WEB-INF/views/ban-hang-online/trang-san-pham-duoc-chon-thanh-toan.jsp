<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head></head>
<body>


<div style="width: 75%;margin-left: 12.5%; ">
<P>Địa chỉ nhận hàng</P>
    <select  class="form-control" id="hangds1" >
        <option value="null">Nhận tại quầy</option>
        <c:forEach items="${banhangonline.Listdiachimotkhachang(listghct.get(0).gioHang.khachHang.id)}" var="ht">
            <option  value="${ht.id}">quận:${ht.quan},huyện:${ht.huyen},thành phố:${ht.thanhPho}</option>
        </c:forEach>
    </select>
<br><br>
        <table class="table table-hover">
            <thead>
            <tr>
                <th>STT</th>
                <th>Ảnh</th>
                <th>Sản Phẩm</th>
                <th>Đơn Giá</th>
                <th>Số lượng</th>
                <th>Số tiền</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listghct}" var="ht" varStatus="stt">
                <tr>
                    <td>
                        ${stt.index}
                    </td>
                    <td>
                        <img src="../../../uploads/${ht.chiTietSanPham.urlAnh}" width="40" height="40" style="border-radius:50% 50% 50% 50%">
                    </td>
                    <td>
                            ${ht.chiTietSanPham.sanPham.ten},${ht.chiTietSanPham.sanPham.hangSanPham.ten},${ht.chiTietSanPham.sanPham.camera.thongSo},${ht.chiTietSanPham.sanPham.manHinh.thongSo},<br>
                            ${ht.chiTietSanPham.mauSac.ten},${ht.chiTietSanPham.ram.dungLuong},${ht.chiTietSanPham.rom.dungLuong},<br>
                            ${ht.chiTietSanPham.pin.loaiPin},${ht.chiTietSanPham.pin.dungLuongPin.thongSo},${ht.chiTietSanPham.chip.ten}.
                    </td>
                    <td>
                        <div name="checkdongiakhigiam">${ht.donGiaKhiGiam}</div>đ-
                        <del class="product-old-price">${ht.donGia}</del>đ

                    </td>
                    <td>
                            ${ht.soLuong}
                    </td>
                    <td>
                        <div  name="checkthanhtien">${ht.donGiaKhiGiam*ht.soLuong}</div>    vnd
                    </td>


                </tr>
            </c:forEach>
            </tbody>
        </table>
        <br>
        <div >
            <div id="tongsanphamchon" style="float: right">
                    ${banhangonline.TongtienvsTongspchon(listghct.get(0).gioHang.id).gettongsanphamchon()}
            </div>
            <div style="float: right">Bạn đã chọn :</div>
        </div>


        <br><br>

        <div >
            <div style="float: right">VND</div>
            <div id="tongthanhtien" style="float: right;margin-right: 10px">
                    ${banhangonline.TongtienvsTongspchon(listghct.get(0).gioHang.id).gettongtien()}
            </div>

            <div style="float: right">Tổng tiền :</div>
        </div>
        <br><br>
        <button style="float: right"  type="button">Thanh Toán</button>


</div>


<%--<div id="listIdGhct"></div>--%>


</body>
</html>

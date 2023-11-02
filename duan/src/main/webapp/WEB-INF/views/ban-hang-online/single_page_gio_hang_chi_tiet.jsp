<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<body>
<c:if test="${listghct.size()>0}">
    <table class="table table-hover">
        <thead>
        <tr>
            <th><input type="checkbox" name="checktong" onclick="chonhetgiohangtong('${listghct.get(0).gioHang.id}');"  ${tttong==0 ?"checked":""}></th>
            <th>Ảnh</th>
            <th>Sản Phẩm</th>
            <th>Đơn Giá</th>
            <th>Số lượng</th>
            <th>Số tiền</th>
            <th>Thao tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listghct}" var="ht" varStatus="stt">
            <tr>
                <td>
                    <input type="checkbox" name="checkidgh" value="${ht.id}" onclick="chonsanphamgiohang('${stt.index}','${ht.id}','${ht.gioHang.id}');"  ${ht.tinhTrang==0 ?"checked":""}>
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
                        <%--                 <input type="text" min="1" max="${banhangonline.soluongcon(ht.chiTietSanPham.id)}" value="${ht.soLuong}" name="checksoluong"  style="height: 1cm">--%>
                    <button type="button" name="checktru1"  onclick="tru1donvi('${stt.index}','${ht.id}')">-</button>
                    <input type="number" value="${ht.soLuong}" min="1"  max="${banhangonline.soluongcon(ht.chiTietSanPham.id)}" name="checksoluong"  oninput="myFunction('${stt.index}','${ht.soLuong}','${ht.id}')">
                    <button type="button" name="checkthem1" onclick="them1donvi('${stt.index}','${ht.id}')">+</button>
                </td>
                <td>
                    <div  name="checkthanhtien"></div>    vnd
                </td>
                <td>
                    <button onclick="xoamotghct('${ht.id}','${ht.gioHang.id}');">Xoa sản phẩm</button>
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
    <c:if test="${banhangonline.ListghTheoidghvsTT1(listghct.get(0).gioHang.id).size()>0}">
        <form action="/ban-hang-online/san-pham-duoc-chon-thanh-toan/nut-mua-hang" method="post">
            <input name="idgh" value="${listghct.get(0).gioHang.id}" style="display: none">
            <button style="float: right" type="submit">Mua hàng</button>
        </form>
    </c:if>
</c:if>
</body>
</html>
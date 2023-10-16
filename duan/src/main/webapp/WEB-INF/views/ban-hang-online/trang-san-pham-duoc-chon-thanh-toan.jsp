<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>

</head>
<body>


<div style="width: 75%;margin-left: 12.5%; ">


        <P>Địa chỉ nhận hàng</P>
    <div>
    <button style="float: right" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalthemdiachidathang">Thêm địa chỉ</button>
    <select  class="form-control" id="diachids1"  style="width: 85%">
        <c:forEach items="${banhangonline.Listdiachimotkhachang(listghct.get(0).gioHang.khachHang.id)}" var="ht">
            <option  value="${ht.id}">quận:${ht.quan},huyện:${ht.huyen},thành phố:${ht.thanhPho}</option>
        </c:forEach>
    </select>

    </div>
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
    <div style="width: 40%;float: right">
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
        <button style="float: right"  type="button" onclick="nutdathang('${listghct.get(0).gioHang.id}')">Đặt Hàng</button>
    </div>




    <div style=" width: 50%">
        <p style="display: inline-block; margin: 0;">Phương thức thanh toán</p>
        <br><br>
        <input style="display: inline-block;" type="radio" name="phuongthucthanhtoandathang" value="Thanh toán khi nhận hàng" checked> Thanh toán khi nhận hàng
        <br><br>
        <input style="display: inline-block;" type="radio" name="phuongthucthanhtoandathang" value="Thanh toán momo"> Thanh toán momo
        <br><br>
        <input style="display: inline-block;" type="radio" name="phuongthucthanhtoandathang" value="Thanh toán online"> Thanh toán online
    </div>



</div>




<%--modal them dia chi dat hang--%>
<!-- The Modal -->
<div class="modal" id="modalthemdiachidathang" >
    <div class="modal-dialog">
        <div class="modal-content" style="">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Thêm địa chỉ</h4>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <div style="margin-left:2.5cm ">
                <div>Địa chỉ:<label style="background: white;color: red;border: 1px solid white" id="tb1"></label></div>
                <input type="text" id="themdiachidathangdiachi"><br>
                    <div>Quận:<label style="background: white;color: red;border: 1px solid white" id="tb2"></label></div>
                <input type="text" id="themdiachidathangquan"><br>
                    <div>Huyện:<label style="background: white;color: red;border: 1px solid white" id="tb3"></label></div>
                <input type="text" id="themdiachidathanghuyen"><br>
                    <div>Thành phố:<label style="background: white;color: red;border: 1px solid white" id="tb4"></label></div>
                <input type="text" id="themdiachidathangthanhpho"><br>
                </div>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" onclick="themdiachikhachhang('${listghct.get(0).gioHang.id}')"   >Thêm</button>
                <button type="button" style="display: none" id="btthemdiachidathang" data-bs-dismiss="modal"></button>
            </div>

        </div>
    </div>
</div>


</body>
</html>

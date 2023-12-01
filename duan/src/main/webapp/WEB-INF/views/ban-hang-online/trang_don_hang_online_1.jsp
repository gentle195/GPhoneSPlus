<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%--    table--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Hóa đơn</title>
    <%--căn đều--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"/>


    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="/cssbanhang/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="/cssbanhang/slick.css"/>
    <link type="text/css" rel="stylesheet" href="/cssbanhang/slick-theme.css"/>

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="/cssbanhang/nouislider.min.css"/>

    <!-- Font Awesome Icon -->

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="/cssbanhang/style.css"/>

    <%--    select 2--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.rtl.min.css">
    <style>
        /* CSS cho modal */

        input[type="radio"] {
            display: none;
        }


        .input-with-button {
            display: flex; /* Sử dụng flexbox để căn chỉnh nút bên trong input */
            border: 1px solid #ccc; /* Tạo đường viền xung quanh hộp tìm kiếm */
            border-radius: 25px; /* Đặt bán kính tròn cho hộp tìm kiếm */
            overflow: hidden; /* Loại bỏ nút nếu nó bị tràn ra ngoài hộp */
        }

        .input-with-button input {
            flex: 1; /* Làm cho input mở rộng để lấp đầy hộp */
            border: none; /* Loại bỏ đường viền của input */
            padding: 10px; /* Đặt khoảng cách nội dung bên trong input */
            outline: none; /* Loại bỏ đường viền khi focus vào input */
        }

        .input-with-button button {
            background: #007bff; /* Màu nền của nút */
            color: #fff; /* Màu chữ trắng */
            border: none; /* Loại bỏ đường viền của nút */
            padding: 10px 20px; /* Đặt khoảng cách nội dung bên trong nút */
            cursor: pointer; /* Biến con trỏ thành bàn tay khi trỏ vào nút */
        }

        .cart-dropdown {
            border-radius: 10px;
            width: 180px;
            background-color: #fff;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            padding: 10px;
            margin-top: 10px;
        }

        .cart-dropdown a {
            display: block;
            width: 100%;
            padding: 10px;
            text-decoration: none;
            text-align: center;
            color: #fff;
            background-color: #007bff;
            margin-bottom: 10px;
        }

        .cart-dropdown a:hover {
            background-color: #0056b3;
        }


        .tabtab{
            margin-left: 5cm;
        }
        article {

            overflow: hidden;
            position: relative;
            /* Thêm dòng này để các phần tử con có thể sử dụng vị trí tuyệt đối */
        }

        article a {
            float: left;
            display: block;
            color:black;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        .nav-underline {
            position: absolute;
            bottom: 0;
            left: 0;
            height: 2px;
            background-color: red;
            transition: width 0.3s ease;
        }

        .tab-content {
            display: none;
        }
        #tab00 {
            display: none;
        }

    </style>

</head>

<body>
<!-- HEADER -->
<header>
    <div id="top-header">
        <div class="container">
            <ul class="header-links pull-left">
                <li><a href="#"><i class="fa fa-envelope-o"></i> gphones@gmail.com</a></li>
            </ul>
            <ul class="header-links pull-right">
                <c:if test="${idkhachhang=='1'}">
                    <li><a href="/login"><i class="fa fa-user-o"></i> Chưa đăng nhập:<input id="tkmkidkhachhang"
                                                                                            type="text"
                                                                                            style="display: none"
                                                                                            value="${idkhachhang}"></a>
                    </li>

                </c:if>
                <c:if test="${idkhachhang !='1'}">
                    <!-- Cart -->
                    <li>
                        <div class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown">
                                    <span>
                                    <i class="fa fa-user-o"></i>
                                            ${khachhangdangnhap.hoTen}
                                        <input id="tkmkidkhachhang" type="text" style="display: none"
                                               value="${idkhachhang}">
                                    </span>
                            </a>
                            <div class="cart-dropdown"
                                 style="border-radius: 10px;width: 3.5cm;margin-top: 10px;width: 180px">
                                <div>
                                    <div>
                                        <form action="/thong-tin-ca-nhan-khach-hang" method="post" style="display: none">
                                            <input value="${idkhachhang}" name="idKhachHang" style="display: none">
                                            <button style="" class="btn btn-primary" type="submit" id="taikhoancuatoi">Tài khoản của tôi</button>
                                        </form>
                                        <a  class="btn btn-primary" type="submit" onclick="anbt()">Tài khoản của tôi</a>

                                    </div>
                                    <div>
                                        <a href="/ban-hang-online/hoa-don-online/${idkhachhang}"
                                           class="btn btn-primary">Đơn hàng</a>
                                    </div>
                                    <div>
                                        <a href="/ban-hang-online/chinh-sach-doi-tra"
                                           class="btn btn-primary">Chính sách đổi trả</a>
                                    </div>
                                    <div>
                                        <a href="/logout" class="btn btn-primary" style="" onclick="">Đăng xuất</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <!-- /Cart -->
                </c:if>
            </ul>
        </div>
    </div>
    <!-- /TOP HEADER -->

    <!-- MAIN HEADER -->
    <div id="header">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- LOGO -->
                <div class="col-md-3">
                    <div class="header-logo">
                        <h2 class="logo" style="margin: 20px;color: white;font-family: 'Times New Roman'">GPhoneS
                            Store</h2>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->
                <div class="col-md-6">
                    <div class="header-search">
                        <form>
                            <div class="input-with-button">
                                <input class="input" placeholder="Tìm kiếm sản phẩm...">
                                <button class="search-btn">Search</button>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- /SEARCH BAR -->

                <!-- ACCOUNT -->
                <div class="col-md-3 clearfix">
                    <div class="header-ctn">
                        <!-- Wishlist -->
                        <div>

                        </div>
                        <!-- /Wishlist -->

                        <!-- Cart -->


                        <div class="dropdown" id="giohangtrangchu">
                            <c:if test="${idkhachhang!='1'}">
                                <c:if test="${listghct.size()>0}">
                                    <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Giỏ hàng</span>
                                        <div class="qty">${banhangonline.ListghctTheoidgh(banhangonline.ListghTheoidkh(idkhachhang).get(0).getId()).size()}</div>
                                    </a>
                                    <div class="cart-dropdown" style="width:  13cm">
                                        <div class="cart-list">

                                            <c:forEach items="${listghct}" var="ht" varStatus="stt">
                                                <br>
                                                <div style="border: 1px solid;height: 2cm">
                                                    <div style="width: 80%;float: right">
                                                        <label style="font-weight: bold">Sản
                                                            phẩm:</label>${ht.chiTietSanPham.sanPham.ten}-
                                                            ${ht.chiTietSanPham.rom.dungLuong}-${ht.chiTietSanPham.mauSac.ten}.

                                                        <br>
                                                        <label style="font-weight: bold">Số lượng:</label> ${ht.soLuong}<br>
                                                        <label style="tbackground-color: white;border: 1px solid white">${ht.donGiaKhiGiam}đ</label>
                                                    </div>
                                                    <div style="width: 18%;">
                                                        <input type="checkbox" name="checkidghTT" value="${ht.id}"
                                                               onclick="chonsanphamgiohangTT('${stt.index}','${ht.id}','${ht.gioHang.id}');"  ${ht.tinhTrang==0 ?"checked":""}>


                                                        <img src="../../../uploads/${ht.chiTietSanPham.urlAnh}"
                                                             width="50" height="50"
                                                             style="border-radius:50% 50% 50% 50%;border: 1px solid black">
                                                    </div>

                                                </div>
                                            </c:forEach>
                                        </div>
                                        <div class="cart-summary">
                                            <small> ${banhangonline.TongtienvsTongspchon(listghct.get(0).gioHang.id).gettongsanphamchon()}
                                                Sản phẩm được chọn</small>
                                            <h5>
                                                Tổng:${banhangonline.TongtienvsTongspchon(listghct.get(0).gioHang.id).gettongtien()}
                                                đ</h5>
                                        </div>
                                        <div class="cart-btns">
                                            <a href="/ban-hang-online/xem-gio-hang">Xem giỏ hàng</a>
                                            <a href="#">Chọn hết
                                                <input type="checkbox" name="checktongTT"
                                                       onclick="chonhetgiohangtongTRANGCHU('${listghct.get(0).gioHang.id}');"  ${tttong==0 ?"checked":""}>
                                            </a>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${listghct.size()<=0}">
                                    <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Giỏ hàng</span>
                                        <div class="qty">0</div>
                                    </a>
                                    <div class="cart-dropdown" style="width: 500px;">
                                        <div class="cart-summary">
                                            <small> 0 Sản phẩm được chọn</small>
                                            <h5>Tổng:0 đ</h5>
                                        </div>
                                        <div class="cart-btns">
                                            <a href="/ban-hang-online/xem-gio-hang">Xem giỏ hàng</a>
                                            <a href="#">Chọn hết
                                            </a>
                                        </div>
                                    </div>
                                </c:if>
                            </c:if>
                            <c:if test="${idkhachhang=='1'}">

                                <a class="dropdown-toggle" aria-expanded="true" href="/login">
                                    <i class="fa fa-shopping-cart"></i>
                                    <span>Giỏ hàng</span>
                                    <div class="qty">0</div>
                                </a>


                            </c:if>

                        </div>

                        <!-- /Cart -->


                        <!-- Menu Toogle -->
                        <div class="menu-toggle">
                            <a href="#">
                                <i class="fa fa-bars"></i>
                                <span>Menu</span>
                            </a>
                        </div>
                        <!-- /Menu Toogle -->
                    </div>
                </div>
                <!-- /ACCOUNT -->
            </div>
            <!-- row -->
        </div>
        <!-- container -->
    </div>
    <!-- /MAIN HEADER -->
</header>
<!-- /HEADER -->

<!-- NAVIGATION -->
<nav id="navigation">
    <!-- container -->
    <div class="container">
        <!-- responsive-nav -->
        <div id="responsive-nav">
            <!-- NAV -->
            <%--                main-nav nav  navbar-nav--%>
            <ul class=" main-nav nav ">

                <c:if test="${idkhachhang=='1'}">
                    <li><a href="/ban-hang-online/hien-thi">TRANG CHỦ</a></li>
                </c:if>
                <c:if test="${idkhachhang !='1'}">
                    <li><a href="/ban-hang-online/home">TRANG CHỦ</a></li>
                </c:if>
                <li><a href="#">ƯU ĐÃI HẤP DẪN</a></li>
                <li><a href="#">LOẠI</a></li>
                <li><a href="/ban-hang-online/dien-thoai-thong-minh">ĐIỆN THOẠI THÔNG MINH</a></li>
                <li><a style="color: red" href="/ban-hang-online/hoa-don-online/${id}">CÁC ĐƠN HÀNG</a></li>

            </ul>
            <!-- /NAV -->
        </div>
        <!-- /responsive-nav -->
    </div>
    <!-- /container -->
</nav>
<!-- /NAVIGATION -->

<br>
<div class="tabtab">
    <article style="margin-left: 5%;max-width: 1050px" class="shadow p-3 mb-5 bg-body-tertiary rounded">
        <a href="/ban-hang-online/hoa-don-online/${id}">Tất cả</a>
        <a href="/ban-hang-online-0/hoa-don-online/${id}">Chờ xử lý(TT giao hàng)</a>
        <a href="/ban-hang-online-1/hoa-don-online/${id}"  style="color: red">Đã xác nhận</a>
        <a href="/ban-hang-online-3/hoa-don-online/${id}">Chờ thanh toán</a>
        <a href="/ban-hang-online-2/hoa-don-online/${id}">Đã thanh toán</a>
        <a href="/ban-hang-online-dang-giao/hoa-don-online/${id}">Đang giao hàng</a>
        <a href="/ban-hang-online-thanh-cong/hoa-don-online/${id}">Hoàn thành</a>
        <a href="/ban-hang-online-8/hoa-don-online/${id}" >Đã hủy</a>
        <div class="nav-underline"></div> <!-- Thêm dòng này để tạo dòng kẻ đỏ -->
    </article>

</div>


<main style="width: 95%;margin-left: 2.5%; " id="content">
    <c:if test="${listhdkh.size()>0}">

        </div>
        <div id="tab1" class="tab-content" style="display: block; color: red">

            <form action="/ban-hang-online-1/hoa-don-online/${id}/search" method="post">
                <div class="input-group" style="width: 20%; float: right">
                    <input  type="text" class="form-control" placeholder="Nhập mã, tên sp, ngày đặt, sđt..."
                            aria-label="Bạn tìm gì..." name="search">
                </div>
                <div class="input-group-append" style="width: 4%; float: right">
                    <button style="height: 0.9cm" class="btn btn-sm btn-primary" type="submit">Search</button>
                </div>
            </form>

            <table class="table table-bordered" style="width: 100%">
                <thead>
                <tr>
                    <th>STT</th>

                    <th>Mã đơn hàng</th>
                    <th>Ngày đặt</th>
                    <th style="display: none;">Ngày tạo</th>
                    <th>SĐT nhận hàng</th>
                    <th>Địa chỉ nhận</th>
                    <th>Trạng thái đơn hàng</th>
                    <th>Hình thức thanh toán</th>
                    <th>Trạng thái giao hàng</th>
                    <th>Chức năng</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listhdkh}" var="ht" varStatus="stt">
                    <tr>
                        <td>${stt.index+1}</td>

                        <td>${ht.ma}</td>
                        <th style="display: none;">${ht.ngayTao}</th>

                        <td>${ht.ngayTao}</td>
                        <td>${ht.sdt}</td>
                        <td > <div style="width: 5cm; overflow: hidden;">${ht.diaChi.diaChi},${ht.diaChi.quan},${ht.diaChi.huyen},${ht.diaChi.thanhPho}</div></td>
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
                            <c:if test="${ht.hinhThucThanhToan==0}">
                                <p>Thanh toán khi nhận hàng</p>
                            </c:if>
                            <c:if test="${ht.hinhThucThanhToan==1}">
                                <p>Thanh toán online</p>
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${ht.tinhTrangGiaoHang==0}">
                                <p>Chờ xử lý</p>
                            </c:if>
                            <c:if test="${ht.tinhTrangGiaoHang==1}">
                                <p>Chuẩn bị đơn hàng</p>
                            </c:if>
                            <c:if test="${ht.tinhTrangGiaoHang==2}">
                                <p>Đang giao hàng</p>
                            </c:if>
                            <c:if test="${ht.tinhTrangGiaoHang==3}">
                                <p>Giao hàng thành công</p>
                            </c:if>
                            <c:if test="${ht.tinhTrangGiaoHang==8}">
                                <p>Đơn hàng đã hủy</p>
                            </c:if>
                        </td>

                        <td>
                            <c:if test="${ht.tinhTrang==0}">
                                <a class="btn btn-info" href="/ban-hang-online/xem-hoa-don-chi-tiet/${ht.id}">Chi tiết đơn hàng</a>
                                <a class="btn btn-danger" onclick="huyhoadonkhachhang('${ht.id}')">Hủy hóa đơn</a>
                            </c:if>
                            <c:if test="${ht.tinhTrang==1}">
                                <a class="btn btn-info" href="/ban-hang-online/xem-hoa-don-chi-tiet/${ht.id}">Chi tiết đơn hàng</a>
                                <a class="btn btn-danger" onclick="huyhoadonkhachhang('${ht.id}')">Hủy hóa đơn</a>
                            </c:if>
                            <c:if test="${ht.tinhTrang==2}">
                                <a class="btn btn-info" href="/ban-hang-online-0/xem-hoa-don-chi-tiet/${ht.id}">Chi tiết đơn hàng</a>
                            </c:if>
                            <c:if test="${ht.tinhTrang==3}">
                                <a class="btn btn-info" href="/ban-hang-online-0/xem-hoa-don-chi-tiet/${ht.id}">Chi tiết đơn hàng</a>
                            </c:if>
                            <c:if test="${ht.tinhTrang==8}">
                                <a class="btn btn-info" href="/ban-hang-online-0/xem-hoa-don-chi-tiet/${ht.id}">Chi tiết đơn hàng</a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </div>

    </c:if>

</main>
<div align="center">
    <div class="btn-group" role="group" aria-label="Basic example">
        <ul class="pagination justify-content-center pagination-lg">
            <li class="page-item"><a class="page-link" href="/ban-hang-online-1/hoa-don-online/${idkhachhang}?pageNum=0"><</a></li>
            <c:forEach begin="1" end="${total}" varStatus="status">
                <li class="page-item">
                    <a href="${pageContext.request.contextPath}/ban-hang-online-1/hoa-don-online/${idkhachhang}?pageNum=${status.index -1}"
                       class="page-link">${status.index}</a>
                </li>
            </c:forEach>
            <li class="page-item"><a class="page-link" href="/ban-hang-online-1/hoa-don-online/${idkhachhang}?pageNum=${total-1}">></a></li>
        </ul>
    </div>
</div>

<!-- /NEWSLETTER -->

<!-- FOOTER -->
<footer id="footer">
    <!-- top footer -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">About Us</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt
                            ut.</p>
                        <ul class="footer-links">
                            <li><a href="#"><i class="fa fa-map-marker"></i>1734 Stonecoal Road</a></li>
                            <li><a href="#"><i class="fa fa-phone"></i>+021-95-51-84</a></li>
                            <li><a href="#"><i class="fa fa-envelope-o"></i>email@email.com</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Categories</h3>
                        <ul class="footer-links">
                            <li><a href="#">Hot deals</a></li>
                            <li><a href="#">Laptops</a></li>
                            <li><a href="#">Smartphones</a></li>
                            <li><a href="#">Cameras</a></li>
                            <li><a href="#">Accessories</a></li>
                        </ul>
                    </div>
                </div>

                <div class="clearfix visible-xs"></div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Information</h3>
                        <ul class="footer-links">
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Orders and Returns</a></li>
                            <li><a href="#">Terms & Conditions</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Service</h3>
                        <ul class="footer-links">
                            <li><a href="#">My Account</a></li>
                            <li><a href="#">View Cart</a></li>
                            <li><a href="#">Wishlist</a></li>
                            <li><a href="#">Track My Order</a></li>
                            <li><a href="#">Help</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /top footer -->

    <!-- bottom footer -->
    <div id="bottom-footer" class="section">
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-12 text-center">
                    <ul class="footer-payments">
                        <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                        <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                    </ul>
                    <span class="copyright">
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i
                            class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com"
                                                                                target="_blank">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</span>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /bottom footer -->
</footer>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        sortTableByInvoiceCode();
    });

    function sortTableByInvoiceCode() {
        var tables = document.getElementsByClassName("table table-bordered");

        // Duyệt qua từng bảng có class "sortable-table"
        Array.from(tables).forEach(function (table) {
            var rows = Array.from(table.rows).slice(1); // Bỏ qua dòng đầu tiên vì đó là tiêu đề

            rows.sort(function (a, b) {
                var codeA = extractNumberFromCode(a.cells[2].textContent);
                var codeB = extractNumberFromCode(b.cells[2].textContent);

                // Sắp xếp theo số đằng sau "MHD" từ lớn tới bé
                return codeB - codeA;
            });

            // Xóa tất cả các dòng từ bảng
            while (table.rows.length > 1) {
                table.deleteRow(1);
            }

            // Thêm lại các dòng đã sắp xếp và cập nhật số thứ tự
            rows.forEach(function (row, index) {
                var newRow = table.insertRow(index + 1); // Chèn dòng mới
                newRow.innerHTML = row.innerHTML; // Copy nội dung từ dòng đã sắp xếp

                // Cập nhật số thứ tự
                newRow.cells[0].textContent = index + 1;
            });
        });
    }

    // Hàm để lấy số từ chuỗi "MHD18" và "MHD19"
    function extractNumberFromCode(code) {
        return parseInt(code.replace("MHD", ""));
    }
</script>


<%--<script>--%>
<%--    document.addEventListener("DOMContentLoaded", function() {--%>
<%--        // Gọi hàm loadTab để chỉ hiển thị nội dung của tab00 khi trang được tải--%>
<%--        loadTab('tab00');--%>
<%--    });--%>
<%--    function loadTab(tabId) {--%>
<%--        // Ẩn tất cả các tab--%>
<%--        document.querySelectorAll('.tab-content').forEach(function (tab) {--%>
<%--            tab.style.display = 'none';--%>
<%--        });--%>

<%--        // Hiển thị tab được chọn--%>
<%--        document.getElementById(tabId).style.display = 'block';--%>
<%--    }--%>
<%--    function loadTab(tabName) {--%>
<%--        // loadTab('tab00');--%>
<%--        var i;--%>
<%--        //  Load ngầm tab00 trước--%>

<%--        var tabContents = document.getElementsByClassName("tab-content");--%>
<%--        for (i = 0; i < tabContents.length; i++) {--%>
<%--            tabContents[i].style.display = "none";--%>
<%--        }--%>
<%--        document.getElementById(tabName).style.display = "block";--%>

<%--        // Cập nhật vị trí và chiều dài của dòng kẻ đỏ--%>
<%--        var navUnderline = document.querySelector(".nav-underline");--%>
<%--        var selectedTab = document.querySelector(`[onclick="loadTab('${tabName}')"]`);--%>
<%--        var selectedTabRect = selectedTab.getBoundingClientRect();--%>
<%--        navUnderline.style.width = selectedTabRect.width + "px";--%>
<%--        navUnderline.style.transform = "translateX(" + selectedTabRect.left + "px)";--%>
<%--    }--%>
<%--</script>--%>
<script>
    function chonhetgiohangtongTRANGCHU(idgh) {
        // var  idgh1=encodeURIComponent(idgh)
        if (document.getElementsByName('checktongTT')[0].checked == true) {
            var link = '/ban-hang-online/trang-chu/chon-san-pham-gio-hang-trang-chu/full/0/' + idgh;
            // document.getElementById("ktlink").innerHTML=link

            loadgiaodienghctbanhangTrangChu(link);


        } else {
            var link = '/ban-hang-online/trang-chu/chon-san-pham-gio-hang-trang-chu/full/1/' + idgh;
            // document.getElementById("ktlink").innerHTML=link

            loadgiaodienghctbanhangTrangChu(link);

        }


        // alert("vdvdvd")
    };

    function chonsanphamgiohangTT(vt, idctgh, idgh) {
        // var  idgh1=encodeURIComponent(idgh)
        var vt1 = parseInt(vt);
        // var id1=encodeURIComponent(id);
        if (document.getElementsByName('checkidghTT')[vt1].checked == true) {
            var link = '/ban-hang-online/trang-chu/chon-san-pham-gio-hang-trang-chu/' + idctgh + '/0/' + idgh;
            // document.getElementById("ktlink").innerHTML=link

            loadgiaodienghctbanhangTrangChu(link);
            // loadgiaodienghctbanhangTrangChu(link);
            // loadgiaodienghctbanhang('/ban-hang-online/single_page_gio_hang_chi_tiet');

        } else {
            var link = '/ban-hang-online/trang-chu/chon-san-pham-gio-hang-trang-chu/' + idctgh + '/1/' + idgh;
            // document.getElementById("ktlink").innerHTML=link

            loadgiaodienghctbanhangTrangChu(link);
            // loadgiaodienghctbanhangTrangChu(link);
            // loadgiaodienghctbanhang('/ban-hang-online/single_page_gio_hang_chi_tiet');

        }


    };

    function loadgiaodienghctbanhangTrangChu(interfaceUrl) {
        fetch(interfaceUrl)
            .then(response => response.text())
            .then(data => {
                const content = document.getElementById('giohangtrangchu');
                content.innerHTML = data;

                loadScripts();


            })
            .catch(error => {
                console.error('Error loading interface:', error);
            });


    }


    function loadgiaodienhoadonkhachhang(interfaceUrl) {
        fetch(interfaceUrl)
            .then(response => response.text())
            .then(data => {
                const content = document.getElementById('content');
                content.innerHTML = data;

                loadScripts();


            })
            .catch(error => {
                console.error('Error loading interface:', error);
            });


    }


    function loadScripts() {
        const scriptsToLoad = [
            'https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js',
            'https://cdn.jsdelivr.net/npm/jquery@3.5.0/dist/jquery.slim.min.js',
            'https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js',
            'https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.full.min.js',


        ];

        const head = document.head || document.getElementsByTagName('head')[0];

        function loadScript(index) {
            if (index < scriptsToLoad.length) {
                const script = document.createElement('script');
                script.src = scriptsToLoad[index];
                script.onload = function () {
                    loadScript(index + 1);
                };
                head.appendChild(script);

            }
        }

        // Bắt đầu quá trình tải script
        loadScript(0);
    }

    function loadSelect2diachi() {
        $('#diachids1').select2({
            theme: 'bootstrap-5'
        });
    }

    loadSelect2diachi();
</script>
<!-- jQuery Plugins -->
<script>
    function anbt() {
        document.getElementById('taikhoancuatoi').click();
    }
</script>
<script src="/jsbanhang/jquery.min.js"></script>
<script src="/jsbanhang/bootstrap.min.js"></script>
<script src="/jsbanhang/slick.min.js"></script>
<script src="/jsbanhang/nouislider.min.js"></script>
<script src="/jsbanhang/jquery.zoom.min.js"></script>
<script src="/jsbanhang/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.full.min.js"></script>
</body>

</html>

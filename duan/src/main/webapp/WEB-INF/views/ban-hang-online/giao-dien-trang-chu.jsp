<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>

</head>
<body>
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <!-- shop -->
            <div class="col-md-4 col-xs-6">
                <div class="shop">
                    <div class="shop-img">
                        <img src="../../../img/shop01.png" alt="">
                    </div>
                    <div class="shop-body">
                        <h3>Laptop<br>Collection</h3>
                        <a href="#" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <!-- /shop -->

            <!-- shop -->
            <div class="col-md-4 col-xs-6">
                <div class="shop">
                    <div class="shop-img">
                        <img src="../../../img/shop03.png" alt="">
                    </div>
                    <div class="shop-body">
                        <h3>Accessories<br>Collection</h3>
                        <a href="#" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <!-- /shop -->

            <!-- shop -->
            <div class="col-md-4 col-xs-6">
                <div class="shop">
                    <div class="shop-img">
                        <img src="../../../img/shop02.png" alt="">
                    </div>
                    <div class="shop-body">
                        <h3>Cameras<br>Collection</h3>
                        <a href="#" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <!-- /shop -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <!-- section title -->
            <div class="col-md-12">
                <div class="section-title">
                    <h3 class="title">New Products</h3>
                    <div class="section-nav">
                        <ul class="section-tab-nav tab-nav">
                            <li class="active"><a data-toggle="tab" href="#tab1">Laptops</a></li>
                            <li><a data-toggle="tab" href="#tab1">Smartphones</a></li>
                            <li><a data-toggle="tab" href="#tab1">Cameras</a></li>
                            <li><a data-toggle="tab" href="#tab1">Accessories</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /section title -->

            <!-- Products tab & slick -->
            <div class="col-md-12">
                <div class="row">
                    <div class="products-tabs">
                        <!-- tab -->
                        <div id="tab1" class="tab-pane active">
                            <div class="products-slick" data-nav="#slick-nav-1">

                                <c:forEach  items="${listsp}" var="ht" varStatus="stt">
                                    <c:if test="${banhangonline.soluongcon(ht.id)>0}">
                                        <!-- product -->

                                        <div class="product">
                                            <div class="product-img">
                                                <img src="../../../uploads/${ht.urlAnh}" style="width: 100%;height: 6cm" alt="">
                                                <div class="product-label">
                                                    <span class="sale">-${giamgia.tonggiamgia(ht.id)}%</span>
                                                    <span class="new">Giảm giá</span>
                                                </div>
                                            </div>
                                            <div class="product-body" style="text-align: left;word-wrap: break-word;">
                                                <p class="product-category">Điện thoại</p>
                                                <h3 class="product-name"><a href="#">${ht.sanPham.ten}</a></h3>
                                                <h4 class="product-price"><span style="font-size:15px">₫</span>${ht.giaBan-ht.giaBan/100*giamgia.tonggiamgia(ht.id)}-<del class="product-old-price">${ht.giaBan}<span style="font-size:15px">₫</span></del></h4>
                                                    <%--                                            ${ht.tinhTrang} +  ${ht.sanPham.tinhTrang}--%>
                                                <p class="product-category">Đã bán :${banhangonline.soluongdaban(ht.id)}--Còn :${banhangonline.soluongcon(ht.id)}</p>
                                                <div  >
                                                    *Hãng sản phẩm:${ht.sanPham.hangSanPham.ten}<br>
                                                    *Camera:${ht.sanPham.camera.thongSo}<br>
                                                    *Màn:${ht.sanPham.manHinh.thongSo}<br>
                                                    *Màu:${ht.mauSac.ten}<br>
                                                    *Ram:${ht.ram.dungLuong}<br>
                                                    *Rom:${ht.rom.dungLuong}<br>
                                                    *Pin:${ht.pin.loaiPin}<br>
                                                    *Dung lượng pin:${ht.pin.dungLuongPin.thongSo}<br>
                                                    *Chip:${ht.chip.ten}<br>


                                                </div>
                                                <div class="product-rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <div class="product-btns">
                                                    <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">Thêm vào danh sách yêu thích</span></button>
                                                    <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">Thêm để so sánh</span></button>
                                                    <button class="quick-view" onclick="loadInterface('/ban-hang-online/chi-tiet-san-pham/${ht.id}')"><i class="fa fa-eye"></i><span class="tooltipp" >Xem chi tiết</span></button>
                                                </div>
                                            </div>
                                            <div class="add-to-cart">
                                                <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                            </div>
                                        </div>
                                        <!-- /product -->
                                    </c:if>
                                </c:forEach>
                            </div>
                            <div id="slick-nav-1" class="products-slick-nav"></div>
                        </div>
                        <!-- /tab -->
                    </div>
                </div>
            </div>
            <!-- Products tab & slick -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- HOT DEAL SECTION -->
<div id="hot-deal" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <div class="hot-deal">
                    <ul class="hot-deal-countdown">
                        <li>
                            <div>
                                <h3>02</h3>
                                <span>Days</span>
                            </div>
                        </li>
                        <li>
                            <div>
                                <h3>10</h3>
                                <span>Hours</span>
                            </div>
                        </li>
                        <li>
                            <div>
                                <h3>34</h3>
                                <span>Mins</span>
                            </div>
                        </li>
                        <li>
                            <div>
                                <h3>60</h3>
                                <span>Secs</span>
                            </div>
                        </li>
                    </ul>
                    <h2 class="text-uppercase">hot deal this week</h2>
                    <p>New Collection Up to 50% OFF</p>
                    <a class="primary-btn cta-btn" href="#">Shop now</a>
                </div>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /HOT DEAL SECTION -->

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <!-- section title -->
            <div class="col-md-12">
                <div class="section-title">
                    <h3 class="title">Top selling</h3>
                    <div class="section-nav">
                        <ul class="section-tab-nav tab-nav">
                            <li class="active"><a data-toggle="tab" href="#tab2">Laptops</a></li>
                            <li><a data-toggle="tab" href="#tab2">Smartphones</a></li>
                            <li><a data-toggle="tab" href="#tab2">Cameras</a></li>
                            <li><a data-toggle="tab" href="#tab2">Accessories</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /section title -->

            <!-- Products tab & slick -->
            <div class="col-md-12">
                <div class="row">
                    <div class="products-tabs">
                        <!-- tab -->
                        <div id="tab2" class="tab-pane fade in active">
                            <div class="products-slick" data-nav="#slick-nav-2">
                                <c:forEach  items="${listsp}" var="ht" varStatus="stt">
                                    <c:if test="${banhangonline.soluongcon(ht.id)>0}">
                                        <!-- product -->

                                        <div class="product">
                                            <div class="product-img">
                                                <img src="../../../uploads/${ht.urlAnh}" style="width: 100%;height: 6cm" alt="">
                                                <div class="product-label">
                                                    <span class="sale">-${giamgia.tonggiamgia(ht.id)}%</span>
                                                    <span class="new">Giảm giá</span>
                                                </div>
                                            </div>
                                            <div class="product-body" style="text-align: left;word-wrap: break-word;">
                                                <p class="product-category">Điện thoại</p>
                                                <h3 class="product-name"><a href="#">${ht.sanPham.ten}</a></h3>
                                                <h4 class="product-price"><span style="font-size:15px">₫</span>${ht.giaBan-ht.giaBan/100*giamgia.tonggiamgia(ht.id)}-<del class="product-old-price">${ht.giaBan}<span style="font-size:15px">₫</span></del></h4>
                                                    <%--                                            ${ht.tinhTrang} +  ${ht.sanPham.tinhTrang}--%>
                                                <p class="product-category">Đã bán :${banhangonline.soluongdaban(ht.id)}--Còn :${banhangonline.soluongcon(ht.id)}</p>
                                                <div  >
                                                    *Hãng sản phẩm:${ht.sanPham.hangSanPham.ten}<br>
                                                    *Camera:${ht.sanPham.camera.thongSo}<br>
                                                    *Màn:${ht.sanPham.manHinh.thongSo}<br>
                                                    *Màu:${ht.mauSac.ten}<br>
                                                    *Ram:${ht.ram.dungLuong}<br>
                                                    *Rom:${ht.rom.dungLuong}<br>
                                                    *Pin:${ht.pin.loaiPin}<br>
                                                    *Dung lượng pin:${ht.pin.dungLuongPin.thongSo}<br>
                                                    *Chip:${ht.chip.ten}<br>


                                                </div>
                                                <div class="product-rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <div class="product-btns">
                                                    <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">Thêm vào danh sách yêu thích</span></button>
                                                    <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">Thêm để so sánh</span></button>
                                                    <button class="quick-view" onclick="loadInterface('/ban-hang-online/chi-tiet-san-pham/${ht.id}')"><i class="fa fa-eye"></i><span class="tooltipp" >Xem chi tiết</span></button>
                                                </div>
                                            </div>
                                            <div class="add-to-cart">
                                                <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                            </div>
                                        </div>
                                        <!-- /product -->
                                    </c:if>
                                </c:forEach>
                            </div>
                            <div id="slick-nav-2" class="products-slick-nav"></div>
                        </div>
                        <!-- /tab -->
                    </div>
                </div>
            </div>
            <!-- /Products tab & slick -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-4 col-xs-6">
                <div class="section-title">
                    <h4 class="title">Top selling</h4>
                    <div class="section-nav">
                        <div id="slick-nav-3" class="products-slick-nav"></div>
                    </div>
                </div>

                <div class="products-widget-slick" data-nav="#slick-nav-3">


                    <c:set var = "vitri" scope = "session" value = "${-1}"/>
                    <c:forEach begin="1" end="${lamchon}" varStatus="trang">
                        <c:set var = "salary" scope = "session" value = "${1}"/>
                        <div>
                            <c:forEach items="${listsp}" var="ht" varStatus="stt">
                                <c:if test="${banhangonline.soluongcon(ht.id)>0}">
                                <c:if test = "${stt.index > vitri }">
                                    <c:if test = "${salary <4}">

                                            <!-- product widget -->
                                            <div class="product-widget" onclick="loadInterface('/ban-hang-online/chi-tiet-san-pham/${ht.id}')">
                                                <div class="product-img">
                                                    <img src="../../../uploads/${ht.urlAnh}"  alt="">
                                                </div>
                                                <div class="product-body">
                                                    <p class="product-category">Điện Thoại</p>
                                                    <h3 class="product-name"><a href="#">${ht.sanPham.ten}</a></h3>
                                                    <h4 class="product-price"><span style="font-size:10px">₫</span> ${ht.giaBan}  - <span style="font-size:10px">₫</span><del class="product-old-price">${ht.giaBan}</del></h4>

                                                </div>
                                            </div>
                                            <!-- /product widget -->

                                        <c:set var = "vitri" scope = "session" value = "${stt.index}"/>
                                        <c:set var = "salary" scope = "session" value = "${salary+1}"/>
                                    </c:if>
                                </c:if>
                                </c:if>
                            </c:forEach>

                        </div>
                    </c:forEach>


                </div>
            </div>

            <div class="col-md-4 col-xs-6">
                <div class="section-title">
                    <h4 class="title">Top selling</h4>
                    <div class="section-nav">
                        <div id="slick-nav-4" class="products-slick-nav"></div>
                    </div>
                </div>

                <div class="products-widget-slick" data-nav="#slick-nav-4">
                    <c:set var = "vitri" scope = "session" value = "${-1}"/>
                    <c:forEach begin="1" end="${lamchon}" varStatus="trang">
                        <c:set var = "salary" scope = "session" value = "${1}"/>
                        <div>
                            <c:forEach items="${listsp}" var="ht" varStatus="stt">
                                <c:if test="${banhangonline.soluongcon(ht.id)>0}">
                                <c:if test = "${stt.index > vitri }">
                                    <c:if test = "${salary <4}">

                                            <!-- product widget -->
                                            <div class="product-widget" onclick="loadInterface('/ban-hang-online/chi-tiet-san-pham/${ht.id}')">
                                                <div class="product-img">
                                                    <img src="../../../uploads/${ht.urlAnh}"  alt="">
                                                </div>
                                                <div class="product-body">
                                                    <p class="product-category">Điện Thoại</p>
                                                    <h3 class="product-name"><a href="#">${ht.sanPham.ten}</a></h3>
                                                    <h4 class="product-price"><span style="font-size:10px">₫</span> ${ht.giaBan}  - <span style="font-size:10px">₫</span><del class="product-old-price">${ht.giaBan}</del></h4>
                                                </div>
                                            </div>
                                            <!-- /product widget -->

                                        <c:set var = "vitri" scope = "session" value = "${stt.index}"/>
                                        <c:set var = "salary" scope = "session" value = "${salary+1}"/>
                                    </c:if>
                                </c:if>
                                </c:if>
                            </c:forEach>

                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="clearfix visible-sm visible-xs"></div>

            <div class="col-md-4 col-xs-6">
                <div class="section-title">
                    <h4 class="title">Top selling</h4>
                    <div class="section-nav">
                        <div id="slick-nav-5" class="products-slick-nav"></div>
                    </div>
                </div>

                <div class="products-widget-slick" data-nav="#slick-nav-5">
                    <c:set var = "vitri" scope = "session" value = "${-1}"/>
                    <c:forEach begin="1" end="${lamchon}" varStatus="trang">
                        <c:set var = "salary" scope = "session" value = "${1}"/>
                        <div>
                            <c:forEach items="${listsp}" var="ht" varStatus="stt">
                                <c:if test="${banhangonline.soluongcon(ht.id)>0}">
                                <c:if test = "${stt.index > vitri }">
                                    <c:if test = "${salary <4}">

                                            <!-- product widget -->
                                            <div class="product-widget" onclick="loadInterface('/ban-hang-online/chi-tiet-san-pham/${ht.id}')">
                                                <div class="product-img">
                                                    <img src="../../../uploads/${ht.urlAnh}"  alt="">
                                                </div>
                                                <div class="product-body">
                                                    <p class="product-category">Điện Thoại</p>
                                                    <h3 class="product-name"><a href="#">${ht.sanPham.ten}</a></h3>
                                                    <h4 class="product-price"><span style="font-size:10px">₫</span> ${ht.giaBan}  - <span style="font-size:10px">₫</span><del class="product-old-price">${ht.giaBan}</del></h4>
                                                </div>
                                            </div>
                                            <!-- /product widget -->

                                        <c:set var = "vitri" scope = "session" value = "${stt.index}"/>
                                        <c:set var = "salary" scope = "session" value = "${salary+1}"/>
                                    </c:if>
                                </c:if>
                                </c:if>
                            </c:forEach>

                        </div>
                    </c:forEach>
                </div>
            </div>

        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- Modal -->
<div id="myModal">
    <div  style="width: 20cm;height: 15cm">
        <img src="https://uploads-ssl.webflow.com/6073fad993ae97919f0b0772/609fa687874b84361fc495db_%C4%91t.jpg" style="width: 100%; height: 100%">
    </div>
</div>
</body>

</html>
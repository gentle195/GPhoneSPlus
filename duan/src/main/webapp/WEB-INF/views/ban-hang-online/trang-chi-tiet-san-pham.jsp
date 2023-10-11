<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head></head>


<body>

 <c:if test="${ktcokhong==1}">

<!-- SECTION -->
<div class="section"  >
    <!-- container -->
    <div class="container"  >
        <!-- row -->
        <div class="row"  >
            <!-- Product main img -->
            <div class="col-md-5 col-md-push-2">
                <div id="product-main-img">
                    <div class="product-preview">
                        <img src="../../../uploads/${motctsp.urlAnh}" alt="" style="width: 100%;height: 12cm">
                    </div>

                    <div class="product-preview">
                        <img src="../../img/product03.png" alt="" style="width: 100%;height: 12cm; ">
                    </div>

                    <div class="product-preview">
                        <img src="../../img/product06.png" alt="" style="width: 100%;height: 12cm; ">
                    </div>

                    <div class="product-preview">
                        <img src="../../img/product08.png" alt="" style="width: 100%;height: 12cm; " >
                    </div>
                </div>
            </div>
            <!-- /Product main img -->

            <!-- Product thumb imgs -->
            <div class="col-md-2  col-md-pull-5">
                <div id="product-imgs">

                    <div class="product-preview">
                        <img src="../../../uploads/${motctsp.urlAnh}" alt="" style="width: 100%;height:4cm;">
                    </div>

                    <div class="product-preview">
                        <img src="../../img/product03.png" alt="" style="width: 3.5cm;height: 3.5cm" style="width: 100%;height:4cm;">
                    </div>

                    <div class="product-preview">
                        <img src="../../img/product06.png" alt="" style="width: 3.5cm;height: 3.5cm" style="width: 100%;height:4cm;">
                    </div>

                    <div class="product-preview">
                        <img src="../../img/product08.png" alt="" style="width: 3.5cm;height: 3.5cm" style="width: 100%;height:4cm;" >
                    </div>
                </div>
            </div>
            <!-- /Product thumb imgs -->

            <!-- Product details -->
            <div class="col-md-5">
                <div class="product-details">
                    <h2 class="product-name">${motctsp.sanPham.ten}</h2>
                    <div>
                        <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <a class="review-link" href="#">10 Review(s) | Add your review</a>
                    </div>
                    <div>
                        <h4 class="product-price"><span style="font-size:15px">₫</span>${motctsp.giaBan-motctsp.giaBan/100*banhangonline.tonggiamgia(motctsp.id)}-<del class="product-old-price">${motctsp.giaBan}<span style="font-size:15px">₫</span></del></h4>
                        <span class="product-available">In Stock</span>
                    </div>



                    <div class="add-to-cart" style="margin-top: 7cm">
                        Số lượng :
                        <div class="qty-label">


                            <c:if test="${idkhachhang=='1'}">

                                <div class="" style="margin-left: 1cm">
                                    <BUTTON class="qty-down">--</BUTTON>
                                    <input type="number" value="1" min="1" max="${banhangonline.soluongcon(motctsp.id)}" id="input2" style="width: 2cm">
                                    <BUTTON class="qty-up">++</BUTTON>
                                </div>
                            </c:if>
                            <c:if test="${idkhachhang!='1'}">
                                <div class="" style="margin-left: 1cm">
                                    <BUTTON class="qty-down">-</BUTTON>
                                    <input type="number" value="0" min="0" max="${banhangonline.soluongcon(motctsp.id)-banhangonline.sl1ctsptronggh(banhangonline.ListghTheoidkh(idkhachhang).get(0).getId(),motctsp.id)}" id="input2" style="width: 2cm">
                                    <BUTTON class="qty-up">+</BUTTON>
                                </div>
                            </c:if>
                        </div>
                        <label style="background: white;border: 1px solid white">Số lượng còn :${banhangonline.soluongcon(motctsp.id)}</label>
                        <br><br>
                        <c:if test="${idkhachhang=='1'}">
                            <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                            <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thanh toán</button>
                        </c:if>
                        <c:if test="${idkhachhang!='1'}">
<%--                            <p>${idkhachhang}----${motctsp.id}</p>--%>
                            <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                            <button class="add-to-cart-btn" onclick="clickthanhtoanctsp('${idkhachhang}','${motctsp.id}')" ><i class="fa fa-shopping-cart"></i> Thanh toán</button>

                        </c:if>

                    </div>
<%--<p>${idkhachhang}</p>--%>
                    <ul class="product-btns">
                        <li><a href="#"><i class="fa fa-heart-o"></i> add to wishlist</a></li>
                        <li><a href="#"><i class="fa fa-exchange"></i> add to compare</a></li>
                    </ul>

                    <ul class="product-links">
                        <li>Category:</li>
                        <li><a href="#">Headphones</a></li>
                        <li><a href="#">Accessories</a></li>
                    </ul>

                    <ul class="product-links">
                        <li>Share:</li>
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                        <li><a href="#"><i class="fa fa-envelope"></i></a></li>
                    </ul>
                    <br>
                    <p>
                    <div>
                        *Hãng sản phẩm:${motctsp.sanPham.hangSanPham.ten}<br>
                        *Camera:${motctsp.sanPham.camera.thongSo}<br>
                        *Màn:${motctsp.sanPham.manHinh.thongSo}<br>
                        *Màu:${motctsp.mauSac.ten}<br>
                        *Ram:${motctsp.ram.dungLuong}<br>
                        *Rom:${motctsp.rom.dungLuong}<br>
                        *Pin:${motctsp.pin.loaiPin}<br>
                        *Dung lượng pin:${motctsp.pin.dungLuongPin.thongSo}<br>
                        *Chip:${motctsp.chip.ten}<br>
                    </div>
                    </p>

                </div>
            </div>
            <!-- /Product details -->

            <!-- Product tab -->
            <div class="col-md-12">
                <div id="product-tab">
                    <!-- product tab nav -->
                    <ul class="tab-nav">
                        <li class="active"><a data-toggle="tab" href="#tab1">Description</a></li>
                        <li><a data-toggle="tab" href="#tab2">Details</a></li>
                        <li><a data-toggle="tab" href="#tab3">Reviews (3)</a></li>
                    </ul>
                    <!-- /product tab nav -->

                    <!-- product tab content -->
                    <div class="tab-content">
                        <!-- tab1  -->
                        <div id="tab1" class="tab-pane fade in active">
                            <div class="row">
                                <div class="col-md-12">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                </div>
                            </div>
                        </div>
                        <!-- /tab1  -->

                        <!-- tab2  -->
                        <div id="tab2" class="tab-pane fade in">
                            <div class="row">
                                <div class="col-md-12">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                </div>
                            </div>
                        </div>
                        <!-- /tab2  -->

                        <!-- tab3  -->
                        <div id="tab3" class="tab-pane fade in">
                            <div class="row">
                                <!-- Rating -->
                                <div class="col-md-3">
                                    <div id="rating">
                                        <div class="rating-avg">
                                            <span>4.5</span>
                                            <div class="rating-stars">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-o"></i>
                                            </div>
                                        </div>
                                        <ul class="rating">
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div style="width: 80%;"></div>
                                                </div>
                                                <span class="sum">3</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div style="width: 60%;"></div>
                                                </div>
                                                <span class="sum">2</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div></div>
                                                </div>
                                                <span class="sum">0</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div></div>
                                                </div>
                                                <span class="sum">0</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div></div>
                                                </div>
                                                <span class="sum">0</span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- /Rating -->

                                <!-- Reviews -->
                                <div class="col-md-6">
                                    <div id="reviews">
                                        <ul class="reviews">
                                            <li>
                                                <div class="review-heading">
                                                    <h5 class="name">John</h5>
                                                    <p class="date">27 DEC 2018, 8:0 PM</p>
                                                    <div class="review-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o empty"></i>
                                                    </div>
                                                </div>
                                                <div class="review-body">
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="review-heading">
                                                    <h5 class="name">John</h5>
                                                    <p class="date">27 DEC 2018, 8:0 PM</p>
                                                    <div class="review-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o empty"></i>
                                                    </div>
                                                </div>
                                                <div class="review-body">
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="review-heading">
                                                    <h5 class="name">John</h5>
                                                    <p class="date">27 DEC 2018, 8:0 PM</p>
                                                    <div class="review-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o empty"></i>
                                                    </div>
                                                </div>
                                                <div class="review-body">
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                                                </div>
                                            </li>
                                        </ul>
                                        <ul class="reviews-pagination">
                                            <li class="active">1</li>
                                            <li><a href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                            <li><a href="#">4</a></li>
                                            <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- /Reviews -->

                                <!-- Review Form -->
                                <div class="col-md-3">
                                    <div id="review-form">
                                        <form class="review-form">
                                            <input class="input" type="text" placeholder="Your Name">
                                            <input class="input" type="email" placeholder="Your Email">
                                            <textarea class="input" placeholder="Your Review"></textarea>
                                            <div class="input-rating">
                                                <span>Your Rating: </span>
                                                <div class="stars">
                                                    <input id="star5" name="rating" value="5" type="radio"><label for="star5"></label>
                                                    <input id="star4" name="rating" value="4" type="radio"><label for="star4"></label>
                                                    <input id="star3" name="rating" value="3" type="radio"><label for="star3"></label>
                                                    <input id="star2" name="rating" value="2" type="radio"><label for="star2"></label>
                                                    <input id="star1" name="rating" value="1" type="radio"><label for="star1"></label>
                                                </div>
                                            </div>
                                            <button class="primary-btn">Submit</button>
                                        </form>
                                    </div>
                                </div>
                                <!-- /Review Form -->
                            </div>
                        </div>
                        <!-- /tab3  -->
                    </div>
                    <!-- /product tab content  -->
                </div>
            </div>
            <!-- /product tab -->

        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

 </c:if>

 <c:if test="${ktcokhong==0}" >
     <!-- SECTION -->
     <div class="section"  >
         <!-- container -->
         <div class="container"  >
             <!-- row -->
             <div class="row"  >
                 <!-- Product main img -->
                 <div class="col-md-5 col-md-push-2">
                     <div id="product-main-img">
                         <div class="product-preview">
                             <img src="" alt="" style="width: 100%;height: 12cm">
                         </div>

                         <div class="product-preview">
                             <img src="" alt="" style="width: 100%;height: 12cm; ">
                         </div>

                         <div class="product-preview">
                             <img src="" alt="" style="width: 100%;height: 12cm; ">
                         </div>

                         <div class="product-preview">
                             <img src="" alt="" style="width: 100%;height: 12cm; " >
                         </div>
                     </div>
                 </div>
                 <!-- /Product main img -->

                 <!-- Product thumb imgs -->
                 <div class="col-md-2  col-md-pull-5">
                     <div id="product-imgs">

                         <div class="product-preview">
                             <img src="" alt="" style="width: 100%;height:4cm;">
                         </div>

                         <div class="product-preview">
                             <img src="" alt="" style="width: 3.5cm;height: 3.5cm" style="width: 100%;height:4cm;">
                         </div>

                         <div class="product-preview">
                             <img src="" alt="" style="width: 3.5cm;height: 3.5cm" style="width: 100%;height:4cm;">
                         </div>

                         <div class="product-preview">
                             <img src="" alt="" style="width: 3.5cm;height: 3.5cm" style="width: 100%;height:4cm;" >
                         </div>
                     </div>
                 </div>
                 <!-- /Product thumb imgs -->

                 <!-- Product details -->
                 <div class="col-md-5">
                     <div class="product-details">
                         <h2 class="product-name">${tensp}</h2>
                         <div>
                             <div class="product-rating">
                                 <i class="fa fa-star"></i>
                                 <i class="fa fa-star"></i>
                                 <i class="fa fa-star"></i>
                                 <i class="fa fa-star"></i>
                                 <i class="fa fa-star-o"></i>
                             </div>
                             <a class="review-link" href="#">10 Review(s) | Add your review</a>
                         </div>
                         <div>
                             <h4 class="product-price"><span style="font-size:15px">₫</span>0-<del class="product-old-price">0<span style="font-size:15px">₫</span></del></h4>
                             <span class="product-available">In Stock</span>
                         </div>



                         <div class="add-to-cart" style="margin-top: 7cm">
                             Số lượng :
                             <div class="qty-label">

                                 <div class="" style="margin-left: 1cm">
                                     <BUTTON class="qty-down">-</BUTTON>
                                     <input type="number" value="1" min="1" max="0" id="input2" style="width: 2cm">
                                     <BUTTON class="qty-up">+</BUTTON>
                                 </div>
                             </div>
                             <label style="background: white;border: 1px solid white">Số lượng còn :0</label>
                             <br><br>
                             <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                             <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thanh toán</button>
                         </div>

                         <ul class="product-btns">
                             <li><a href="#"><i class="fa fa-heart-o"></i> add to wishlist</a></li>
                             <li><a href="#"><i class="fa fa-exchange"></i> add to compare</a></li>
                         </ul>

                         <ul class="product-links">
                             <li>Category:</li>
                             <li><a href="#">Headphones</a></li>
                             <li><a href="#">Accessories</a></li>
                         </ul>

                         <ul class="product-links">
                             <li>Share:</li>
                             <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                             <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                             <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                             <li><a href="#"><i class="fa fa-envelope"></i></a></li>
                         </ul>
                         <br>
                         <p>
                         <div>
                             *Hãng sản phẩm:<br>
                             *Camera:<br>
                             *Màn:<br>
                             *Màu:<br>
                             *Ram:<br>
                             *Rom:<br>
                             *Pin:<br>
                             *Dung lượng pin:<br>
                             *Chip:<br>
                         </div>
                         </p>

                     </div>
                 </div>
                 <!-- /Product details -->

                 <!-- Product tab -->
                 <div class="col-md-12">
                     <div id="product-tab">
                         <!-- product tab nav -->
                         <ul class="tab-nav">
                             <li class="active"><a data-toggle="tab" href="#tab1">Description</a></li>
                             <li><a data-toggle="tab" href="#tab2">Details</a></li>
                             <li><a data-toggle="tab" href="#tab3">Reviews (3)</a></li>
                         </ul>
                         <!-- /product tab nav -->

                         <!-- product tab content -->
                         <div class="tab-content">
                             <!-- tab1  -->
                             <div id="tab1" class="tab-pane fade in active">
                                 <div class="row">
                                     <div class="col-md-12">
                                         <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                     </div>
                                 </div>
                             </div>
                             <!-- /tab1  -->

                             <!-- tab2  -->
                             <div id="tab2" class="tab-pane fade in">
                                 <div class="row">
                                     <div class="col-md-12">
                                         <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                     </div>
                                 </div>
                             </div>
                             <!-- /tab2  -->

                             <!-- tab3  -->
                             <div id="tab3" class="tab-pane fade in">
                                 <div class="row">
                                     <!-- Rating -->
                                     <div class="col-md-3">
                                         <div id="rating">
                                             <div class="rating-avg">
                                                 <span>4.5</span>
                                                 <div class="rating-stars">
                                                     <i class="fa fa-star"></i>
                                                     <i class="fa fa-star"></i>
                                                     <i class="fa fa-star"></i>
                                                     <i class="fa fa-star"></i>
                                                     <i class="fa fa-star-o"></i>
                                                 </div>
                                             </div>
                                             <ul class="rating">
                                                 <li>
                                                     <div class="rating-stars">
                                                         <i class="fa fa-star"></i>
                                                         <i class="fa fa-star"></i>
                                                         <i class="fa fa-star"></i>
                                                         <i class="fa fa-star"></i>
                                                         <i class="fa fa-star"></i>
                                                     </div>
                                                     <div class="rating-progress">
                                                         <div style="width: 80%;"></div>
                                                     </div>
                                                     <span class="sum">3</span>
                                                 </li>
                                                 <li>
                                                     <div class="rating-stars">
                                                         <i class="fa fa-star"></i>
                                                         <i class="fa fa-star"></i>
                                                         <i class="fa fa-star"></i>
                                                         <i class="fa fa-star"></i>
                                                         <i class="fa fa-star-o"></i>
                                                     </div>
                                                     <div class="rating-progress">
                                                         <div style="width: 60%;"></div>
                                                     </div>
                                                     <span class="sum">2</span>
                                                 </li>
                                                 <li>
                                                     <div class="rating-stars">
                                                         <i class="fa fa-star"></i>
                                                         <i class="fa fa-star"></i>
                                                         <i class="fa fa-star"></i>
                                                         <i class="fa fa-star-o"></i>
                                                         <i class="fa fa-star-o"></i>
                                                     </div>
                                                     <div class="rating-progress">
                                                         <div></div>
                                                     </div>
                                                     <span class="sum">0</span>
                                                 </li>
                                                 <li>
                                                     <div class="rating-stars">
                                                         <i class="fa fa-star"></i>
                                                         <i class="fa fa-star"></i>
                                                         <i class="fa fa-star-o"></i>
                                                         <i class="fa fa-star-o"></i>
                                                         <i class="fa fa-star-o"></i>
                                                     </div>
                                                     <div class="rating-progress">
                                                         <div></div>
                                                     </div>
                                                     <span class="sum">0</span>
                                                 </li>
                                                 <li>
                                                     <div class="rating-stars">
                                                         <i class="fa fa-star"></i>
                                                         <i class="fa fa-star-o"></i>
                                                         <i class="fa fa-star-o"></i>
                                                         <i class="fa fa-star-o"></i>
                                                         <i class="fa fa-star-o"></i>
                                                     </div>
                                                     <div class="rating-progress">
                                                         <div></div>
                                                     </div>
                                                     <span class="sum">0</span>
                                                 </li>
                                             </ul>
                                         </div>
                                     </div>
                                     <!-- /Rating -->

                                     <!-- Reviews -->
                                     <div class="col-md-6">
                                         <div id="reviews">
                                             <ul class="reviews">
                                                 <li>
                                                     <div class="review-heading">
                                                         <h5 class="name">John</h5>
                                                         <p class="date">27 DEC 2018, 8:0 PM</p>
                                                         <div class="review-rating">
                                                             <i class="fa fa-star"></i>
                                                             <i class="fa fa-star"></i>
                                                             <i class="fa fa-star"></i>
                                                             <i class="fa fa-star"></i>
                                                             <i class="fa fa-star-o empty"></i>
                                                         </div>
                                                     </div>
                                                     <div class="review-body">
                                                         <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                                                     </div>
                                                 </li>
                                                 <li>
                                                     <div class="review-heading">
                                                         <h5 class="name">John</h5>
                                                         <p class="date">27 DEC 2018, 8:0 PM</p>
                                                         <div class="review-rating">
                                                             <i class="fa fa-star"></i>
                                                             <i class="fa fa-star"></i>
                                                             <i class="fa fa-star"></i>
                                                             <i class="fa fa-star"></i>
                                                             <i class="fa fa-star-o empty"></i>
                                                         </div>
                                                     </div>
                                                     <div class="review-body">
                                                         <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                                                     </div>
                                                 </li>
                                                 <li>
                                                     <div class="review-heading">
                                                         <h5 class="name">John</h5>
                                                         <p class="date">27 DEC 2018, 8:0 PM</p>
                                                         <div class="review-rating">
                                                             <i class="fa fa-star"></i>
                                                             <i class="fa fa-star"></i>
                                                             <i class="fa fa-star"></i>
                                                             <i class="fa fa-star"></i>
                                                             <i class="fa fa-star-o empty"></i>
                                                         </div>
                                                     </div>
                                                     <div class="review-body">
                                                         <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                                                     </div>
                                                 </li>
                                             </ul>
                                             <ul class="reviews-pagination">
                                                 <li class="active">1</li>
                                                 <li><a href="#">2</a></li>
                                                 <li><a href="#">3</a></li>
                                                 <li><a href="#">4</a></li>
                                                 <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                                             </ul>
                                         </div>
                                     </div>
                                     <!-- /Reviews -->

                                     <!-- Review Form -->
                                     <div class="col-md-3">
                                         <div id="review-form">
                                             <form class="review-form">
                                                 <input class="input" type="text" placeholder="Your Name">
                                                 <input class="input" type="email" placeholder="Your Email">
                                                 <textarea class="input" placeholder="Your Review"></textarea>
                                                 <div class="input-rating">
                                                     <span>Your Rating: </span>
                                                     <div class="stars">
                                                         <input id="star5" name="rating" value="5" type="radio"><label for="star5"></label>
                                                         <input id="star4" name="rating" value="4" type="radio"><label for="star4"></label>
                                                         <input id="star3" name="rating" value="3" type="radio"><label for="star3"></label>
                                                         <input id="star2" name="rating" value="2" type="radio"><label for="star2"></label>
                                                         <input id="star1" name="rating" value="1" type="radio"><label for="star1"></label>
                                                     </div>
                                                 </div>
                                                 <button class="primary-btn">Submit</button>
                                             </form>
                                         </div>
                                     </div>
                                     <!-- /Review Form -->
                                 </div>
                             </div>
                             <!-- /tab3  -->
                         </div>
                         <!-- /product tab content  -->
                     </div>
                 </div>
                 <!-- /product tab -->

             </div>
             <!-- /row -->
         </div>
         <!-- /container -->
     </div>
     <!-- /SECTION -->
 </c:if>

 <!-- Section -->
 <div class="section">
     <!-- container -->
     <div class="container">
         <!-- row -->
         <div class="row">

             <div class="col-md-12">
                 <div class="section-title text-center">
                     <h3 class="title">Related Products</h3>
                 </div>
             </div>

             <!-- product -->
             <div class="section">
                 <!-- container -->
                 <div class="container">
                     <!-- row -->
                     <div class="row">

                         <!-- section title -->

                         <!-- /section title -->

                         <!-- Products tab & slick -->
                         <div class="col-md-12">
                             <div class="row">
                                 <div class="products-tabs">
                                     <!-- tab -->
                                     <div  class="tab-pane active">
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
                                                         <div class="product-body">
                                                             <p class="product-category">Điện thoại</p>
                                                             <h3 class="product-name"><a href="#">${ht.sanPham.ten}</a></h3>
                                                             <h4 class="product-price"><span style="font-size:15px">₫</span>${ht.giaBan-ht.giaBan/100*giamgia.tonggiamgia(ht.id)}-<del class="product-old-price">${ht.giaBan}<span style="font-size:15px">₫</span></del></h4>
                                                                 <%--                                            ${ht.tinhTrang} +  ${ht.sanPham.tinhTrang}--%>
                                                             <p class="product-category">Đã bán :${banhangonline.soluongdaban(ht.id)}--Còn :${banhangonline.soluongcon(ht.id)}</p>
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
                         <br>
                         <br>
                         <br>
                         <div class="section">
                             <!-- container -->
                             <div class="container">
                                 <!-- row -->
                                 <div class="row">

                                     <!-- section title -->

                                     <!-- /section title -->

                                     <!-- Products tab & slick -->
                                     <div class="col-md-12">
                                         <div class="row">
                                             <div class="products-tabs">
                                                 <!-- tab -->
                                                 <div id="" class="tab-pane fade in active">
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
                                                                     <div class="product-body">
                                                                         <p class="product-category">Điện thoại</p>
                                                                         <h3 class="product-name"><a href="#">${ht.sanPham.ten}</a></h3>
                                                                         <h4 class="product-price"><span style="font-size:15px">₫</span>${ht.giaBan-ht.giaBan/100*giamgia.tonggiamgia(ht.id)}-<del class="product-old-price">${ht.giaBan}<span style="font-size:15px">₫</span></del></h4>
                                                                             <%--                                            ${ht.tinhTrang} +  ${ht.sanPham.tinhTrang}--%>
                                                                         <p class="product-category">Đã bán :${banhangonline.soluongdaban(ht.id)}--Còn :${banhangonline.soluongcon(ht.id)}</p>
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
                         <!-- Products tab & slick -->
                     </div>
                     <!-- /row -->
                 </div>
                 <!-- /container -->
             </div>
             <!-- /product -->



         </div>
         <!-- /row -->
     </div>
     <!-- /container -->
 </div>
 <!-- /Section -->


<!-- jQuery Plugins -->
<%--<script src="js/jquery.min.js"></script>--%>
<%--<script src="js/bootstrap.min.js"></script>--%>
<%--<script src="js/slick.min.js"></script>--%>
<%--<script src="js/nouislider.min.js"></script>--%>
<%--<script src="js/jquery.zoom.min.js"></script>--%>
<%--<script src="js/main.js"></script>--%>

</body>
</html>

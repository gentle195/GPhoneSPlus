<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">


<style>
    .product-info-table {
        border-collapse: collapse; /* Loại bỏ khoảng cách giữa các ô */
        width: 100%; /* Đảm bảo bảng rộng 100% */
    }

    .product-info-table tr {
        border-bottom: 1px solid #ccc; /* Thêm dòng kẻ dưới mỗi hàng */
    }

    .product-info-table td {
        padding: 8px; /* Tùy chỉnh khoảng cách nội dung trong ô */
    }

    .info-label {
        font-weight: bold; /* In đậm nhãn */
    }
    .modal {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
    }

    .modal-content {
        background-color: #fff;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        padding: 20px;
        border: 1px solid #000;
    }
</style>
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
                            <img src="../../uploads/${motctsp.sanPham.anh.anh1}" alt="" style="width: 100%;height: 12cm; ">
                        </div>

                        <div class="product-preview">
                            <img src="../../uploads/${motctsp.sanPham.anh.anh2}" alt="" style="width: 100%;height: 12cm; ">
                        </div>

                        <div class="product-preview">
                            <img src="../../uploads/${motctsp.sanPham.anh.anh3}" alt="" style="width: 100%;height: 12cm; " >
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
                            <img src="../../uploads/${motctsp.sanPham.anh.anh1}" alt="" style="width: 3.5cm;height: 3.5cm" style="width: 100%;height:4cm;">
                        </div>

                        <div class="product-preview">
                            <img src="../../uploads/${motctsp.sanPham.anh.anh2}" alt="" style="width: 3.5cm;height: 3.5cm" style="width: 100%;height:4cm;">
                        </div>

                        <div class="product-preview">
                            <img src="../../uploads/${motctsp.sanPham.anh.anh3}" alt="" style="width: 3.5cm;height: 3.5cm" style="width: 100%;height:4cm;" >
                        </div>
                    </div>
                </div>
                <!-- /Product thumb imgs -->

                <!-- Product details -->
                <div class="col-md-5">
                    <div class="product-details">
                        <h2 class="product-name">${motctsp.sanPham.ten}</h2>

                        <div>
                            <h4 class="product-price"><span style="font-size:15px">₫</span>${motctsp.giaBan-motctsp.giaBan/100*banhangonline.tonggiamgia(motctsp.id)}-<del class="product-old-price">${motctsp.giaBan}<span style="font-size:15px">₫</span></del></h4>
                            <span class="product-available">In Stock</span>
                        </div>



                        <div class="add-to-cart" style="margin-top: 7cm">
                            <div class="qty-label">
                                <c:if test="${idkhachhang=='1'}">
                                    <div class="input-group" style="width: 100px;">
                <span class="input-group-btn">
                    <button type="button" class="btn btn-default btn-number qty-down" disabled="disabled">
                        <span class="fa fa-minus"></span>
                    </button>
                </span>
                                        <input type="text" id="input2" class="form-control input-number" value="1" min="1" max="${banhangonline.soluongcon(motctsp.id)}">
                                        <span class="input-group-btn">
                    <button type="button" class="btn btn-default btn-number qty-up">
                        <span class="fa fa-plus"></span>
                    </button>
                </span>
                                    </div>
                                </c:if>
                                <c:if test="${idkhachhang!='1'}">
                                    <div class="input-group" style="width: 100px;">
                <span class="input-group-btn">
                    <button type="button" class="btn btn-default btn-number qty-down" disabled="disabled">
                        <span class="fa fa-minus"></span>
                    </button>
                </span>
                                        <input type="text" id="input2" class="form-control input-number" value="0" min="0" max="${banhangonline.soluongcon(motctsp.id)-banhangonline.sl1ctsptronggh(banhangonline.ListghTheoidkh(idkhachhang).get(0).getId(),motctsp.id)}">
                                        <span class="input-group-btn">
                    <button type="button" class="btn btn-default btn-number qty-up">
                        <span class="fa fa-plus"></span>
                    </button>
                </span>
                                    </div>
                                </c:if>
                                <label style="background: white; border: 1px solid white; float: left; margin-top: 5px;">Số lượng còn : ${banhangonline.soluongcon(motctsp.id)}</label>
                            </div>
                            <br><br>
                            <c:if test="${idkhachhang=='1'}">
                                <button class="btn btn-primary add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                <button class="btn btn-primary add-to-cart-btn"><i class="fa fa-credit-card"></i> Thanh toán</button>
                            </c:if>
                            <c:if test="${idkhachhang!='1'}">
                                <button class="btn btn-primary add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                <button class="btn btn-primary add-to-cart-btn" onclick="clickthanhtoanctsp('${idkhachhang}','${motctsp.id}')"><i class="fa fa-credit-card"></i> Thanh toán</button>
                            </c:if>

                        </div>
                            <%--<p>${idkhachhang}</p>--%>





                        <br>
                        <p>
                        <div class="product-description">
                            <h3>Thông tin chi tiết sản phẩm:</h3>
                            <table class="product-info-table">
                                <tr>
                                    <td class="info-label">Hãng sản phẩm:</td>
                                    <td>${motctsp.sanPham.hangSanPham.ten}</td>
                                </tr>
                                <tr>
                                    <td class="info-label">Camera:</td>
                                    <td>${motctsp.sanPham.camera.thongSo}</td>
                                </tr>
                                <tr>
                                    <td class="info-label">Màn:</td>
                                    <td>${motctsp.sanPham.manHinh.thongSo}</td>
                                </tr>
                                <tr>
                                    <td class="info-label">Màu:</td>
                                    <td>${motctsp.mauSac.ten}</td>
                                </tr>
                                <tr>
                                    <td class="info-label">Ram:</td>
                                    <td>${motctsp.ram.dungLuong}</td>
                                </tr>
                                <tr>
                                    <td class="info-label">Rom:</td>
                                    <td>${motctsp.rom.dungLuong}</td>
                                </tr>
                                <tr>
                                    <td class="info-label">Pin:</td>
                                    <td>${motctsp.pin.loaiPin}</td>
                                </tr>
                                <tr>
                                    <td class="info-label">Dung lượng pin:</td>
                                    <td>${motctsp.pin.dungLuongPin.thongSo}</td>
                                </tr>
                                <tr>
                                    <td class="info-label">Chip:</td>
                                    <td>${motctsp.chip.ten}</td>
                                </tr>
                            </table>
                        </div>


                        <div class="row">
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModalCTSP
">
                                Xem thêm cấu hình chi tiết
                            </button>
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
<div class="modal fade" id="exampleModalCTSP" tabindex="-1" aria-labelledby="exampleModalLabelCTSP"
     aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabelCTSP">Chi tiết sản phẩm</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <table class="table table-bordered">
                    <%--                    <tr>--%>
                    <%--                        <th>Thông số Camera:</th>--%>
                    <%--                        <td><c:out value="${camera.thongSo}" /></td>--%>
                    <%--                    </tr>--%>
                    <%--                    <tr>--%>
                    <%--                        <th>Mô tả:</th>--%>
                    <%--                        <td><c:out value="${camera.moTa}" /></td>--%>
                    <%--                    </tr>--%>
                    <!-- Thêm các thông tin sản phẩm khác tương tự -->
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>


</body>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</html>

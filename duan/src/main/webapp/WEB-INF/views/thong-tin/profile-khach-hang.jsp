<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <%--phan trang--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Electro - HTML Ecommerce Template</title>
    <%--căn đều--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" />


    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="/cssbanhang/bootstrap.min.css"/>

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="/cssbanhang/slick.css"/>
    <link type="text/css" rel="stylesheet" href="/cssbanhang/slick-theme.css"/>

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="/cssbanhang/nouislider.min.css"/>

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="/cssbanhang/font-awesome.min.css">

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="/cssbanhang/style.css"/>

    <%--    select 2--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.rtl.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.full.min.js"></script>




    <style>
        /* CSS cho modal */

        body {
            margin: 0;
            padding: 0;
        }

        .container1 {
            display: flex;
            margin-left: 5cm;
            margin-right: 5cm;
        }

        .middle-column1, .right-column1 {
            flex: 1;
            padding: 10px;
            /*border: 1px solid #ccc;*/
            box-sizing: border-box;
        }
        .left-column1{
            width: 6cm;
        }
        .middle-column1 {
            width:  calc(100% - 6cm - 4cm); /* Tính toán kích thước cột giữa */

        }
        .right-column1 {
            width: 4cm;
        }



        .tab-container {
            display: flex;
            width: 300px; /* Điều chỉnh chiều rộng theo ý muốn */
        }

        .tab-menu {
            /*background-color: #333;*/
            color: black;

            width: 100%; /* Điều chỉnh chiều rộng menu tab */
        }

        .tab {
            padding: 10px;
            cursor: pointer;
        }

        .tab-content {
            width: 100%; /* Điều chỉnh chiều rộng nội dung tab */
        }

        .tab-pane {
            display: none;
        }

        .tab-pane.active {
            display: block;
        }
    </style>

</head>
<body>






<!-- HEADER -->
<header>
    <!-- TOP HEADER -->
    <div id="top-header">
        <div class="container">
            <ul class="header-links pull-left">
                <li><a href="#"><i class="fa fa-phone"></i> +021-95-51-84</a></li>
                <li><a href="#"><i class="fa fa-envelope-o"></i> email@email.com</a></li>
                <li><a href="#"><i class="fa fa-map-marker"></i> 1734 Stonecoal Road</a></li>
            </ul>
            <ul class="header-links pull-right">
                <li><a href="#"><i class="fa fa-dollar"></i> USD</a></li>
                <c:if test="${idkhachhang=='1'}">
                    <li><a href="/thong-tin-ca-nhan"><i class="fa fa-user-o"></i> Chưa đăng nhập:<input id="tkmkidkhachhang" type="text" style="display: none" value="${idkhachhang}"></a></li>

                </c:if>
                <c:if test="${idkhachhang !='1'}">
                    <li><a href="#"><i class="fa fa-user-o"></i> ${khachhangdangnhap.hoTen}<input id="tkmkidkhachhang" type="text" style="display: none" value="${idkhachhang}"></a></li>
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
                        <a href="#" class="logo">
                            <%--							<img src="../../img/logo.png" alt="">--%>
                            <img src="/img/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->
                <div class="col-md-6">
                    <div class="header-search">
                        <form>
                            <select class="input-select">
                                <option value="0">All Categories</option>
                                <option value="1">Category 01</option>
                                <option value="1">Category 02</option>
                            </select>
                            <input class="input" placeholder="Search here">
                            <button class="search-btn">Search</button>
                        </form>
                    </div>
                </div>
                <!-- /SEARCH BAR -->

                <!-- ACCOUNT -->
                <div class="col-md-3 clearfix">
                    <div class="header-ctn">
                        <!-- Wishlist -->
                        <div>
                            <a href="#">
                                <i class="fa fa-heart-o"></i>
                                <span>Your Wishlist</span>
                                <div class="qty">2</div>
                            </a>
                        </div>
                        <!-- /Wishlist -->

                        <!-- Cart -->
                        <div class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                <i class="fa fa-shopping-cart"></i>
                                <span>Your Cart</span>
                                <div class="qty">3</div>
                            </a>
                            <div class="cart-dropdown">
                                <div class="cart-list">
                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="/img/product01.png" alt="">
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                            <h4 class="product-price"><span class="qty">1x</span>$980.00</h4>
                                        </div>
                                        <button class="delete"><i class="fa fa-close"></i></button>
                                    </div>

                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="/img/product02.png" alt="">
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                            <h4 class="product-price"><span class="qty">3x</span>$980.00</h4>
                                        </div>
                                        <button class="delete"><i class="fa fa-close"></i></button>
                                    </div>
                                </div>
                                <div class="cart-summary">
                                    <small>3 Item(s) selected</small>
                                    <h5>SUBTOTAL: $2940.00</h5>
                                </div>
                                <div class="cart-btns">
                                    <a href="#">View Cart</a>
                                    <a href="#">Checkout  <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
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
                <li ><a href="#" onclick="loadInterface('/ban-hang-online/giao-dien-trang-chu')">TRANG CHỦ</a></li>
                <li><a href="#">ƯU ĐÃI HẤP DẪN</a></li>
                <li><a href="#">LOẠI</a></li>
                <li><a href="#" onclick="loadInterface('/ban-hang-online/dien-thoai-thong-minh')">ĐIỆN THOẠI THÔNG MINH</a></li>
            </ul>
            <!-- /NAV -->
        </div>
        <!-- /responsive-nav -->
    </div>
    <!-- /container -->
</nav>
<!-- /NAVIGATION -->
<!-- /NAVIGATION -->


<form:form action="/khach-hang/update" method="post" modelAttribute="kh"
           enctype="multipart/form-data">

    <div class="container1">



        <div class="left-column1" style="width: 6cm;">
            <!-- Nội dung cột trái -->
            <div class="row">
                <div class="col-md-2">
                    <img id="preview-image-2" class="preview-image" src="../../../uploads/${kh.anh}" alt=""
                         width="40px" height="40px%"
                         style="border-radius:50% 50% 50% 50%;border: 2px solid #999999">
                </div>
                <div class="col-md-10">
                    <p style="margin-left: 0.5cm"><strong>${kh.taiKhoan}</strong></p>
                        <%--                <p style="margin-left: 0.5cm">     (Sửa hồ sơ!)</p>--%>
                </div>

            </div>

            <div class="row">
                <div class="tab-container">
                    <div class="tab-menu">
                        <div class="tab" st onclick="openTab(1)">Hồ sơ</div>
                        <div class="tab" onclick="openTab(2)">Địa chỉ</div>
                        <div class="tab" onclick="openTab(3)">Đơn hàng</div>
                        <div class="tab" onclick="openTab(4)">Thông báo</div>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane" id="tab1">Nội dung 1</div>
                        <div class="tab-pane" id="tab2">2</div>
                        <div class="tab-pane" id="tab3">3</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="middle-column1">
            <!-- Nội dung cột giữa -->
            <div class="row">
                <p style="margin-left: 0.5cm"><strong>Hồ sơ của tôi </strong></p>
                <p style="margin-left: 0.5cm">     (Quản lý thông tin hồ sơ để bảo mật tài khoản!)</p>

            </div>
            <table class="table">
                <thead>
                <tr>
                    <P style="display: none">
                        <form:input path="id"></form:input>
                    </P>
                    <th>
                        Tên đăng nhập: ${kh.taiKhoan}
                    </th>
                </tr>
                <tr>
                    <td>Họ tên</td>
                    <td>
                        <form:input class="form-control" placeholder="${kh.hoTen}"  path="hoTen"/>
                    </td>
                </tr>
                    <%--                <tr>--%>
                    <%--                    <td>Địa chỉ</td>--%>
                    <%--                    <td>--%>
                    <%--                        <form:input class="form-control" placeholder="" path=""/>--%>
                    <%--                    </td>--%>
                    <%--                </tr>--%>
                <tr>
                    <td>Email</td>
                    <td><form:input class="form-control" placeholder="${kh.email}" path="email"/></td>
                </tr>
                <tr>
                    <td>SĐT</td>
                    <td><form:input class="form-control" placeholder="${kh.sdt}" path="sdt"/></td>
                </tr>
                <tr>
                    <td>Giới tính</td>
                    <td>
                        <div class="form-control">
                            <form:radiobutton path="gioiTinh" value="true"/>Nam
                            <form:radiobutton path="gioiTinh" value="false" cssStyle="margin-left: 1cm"/> Nữ
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Ngày sinh</td>
                    <td> <form:input class="form-control" placeholder="" path="ngaySinh" type="date"
                                     id="ns"/></td>
                </tr>
            </table>
            <div style="text-align: center">
                <button type="submit" class="btn btn-primary mr-2"
                        onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                    SAVE
                </button>
            </div>

        </div>


        <div class="right-column1" style="text-align: center">
                <%--                <div class="col-md-2" style="text-align: center; margin-left: 1cm">--%>
                <%--                </div>--%>

            <!-- Nội dung cột phải -->
            <div style="display: none">
                <input style="" type="text" name="checkanh" value="cu" id="cucheck">
                <br>
            </div>
            <div>

                <label style="border: 5px solid white;width: 150px;height: 150px;border-radius:50% 50% 50% 50%;"
                       for="anhmoi">
                    <img id="preview-image-4" class="preview-image" src="../../../uploads/${kh.anh}" alt=""
                         width="100%" height="100%"
                         style="border-radius:50% 50% 50% 50%;border: 2px solid #8c8c8c">
                    <br>
                    ẢNH
                </label>
                <br>
                <div style="display: none">
                    <input type="file" name="images" accept="image/jpeg, image/png" id="anhmoi">
                </div>
            </div>
            <div style="display: none">
                <form:input path="anh"/>
            </div>

        </div>



    </div>
</form:form>


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
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.</p>
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
                    <ul class="footer-payments" >
                        <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                        <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                    </ul  >
                    <span class="copyright">
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
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
<!-- /FOOTER -->





<script>
    function openTab(tabIndex) {
        var tabPanes = document.querySelectorAll('.tab-pane');
        for (var i = 0; i < tabPanes.length; i++) {
            tabPanes[i].classList.remove('active');
        }
        document.getElementById('tab' + tabIndex).classList.add('active');
    }


</script>
<script>


    const imageInput = document.getElementById('anhmoi');

    const previewImage2 = document.getElementById('preview-image-2');

    imageInput.addEventListener('change', function () {

        const file = imageInput.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                previewImage2.src = e.target.result;
            };
            reader.readAsDataURL(file);
        } else {
            previewImage2.src = '';
        }
        document.getElementById('cucheck').value = 'moi';
    });
</script>
<script>


    function loadgiaodienghctbanhang(interfaceUrl) {
        fetch(interfaceUrl)
            .then(response => response.text())
            .then(data => {
                const content = document.getElementById('content');
                content.innerHTML = data;
                thanhtienbenghct();
                loadScripts();
                loadSelect2();


            })
            .catch(error => {
                console.error('Error loading interface:', error);
            });

        document.getElementById('thanhlocctsp').style.display='none';

    }




    function loadbenloc(interfaceUrl) {
        fetch(interfaceUrl)
            .then(response => response.text())
            .then(data => {
                const content = document.getElementById('dssanphamloc');
                content.innerHTML = data;
            })
            .catch(error => {
                console.error('Error loading interface:', error);
            });
        document.getElementById('thanhlocctsp').style.display='none';
    }

    function thanhlocctsp(interfaceUrl) {
        fetch(interfaceUrl)
            .then(response => response.text())
            .then(data => {

                const content = document.getElementById('thanhlocctsp');
                content.innerHTML = data;




            })
            .catch(error => {
                console.error('Error loading interface:', error);
            });
        document.getElementById('thanhlocctsp').style.display='none';
    }
    function locbenctsp(interfaceUrl) {
        fetch(interfaceUrl)
            .then(response => response.text())
            .then(data => {
                const content = document.getElementById('content');
                content.innerHTML = data;

                loadScripts();
                loadSelect2();


            })
            .catch(error => {
                console.error('Error loading interface:', error);
            });
        document.getElementById('thanhlocctsp').style.display='block';
    }
    function loadInterface(interfaceUrl) {
        fetch(interfaceUrl)
            .then(response => response.text())
            .then(data => {
                const content = document.getElementById('content');
                content.innerHTML = data;

                loadScripts();
                loadSelect2();


            })
            .catch(error => {
                console.error('Error loading interface:', error);
            });

        document.getElementById('thanhlocctsp').style.display='none';


        if(interfaceUrl.includes('/ban-hang-online/chi-tiet-san-pham/')){
            <c:forEach  items="${listsp}" var="ht" varStatus="stt">
            var kt='/ban-hang-online/chi-tiet-san-pham/'+'${ht.id}';
            if(kt==interfaceUrl){
                thanhlocctsp('/ban-hang-online/thanh-loc-ctsp/'+'${ht.id}');
                document.getElementById('thanhlocctsp').style.display='block';
            }
            </c:forEach>

        }
    }

    function loadScripts() {
        const scriptsToLoad = [
            'https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js',
            'https://cdn.jsdelivr.net/npm/jquery@3.5.0/dist/jquery.slim.min.js',
            'https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js',
            'https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.full.min.js',

            '/jsbanhang/jquery.min.js',
            '/jsbanhang/bootstrap.min.js',
            '/jsbanhang/slick.min.js',
            '/jsbanhang/nouislider.min.js',
            '/jsbanhang/jquery.zoom.min.js',
            '/jsbanhang/main.js'

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
                loadSelect2();
            }
        }

        // Bắt đầu quá trình tải script
        loadScript(0);
    }

    function loadSelect2() {
        // Gọi .select2() cho các phần tử sau khi tất cả các tệp script đã được nạp
        $('#hangds1').select2({
            theme: 'bootstrap-5'
        });
        $( '#camds1' ).select2( {
            theme: 'bootstrap-5'
        } );
        $( '#mands1' ).select2( {
            theme: 'bootstrap-5'
        } );
        $( '#mauds1' ).select2( {
            theme: 'bootstrap-5'
        } );
        $( '#ramds1' ).select2( {
            theme: 'bootstrap-5'
        } );
        $( '#romds1' ).select2( {
            theme: 'bootstrap-5'
        } );

        $( '#pinds1' ).select2( {
            theme: 'bootstrap-5'
        } );
        $( '#dungds1' ).select2( {
            theme: 'bootstrap-5'
        } );

        $( '#chipds1' ).select2( {
            theme: 'bootstrap-5'
        } );

        $( '#sands1' ).select2( {
            theme: 'bootstrap-5'
        } );

        $( '#diachids1' ).select2( {
            theme: 'bootstrap-5'
        } );

        // Gọi .select2() cho các phần tử khác ở đây (tương tự)
    }

</script>

<!-- jQuery Plugins -->
<script src="/jsbanhang/jquery.min.js"></script>
<script src="/jsbanhang/bootstrap.min.js"></script>
<script src="/jsbanhang/slick.min.js"></script>
<script src="/jsbanhang/nouislider.min.js"></script>
<script src="/jsbanhang/jquery.zoom.min.js"></script>
<script src="/jsbanhang/main.js"></script>
</body>
</html>

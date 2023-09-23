<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="../../images/favicon.ico" type="image/ico" />
    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">

    <!-- bootstrap-progressbar -->
    <link href="../vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="../vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../../build/css/custom.min.css" rel="stylesheet">
</head>
<body>
<P style="font-size: 50px;text-align: center">
    Khách hàng
</P>
<a href="/khach-hang/view-add" class="btn btn-primary" style="float: right" >Thêm khách hàng</a>

<a href="/khach-hang/khach-hang-tung-xoa" class="btn btn-danger" style="float: right" >Khách hàng tung xóa</a>


<form action="/khach-hang/tim-kiem" method="post" style="margin-left: 1cm">

    <input style="height: 1cm" type="text" name="matk" placeholder="Mã hoặc tên">

    <button type="submit" class="btn btn-primary">Tìm kiếm</button>
</form>


<div class="">
    <div class="clearfix"></div>
    <div class="col-md-12 col-sm-12 ">
        <div class="x_panel">
            <div class="x_title">
                <h2>Thông tin Khách Hàng</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box table-responsive">
                            <table id="datatable-responsive"
                                   class="table table-striped table-bordered dt-responsive nowrap"
                                   cellspacing="0" width="100%"  id="bang">
                                <tr>
                                    <th>STT</th>
                                    <th>Ảnh</th>
                                    <th>Mã</th>
                                    <th>Tên</th>
                                    <th>Giới tính</th>
                                    <th>Email</th>
                                    <th>Sdt</th>
                                    <th>Ngày sinh</th>
                                    <th>Tài khoản</th>
                                    <th>Mật khẩu</th>
                                    <th>Ngày tạo</th>
                                    <th>Ngày cập nhật</th>

                                    <th>Tình trạng</th>
                                    <th>Điểm</th>
                                    <th>Hãng khách hàng</th>
                                    <th>Chức năng</th>

                                </tr>


                                <c:forEach items="${dulieu}" var="ht" varStatus="stt">
                                    <tr>
                                        <td>${stt.index+1}</td>

                                        <td align="center">

                                            <img src="../../../uploads/${ht.anh}" width="40" height="40" style="border-radius:50% 50% 50% 50%">


                                        </td>
                                        <td>${ht.ma}</td>
                                        <td>${ht.hoTen} </td>
<%--                                        <c:if test="${nhanVien.gioiTinh == true}">Nam</c:if>--%>
<%--                                        <c:if test="${nhanVien.gioiTinh == false}">Nữ</c:if>--%>
                                        <td>${ht.goitinh()}</td>
                                        <td>${ht.email}</td>
                                        <td>${ht.sdt}</td>
                                        <td>${ht.ngaySinh}</td>
                                        <td>${ht.taiKhoan}</td>
                                        <td>${ht.matKhau}</td>
                                        <td>${ht.ngayTao}</td>
                                        <td>${ht.ngayCapNhat}</td>

                                        <td style="color: #62c462;font-size: 15px">${ht.tt()}</td>
                                        <td>${ht.diem}</td>
                                        <td>${ht.hangKhachHang.ten}</td>

                                        <td>
                                            <a href="/khach-hang/remove/${ht.id}" class="btn btn-success" onclick="return tbxd()">Xóa</a>

                                            <a href="/khach-hang/view-update/${ht.id}" class="btn btn-success" onclick="return tbxd()">Sửa</a>

                                            <a href="/khach-hang/view-detail/${ht.id}" class="btn btn-success" onclick="return tbxd()">xem</a>
                                        </td>

                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>




        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center pagination-lg">
                <li class="page-item"><a class="page-link" href="/khach-hang/hien-thi?num=0">First</a></li>

                <c:forEach begin="1" end="${total}" varStatus="status">
                    <li class="page-item">
                        <a href="/khach-hang/hien-thi?num=${status.index-1}"
                           class="page-link">${status.index}</a>
                    </li>
                </c:forEach>

                <li class="page-item"><a class="page-link" href="/khach-hang/hien-thi?num=${total-1}">Last</a></li>
            </ul>
        </nav>


<P id="bc" style="color: crimson"></P>


        <script>


    if ("${tong}" <= 0) {
        document.getElementById("bang").style.display = "none"
        document.getElementById("bc").innerText = "Hết để xóa rồi cu"
    } else {
        document.getElementById("bang").style.display = ""
        document.getElementById("bc").innerText = ""
    }


    function thongbao() {
        var ns = document.getElementById("ns").value;
        if (confirm("Bạn muốn dùng trức năng") == true) {
            if (ns.trim() === '') {
                document.getElementById("tb").innerHTML = "Không để trống ngày sinh";
                document.getElementById("bt").type = "button"
                return false;
            } else {
                document.getElementById("bt").type = "submit"
                return true;
            }


        }
    }



    function tbxd() {
        if (confirm("Bạn muốn dùng chức năng") == true) {
            return true;
        }
        return false;
    }



    // function ktmd() {
    //     var kt = document.getElementById("vocuc").innerHTML
    //     if (kt.trim() === '') {
    //         document.getElementById("ktvocuc").innerHTML = "ko de trong"
    //         document.getElementById("btkt").type = "button"
    //         return false;
    //     } else {
    //         document.getElementById("btkt").type = "submit"
    //         return true;
    //     }
    // }
</script>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
        integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
        crossorigin="anonymous"></script>

<!-- jQuery -->
<script src="../vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="../vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!-- FastClick -->
<script src="../vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="../vendors/nprogress/nprogress.js"></script>
<!-- Chart.js -->
<script src="../vendors/Chart.js/dist/Chart.min.js"></script>
<!-- gauge.js -->
<script src="../vendors/gauge.js/dist/gauge.min.js"></script>
<!-- bootstrap-progressbar -->
<script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<!-- iCheck -->
<script src="../vendors/iCheck/icheck.min.js"></script>
<!-- Skycons -->
<script src="../vendors/skycons/skycons.js"></script>
<!-- Flot -->
<script src="../vendors/Flot/jquery.flot.js"></script>
<script src="../vendors/Flot/jquery.flot.pie.js"></script>
<script src="../vendors/Flot/jquery.flot.time.js"></script>
<script src="../vendors/Flot/jquery.flot.stack.js"></script>
<script src="../vendors/Flot/jquery.flot.resize.js"></script>
<!-- Flot plugins -->
<script src="../vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
<script src="../vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
<script src="../vendors/flot.curvedlines/curvedLines.js"></script>
<!-- DateJS -->
<script src="../vendors/DateJS/build/date.js"></script>
<!-- JQVMap -->
<script src="../vendors/jqvmap/dist/jquery.vmap.js"></script>
<script src="../vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
<script src="../vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
<!-- bootstrap-daterangepicker -->
<script src="../vendors/moment/min/moment.min.js"></script>
<script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

<!-- Custom Theme Scripts -->
<script src="../../build/js/custom.min.js"></script>

</html>
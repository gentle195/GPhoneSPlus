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


<br>
<div style="border: 4px solid #9cc2cb;width: 90%;margin-left: 5%;height: 50cm">
    <P style="font-size: 50px;text-align: center">
        Hạng khách hàng từng xóa
    </P>


    <div>
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
                <a role="tab"  href="/dia-chi/hien-thi">
                    <h6>Thông tin địa chỉ</h6>
                </a>
            </li>
            <li class="nav-item">
                <a href="/dia-chi/dia-chi-tung-xoa"
                   class="nav-link active" id="description-tab"
<%--                   data-toggle="tab"  --%>
                   role="tab"
                   aria-controls="description" aria-selected="true" >
                    <h6>Địa chỉ tung xóa</h6>
                </a>
            </li>
        </ul>
    </div>
    <br><br>






    <div class="">
        <div class="clearfix"></div>
        <%--    <div class="col-md-12 col-sm-12 ">--%> <div class="">
        <div class="x_panel">
            <div class="x_title">
                <a href="/dia-chi/dia-chi-tungxoa/khoi-phuc-het" class="btn btn-danger" style="float: right" >Khôi phục hết</a>

                <form action="/dia-chi/tim-kiem-tung-xoa" method="post" style="margin-right: 15cm; float: right">

                    <input style="height: 1cm" type="text" name="matk" placeholder="Mã hoặc địa chỉ">

                    <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                </form>
                <h2>Thông tin Địa chỉ</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box table-responsive">
                            <table id="datatable-responsive"
                                   class="table table-striped table-bordered dt-responsive nowrap"
                                   cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Mã</th>
                                    <th>Địa chỉ</th>
                                    <th>Quận</th>
                                    <th>Huyện</th>
                                    <th>Thành phố</th>
                                    <th>Ngày tạo</th>
                                    <th>Ngày cập nhật</th>
                                    <th>Tình trạng</th>
                                    <th>Mô tả</th>
                                    <th>Khách hàng</th>

                                    <th>Chức năng</th>
                                </tr>
                                </thead>

                                <c:forEach items="${dulieu}" var="ht" varStatus="stt">
                                    <tr>
                                        <td>${stt.index+1}</td>
                                        <td>${ht.ma}</td>
                                        <td>${ht.diaChi} </td>
                                        <td>${ht.quan}</td>
                                        <td>${ht.huyen}</td>
                                        <td>${ht.thanhPho}</td>

                                        <td>${ht.ngayTao}</td>
                                        <td>${ht.ngayCapNhat}</td>


                                        <td style="color: red">${ht.tt()}</td>
                                        <td> ${ht.moTa} </td>
                                        <td> ${ht.khachHang.hoTen} </td>
                                        <td>
                                            <a href="/dia-chi/dia-chi-tungxoa/khoi-phuc/${ht.id}" class="btn btn-success" onclick="return tb()">Khôi phục</a>

                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>


    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center pagination-lg">
            <li class="page-item"><a class="page-link" href="/dia-chi/dia-chi-tung-xoa?num=0">First</a></li>

            <c:forEach begin="1" end="${total}" varStatus="status">
                <li class="page-item">
                    <a href="/dia-chi/dia-chi-tung-xoa?num=${status.index-1}"
                       class="page-link">${status.index}</a>
                </li>
            </c:forEach>

            <li class="page-item"><a class="page-link" href="/dia-chi/dia-chi-tung-xoa?num=${total-1}">Last</a></li>
        </ul>
    </nav>





    <P id="bc" style="color: crimson"></P>
</div>


<%--<script>--%>


<%--    function viewadd() {--%>
<%--        document.getElementById("idhkh").value='';--%>
<%--        document.getElementById("mahkh").value='';--%>
<%--        document.getElementById("tenhkh").value='';--%>
<%--        document.getElementById("diemtoithieuhkh").value='';--%>
<%--        document.getElementById("motahkh").value='';--%>
<%--        document.getElementById("formlink").action="/hang-khach-hang/add";--%>
<%--        document.getElementById("bthkh").innerHTML="Thêm hạng khách hàng";--%>
<%--    }--%>
<%--    function viewud(ma) {--%>

<%--        <c:forEach items="${service.getALL0()}" var="ht"  >--%>

<%--        if("${ht.ma}"===ma.trim()){--%>
<%--            document.getElementById("idhkh").value='${ht.id}';--%>
<%--            document.getElementById("mahkh").value='${ht.ma}';--%>
<%--            document.getElementById("tenhkh").value='${ht.ten}';--%>
<%--            document.getElementById("diemtoithieuhkh").value='${ht.diem_toi_thieu}';--%>
<%--            document.getElementById("motahkh").value='${ht.moTa}';--%>
<%--            document.getElementById("formlink").action="/hang-khach-hang/update";--%>
<%--            document.getElementById("bthkh").innerHTML="Update hạng khách hàng";--%>

<%--        }--%>

<%--        </c:forEach>--%>

<%--    }--%>
<%--</script>--%>
<%--<script>--%>
<%--    function checkhkh() {--%>
<%--        var tenhkh=document.getElementById("tenhkh").value;--%>
<%--        var diemtoithieuhkh=document.getElementById("diemtoithieuhkh").value;--%>
<%--        var motahkh=document.getElementById("motahkh").value;--%>

<%--        if(--%>
<%--            tenhkh.trim().length<6 || tenhkh==''--%>
<%--        ){--%>
<%--            document.getElementById("bthkh").type="button";--%>
<%--            document.getElementById("tenhkh1").innerHTML="Không để trống ,Tên ít nhất 6 ký tự";--%>
<%--            return  false;--%>
<%--        }else {--%>
<%--            document.getElementById("tenhkh1").innerHTML="";--%>
<%--            if(--%>

<%--                diemtoithieuhkh <= 0 || diemtoithieuhkh % 1 != 0--%>
<%--            ){--%>
<%--                document.getElementById("bthkh").type="button";--%>
<%--                document.getElementById("diemtoithieuhkh1").innerHTML="Phải là số nguyên dương ";--%>
<%--                return  false;--%>
<%--            }else {--%>
<%--                document.getElementById("diemtoithieuhkh1").innerHTML="";--%>
<%--                if(--%>
<%--                    motahkh.trim()===''--%>
<%--                ){--%>
<%--                    document.getElementById("bthkh").type="button";--%>
<%--                    document.getElementById("motahkh1").innerHTML="Không để trống ";--%>
<%--                    return  false;--%>
<%--                }else {--%>
<%--                    document.getElementById("bthkh").type="submit";--%>
<%--                    return true;--%>
<%--                }--%>
<%--            }--%>
<%--        }--%>



<%--    }--%>
<%--</script>--%>
<script>
    if ("${tong}" <= 0) {
        document.getElementById("bang").style.display = "none"
        document.getElementById("bc").innerText = "Hết để xóa rồi "
    } else {
        document.getElementById("bang").style.display = ""
        document.getElementById("bc").innerText = ""
    }

    function tb() {
        var dtt = document.getElementById("dtt").value;
        if (confirm("Bạn muốn dùng chức năng") == true) {


            return true;

        }
        return false;
    }

    function tbxd() {
        if (confirm("Bạn muốn dùng chức năng") == true) {
            return true;
        }
        return false;
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
        integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
        crossorigin="anonymous"></script>
</body>

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- Custom Theme Scripts -->
<script src="../../build/js/custom.min.js"></script>
</html>
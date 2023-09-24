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
<div style="border: 4px solid #9cc2cb;width: 90%;margin-left: 5%">
    <P style="font-size: 50px;text-align: center">
         Thông tin khách hàng
    </P>
    <a href="/khach-hang/hien-thi" class="btn btn-primary" style="float: right" >Quay về</a>
    <br>

    <form:form action="/khach-hang/update" method="post" modelAttribute="kh" enctype="multipart/form-data">

    <div >

        <div style="border: 5px solid whitesmoke;width: 150px;height: 150px;margin-left: 17.5cm"   >
            <img src="../../../uploads/${kh.anh}" width="100%" height="100%" style="border-radius:50% 50% 50% 50%;border: 2px solid #8c8c8c" id="anhcu">
        </div>

        <br>
        <div style="border: 1px solid white;text-align: center" >
            <label class="form-label">ẢNH</label><br>

        </div>




    </div>

    <div style="display: none">
        <form:input   path="anh" />
    </div>
  <div style="width: 70%;font-size: 20px;margin-left: 19%">
    <table class="table">
        <thead>
        <tr>
            <th >
                <div >
                    <form:label class="form-label" path="hoTen">Mã: ${kh.ma}</form:label>
                </div>
            </th>
            <th >
                <div >
                    <form:label class="form-label" path="hoTen">Họ tên:${kh.hoTen}</form:label>
                </div>
            </th>
        </tr>
        </thead>

        <thead>
        <tr>
            <th >
                <form:label class="form-label" path="gioiTinh">Giới Tính: ${kh.gioiTinh}</form:label>
            </th>
            <th >
                    <form:label class="form-label" path="email">Email: ${kh.email}</form:label>
            </th>
        </tr>
        </thead>


        <thead>
        <tr>
            <th >
                <form:label class="form-label" path="sdt">Sdt: ${kh.sdt}</form:label>
            </th>
            <th >
                <form:label class="form-label" path="ngaySinh">Ngày sinh: ${kh.ngaySinh}</form:label>
            </th>
        </tr>
        </thead>


        <thead>
        <tr>
            <th>
                    <form:label class="form-label" path="taiKhoan">Tài khoản: ${kh.taiKhoan}</form:label>
            </th>
            <th >
                <form:label class="form-label" path="matKhau">Mật khẩu: ${kh.matKhau}</form:label>
            </th>

        </tr>
        </thead>
        <thead>
        <tr>




            <th >
                <form:label class="form-label" path="diem">Điểm: ${kh.diem}</form:label>
            </th>
            <th>
                <form:label class="form-label" path="hangKhachHang">Hãng khách hàng: ${kh.hangKhachHang.ten}</form:label>
            </th>

        </tr>

        </thead>



        <P style="display: none">
            <form:input path="id"></form:input>
        </P>
        <th  style="display: none">
            <form:input path="ngayTao" type="date"></form:input>
        </th>


    </table>
  </div>
</div>

</form:form>


<br><br>

<div style="border: 4px solid #9cc2cb;width: 90%;margin-left: 5%">
    <P style="font-size: 50px;text-align: center">
        Lịch sử mua hàng
    </P>
    <br>
  <P style="color: red"> CHỌN VÀO HÓA ĐƠN ĐỂ XEM CHI TIẾT</P>
    <table id="datatable-responsive"
           class="table table-striped table-bordered dt-responsive nowrap"
           cellspacing="0" width="100%"  >
        <tr>
            <th>STT</th>
            <th>Tên khách hàng</th>
            <th>Tên hóa đơn</th>
            <th>Tên nhân viên</th>
            <th>Ngày nhận</th>
            <th>Tổng tiền</th>
            <th>Tổng sản phẩm</th>
            <th>Tình trạng</th>



        </tr>


        <c:forEach items="${lsmuahang}" var="ht" varStatus="stt">
            <tr  data-bs-toggle="modal" data-bs-target="#myModal">
                <td type="text" style="display: none" value="${ht.getmahd()}">${ht.getmahd()} </td>
                <td>${stt.index+1}</td>


                <td>${ht.gettenkh()}</td>
                <td>${ht.getmahd()} </td>
                    <%--                                        <c:if test="${nhanVien.gioiTinh == true}">Nam</c:if>--%>
                    <%--                                        <c:if test="${nhanVien.gioiTinh == false}">Nữ</c:if>--%>
                <td>${ht.gettennv()}</td>
                <td>${ht.getngaynhan()}</td>
                <td>${ht.gettongtien()}</td>
                <td>${ht.gettongsp()}</td>
                <td>${ht.gettinhtrang()}</td>



            </tr>
        </c:forEach>
    </table>


    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center pagination-lg">
            <li class="page-item"><a class="page-link" href="/khach-hang/view-detail/${kh.id}?num=0">First</a></li>

            <c:forEach begin="1" end="${total}" varStatus="status">
                <li class="page-item">
                    <a href="/khach-hang/view-detail/${kh.id}?num=${status.index-1}"
                       class="page-link">${status.index}</a>
                </li>
            </c:forEach>

            <li class="page-item"><a class="page-link" href="/khach-hang/view-detail/${kh.id}?num=${total-1}">Last</a></li>
        </ul>
    </nav>
</div>








<!-- The Modal -->
<div class="modal" id="myModal" >
    <div class="modal-dialog modal-xl ">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">MÃ HÓA ĐƠN :<label id="ganmhd" style="color: red"></label></h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <P>Danh sách sản phẩm mua</P>

                    <div id="click-response">Không có sản phẩm nào</div><br>

                <P>TỔNG TIỀN: <label id="tongtien"></label> VND</P>
                <P>TIỀN QUY ĐỔI: <label id="tienquydoi"></label> VND</P>
                <P>THÀNH TIỀN: <label id="thanhtien"></label> VND</P>







            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
            </div>

        </div>
    </div>
</div>




<script>



    function onRowClick(tableId, callback) {
        var table = document.getElementById(tableId),
            rows = table.getElementsByTagName("tr"),
            i;
        for (i = 0; i < rows.length; i++) {
            table.rows[i].onclick = function (row) {
                return function () {
                    callback(row);
                };
            }(table.rows[i]);
        }
    };

    onRowClick("datatable-responsive", function (row){
        var value1 = row.getElementsByTagName("td")[0].innerHTML;
         var gan='';
        var stt=1;

        var tongtien=0;
        var tienquydoi=0;
        var thanhtien=0;
        <c:forEach items="${tthdkh}" var="ht"  >

        if("${ht.getmahd()}"===value1.trim()){

             gan=gan+
                '<tr>'+
                '<td>'+stt+'</td>'+
                <%--' <td>'+'${ht.getmahd()}'+'</td>'+--%>
                '<td>'+'${ht.getsoimei()}'+'</td>'+
                ' <td>'+'${ht.gettensp()}'+'</td>'+
                '<td>'+'${ht.getthongtin()}'+'</td>'+
                '<td>'+'${ht.getsoluong()}'+'</td>'+
                ' <td>'+'${ht.getdongia()}'+'</td>'+
                ' <td>'+'${ht.gettienquydoi()}'+'</td>'+
                ' </tr>';
                   stt=stt+1;
                   tongtien=tongtien+${ht.getdongia()*ht.getsoluong()};
                   if("${ht.gettienquydoi()}".trim()=== ''){
                   }else {
                       tienquydoi=${ht.getsoluong()};
                   }



        }
        </c:forEach>
        thanhtien=tongtien-tienquydoi;
        document.getElementById("tongtien").innerHTML=tongtien;
        document.getElementById("tienquydoi").innerHTML=tienquydoi;
        document.getElementById("thanhtien").innerHTML=thanhtien;
        document.getElementById("ganmhd").innerHTML=value1;
        document.getElementById('click-response').innerHTML =''+
            '<table class="table table-striped table-bordered dt-responsive nowrap"' +
            'cellspacing="0" width="100%"  id="bang">' +
            ' <tr> ' +
            '<th>STT  </th>' +
            // ' <th>Mã hóa đơn</th>' +
            ' <th>imei</th>' +
            ' <th>Tên sản phẩm</th>' +
            ' <th>Thông tin sản phẩm</th>' +
            ' <th>Số lượng</th>' +
            ' <th>Đơn giá</th>' +
            ' <th>Tiền quy đổi</th>' +
            ' </tr>'+
             ''+
               gan

            + ' </table>';




    });

</script>
<script>

    function thongbao() {
        var ns=document.getElementById("ns").value;
        if(confirm("Bạn muốn dùng trức năng")==true){
            if(ns.trim()===''){
                document.getElementById("tb").innerHTML="Không để trống ngày sinh";
                document.getElementById("bt").type="button"
                return false;
            }else {
                document.getElementById("bt").type="submit";
                return true;
            }
        }else {
            return false;
        }


    }

    var checkbox = document.getElementsByName("checkanh");
    for (var i = 0; i < checkbox.length; i++){
        if (checkbox[i].checked === true){
            if (checkbox[i].value === 'cu'){
                document.getElementById('anhcu').style.display=""
                document.getElementById('anhmoi').style.display="none"
            }else {
                document.getElementById('anhcu').style.display="none"
                document.getElementById('anhmoi').style.display=""
            }}}



    document.body.addEventListener('change', function (e) {
        let target = e.target;

        switch (target.id) {
            case 'cucheck':
                document.getElementById('anhcu').style.display=""
                document.getElementById('anhmoi').style.display="none"
                break;
            case 'moicheck':
                document.getElementById('anhcu').style.display="none"
                document.getElementById('anhmoi').style.display=""
                break;

        }
    });
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

<!-- Custom Theme Scripts -->
<script src="../../build/js/custom.min.js"></script>
</html>
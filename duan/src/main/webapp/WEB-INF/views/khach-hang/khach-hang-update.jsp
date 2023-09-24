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
        Sửa thông tin khách hàng
    </P>
    <a href="/khach-hang/hien-thi" class="btn btn-primary" style="float: right" >Quay về</a>
    <br>

<form:form action="/khach-hang/update" method="post" modelAttribute="kh" enctype="multipart/form-data">
    <P style="display: none">
        <form:input path="id"></form:input>
    </P>
    <div >


            <div style="border: 5px solid whitesmoke;width: 150px;height: 150px;margin-left: 17.5cm"   >
                <input type="file"  name="images"  accept="image/jpeg, image/png" id="anhmoi" style="width:100%;height:100%;padding-top: 2cm">
                <img src="../../../uploads/${kh.anh}" width="100%" height="100%" style="border-radius:50% 50% 50% 50%;border: 2px solid #8c8c8c" id="anhcu">
            </div>

        <br>
            <div style="border: 1px solid white;text-align: center" >
                <label class="form-label">ẢNH</label><br>
                <input style="" type="radio"  name="checkanh" value="cu" id="cucheck" checked>Ảnh cũ
                <input style="margin-left: 1cm" type="radio"  name="checkanh" value="moi" id="moicheck" >Ảnh Mới
            </div>




    </div>

    <div style="display: none">
        <form:input   path="anh" />
    </div>



    <table class="table">

        <thead>
        <tr>
            <th >

                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="ma" readonly="true"/>
                    <form:label class="form-label" path="ma">Mã:</form:label>
                </div>

            </th>
            <th >
                            <div class="form-floating mb-3 mt-3">
                                <form:input class="form-control" placeholder="" path="hoTen"/>
                                <form:label class="form-label" path="hoTen">Họ tên:
                                    <form:errors path="hoTen" cssStyle="color: red"></form:errors>
                                </form:label>

                            </div>

            </th>

        </tr>
        </thead>

        <thead>
        <tr>
            <th >
                <div class="form-floating mb-3 mt-3">
                    <div class="form-control">
                        <form:radiobutton path="gioiTinh" value="true" />Nam
                        <form:radiobutton path="gioiTinh" value="false"  cssStyle="margin-left: 1cm"/> Nữ
                    </div>
                    <form:label class="form-label" path="gioiTinh">Giới Tính:</form:label>
                </div>
            </th>
            <th >
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="email"/>
                    <form:label class="form-label" path="email">Email:
                        <form:errors path="email" cssStyle="color: red"></form:errors>
                    </form:label>

                </div>

            </th>
        </tr>
        </thead>


        <thead>
        <tr>
            <th >

                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="sdt"/>
                    <form:label class="form-label" path="sdt">Sdt:
                        <form:errors path="sdt" cssStyle="color: red"></form:errors>
                    </form:label>

                </div>
            </th>
            <th >

                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="ngaySinh" type="date" id="ns"/>
                    <form:label class="form-label" path="ngaySinh">
                        Ngày sinh:
                        <div id="tb" style="color: crimson;float: right"></div>


                    </form:label>

                </div>
            </th>
        </tr>
        </thead>


        <thead>
        <tr>

            <th>
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="taiKhoan"  />
                    <form:label class="form-label" path="taiKhoan">Tài khoản:
                        <form:errors path="taiKhoan" cssStyle="color: red"></form:errors>
                    </form:label>

                </div>
            </th>


            <th >
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="matKhau"  />
                    <form:label class="form-label" path="matKhau">Mật khẩu:
                        <form:errors path="matKhau" cssStyle="color: red"></form:errors>
                    </form:label>

                </div>
            </th>

        </tr>
        </thead>
        <thead>
        <tr>




            <th >
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="diem"  type="number"  />
                    <form:label class="form-label" path="diem">Điểm:
                        <form:errors path="diem" cssStyle="color: red"></form:errors>
                    </form:label>

                </div>
            </th>
            <th>
                <div class="form-floating mb-3 mt-3"  style="float: right;width: 15%;height: 60px">
                <button type="button"
                       style="height: 100%"
                        class="btn btn-primary"
                        data-bs-toggle="modal"
                        data-bs-target="#myModal">
                    Thêm nhanh
                </button>
                </div>
                <div class="form-floating mb-3 mt-3" style="width: 80%">

                    <form:select  class="form-control"
                                  path="hangKhachHang"
                                  items="${hkh}"
                                  itemValue="id"
                                  itemLabel="ten"  ></form:select>
                    <form:label class="form-label" path="diem">Hãng khách hàng:
                        <form:errors path="hangKhachHang" cssStyle="color: red" />
                    </form:label>


                </div>
            </th>

        </tr>

        </thead>

        <thead>
        <tr>
            <th>
<%--                <div class="form-floating mb-3 mt-3">--%>
<%--                    <form:input class="form-control" placeholder="" path="diaChi"    />--%>
<%--                    <form:label class="form-label" path="diaChi">Địa chỉ:--%>
<%--                        <form:errors path="diaChi" cssStyle="color: red"></form:errors>--%>
<%--                    </form:label>--%>

<%--                </div>--%>

            </th>
            <th>
<%--                class="form-control"--%>


            </th>
        </tr>
        </thead>


        <th  style="display: none">
            <form:input path="ngayTao" type="date"></form:input>
        </th>

        <thead>
        <tr>
            <th>
<%--                <BUTTON type="submit" class="btn btn-success" style="margin-left: 5cm;float: right" >Load</BUTTON>--%>
            </th>
            <th>
                <BUTTON type="submit"  class="btn btn-warning"  style="" id="bt" onclick="return thongbao()">update</BUTTON>
            </th>
        </tr>
        </thead>
    </table>
    </div>

</form:form>

<%----%>


<!-- The Modal -->
<div class="modal" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Hãng khách hàng</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">

                <form:form action="/khach-hang/them-hang-khach-hang-update" method="post" modelAttribute="KHHangKhachHang" >
                          <input name="idkh" value="${kh.id}" type="text" style="display: none">
                    <table class="table">

                        <thead>
                        <tr>
                            <th >

                                <div class="form-floating mb-3 mt-3">
                                    <form:input id="tenhkh" class="form-control" placeholder="" path="ten" />
                                    <form:label class="form-label" path="ten">Tên hạng:<label id="tenhkh1" style="color: red"></label>
                                    </form:label>
                                </div>

                            </th>
                        </tr>
                        <tr>
                            <th >

                                <div class="form-floating mb-3 mt-3">
                                    <form:input id="diemtoithieuhkh" class="form-control" placeholder="" path="diem_toi_thieu" />
                                    <form:label class="form-label" path="diem_toi_thieu">Điểm tối thiểu:<label id="diemtoithieuhkh1" style="color: red"></label>
                                    </form:label>
                                </div>

                            </th>
                        </tr>
                        <tr>
                            <th >

                                <div class="form-floating mb-3 mt-3">
                                    <form:input id="motahkh" class="form-control" placeholder="" path="moTa" />
                                    <form:label class="form-label" path="moTa">Mô tả:<label id="motahkh1" style="color: red"></label>
                                    </form:label>
                                </div>

                            </th>
                        </tr>
                        </thead>
                    </table>



            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="submit" class="btn btn-warning" id="bthkh" onclick="return checkhkh()" >Thêm hãng khách hàng</button>
            </div>
            </form:form>
        </div>
    </div>
</div>


</body>
<script>


    function checkhkh() {
        var tenhkh=document.getElementById("tenhkh").value;
        var diemtoithieuhkh=document.getElementById("diemtoithieuhkh").value;
        var motahkh=document.getElementById("motahkh").value;

        if(
           tenhkh.trim().length<6 || tenhkh==''
        ){
            document.getElementById("bthkh").type="button";
            document.getElementById("tenhkh1").innerHTML="Không để trống ,Tên ít nhất 6 ký tự";
           return  false;
        }else {
            document.getElementById("tenhkh1").innerHTML="";
           if(

               diemtoithieuhkh <= 0 || diemtoithieuhkh % 1 != 0
           ){
               document.getElementById("bthkh").type="button";
               document.getElementById("diemtoithieuhkh1").innerHTML="Phải là số nguyên dương ";
               return  false;
           }else {
               document.getElementById("diemtoithieuhkh1").innerHTML="";
               if(
                   motahkh.trim()===''
               ){
                   document.getElementById("bthkh").type="button";
                   document.getElementById("motahkh1").innerHTML="Không để trống ";
                   return  false;
               }else {
                   document.getElementById("bthkh").type="submit";
                   return true;
               }
           }
        }



    }
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
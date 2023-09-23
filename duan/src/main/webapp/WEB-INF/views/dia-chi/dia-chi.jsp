<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Camera</title>
    <link rel="icon" href="../../images/favicon.ico" type="image/ico"/>
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
<div style="border: 4px solid #9cc2cb;width: 90%;margin-left: 5%">
    <P style="font-size: 50px;text-align: center">
        Địa chỉ
    </P>


    <div>
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active"
                   id="description-tab"
<%--                   data-toggle="tab"--%>
                   href="/dia-chi/hien-thi" role="tab"
                   aria-controls="description" aria-selected="true">
                    <h6>Thông tin dịa chỉ</h6>
                </a>
            </li>
            <li class="nav-item">
                <a href="/dia-chi/dia-chi-tung-xoa" role="tab" >
                    <h6>Địa chỉ từng xóa</h6>
                </a>
            </li>
        </ul>
    </div>
    <br><br>





    <form:form action="/dia-chi/add" method="post" modelAttribute="dc" id="formlink">

        <div style="border: 2px solid #9cc2cb; padding: 10px; position: relative;float: right;width: 10%;margin-right: 5%;height: 10cm">
            <div style="background-color: #fff; position: absolute; top: -20px; left: 10px; padding: 5px;">
                CHỨC NĂNG
            </div>
            <button type="submit" class="btn btn-warning" id="bthkh"  style="width: 90%;height:1cm;margin-left: 5%;margin-top: 2cm"  >ADD</button>
        </div>


        <div style="border: 2px solid #9cc2cb; padding: 10px; position: relative;width: 75%;margin-left: 5%;height: 10cm">
            <P style="background-color: #fff; position: absolute; top: -20px; left: 10px; padding: 5px;">
                Thông tin  địa chỉ
            </P>
            <div >
                <table class="table" style="height: 100%">


                    <tr>
                        <th >

                            <div class="form-floating mb-3 mt-3">
                                <form:input id="tenhkh" class="form-control" placeholder="" path="diaChi" value=""/>
                                <form:label class="form-label" path="diaChi">Địa chỉ: <form:errors path="diaChi" cssStyle="color: red"></form:errors>
                                </form:label>
                            </div>

                        </th>

                        <th   >

                            <div class="form-floating mb-3 mt-3">
                                <form:input id="diemtoithieuhkh" class="form-control" placeholder=""  path="quan" />
                                <form:label class="form-label" path="quan">Quận:
                                    <form:errors path="quan" cssStyle="color: red"></form:errors>
                                </form:label>
                            </div>

                        </th>
                    </tr>
                    <tr>
                        <th >

                            <div class="form-floating mb-3 mt-3">
                                <form:input id="tenhkh" class="form-control" placeholder="" path="huyen" value=""/>
                                <form:label class="form-label" path="huyen">Huyện: <form:errors path="huyen" cssStyle="color: red"></form:errors>
                                </form:label>
                            </div>

                        </th>

                        <th   >

                            <div class="form-floating mb-3 mt-3">
                                <form:input id="diemtoithieuhkh" class="form-control" placeholder=""  path="thanhPho" />
                                <form:label class="form-label" path="thanhPho">Thành phố:
                                    <form:errors path="thanhPho" cssStyle="color: red"></form:errors>
                                </form:label>
                            </div>

                        </th>
                    </tr>
                    <tr>
<%--                        colspan="2"--%>
                        <th  >


                            <div class="form-floating mb-3 mt-3">
                                <form:textarea id="motahkh" class="form-control" placeholder="" path="moTa" />
                                <form:label class="form-label" path="moTa">Mô tả:
                                    <form:errors path="moTa" cssStyle="color: red"></form:errors>
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
                          path="khachHang"
                          items="${kh}"
                          itemValue="id"
                          itemLabel="KHMT"  ></form:select>
            <form:label class="form-label" path="khachHang">Khách hàng:
                <form:errors path="khachHang" cssStyle="color: red" />
            </form:label>


        </div>
    </th>
                    </tr>




                </table>

            </div>






        </div>


    </form:form><br>





    <br>
    <div class="">
        <div class="clearfix"></div>
        <%--    <div class="col-md-12 col-sm-12 ">--%> <div class="">
        <div class="x_panel">
            <div class="x_title">
                <div align="center" style="float: right;margin-right: 20cm">
                    <form action="/dia-chi/tim-kiem" method="post" style="margin-left: 1cm;">

                        <input style="height: 1cm" type="text" name="matk" placeholder="Mã hoặc địa chỉ">

                        <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                    </form>

                </div>
                <h2>Danh sách Địa chỉ</h2>
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


                                        <td style="color: #00A000">${ht.tt()}</td>
                                        <td> ${ht.moTa} </td>
                                        <td> ${ht.khachHang.hoTen} </td>
                                        <td>
                                            <a href="/dia-chi/remove/${ht.id}" class="btn btn-success" onclick="return tb()">Xóa</a>



                                            <a href="/dia-chi/view-update/${ht.id}"  class="btn btn-success">Xem và Cập nhật</a>
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
            <li class="page-item"><a class="page-link" href="/dia-chi/hien-thi?num=0">First</a></li>

            <c:forEach begin="1" end="${total}" varStatus="status">
                <li class="page-item">
                    <a href="/dia-chi/hien-thi?num=${status.index-1}"
                       class="page-link">${status.index}</a>
                </li>
            </c:forEach>

            <li class="page-item"><a class="page-link" href="/dia-chi/hien-thi?num=${total-1}">Last</a></li>
        </ul>
    </nav>




    <P id="bc" style="color: crimson"></P>

</div>






<div class="modal" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Thêm nhanh khách hàng</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">

                <form:form action="/dia-chi/add-khach-hang" method="post" modelAttribute="khmodal" >

                <table class="table">

                    <thead>
                    <tr>
                        <th >

                            <div class="form-floating mb-3 mt-3">
                                <form:input id="tenkh" class="form-control" placeholder="" path="hoTen" />
                                <form:label class="form-label" path="hoTen">Tên khách hàng:<label id="tenkh1" style="color: red"></label>
                                </form:label>
                            </div>

                        </th>
                    </tr>
                    <tr>
                        <th >

                            <div class="form-floating mb-3 mt-3">
                                <div class="form-control">
                                    <form:radiobutton path="gioiTinh" value="true"  checked="checked" />Nam
                                    <form:radiobutton path="gioiTinh" value="false"  cssStyle="margin-left: 1cm"/> Nữ
                                </div>
                                <form:label class="form-label" path="gioiTinh">Giới Tính:</form:label>
                            </div>

                        </th>
                    </tr>
                    <tr>
                        <th >

                            <div class="form-floating mb-3 mt-3">
                                <form:input id="sdtkh" class="form-control" placeholder="" path="sdt" type="number" />
                                <form:label class="form-label" path="sdt">Số điện thoại:<label id="sdtkh1" style="color: red"></label>
                                </form:label>
                            </div>

                        </th>
                    </tr>
                    </thead>
                </table>



            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="submit" class="btn btn-warning" id="btkh" onclick="return checkhkh()" >Thêm  khách hàng</button>
            </div>
            </form:form>
        </div>
    </div>
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
<script>
    function checkhkh() {
        var tenhkh=document.getElementById("tenkh").value;

        var sdtkh=document.getElementById("sdtkh").value;

        if(
            tenhkh.trim().length<6 || tenhkh==''
        ){
            document.getElementById("btkh").type="button";
            document.getElementById("tenkh1").innerHTML="Không để trống ,Tên ít nhất 6 ký tự";
            return  false;
        }else {
            document.getElementById("tenkh1").innerHTML="";
            var regex = /^0\d{9}$/;

            if( regex.test(sdtkh)){
                document.getElementById("sdtkh1").innerHTML="";

                document.getElementById("btkh").type="submit";
                return true;
            }else {

                document.getElementById("bthkh").type="button";
                document.getElementById("sdtkh1").innerHTML="SDT phảo 10 số và bắt đầu là số 0";
                return  false;
            }
        }



    }
</script>
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


</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
</html>
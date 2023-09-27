<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Skydash Admin</title>
    <link rel="stylesheet" href="../../vendors/feather/feather.css">
    <link rel="stylesheet" href="../../vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" href="../../vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="../../css/vertical-layout-light/style.css">
    <link rel="shortcut icon" href="../../images/favicon.png"/>
</head>
<body>
<P style="font-size: 50px;text-align: center">
    Khách hàng
</P>
<br>



<div>
    <ul class="nav nav-tabs border-top"
        id="setting-panel" role="tablist">
        <li class="nav-item">
            <a class="nav-link active"
               id="description-tab"
            <%--                   data-toggle="tab"--%>
               href="/khach-hang/hien-thi" role="tab"
               aria-controls="description"
               aria-selected="true">
                Thông tin khách hàng
            </a>
        </li>
        <li class="nav-item">
            <a href="/khach-hang/view-add"
               role="tab"
               class="nav-link" >
                Thêm khách hàng
            </a>
        </li>
        <li class="nav-item">
            <a href="/khach-hang/khach-hang-tung-xoa"
               role="tab"
               class="nav-link" >
                Khách hàng từng xóa
            </a>
        </li>
    </ul>
</div>




<div class="tab-content" id="myTabContent">
    <div class="tab-pane fade show active" id="description" role="tabpanel"
         aria-labelledby="description-tab">

        <div class="card">
            <div class="card-body">




<form action="/khach-hang/tim-kiem" method="post" style="margin-left: 1cm;">
    <div class="input-group" style="width: 30%; float: right">
        <input style="height: 1cm" type="text" class="form-control" name="matk" placeholder="Mã hoặc tên">
        <div class="input-group-append">
            <button type="submit" class="btn btn-sm btn-primary" onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">Tìm kiếm</button>
        </div>
    </div>
</form>
<br>
<br>
        <div class="col-sm-12">
            <div class="card-box table-responsive">

        <table class="table table-striped">
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


<br>




        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center pagination-lg">
                <li class="page-item"><a class="page-link" href="/khach-hang/hien-thi?num=0"> <</a></li>

                <c:forEach begin="1" end="${total}" varStatus="status">
                    <li class="page-item">
                        <a href="/khach-hang/hien-thi?num=${status.index-1}"
                           class="page-link">${status.index}</a>
                    </li>
                </c:forEach>

                <li class="page-item"><a class="page-link" href="/khach-hang/hien-thi?num=${total-1}"> ></a></li>
            </ul>
        </nav>


<P id="bc" style="color: crimson"></P>

            </div>
        </div>
    </div>
</div>


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
<script src="../../vendors/js/vendor.bundle.base.js"></script>
<script src="../../js/off-canvas.js"></script>
<script src="../../js/hoverable-collapse.js"></script>
<script src="../../js/template.js"></script>
<script src="../../js/settings.js"></script>
<script src="../../js/todolist.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
</html>
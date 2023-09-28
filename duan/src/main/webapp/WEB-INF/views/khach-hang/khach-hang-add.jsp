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
    Thêm khách hàng
</P>

<br>

<div>
    <ul class="nav nav-tabs border-top"
        id="setting-panel" role="tablist">
        <li class="nav-item">
            <a href="/khach-hang/hien-thi"
               role="tab"
               class="nav-link">
                Thông tin khách hàng
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link active"
               id="description-tab"
            <%--                   data-toggle="tab"--%>
               href="/khach-hang/view-add"
               role="tab"
               aria-controls="description"
               aria-selected="true">
                Thêm khách hàng

            </a>

        </li>
        <li class="nav-item">
            <a href="/khach-hang/khach-hang-tung-xoa"
               role="tab"
               class="nav-link">
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
                <form:form action="/khach-hang/add" method="post" modelAttribute="kh" enctype="multipart/form-data">
                    <div align="center">
                        <br>
                        <label style="border: 5px solid white;width: 150px;height: 150px;border-radius:50% 50% 50% 50%;"
                               for="anhmoi">
                            <img id="preview-image-2" class="preview-image" src="" alt=""
                                 width="100%" height="100%"
                                 style="border-radius:50% 50% 50% 50%;border: 2px solid #8c8c8c">
                            <br><br>
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
                    <table class="table">
                        <thead>
                        <tr>
                            <th colspan="2">
                                <form:label class="form-label" path="hoTen">Họ tên:
                                    <form:errors path="hoTen" cssStyle="color: red"></form:errors>
                                </form:label>
                                <form:input class="form-control" placeholder="" path="hoTen"/>
                            </th>
                        </tr>
                        </thead>
                        <thead>
                        <tr>
                            <th>
                                <form:label class="form-label" path="gioiTinh">Giới Tính:</form:label>
                                <div class="form-control">
                                    <form:radiobutton path="gioiTinh" value="true"/>Nam
                                    <form:radiobutton path="gioiTinh" value="false" cssStyle="margin-left: 1cm"/> Nữ
                                </div>
                            </th>
                            <th>
                                <form:label class="form-label" path="email">Email:
                                    <form:errors path="email" cssStyle="color: red"></form:errors>
                                </form:label>
                                <form:input class="form-control" placeholder="" path="email"/>
                            </th>
                        </tr>
                        </thead>
                        <thead>
                        <tr>
                            <th>
                                <form:label class="form-label" path="sdt">Sdt:
                                    <form:errors path="sdt" cssStyle="color: red"></form:errors>
                                </form:label>
                                <form:input class="form-control" placeholder="" path="sdt"/>
                            </th>
                            <th>
                                <form:label class="form-label" path="ngaySinh">
                                    Ngày sinh:
                                    <div id="tb" style="color: crimson;float: right"></div>
                                </form:label>
                                <form:input class="form-control" placeholder="" path="ngaySinh" type="date" id="ns"/>
                            </th>
                        </tr>
                        </thead>
                        <thead>
                        <tr>
                            <th>
                                <form:label class="form-label" path="taiKhoan">Tài khoản:
                                    <form:errors path="taiKhoan" cssStyle="color: red"></form:errors>
                                </form:label>
                                <form:input class="form-control" placeholder="" path="taiKhoan"/>
                            </th>
                            <th>
                                <form:label class="form-label" path="matKhau">Mật khẩu:
                                    <form:errors path="matKhau" cssStyle="color: red"></form:errors>
                                </form:label>
                                <form:input class="form-control" placeholder="" path="matKhau"/>
                            </th>
                        </tr>
                        </thead>
                        <thead>
                        <tr>
                            <th>
                                <form:label class="form-label" path="diem">Điểm:
                                    <form:errors path="diem" cssStyle="color: red"></form:errors>
                                </form:label>
                                <form:input class="form-control" placeholder="" path="diem" type="number"/>
                            </th>
                            <th>

                                <div style="float: right;width: 15%;height: 50px;margin-right: 40px;margin-top: 23px">
                                    <button type="button"
                                            style="height: 100%"
                                            class="btn btn-primary"
                                            data-bs-toggle="modal"
                                            data-bs-target="#myModal">
                                        Thêm nhanh
                                    </button>
                                </div>
                                <div style="width: 75%;height: 60px;margin-bottom: 15px">
                                    <form:label class="form-label" path="hangKhachHang">Hãng khách hàng:
                                        <form:errors path="hangKhachHang" cssStyle="color: red"/>
                                    </form:label>
                                    <form:select class="form-control"
                                                 path="hangKhachHang"
                                                 items="${hkh}"
                                                 itemValue="id"
                                                 itemLabel="ten"></form:select>

                                </div>
                            </th>
                        </tr>
                        </thead>
                        <P style="display: none">
                            <form:input path="id"></form:input>
                        </P>
                    </table>
                    <div align="center">
                        <BUTTON type="submit" class="btn btn-warning" style="" id="bt" onclick="return thongbao()">add
                        </BUTTON>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Hãng khách hàng</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal">X</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">

                <form:form action="/khach-hang/them-hang-khach-hang-add" method="post" modelAttribute="KHHangKhachHang">

                <table class="table">

                    <thead>
                    <tr>
                        <th>

                            <div class="form-floating mb-3 mt-3">
                                <form:label class="form-label"
                                            path="ten">Tên hạng:<label id="tenhkh1" style="color: red"></label>
                                </form:label>
                                <form:input id="tenhkh" class="form-control" placeholder="" path="ten"/>

                            </div>

                        </th>
                    </tr>
                    <tr>
                        <th>

                            <div class="form-floating mb-3 mt-3">
                                <form:label class="form-label"
                                            path="diem_toi_thieu">Điểm tối thiểu:<label id="diemtoithieuhkh1" style="color: red"></label>
                                </form:label>
                                <form:input id="diemtoithieuhkh" class="form-control" placeholder=""
                                            path="diem_toi_thieu"/>

                            </div>

                        </th>
                    </tr>
                    <tr>
                        <th>

                            <div class="form-floating mb-3 mt-3">
                                <form:label class="form-label"
                                            path="moTa">Mô tả:<label id="motahkh1" style="color: red"></label>
                                </form:label>
                                <form:input id="motahkh" class="form-control" placeholder="" path="moTa"/>

                            </div>

                        </th>
                    </tr>
                    </thead>
                </table>


            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="submit" class="btn btn-warning" id="bthkh" onclick="return checkhkh()">Thêm hãng khách
                    hàng
                </button>
            </div>
            </form:form>
        </div>
    </div>
</div>


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
    });
</script>

<script>


    function checkhkh() {
        var tenhkh = document.getElementById("tenhkh").value;
        var diemtoithieuhkh = document.getElementById("diemtoithieuhkh").value;
        var motahkh = document.getElementById("motahkh").value;

        if (
            tenhkh.trim().length < 6 || tenhkh == ''
        ) {
            document.getElementById("bthkh").type = "button";
            document.getElementById("tenhkh1").innerHTML = "Không để trống ,Tên ít nhất 6 ký tự";
            return false;
        } else {
            document.getElementById("tenhkh1").innerHTML = "";
            if (

                diemtoithieuhkh <= 0 || diemtoithieuhkh % 1 != 0
            ) {
                document.getElementById("bthkh").type = "button";
                document.getElementById("diemtoithieuhkh1").innerHTML = "Phải là số nguyên dương ";
                return false;
            } else {
                document.getElementById("diemtoithieuhkh1").innerHTML = "";
                if (
                    motahkh.trim() === ''
                ) {
                    document.getElementById("bthkh").type = "button";
                    document.getElementById("motahkh1").innerHTML = "Không để trống ";
                    return false;
                } else {
                    document.getElementById("bthkh").type = "submit";
                    return true;
                }
            }
        }


    }
</script>
<script>

    function thongbao() {
        var ns = document.getElementById("ns").value;
        if (confirm("Bạn muốn dùng trức năng") == true) {
            if (ns.trim() === '') {
                document.getElementById("tb").innerHTML = "Không để trống ngày sinh";
                document.getElementById("bt").type = "button"
                return false;
            } else {
                document.getElementById("bt").type = "submit";
                return true;
            }
        } else {
            return false;
        }


    }

    // var checkbox = document.getElementsByName("checkanh");
    // for (var i = 0; i < checkbox.length; i++){
    //     if (checkbox[i].checked === true){
    //         if (checkbox[i].value === 'cu'){
    //             document.getElementById('anhcu').style.display=""
    //             document.getElementById('anhmoi').style.display="none"
    //         }else {
    //             document.getElementById('anhcu').style.display="none"
    //             document.getElementById('anhmoi').style.display=""
    //         }}}
    //


    // document.body.addEventListener('change', function (e) {
    //     let target = e.target;
    //
    //     switch (target.id) {
    //         case 'cucheck':
    //             document.getElementById('anhcu').style.display=""
    //             document.getElementById('anhmoi').style.display="none"
    //             break;
    //         case 'moicheck':
    //             document.getElementById('anhcu').style.display="none"
    //             document.getElementById('anhmoi').style.display=""
    //             break;
    //
    //     }
    // });
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
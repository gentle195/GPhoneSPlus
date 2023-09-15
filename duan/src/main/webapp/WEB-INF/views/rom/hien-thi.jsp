<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Rom</title>
    <%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"--%>
    <%--          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">--%>
    <!-- Bootstrap -->
    <link rel="icon" href="/images/favicon.ico" type="image/ico"/>

    <title>Gentelella Alela!</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet"/>
    <link rel="icon" href="/images/favicon.ico" type="image/ico"/>
    <!-- Bootstrap -->
    <link href="/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="/vendors/iCheck/skins/flat/green.css" rel="stylesheet">

    <!-- bootstrap-progressbar -->
    <link href="/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="/build/css/custom.min.css" rel="stylesheet">
</head>
<body>
<form:form  action="/rom/update/${dulieuxem.id}" method="post" modelAttribute="dulieuxem" class="needs-validation">
    <div class="row">
        <div class="col-md-4 mb-3">
            <form:label path="dungLuong"><b>Dung lượng:</b></form:label>
            <form:input type="text" class="form-control" id="dungLuong" path="dungLuong" required="true" />
            <div class="invalid-feedback">
                Vui lòng nhập dung lượng.
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <form:label path="tinhTrang"><b>Tình Trạng:</b></form:label>
            <div class="form-check">
                <form:radiobutton path="tinhTrang" id="thegemoi" value="0" />
                <label class="form-check-label" for="thegemoi">Thế hệ mới</label>
            </div>
            <div class="form-check">
                <form:radiobutton path="tinhTrang" id="thegemocu" value="1" />
                <label class="form-check-label" for="thegemocu">Thế hệ cũ</label>
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <form:label path="moTa"><b>Mô Tả:</b></form:label>
            <form:textarea class="form-control" id="moTa" path="moTa" rows="3"></form:textarea>
        </div>

    </div>
    <button type="submit" class="btn btn-primary" onclick="return confirm('Bạn có muốn thực hiện thao tác này không?')">Update</button>
</form:form>

<div class="col-1">
    <a type="button" data-bs-toggle="modal" data-bs-target="#exampleModalRom">
        <img src="../img/plus.png">
    </a>
</div>

<div class="">
    <div class="clearfix"></div>
    <div class="col-md-12 col-sm-12 ">
        <div class="x_panel">
            <div class="x_title">
                <h2>Responsive example<small>Users</small></h2>
                <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                           aria-expanded="false"><i
                                class="fa fa-wrench"></i></a>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="#">Settings 1</a>
                            <a class="dropdown-item" href="#">Settings 2</a>
                        </div>
                    </li>
                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                    </li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box table-responsive">
                            <p class="text-muted font-13 m-b-30">
                                Responsive is an extension for DataTables that resolves that problem by optimising the
                                table's layout for different screen sizes through the dynamic insertion and removal of
                                columns from the table.
                            </p>
                            <table id="datatable-responsive"
                                   class="table table-striped table-bordered dt-responsive nowrap"
                                   cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Mã</th>
                                    <th>Dung lượng</th>
                                    <th>Ngày tạo</th>
                                    <th>Ngày cập nhật</th>
                                    <th>Tình trạng</th>
                                    <th>Mô tả </th>
                                    <th colspan="2">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${hsp}" var="chip" varStatus="i">
                                    <tr>
                                        <td>${i.index+1}</td>
                                        <td>${chip.ma}</td>
                                        <td>${chip.dungLuong}</td>
                                        <td>${chip.ngayTao}</td>
                                        <td>${chip.ngayCapNhat}</td>
                                        <td>${chip.tinhTrang}</td>
                                        <td>${chip.moTa}</td>
                                        <td>
                                                <%--                                            <a href="/detail-chip/${chip.id}" class="btn btn-outline-primary"--%>
                                                <%--                                               tabindex="-1"--%>
                                                <%--                                               role="button"--%>
                                                <%--                                               onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">Detail</a>--%>
                                            <a href="/rom/delete/${chip.id}" class="btn btn-outline-primary"
                                               tabindex="-1"
                                               role="button"
                                               onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">Delete</a>
                                            <a href="/rom/detail/${chip.id}" class="btn btn-outline-primary"
                                               tabindex="-1"
                                               role="button">Update</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--hết--%>


        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center pagination-lg">
                <li class="page-item"><a class="page-link" href="/rom/hien-thi?num=0">First</a></li>

                <c:forEach begin="1" end="${total}" varStatus="status">
                    <li class="page-item">
                        <a href="${pageContext.request.contextPath}/rom/hien-thi?num=${status.index -1}"
                           class="page-link">${status.index}</a>
                    </li>
                </c:forEach>

                <li class="page-item"><a class="page-link" href="/rom/hien-thi?num=${total-1}">Last</a></li>
            </ul>
        </nav>

        <div class="modal fade" id="exampleModalRom" tabindex="-1" aria-labelledby="exampleModalLabelRom"
             aria-hidden="true" data-backdrop="static">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabelRom">Rom</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div>
                            <table class="table">
                                <form:form action="/rom/add" method="post" modelAttribute="dulieuxem">
                                    <div class="row">
                                        <div class="col">
                                            <form:label path="dungLuong"><b>Dung Lượng:</b></form:label>
                                            <form:input path="dungLuong" class="form-control"/>
                                            <form:errors path="dungLuong"/>
                                        </div>
                                        <div class="col">
                                            <form:label path="tinhTrang"><b>Tình Trạng:</b></form:label>
                                            <br>
                                            <form:radiobutton path="tinhTrang" label="Còn dùng"
                                                              value="0"/>
                                            <form:radiobutton path="tinhTrang" label="Không còn dùng"
                                                              value="1"/>
                                        </div>
                                        <div class="col">
                                            <form:label path="moTa"><b>Mô Tả:</b></form:label>
                                            <form:textarea path="moTa" class="form-control"></form:textarea>
                                            <form:errors path="moTa"/>
                                        </div>
                                        <div style="margin-top: 20px;margin-bottom: 20px">
                                            <button type="submit" class="btn btn-primary"
                                                    onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                                ADD
                                            </button>
                                        </div>
                                    </div>
                                </form:form>
                            </table>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

</body>
<script>
    function myFunction1() {
        let text = "Bạn chắc chắn muốn thêm";
        let kt = confirm(text);
        if (kt == true) {
            return true
        } else {
            return false;
        }
    }

    function myFunction2() {
        let text = "Bạn chắc chắn muốn sửa";
        let kt = confirm(text);
        if (kt == true) {
            return true
        } else {
            return false;
        }
    }

    function myFunction3() {
        let text = "Bạn chắc chắn muốn xóa";
        let kt = confirm(text);
        if (kt == true) {
            confirm("Xóa thành công");
            return true
        } else {
            return false;
        }
    }


</script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        $('div[id^="nhapImei_"]').on('show.bs.modal', async function (e) {
            const ctspId = e.currentTarget.id.split("_")[1];
            const url = "http://localhost:8080/ban-hang/them-san-pham/" + ctspId;
            console.log(ctspId, url);
            try {
                const resp = await fetch(url);
                const data = await resp.json();
                console.log(data)
                let html = '';
                for (let i = 0; i < data.length; i++) {
                    const imei = data[i];
                    const tr = `
            <tr>
                <td>` + (i + 1) + `</td>
                <td>` + imei.soImei + `</td>
                <td>` + (imei.tinhTrang == 0 ? "Chưa bán" : "Đã bán") + `</td>
                <td><a href="/ban-hang/them-imei/` + imei.id + `">Thêm IMEI</a></td>
            </tr>
            `;
                    html += tr;
                }

                $("#listImei_" + ctspId).html(html);
            } catch (err) {
                console.error(err)
            }
        });
    });
</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var inputElements = document.querySelectorAll(".form-control");
        var submitButton = document.getElementById("submitButton");

        for (var i = 0; i < inputElements.length; i++) {
            inputElements[i].addEventListener("input", function () {
                var allInputsValid = true;
                for (var j = 0; j < inputElements.length; j++) {
                    if (inputElements[j].value.trim() === "") {
                        allInputsValid = false;
                        break;
                    }
                }
                submitButton.disabled = !allInputsValid;
            });
        }
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<%--<script src="https://code.jquery.com/jquery-3.7.0.min.js"--%>
<%--        integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

<script>
    $(document).ready(function () {
        $('#selectSanPham').select2();
    });
    $(document).ready(function () {
        $('#selectRam').select2();
    });
    $(document).ready(function () {
        $('#selectRom').select2();
    });
    $(document).ready(function () {
        $('#selectPin').select2();
    });
    $(document).ready(function () {
        $('#selectMauSac').select2();
    });
    $(document).ready(function () {
        $('#selectChip').select2();
    });
</script>
</html>
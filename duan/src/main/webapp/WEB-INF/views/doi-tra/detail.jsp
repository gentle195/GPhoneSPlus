<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Focus - Bootstrap Admin Dashboard </title>
    <link rel="stylesheet" href="../../../vendor/toastr/css/toastr.min.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css"/>
    <style>
        .stepwizard-step p {
            margin-top: 10px;

        }

        .stepwizard-row {
            display: table-row;

        }

        .stepwizard {
            display: table;
            width: 100%;
            position: relative;

        }

        .stepwizard-step button[disabled] {
            opacity: 1 !important;
            filter: alpha(opacity=100) !important;
        }

        .stepwizard-row:before {
            top: 14px;
            bottom: 0;
            position: absolute;
            content: " ";
            width: 100%;
            height: 7px;
            background-color: red;
            z-order: 0;


        }

        .stepwizard-step-linear a:active .btn-circle {
            background-color: red;
        }

        .stepwizard-step {
            display: table-cell;
            text-align: center;
            position: relative;
        }

        .btn-circle {
            width: 30px;
            height: 30px;
            text-align: center;
            padding: 6px 0;
            font-size: 12px;
            line-height: 1.428571429;
            border-radius: 15px;
            background-color: #999999;
        }

        .stepwizard-step-linear {

            font-size: 20px;
            color: black;
        }

        .custom-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .custom-table th, .custom-table td {
            border: 1px solid #ddd;
            padding: 12px; /* Tăng kích thước padding */
            text-align: center; /* Căn giữa nội dung */
        }

        .custom-table th {
            background-color: #f2f2f2; /* Màu nền cho tiêu đề cột */
        }

        .custom-table td img {
            max-width: 60px; /* Giảm kích thước ảnh */
            max-height: 60px;
        }

        .custom-table button {
            padding: 8px 12px; /* Điều chỉnh kích thước của nút */
            background-color: #4CAF50; /* Màu nền */
            color: white; /* Màu chữ */
            border: none;
            border-radius: 4px; /* Góc bo tròn */
            cursor: pointer;
        }

        .custom-table button:hover {
            background-color: #45a049; /* Màu nền khi di chuột qua */
        }

    </style>
</head>
<body>

<div>

    <ul class="nav nav-tabs border-top" id="setting-panel" role="tablist">
        <li class="nav-item">
            <a href="/doi-tra/hien-thi" class="nav-link"
               tabindex="-1"
               role="button">
                Trang Hóa đơn</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab"
               aria-controls="description" aria-selected="true">Xem hóa đơn</a>
        </li>
    </ul>
</div>
<div class="tab-content" id="myTabContent">
    <div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab">
        <div class="col-12 grid-margin">
            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                    <div>
                        <div class="card-body">
                            <br>
                            <h3 style="text-align: center;">Hóa đơn chi tiết</h3>
                            <br>

                            <div class="table-responsive custom-table">
                                <table class="display custom-table" style="color: black">
                                    <thead>
                                    <tr>
                                        <th>Tên Sản Phẩm</th>
                                        <th>Ảnh</th>
                                        <th>Hãng</th>
                                        <th>Số IMEI</th>
                                        <th>Giá Bán</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody id="table-search">
                                    <!-- Dữ liệu của bảng 1 -->
                                    <c:forEach items="${hdctne}" var="hdct">
                                        <tr>
                                            <td>${hdct.imei.chiTietSanPham.sanPham.ten}</td>
                                            <td align="center">
                                                <img src="/uploads/${hdct.imei.chiTietSanPham.urlAnh}" width="40"
                                                     height="40">
                                            </td>
                                            <td>${hdct.imei.chiTietSanPham.sanPham.hangSanPham.ten}</td>
                                            <td>${hdct.imei.soImei}</td>
                                            <td>${hdct.donGia}</td>
                                            <td>
                                                <button class='btn btn-primary chonSanPhamButton'
                                                        data-idhdct="${hdct.id}">Chọn sản phẩm
                                                </button>
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
        </div>
        <c:if test="${dtct.size()!=0}">
            <div class="col-12 grid-margin">
                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <div>
                            <div class="card-body">
                                <h3 style="text-align: center;">Sản phẩm cần đổi mới</h3>
                                <br>
                                <div class="table-responsive custom-table">
                                    <table class="display custom-table" style="color: black">
                                        <thead>
                                        <tr>
                                            <th style="display: none"></th>
                                            <th>Thông tin sản phẩm</th>
                                            <th>Số IMEI</th>
                                            <th>Đơn Giá Gốc</th>
                                            <th colspan="2">Action</th>
                                        </tr>
                                        </thead>
                                        <tbody id="table-search11">
                                        <c:forEach items="${dtct}" var="hdct">
                                            <tr>
                                                <td style="display: none">${hdct.hoaDonChiTiet.imei.chiTietSanPham.id}</td>
                                                <td align="center">
                                                    <img src="/uploads/${hdct.hoaDonChiTiet.imei.chiTietSanPham.urlAnh}"
                                                         width="40"
                                                         height="40"> -
                                                        ${hdct.hoaDonChiTiet.imei.chiTietSanPham.sanPham.ten}
                                                    - ${hdct.hoaDonChiTiet.imei.chiTietSanPham.mauSac.ten} -
                                                        ${hdct.hoaDonChiTiet.imei.chiTietSanPham.sanPham.hangSanPham.ten}
                                                    -
                                                        ${hdct.hoaDonChiTiet.imei.chiTietSanPham.ram.dungLuong} -
                                                        ${hdct.hoaDonChiTiet.imei.chiTietSanPham.rom.dungLuong}</td>
                                                <td>${hdct.hoaDonChiTiet.imei.soImei}</td>
                                                <td>${hdct.hoaDonChiTiet.imei.chiTietSanPham.giaBan}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${hdct.hinhThucDoiTra ==0 }">
                                                            <button class='btn btn-primary chonSanPhamDoiTraButton'
                                                                    data-idhdctmoi="${hdct.hoaDonChiTiet.id}"
                                                                    idSanPham="${hdct.hoaDonChiTiet.imei.chiTietSanPham.sanPham.id}"
                                                                    idChip="${hdct.hoaDonChiTiet.imei.chiTietSanPham.chip.id}"
                                                                    idRam="${hdct.hoaDonChiTiet.imei.chiTietSanPham.ram.id}"
                                                                    idRom="${hdct.hoaDonChiTiet.imei.chiTietSanPham.rom.id}"
                                                                    idPin="${hdct.hoaDonChiTiet.imei.chiTietSanPham.pin.id}"
                                                                    onclick='showChonSanPhamModalWithDonGia(${hdct.hoaDonChiTiet.donGia})'
                                                                    data-bs-toggle="modal"
                                                                    data-bs-target="#newSanPham">
                                                                Chọn
                                                            </button>
                                                            <button class='btn btn-primary xoaSanPhamDoiTraButton'
                                                                    data-idhdctmoixoa="${hdct.hoaDonChiTiet.id}"
                                                                    onclick="xoaSanPham('${hdct.hoaDonChiTiet.id}')">Xóa
                                                            </button>
                                                        </c:when>
                                                        <c:when test="${hdct.hinhThucDoiTra == 1}">
                                                            <button class='btn btn-primary xoaSanPhamDoiTraButton'
                                                                    data-idhdctmoixoa="${hdct.hoaDonChiTiet.id}"
                                                                    onclick="xoaSanPham('${hdct.hoaDonChiTiet.id}')">Xóa
                                                            </button>
                                                        </c:when>
                                                    </c:choose>
                                                </td>

                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <br>
                                <c:if test="${dtctlist.size()!=0}">
                                    <h3 ${not empty dtctlist ? '' : 'style="display: none;"'}
                                            style="text-align: center;">
                                        Sản
                                        phẩm đổi mới</h3>
                                    <br>
                                    <div class="table-responsive custom-table">
                                        <table class="display custom-table" ${not empty dtctlist ? '' : 'style="display: none;"'}
                                               style="color: black">
                                            <thead>
                                            <tr>
                                                <th>Sản phẩm cần đổi</th>
                                                <th>IMEI cần đổi</th>
                                                <th>Đơn giá cũ</th>
                                                <th>Sản phẩm đổi sang</th>
                                                <th>Số IMEI đổi mới</th>
                                                <th>Đơn giá mới</th>
                                            </tr>
                                            </thead>
                                            <tbody id="table-search1">
                                            <c:forEach items="${dtctlist}" var="hdct">
                                                <tr>
                                                    <td>
                                                        <img src="/uploads/${hdct.hoaDonChiTiet.imei.chiTietSanPham.urlAnh}"
                                                             width="40"
                                                             height="40"> -
                                                            ${hdct.hoaDonChiTiet.imei.chiTietSanPham.sanPham.ten}
                                                        - ${hdct.hoaDonChiTiet.imei.chiTietSanPham.mauSac.ten} -
                                                            ${hdct.hoaDonChiTiet.imei.chiTietSanPham.sanPham.hangSanPham.ten}
                                                        -
                                                            ${hdct.hoaDonChiTiet.imei.chiTietSanPham.ram.dungLuong} -
                                                            ${hdct.hoaDonChiTiet.imei.chiTietSanPham.rom.dungLuong}</td>
                                                    <td>${hdct.hoaDonChiTiet.imei.soImei}</td>
                                                    <td>${hdct.hoaDonChiTiet.donGia}</td>
                                                    <td align="center">
                                                        <img src="/uploads/${hdct.imei.chiTietSanPham.urlAnh}"
                                                             width="40"
                                                             height="40"> -
                                                            ${hdct.imei.chiTietSanPham.sanPham.ten}
                                                        - ${hdct.imei.chiTietSanPham.mauSac.ten} -
                                                            ${hdct.imei.chiTietSanPham.sanPham.hangSanPham.ten} -
                                                            ${hdct.imei.chiTietSanPham.ram.dungLuong} -
                                                            ${hdct.imei.chiTietSanPham.rom.dungLuong}
                                                    </td>
                                                    <td>${hdct.imei.soImei}</td>
                                                    <td>${hdct.donGia}</td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                        <br>
                                        <div>
                                            <form id="xacNhanForm" action="/doi-tra/xac-nhan" method="post">
                                                <div class="row">
                                                    <div style="margin-left: 550px">
                                                        <button type="button" class="btn btn-dark mb-2"
                                                                id="toastr-success-top-center-doi-tra1"
                                                                onclick="kiemTraTruocXacNhan()">
                                                            Xác nhận
                                                        </button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
</div>
<%--modal chọn sp--%>
<div class="modal fade" id="newSanPham" tabindex="-1" aria-labelledby="modal-1-label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-body">
                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <div>
                            <div class="card-body">
                                <h4 class="card-title" style="float: left">Sản phẩm</h4>
                                <%--            Tìm kiếm               --%>
                                <div class="input-group"
                                     style="width: 30%; float: right">
                                    <input type="text"
                                           class="form-control"
                                           name="search-imei"
                                           id="imeiSearchInput"
                                           placeholder="Tìm kiếm IMEI">
                                    <div class="input-group-append">
                                        <button class="btn btn-sm btn-primary"
                                                type="button"
                                                id="searchImei"
                                        >Tìm kiếm
                                        </button>
                                    </div>
                                </div>
                                <br>
                                <br>
                                <%--           kết thúc tìm kiếm         --%>
                                <div class="table-responsive">
                                    <div>
                                        <table style="min-width: 1200px; color: black;text-align: center">
                                            <thead>
                                            <tr>
                                                <th>Tên Sản Phẩm</th>
                                                <th>Ảnh</th>
                                                <th>Hãng</th>
                                                <th>Màu Sắc</th>
                                                <th>Ram</th>
                                                <th>Bộ Nhớ</th>
                                                <th>Đơn Giá Gốc</th>
                                                <th>Số IMEI</th>
                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody class="san_pham_search" style="text-align: center"
                                                   id="banglocthaydoi">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Thông Tin Đổi Hàng</h5>
            </div>
            <div class="modal-body">
                <!-- Form để nhập thông tin đổi hàng -->
                <form id="doiTraForm" style="color:black;">
                    <div class="form-group">
                        <label for="lyDo">Lý Do Đổi Hàng</label>
                        <input type="text" class="form-control" id="lyDo" placeholder="Lý do đổi hàng">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary" onclick="themThongTinDoiTra()">Thêm Thông Tin</button>
            </div>
        </div>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"
        integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.full.min.js"></script>
<script>
    function xoaSanPham(hdctId) {
        // Gửi yêu cầu xóa bất đồng bộ
        $.ajax({
            url: '/doi-tra/delete-hdct/' + doitraId + '/' + hdctId,
            type: 'GET',
            success: function (data) {
                // Load lại trang sau khi xóa thành công
                location.reload();
            },
            error: function (error) {
                console.error('Lỗi khi xóa', error);
            }
        });
    }
</script>
<script>
    $("#toastr-success-top-center-doi-tra1").on("click", function () {
        $.ajax({
            type: "GET",
            url: "/doi-tra/check/" + doitraId,
            success: function (data) {

                if (data.hasNullImei) {

                    toastr.error("Vui lòng chọn sản phẩm đổi hàng  ", "Lỗi", {
                        timeOut: 3000,
                        closeButton: true,
                        progressBar: true,
                        positionClass: "toast-top-right"
                    });
                } else {

                    toastr.success("Đổi hàng thành công", "Thông báo", {
                        timeOut: 1500,
                        closeButton: true,
                        progressBar: true,
                        positionClass: "toast-top-right"
                    });
                    document.getElementById("xacNhanForm").submit();

                    setTimeout(function () {
                        window.location.href = "/doi-tra/thanh-cong";
                    }, 1500);
                }
            },
            error: function (error) {
                console.log("Lỗi:", error);
            }
        });
    });
</script>
<script>
    var xoahdctId; // Biến toàn cục để lưu giá trị hdctId

    // Lắng nghe sự kiện click trên button
    document.querySelectorAll('.xoaSanPhamDoiTraButton').forEach(button => {
        button.addEventListener('click', function () {
            // Lấy giá trị hdct.id từ thuộc tính data
            var hdctId = this.getAttribute('data-idhdctmoixoa');

            // Lưu giá trị hdctId vào biến toàn cục
            xoahdctId = hdctId;

            // Gọi hàm để xử lý với giá trị hdct.id
            chonSanPham();
        });
    });

    // Hàm xử lý khi click
    function chonSanPham() {
        // Sử dụng giá trị hdct.id từ biến toàn cục
        console.log('Selected hdct.id:', xoahdctId);

        // Gửi giá trị hdct.id đến trang khác thông qua Ajax
        // Có thể thực hiện gửi giá trị này trong hàm fetch
    }
</script>
<script>
    document.querySelectorAll('.chonSanPhamButton').forEach(button => {
        button.addEventListener('click', function () {
            var hdctId = this.getAttribute('data-idhdct');
            var doitraId = window.location.pathname.split('/').pop();

            // Hiển thị modal
            $('#myModal').modal('show');

            // Lưu thông tin hdctId và doitraId trong form để sử dụng khi thêm
            $('#doiTraForm').data('hdctId', hdctId);
            $('#doiTraForm').data('doitraId', doitraId);
        });
    });

    function themThongTinDoiTra() {
        var lyDo = $('#lyDo').val();
        var hienTrang = 0;
        var hinhThuc = $('#hinhThucDoiTra').val();
        var hdctId = $('#doiTraForm').data('hdctId');


        // Thực hiện thêm thông tin và chuyển hướng đến đường dẫn /doi-tra/them-dtct với các tham số truyền vào
        window.location.href = "/doi-tra/them-dtct?hdctId=" + hdctId + "&doitraId=" + doitraId + "&lyDo=" + lyDo + "&hienTrang=" + hienTrang + "&hinhThuc=" + hinhThuc;
    }
</script>
<script>
    function kiemTraGia() {
        // Lấy giá trị hdct.donGia từ biến toàn cục
        var hdctDonGia = selectedDonGia;

        // Lấy giá trị ctsp.giaBan từ dữ liệu HTML
        var ctspGiaBan = parseFloat(document.querySelector('[data-bs-target="#nhapImei"]').getAttribute('data-giaban'));

        // In ra console để kiểm tra giá trị
        console.log("hdctDonGia:", hdctDonGia);
        console.log("ctspGiaBan:", ctspGiaBan);

        // Kiểm tra điều kiện so sánh giá trị
        if (hdctDonGia === ctspGiaBan) {
            // Thực hiện hành động nếu giá trị bằng nhau
            console.log("Giá trị hợp lệ. Thực hiện thêm các hành động khác ở đây.");
        } else {
            // Thực hiện hành động nếu giá trị không bằng nhau
            console.log("Giá trị không hợp lệ. Thực hiện hành động khác nếu cần.");
        }
    }
</script>
<script>
    function showDoiTraModal() {
        // Hiển thị modal đổi hàng
        $("#doiTra").modal("show");
    }
</script>
<script>
    // Định nghĩa một biến toàn cục để lưu giá trị hdct.donGia
    var selectedDonGia;

    function showChonSanPhamModalWithDonGia(donGia) {
        // Lưu giá trị hdct.donGia vào biến toàn cục
        selectedDonGia = donGia;

        // Gọi hàm hiển thị modal chọn sản phẩm ở đây
        showChonSanPhamModal();
    }

</script>
<script>
    function showChonSanPhamModal() {
        // Hiển thị modal chọn sản phẩm
        $("#exampleModalChonSanPham").modal("show");
    }

</script>
<script>

    $('#selectKhachHang1').select2({
        theme: 'bootstrap-5'
    });
    $('#selectNhanVien1').select2({
        theme: 'bootstrap-5'
    });
    $('#selectDiaChi1').select2({
        theme: 'bootstrap-5'
    });
</script>
<script>
    var globalHdctId;
    var setIdSP;
    var setIdRam;
    var setIdRom;
    var setIdChip;
    var setIdPin; // Biến toàn cục để lưu giá trị hdctId

    // Lắng nghe sự kiện click trên button
    document.querySelectorAll('.chonSanPhamDoiTraButton').forEach(button => {
        button.addEventListener('click', function () {
            // Lấy giá trị hdct.id từ thuộc tính data
            var hdctId = this.getAttribute('data-idhdctmoi');
            var idSanPham = this.getAttribute('idSanPham');
            var idChip = this.getAttribute('idChip');
            var idRam = this.getAttribute('idRam');
            var idRom = this.getAttribute('idRom');
            var idPin = this.getAttribute('idPin');

            // Lưu giá trị hdctId vào biến toàn cục
            globalHdctId = hdctId;
            setIdSP = idSanPham;
            setIdChip = idChip;
            setIdRam = idRam;
            setIdRom = idRom;
            setIdPin = idPin;

            // Gọi hàm để xử lý với giá trị hdct.id
            chonSanPham();
        });
    });
    $('button[id^="searchImei"]').on('click', async function (e) {
        const btn = $(this);
        const parentModal = btn.closest('.modal'); // Lấy modal cha gần nhất của nút "Tìm kiếm" được nhấn
        const search = parentModal.find("#imeiSearchInput").val();
        const idCTSPInputElement = $(document).find('#idCTSPham').val();
        const idSanPham = setIdSP;
        const idChip = setIdChip;
        const idRam = setIdRam;
        const idRom = setIdRom;
        const idPin = setIdPin;
        const url = "http://localhost:8080/ban-hang/search-imei?search-imei=" + search;
        if (search === "") {
            let html = `
                <br>
                <tr>
                    <td colspan="9" style="text-align: center; color: red"><strong>Vui lòng nhập IMEI trước khi tìm kiếm.</strong></td>
                </tr>
                <br>`;
            parentModal.find(".san_pham_search").html(html);
            return;
        }
        try {
            const resp = await fetch(url);
            const data = await resp.json();
            console.log(data)
            if (data.length === 0) {
                let html = `
                <br>
                <tr>
                    <td colspan="9" style="text-align: center; color: red"><strong>IMEI đang chờ xử lý hoặc đã bán!</strong></td>
                </tr>
                <br>`;
                parentModal.find(".san_pham_search").html(html);
            } else {
                // Hiển thị dữ liệu tìm kiếm
                let html = ``;
                for (let i = 0; i < data.length; i++) {
                    const imei = data[i];
                    const idSP = imei.chiTietSanPham.sanPham.id;
                    const ram = imei.chiTietSanPham.ram.id;
                    const rom = imei.chiTietSanPham.rom.id;
                    const chip = imei.chiTietSanPham.chip.id;
                    const pin = imei.chiTietSanPham.pin.id;
                    if (idSP.trim() === idSanPham.trim() && ram.trim() === idRam.trim()
                        && rom.trim() === idRom.trim() && chip.trim() === idChip.trim() && pin.trim() === idPin.trim()) {
                        const tr = `
                        <br>
                        <tr>
                            <td>` + imei.chiTietSanPham.sanPham.ten + `</td>
                            <td align="center"><img src="/uploads/` + imei.chiTietSanPham.urlAnh + `" width="40" height="40"></td>
                            <td>` + imei.chiTietSanPham.sanPham.hangSanPham.ten + `</td>
                            <td>` + imei.chiTietSanPham.mauSac.ten + `</td>
                            <td>` + imei.chiTietSanPham.ram.dungLuong + `</td>
                            <td>` + imei.chiTietSanPham.rom.dungLuong + `</td>
                            <td>` + imei.chiTietSanPham.giaBan + `</td>
                            <td>` + imei.soImei + `</td>
                            <td><a class="btn btn-warning btn-icon-text" href="/doi-tra/them-imei/` + imei.id + `/` + doitraId + `/` + globalHdctId + `">Thêm IMEI</a></td>
                        </tr>
                        <br>
                        `;
                        html += tr;
                    } else {
                        const tr = `
                    <br>
                    <tr>
                        <td colspan="9" style="text-align: center; color: red"><strong>Sản phẩm có IMEI vừa nhập không đúng loại với sản phẩm đổi hàng!</strong></td>
                    </tr>
                    <br>
                    `;
                        html += tr;
                    }
                }
                parentModal.find(".san_pham_search").html(html);
            }
        } catch (err) {
            console.error(err)
        }
    });
</script>
<script>
    $('button[id^="searchSanPham"]').on('click', async function (e) {
        const btn = $(this);
        const parentModal = btn.closest('.modal'); // Lấy modal cha gần nhất của nút "Tìm kiếm" được nhấn
        const search = parentModal.find("#sanPhamSearchInput").val();
        const url = "http://localhost:8080/ban-hang/search-san-pham?search-san-pham=" + search;
        try {
            const resp = await fetch(url);
            const data = await resp.json();
            console.log(data)
            // Hiển thị dữ liệu tìm kiếm
            let html = ``;
            for (let i = 0; i < data.length; i++) {
                const ctsp = data[i];
                let productPrice;
                if (ctsp.khuyenMai) {
                    productPrice = ctsp.giaBan - ctsp.giaBan * ctsp.khuyenMai.soTienGiam / 100;
                } else {
                    productPrice = ctsp.giaBan;
                }
                const tr = `
            <tr>
                <td style="display:none;">` + ctsp.id + `</td>
                <td>` + ctsp.sanPham.ten + `</td>
                <td align="center"><img src="/uploads/` + ctsp.urlAnh + `" width="40" height="40"></td>
                <td>` + ctsp.sanPham.hangSanPham.ten + `</td>
                <td>` + ctsp.mauSac.ten + `</td>
                <td>` + ctsp.ram.dungLuong + `</td>
                <td>` + ctsp.rom.dungLuong + `</td>
                <td>` + productPrice + `</td>
                <td>` + ctsp.soLuong + `</td>
                <td>
                    <a class="btn btn-warning btn-icon-text"
                    data-bs-toggle="modal" data-bs-target="#nhapImei">Nhập IMEI</a>
                </td>
            </tr>
            `;
                html += tr;
            }
            parentModal.find(".san_pham_search").html(html);
            const aTags = document.querySelectorAll('.btn-warning.btn-icon-text');

            aTags.forEach(aTag => {
                aTag.addEventListener('click', () => {
                    // Lấy ID của sản phẩm
                    const productId = aTag.closest('tr').querySelector('td:first-child').textContent;

                    // Lưu ID của sản phẩm vào input
                    const input = document.querySelector('#idCTSPham');
                    input.value = productId;
                });
            });

        } catch (err) {
            console.error(err)
        }
    });
</script>

<script>
    // Lấy giá trị doitraId từ tham số truyền vào URL
    var doitraId = '${param.doitraId}';

    // Thiết lập giá trị vào ô input khi trang được tải
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById('doitraIdInput').value = doitraId;
    });
</script>

<script>
    // Lấy giá trị doitraId từ tham số truyền vào URL
    var hoadonId = '${param.hoadonId}';


    // Thiết lập giá trị vào ô input khi trang được tải
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById('hoadonIdInput').value = hoadonId;
    });
</script>

<script>
    function loadInterface(interfaceUrl) {
        fetch(interfaceUrl)
            .then(response => response.text())
            .then(data => {
                const content = document.getElementById('banglocthaydoi');
                content.innerHTML = data;

                loadScripts();
                const aTags = document.querySelectorAll('.btn-warning.btn-icon-text');

                aTags.forEach(aTag => {
                    aTag.addEventListener('click', () => {
                        // Lấy ID của sản phẩm
                        const productId = aTag.closest('tr').querySelector('td:first-child').textContent;

                        // Lưu ID của sản phẩm vào input
                        const input = document.querySelector('#idCTSPham');
                        input.value = productId;
                    });
                });
                // loadSelect2();
            })
            .catch(error => {
                console.error('Error loading interface:', error);
            });
    }

    function loadScripts() {
        const scriptsToLoad = [
            '../../../vendor/datatables/js/jquery.dataTables.min.js',
            '../../../js/plugins-init/datatables.init.js'


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
                // loadSelect2();
            }
        }

        // Bắt đầu quá trình tải script
        loadScript(0);
    }

    function clickcombobox() {
        var x1 = encodeURIComponent(document.getElementById("hangds1").value);
        var x2 = encodeURIComponent(document.getElementById("camds1").value);
        var x3 = encodeURIComponent(document.getElementById("mands1").value);
        var x4 = encodeURIComponent(document.getElementById("mauds1").value);
        var x5 = encodeURIComponent(document.getElementById("ramds1").value);
        var x6 = encodeURIComponent(document.getElementById("romds1").value);
        // var x7 = encodeURIComponent(document.getElementById("pinds1").value);
        var x8 = encodeURIComponent(document.getElementById("dungds1").value);
        var x9 = encodeURIComponent(document.getElementById("chipds1").value);
        var x10 = encodeURIComponent(document.getElementById("sands1").value);

        var link = '/ban-hang/loc/ban-hang-tai-quay/' + x1 + '/' + x2 + '/' + x3 + '/' + x4 + '/' + x5 + '/' + x6 + '/' + 'null' + '/' + x8 + '/' + x9 + '/' + x10;
        // document.getElementById("vt").innerHTML=link
        loadInterface(link);
        // document.getElementById("demo").innerHTML = "You selected: " + x;
    }


    function loadSelect2() {
        // Gọi .select2() cho các phần tử sau khi tất cả các tệp script đã được nạp
        $('#hangds1').select2({
            theme: 'bootstrap-5'
        });
        $('#camds1').select2({
            theme: 'bootstrap-5'
        });
        $('#mands1').select2({
            theme: 'bootstrap-5'
        });
        $('#mauds1').select2({
            theme: 'bootstrap-5'
        });
        $('#ramds1').select2({
            theme: 'bootstrap-5'
        });
        $('#romds1').select2({
            theme: 'bootstrap-5'
        });

        $('#pinds1').select2({
            theme: 'bootstrap-5'
        });
        $('#dungds1').select2({
            theme: 'bootstrap-5'
        });

        $('#chipds1').select2({
            theme: 'bootstrap-5'
        });

        $('#sands1').select2({
            theme: 'bootstrap-5'
        });

        // Gọi .select2() cho các phần tử khác ở đây (tương tự)
    }

    loadSelect2();
</script>
<script src="../../../vendor/global/global.min.js"></script>
<script src="../../../js/quixnav-init.js"></script>

<!-- Toastr -->
<script src="../../../vendor/toastr/js/toastr.min.js"></script>

<!-- All init script -->
<script src="../../../js/plugins-init/toastr-init.js"></script>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Focus - Bootstrap Admin Dashboard </title>
    <style>
        .btn-group {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 75%;
        }

        .btn-group .btn {
            text-align: center;
            margin: 0 auto;
        }

        .btn-group .btn:nth-child(1) {
            width: 100%;
        }

        .btn-group .btn:nth-child(2) {
            width: 20%;
        }
    </style>
</head>
<body>
<c:forEach items="${listHoaDon}" var="hd" varStatus="i">
    <div class="col-4">
        <div class="btn-group">
            <a href="/ban-hang/thong-tin-hoa-don/${hd.id}" class="btn btn-info"
               style="width: 100%;height: 47px">Hóa Đơn Chờ ${i.index+1}</a>
            <a href="/ban-hang/remove/${hd.id}" class="btn btn-danger" style="width: 20%;height: 47px">
                <i class="mdi mdi-close">X</i>
            </a>
        </div>
    </div>
</c:forEach>
<div class="col-lg-6">
    <div class="ban-hang">
        <video
                style="border: 1px solid"
                id="video"
                autoplay="true"
                width="200px"
                height="120px"
        ></video>
    </div>
</div>

</body>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"
        integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
        integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
        crossorigin="anonymous"></script>
<script src="../../vendors/js/vendor.bundle.base.js"></script>
<script src="../../js/off-canvas.js"></script>
<script src="../../js/hoverable-collapse.js"></script>
<script src="../../js/template.js"></script>
<script src="../../js/settings.js"></script>
<script src="../../js/todolist.js"></script>
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

    function myFunction4() {
        let text = "Bạn chắc chắn muốn thanh toán không";
        let kt = confirm(text);
        if (kt == true) {
            confirm("Thanh toán thành công");
            return true
        } else {
            return false;
        }
    }

    document.getElementById("tienKhachDua").addEventListener("keyup", function () {
        tinhTienThua();
    });

    function tinhTienThua() {
        var tongTien = parseFloat(document.getElementById("tienCanThanhToan").value);
        var tienKhachDua = parseFloat(document.getElementById("tienKhachDua").value);
        var tienThua = tienKhachDua - tongTien;

        var ketQuaElement = document.getElementById("ketQua");
        if (tienThua >= 0) {
            ketQuaElement.value = tienThua.toFixed(2);
        } else {
            ketQuaElement.value = "Khách đưa không đủ tiền.";
        }
    }

    document.getElementById("emailkh").addEventListener("keyup", function () {
        taiKhoan();
    });

    function taiKhoan() {
        var email = document.getElementById("emailkh").value;
        var tk = email;

        var ketQuaElement = document.getElementById("tkkh");
        if (email == '') {
            ketQuaElement.value = "Hãy nhập email";
        } else {
            ketQuaElement.value = tk;
        }
    }

    document.getElementById("emailkh").addEventListener("keyup", function () {
        matKhau();
    });

    function matKhau() {
        var email = document.getElementById("emailkh").value;
        var matKhau = "12345678";

        var ketQuaElement = document.getElementById("mkkh");
        if (email == '') {
            ketQuaElement.value = "Hãy nhập email";
        } else {
            ketQuaElement.value = matKhau;
        }
    }

    function checkhkh() {
        var tenhkh = document.getElementById("tenkh").value;
        var sdtkh = document.getElementById("sdtkh").value;
        var email = document.getElementById("emailkh").value;
        var diem = document.getElementById("diemkh").value;
        var tk = document.getElementById("tkkh").value;
        var mk = document.getElementById("mkkh").value;

        if (
            tenhkh.trim().length < 6 || tenhkh == ''
        ) {
            document.getElementById("btkh").type = "button";
            document.getElementById("tenkh1").innerHTML = "Không để trống ,Tên ít nhất 6 ký tự";
            return false;
        } else {
            document.getElementById("tenkh1").innerHTML = "";
            var regex = /^0\d{9}$/;
            var regexemail = /^.{8,}@gmail\\.com$/

            if (regex.test(sdtkh)) {
                document.getElementById("sdtkh1").innerHTML = "";
                document.getElementById("btkh").type = "submit";
                return true;
            } else {
                document.getElementById("sdtkh1").innerHTML = "SDT phải 10 số và bắt đầu là số 0";
                if (regexemail.test(email)) {
                    document.getElementById("email1").innerHTML = "";
                    document.getElementById("btkh").type = "submit";
                    return true;
                } else {
                    document.getElementById("email1").innerHTML = "email chưa đúng";
                    if (diem == '') {
                        document.getElementById("btkh").type = "button";
                        document.getElementById("diem1").innerHTML = "Điểm ít nhất là 1";
                        return false;
                    } else {
                        document.getElementById("diem1").innerHTML = "";
                        document.getElementById("btkh").type = "submit";
                        return true;
                    }
                }
            }
        }
    }
</script>
<script>
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
</script>
<script>
    $('button[id^="searchImei"]').on('click', async function (e) {
        const btn = $(this);
        const parentModal = btn.closest('.modal'); // Lấy modal cha gần nhất của nút "Tìm kiếm" được nhấn
        const search = parentModal.find("#imeiSearchInput").val();
        const url = "http://localhost:8080/ban-hang/search-imei?search-imei=" + search;
        try {
            const resp = await fetch(url);
            const data = await resp.json();
            console.log(data)
            let html = ``;
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
            parentModal.find(".imei_search").html(html);
        } catch (err) {
            console.error(err)
        }
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
<script type="text/javascript" src="https://rawgit.com/schmich/instascan-builds/master/instascan.min.js"></script>
<script src="../js/scan-qr.js"></script>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <title>Focus - Bootstrap Admin Dashboard </title>
    <!-- Favicon icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />

    <style>



        .notifications{
            position: absolute;
            top: 30px;
            right: 20px;
        }
        .toast1{
            position: relative;
            padding: 10px;
            color: #fff;
            margin-bottom: 10px;
            width: 400px;
            display: grid;
            grid-template-columns: 70px 1fr 70px;
            border-radius: 5px;
            --color: #0abf30;
            background-image:
                    linear-gradient(
                            to right, #0abf3055, #22242f 30%
                    );
            animation: show 0.3s ease 1 forwards
        }
        .toast1 i{
            color: var(--color);
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: x-large;
        }
        .toast1 .title{
            font-size: x-large;
            font-weight: bold;
        }
        .toast1 span, .toast i:nth-child(3){
            color: #fff;
            opacity: 0.6;
        }
        @keyframes show{
            0%{
                transform: translateX(100%);
            }
            40%{
                transform: translateX(-5%);
            }
            80%{
                transform: translateX(0%);
            }
            100%{
                transform: translateX(-10%);
            }
        }
        .toast1::before{
            position: absolute;
            bottom: 0;
            left: 0;
            background-color: var(--color);
            width: 100%;
            height: 3px;
            content: '';
            box-shadow: 0 0 10px var(--color);
            animation: timeOut 5s linear 1 forwards
        }
        @keyframes timeOut{
            to{
                width: 0;
            }
        }
        .toast1.error{
            --color: #f24d4c;
            background-image:
                    linear-gradient(
                            to right, #f24d4c55, #22242F 30%
                    );
        }
        .toast1.warning{
            --color: #e9bd0c;
            background-image:
                    linear-gradient(
                            to right, #e9bd0c55, #22242F 30%
                    );
        }
        .toast1.info{
            --color: #3498db;
            background-image:
                    linear-gradient(
                            to right, #3498db55, #22242F 30%
                    );
        }
    </style>
</head>
<body >

<%--<div style="width: 5cm;height: 5cm; overflow: auto;border: 1px solid #ccc;">--%>

<%--    <p>Mffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</p>--%>
<%--    <p>More content...</p>--%>
<%--    <p>More content...</p>--%>
<%--    <p>More content...</p>--%>
<%--    <p>More content...</p>--%>
<%--    <p>More content...</p>--%>
<%--    <p>More content...</p>--%>
<%--    <p>More content...</p>--%>
<%--    <p>More content...</p>--%>
<%--    <p>More content...</p>--%>
<%--    <p>More content...</p><p>More content...</p>--%>
<%--    <p>More content...</p><p>More content...</p>--%>
<%--    <p>More content...</p><p>More content...</p>--%>
<%--    <p>More content...</p><p>More content...</p>--%>
<%--    <p>More content...</p><p>More content...</p>--%>
<%--    <p>More content...</p><p>More content...</p>--%>
<%--   vodanh--%>
<%--</div>--%>

<%--<input id="giatri" type="datetime-local" value="2023-11-29T17:09"  onchange="chya()">--%>

<%--<input id="hienthi">--%>
<%--<script>--%>
<%--    function chya() {--%>
<%--        document.getElementById('hienthi').value=document.getElementById('giatri').value;--%>
<%--    }--%>
<%--</script>--%>
<br>


<%--<div>--%>
<%--    <ul class="nav nav-tabs border-top"--%>
<%--        id="setting-panel" role="tablist">--%>
<%--        <li class="nav-item">--%>
<%--            <a class="nav-link active"--%>
<%--               id="description-tab"--%>
<%--            &lt;%&ndash;                   data-toggle="tab"&ndash;%&gt;--%>
<%--               href="/khuyen-mai/hien-thi" role="tab"--%>
<%--               aria-controls="description"--%>
<%--               aria-selected="true">--%>
<%--                Thông tin khách hàng--%>
<%--            </a>--%>
<%--        </li>--%>
<%--        <li class="nav-item">--%>
<%--            <a href="/khuyen-mai/view-add"--%>
<%--               role="tab"--%>
<%--               class="nav-link">--%>
<%--                Thêm khách hàng--%>
<%--            </a>--%>
<%--        </li>--%>
<%--        <li class="nav-item">--%>
<%--            <a href="/khuyen-mai/khuyen-mai-tung-xoa"--%>
<%--               role="tab"--%>
<%--               class="nav-link">--%>
<%--                Khách hàng từng xóa--%>
<%--            </a>--%>
<%--        </li>--%>
<%--    </ul>--%>
<%--</div>--%>



<!-- The Modal -->
<div class="modal" id="myModalthemkm">
    <div class="modal-dialog">
        <div class="modal-content">
<br>
            <!-- Modal Header -->
            <div >
                <h4 style="text-align: center">Thêm khuyến mãi</h4>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <form:form action="/khuyen-mai/add" method="post" modelAttribute="km" id="formlink">


<br>

                                 Tên khuyến mãi: <form:errors path="ten" cssStyle="color: red"></form:errors>
                                <form:input  class="form-control" placeholder="" path="ten" value=""/>


<br>

                                Ngày bắt đầu:<form:errors path="ngayBatDau" cssStyle="color: red"></form:errors>
                                <form:input class="form-control" placeholder="" path="ngayBatDau" type="datetime-local" />


<br>


                                 Ngày kết thúc:<label style="color: red">${momdalthongbaongayKT}</label><form:errors path="ngayKetThuc" cssStyle="color: red"></form:errors>
                                 <form:input class="form-control" placeholder="" path="ngayKetThuc" type="datetime-local" />


<br>

                               % giảm(0->50):<form:errors path="soTienGiam" cssStyle="color: red"></form:errors>
                               <form:input   class="form-control" placeholder=""  path="soTienGiam" type="number" oninput="validateInput(this)" />

<br>


                                Mô tả:<form:errors path="moTa" cssStyle="color: red"></form:errors>
                                <form:textarea id="motahkh" class="form-control" placeholder="" path="moTa" />

<br>

                    <div align="center"> <button type="submit" class="btn btn-warning" id="bthkh" >ADD</button></div>


                </form:form>


            </div>

        </div>
    </div>
</div>








<div class="tab-content" id="myTabContent">
    <div class="tab-pane fade show active" id="description" role="tabpanel"
         aria-labelledby="description-tab">

        <div class="card">
            <div class="card-body">




                <form action="/khuyen-mai/tim-kiem" method="post" style="margin-left: 1cm;">
                    <div class="input-group" style="width: 30%; float: right">
                        <input style="height: 1cm" type="text" class="form-control" name="matk"
                               placeholder="Mã hoặc tên">
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-sm btn-primary"
                                    onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                Tìm kiếm
                            </button>
                        </div>
                    </div>
                </form>
                <button type="button" id="modalthemkm" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModalthemkm">
                    Thêm khuyến mãi
                </button>
                <br>
                <br>
                <div class="col-sm-12">
                    <div class="card-box table-responsive">
                        <table class="table table-striped" style="width: 2500px;color: black">
                            <tr>
                                <th>STT</th>
                                <th>Mã</th>
                                <th>Tên</th>
                                <th>% giảm</th>
                                <th>Ngày bắt đầu</th>
                                <th>Ngày kết thúc</th>
                                <th>Ngày tạo</th>
                                <th>Ngày cập nhật</th>
                                <th>Tình trạng</th>
                                <th>Mô tả</th>
                                <th>Chức năng</th>

                            </tr>


                            <c:forEach items="${dulieu}" var="ht" varStatus="stt">
                                <tr>
                                    <td>${stt.index+1}</td>
                                    <td>${ht.ma}</td>
                                    <td>${ht.ten} </td>
                                    <td>${ht.soTienGiam}</td>
                                    <td>${ht.ngayBatDau}</td>
                                    <td>${ht.ngayKetThuc}</td>
                                    <td>${ht.ngayTao}</td>
                                    <td>${ht.ngayCapNhat}</td>
                                    <td >
                                        <c:if test="${ht.tinhTrang==0}">
                                            Khuyến mãi đang áp dụng
                                        </c:if>
                                        <c:if test="${ht.tinhTrang==1}">
                                            Khuyến mãi đã hết hạn
                                        </c:if>
                                        <c:if test="${ht.tinhTrang==2}">
                                            Khuyến mãi chưa bắt đầu
                                        </c:if>

                                           </td>
                                    <td>${ht.moTa}</td>

                                    <td>
                                    <c:if test="${ht.tinhTrang==1}">
                                        <a href="/khuyen-mai/detail-khuyen-mai/${ht.id}" class="btn btn-success"
                                           onclick="return tbxd()">Xem khuyến mãi</a>
                                    </c:if>

                                        <c:if test="${ht.tinhTrang!=1}">
                                            <a href="/khuyen-mai/ap-dung-khuyen-mai/${ht.id}" class="btn btn-success"
                                               onclick="return tbxd()">Áp dụng</a>
                                            <a href="/khuyen-mai/detail-khuyen-mai/${ht.id}" class="btn btn-success"
                                               onclick="return tbxd()">Xem khuyến mãi</a>
                                        </c:if>

                                    </td>

                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>


                <br>


                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center pagination-lg">
                        <li class="page-item"><a class="page-link" href="/khuyen-mai/hien-thi?num=0"> <</a></li>

                        <c:forEach begin="1" end="${total}" varStatus="status">
                            <li class="page-item">
                                <a href="/khuyen-mai/hien-thi?num=${status.index-1}"
                                   class="page-link">${status.index}</a>
                            </li>
                        </c:forEach>

                        <li class="page-item"><a class="page-link" href="/khuyen-mai/hien-thi?num=${total-1}"> ></a>
                        </li>
                    </ul>
                </nav>


                <P id="bc" style="color: crimson"></P>

            </div>
        </div>
    </div>
</div>








<button style="display: none" id="modalapdung1khuyenmai" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModalapdungkhuyemmai">
    Bat modal ap dung 1 khuyeen mai
</button>
</div>

<!-- The Modal -->
<div class="modal" id="myModalapdungkhuyemmai" >
    <div class="modal-dialog modal-xl">
        <div class="modal-content" >

            <!-- Modal Header -->
            <div class="apdungthanhcong" style="margin-left: 85%;width:10%;z-index: 88;position: absolute"></div>
            <div style="margin-top: 0.5cm;">

                <h4 align="center">Áp dụng khuyến mãi</h4>
                <h4 align="center">${kmchon.ma}    </h4>


            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <table class="table" style="color: black">
                    <thead>
                    <tr style="background-color: #70c0b1">
                        <th>
                            STT
                        </th>
                        <th>
                            Ảnh
                        </th>
                        <th>Sản Phẩm</th>
                        <th>Đơn Giá</th>
                        <th>% giảm</th>
                        <th>Đơn giá khi giảm</th>
                        <th>Chức năng</th>

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${khuyenMaiRepository.getall0CTSP()}" var="ht" varStatus="stt">
                        <tr>
                            <td>
                                ${stt.index}
                            </td>
                            <td>
                                <img src="../../../uploads/${ht.urlAnh}" width="40" height="40"
                                     style="border-radius:50% 50% 50% 50%">
                            </td>
                            <td>
                                    sản phẩm:${ht.sanPham.ten},màu:${ht.mauSac.ten}<br>
                                    dung lượng:${ht.ram.dungLuong},rom:${ht.rom.dungLuong}<br>
                            </td>
                            <td>
                               ${ht.giaBan} VND
                            </td>
                            <td>

                                ${ht.khuyenMai.soTienGiam}% <br>
                                Mã khuyến mãi:${ht.khuyenMai.ma}<br>
                                Tên khuyến mãi:${ht.khuyenMai.ten}<br>
                                Bắt đầu:${ht.khuyenMai.ngayBatDau}<br>
                                Kết thúc:${ht.khuyenMai.ngayKetThuc}
                            </td>
                            <td>
                                    ${ht.giaBan-ht.giaBan/100*khuyenMaiRepository.tonggiamgia(ht.id)} VND
                            </td>
                            <td>
                                <c:if test="${ht.khuyenMai==null}">
                                    <a href="/khuyen-mai/chi-tiet-san-pham-ap-dung-khuyen-mai/${ht.id}/${kmchon.id}" class="btn btn-success"
                                    >Áp dụng</a>
                                </c:if>
                                <c:if test="${ht.khuyenMai!=null}">
                                    <c:if test="${ht.khuyenMai.tinhTrang!=0}">
                                        <c:if test="${ht.khuyenMai.id==kmchon.id}">
                                            Khuyến mãi này đang áp dụng sản phẩm này
                                        </c:if>
                                        <c:if test="${ht.khuyenMai.id!=kmchon.id}">
                                            <a href="/khuyen-mai/chi-tiet-san-pham-ap-dung-khuyen-mai/${ht.id}/${kmchon.id}" class="btn btn-success"
                                            >Áp dụng</a>
                                        </c:if>

                                    </c:if>
                                    <c:if test="${ht.khuyenMai.tinhTrang==0}">
                                       Khuyến mãi đang được diễn ra
                                    </c:if>
                                </c:if>

                            </td>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>


            <br>

        </div>
    </div>
</div>


<div class="buttons" style="display: none">
    <button id="success">Success</button>
</div>








<button style="display: none" type="button" id="modaldetailupdatekm" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModalsuaKM">
    Open modal
</button>
</div>

<!-- The Modal -->
<div class="modal" id="myModalsuaKM">
    <div class="modal-dialog">
        <div class="modal-content">
            <br>
            <!-- Modal Header -->
            <div class="apdungthanhcongupdate" style="margin-left: 85%;width:10%;z-index: 88;position: absolute"></div>

            <div >
                <h4 style="text-align: center">UPDATE khuyến mãi</h4>
                <h4 style="text-align: center">Mã khuyến mãi:${kmchon.ma}</h4>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <form:form action="/khuyen-mai/update" method="post" modelAttribute="kmupdate" id="formlink">
                 <div style="display: none">
                     <form:input  class="form-control" placeholder="" path="id" value=""/>
                     <form:input  class="form-control" placeholder="" path="ma" value=""/>
                     <form:input  class="form-control" placeholder="" path="ngayTao" value=""/>
                     <form:input  class="form-control" placeholder="" path="ngayCapNhat" value=""/>
                     <form:input  class="form-control" placeholder="" path="loaiGiamGia" value=""/>
                     <form:input  class="form-control" placeholder="" path="hinhThucGiamGia" value=""/>
                     <form:input  placeholder="" path="ngayBatDau" type="text" id="input2"/>
                     <form:input  placeholder="" path="ngayKetThuc" type="text"  id="input4"/>
                 </div>


                    <br>

                    Tên khuyến mãi: <form:errors path="ten" cssStyle="color: red"></form:errors>
                    <form:input  class="form-control" placeholder="" path="ten" value=""/>


                    <br>

                    Ngày bắt đầu:<form:errors path="ngayBatDau" cssStyle="color: red"></form:errors>
                    <input value="${NBTCC}" name="NBDupdate" type="datetime-local" style="width: 100%" id="input1" oninput="updateInput2(this.value)">


                    <br><br>


                    Ngày kết thúc:<label style="color: red">${momdalthongbaongayKT1}</label><form:errors path="ngayKetThuc" cssStyle="color: red"></form:errors><br>
                    <input value="${NKTCC}" name="NKTupdate" type="datetime-local" style="width: 100%" id="input3" oninput="updateInput4(this.value)">


                    <br><br>

                    % giảm(0->50):<form:errors path="soTienGiam" cssStyle="color: red"></form:errors>
                    <form:input   class="form-control" placeholder=""  path="soTienGiam" type="number" oninput="validateInput(this)" />

                    <br>


                    Mô tả:<form:errors path="moTa" cssStyle="color: red"></form:errors>
                    <form:textarea id="motahkh" class="form-control" placeholder="" path="moTa" />

                    <br>

                    <div align="center"> <button type="submit" class="btn btn-warning" id="" >UPDATE</button></div>


                </form:form>


            </div>

        </div>
    </div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>





<div class="buttons" style="display: none" >
    <button id="btapdungthanhcong">btapdungthanhcong</button>
</div>
<div class="buttons" style="display: none" >
    <button id="btapdungthanhcongupdate">btapdungthanhcong</button>
</div>
<script>
    // Hàm chuyển đổi định dạng thời gian
    function convertDateFormat(inputDateTime1) {


        // Chuỗi thời gian đầu vào
        var inputDateTime = inputDateTime1.replace("T", " ");


        // Chuyển đổi chuỗi thành đối tượng Date
        var parsedDate = new Date(inputDateTime);


        // Kiểm tra nếu parsedDate không hợp lệ
        if (isNaN(parsedDate.getTime())) {
            return "";
        }

        // Lấy thông tin ngày, tháng, năm, giờ, phút và giây
        var day = parsedDate.getDate();
        var month = parsedDate.getMonth() + 1; // Tháng trong JavaScript bắt đầu từ 0
        var year = parsedDate.getFullYear();
        var hours = parsedDate.getHours();
        var minutes = parsedDate.getMinutes();
        var seconds = parsedDate.getSeconds();

        // Định dạng lại chuỗi theo định dạng mong muốn
        var formattedMonth = (month < 10 ? '0' : '') + month;

        var formattedDay = (day < 10 ? '0' : '') + day;
        var formattedHours = (hours < 10 ? '0' : '') + hours;
        var formattedMinutes = (minutes < 10 ? '0' : '') + minutes;
        var formattedSeconds = (seconds < 10 ? '0' : '') + seconds;

        var outputDateTime = formattedDay + "-" + formattedMonth + "-" + year + " " + formattedHours + ":" + formattedMinutes + ":" + formattedSeconds;


        return outputDateTime;
    }


    // Hàm được gọi khi giá trị của input3 thay đổi
    function updateInput4(value) {


        document.getElementById('input4').value = convertDateFormat(value);;
    }
    // Hàm được gọi khi giá trị của input1 thay đổi
    function updateInput2(value) {
        // Lấy thẻ input thứ hai và cập nhật giá trị của nó
        document.getElementById('input2').value = convertDateFormat(value);
    }
</script>

<script>
    let apdungthanhcong = document.querySelector('.apdungthanhcong');
    let btapdungthanhcong = document.getElementById('btapdungthanhcong');

    function createToast1(){
        let newToast1 = document.createElement('div');
        newToast1.innerHTML = `
            <div class="toast1">
                <i class="fa-solid fa-circle-check"></i>
                <div class="content">
                    <div class="title">Thành công</div>
                    <span>Áp dụng khuyến mãi thành công</span>
                </div>
                <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
            </div>`;
        apdungthanhcong.appendChild(newToast1);
        newToast1.timeOut = setTimeout(
            ()=>newToast1.remove(), 5000
        )
    }
    btapdungthanhcong.onclick = function(){


        createToast1( );
    }

</script>
<script>

        function validateInput(input) {
        // Xóa mọi ký tự không phải số và giới hạn tối đa 2 ký tự
        input.value = input.value.replace(/[^0-9]/g, '').substring(0, 2);

    }

</script>
<script>

    <c:if test="${momdalthemkm==0}">
    document.getElementById('modalthemkm').click();
    </c:if>
</script>


<script>
    let notifications = document.querySelector('.notifications');
    let success = document.getElementById('success');


    function createToast(){
        let newToast = document.createElement('div');
        newToast.innerHTML = `
            <div class="toast1">
                <i class="fa-solid fa-circle-check"></i>
                <div class="content">
                    <div class="title">Thành công</div>
                    <span>Thêm khuyến mãi thành công</span>
                </div>
                <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
            </div>`;
        notifications.appendChild(newToast);
        newToast.timeOut = setTimeout(
            ()=>newToast.remove(), 5000
        )
    }
    success.onclick = function(){


        createToast( );
    }

</script>
<script>
    let btapdungthanhcongupdate = document.getElementById('btapdungthanhcongupdate');

    function createToast2(){
        let newToast2 = document.createElement('div');
        newToast2.innerHTML = `
            <div class="toast1">
                <i class="fa-solid fa-circle-check"></i>
                <div class="content">
                    <div class="title">Thành công</div>
                    <span>Sửa khuyến mãi thành công</span>
                </div>
                <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
            </div>`;
        notifications.appendChild(newToast2);
        newToast2.timeOut = setTimeout(
            ()=>newToast2.remove(), 5000
        )
    }
    btapdungthanhcongupdate.onclick = function(){


        createToast2( );
    }

</script>
<script>
    <c:if test="${tbThemKMOK==0}">
    document.getElementById('success').click();
    </c:if>
</script>
<script>
    <c:if test="${tbUPDATEkmOK==0}">
    document.getElementById('btapdungthanhcongupdate').click();
    </c:if>
</script>
<script>
    <c:if test="${batmodalapdungkm==0}">
    document.getElementById('modalapdung1khuyenmai').click();
    </c:if>
    <c:if test="${tbapdungKMvsCTSP==0}">
    document.getElementById('modalapdung1khuyenmai').click();
    document.getElementById('btapdungthanhcong').click();
    </c:if>
    <c:if test="${batmodaldetailupdatekm==0}">
    document.getElementById('modaldetailupdatekm').click();
    </c:if>
</script>
</html>
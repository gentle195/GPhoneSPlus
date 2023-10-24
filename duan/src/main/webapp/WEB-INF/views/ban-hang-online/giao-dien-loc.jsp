<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
    /* Ẩn input radio */
    input[type="radio"] {
        display: none;
    }

    /* Tạo một giao diện tùy chỉnh cho label */
    label {
        display: inline-block;
        padding: 5px 10px;
        background-color: #e0e0e0;
        border: 1px solid #ccc;
        cursor: pointer;
    }

    /* Khi label được nhấp vào, thay đổi màu nền để biểu thị lựa chọn */
    input[type="radio"]:checked + label {
        background-color: #007bff;
        color: #fff;
    }
</style>

<body>
<p id="vt"></p>
<div style="position: absolute;margin-left: 57%;width: 43%;margin-top: 10%;z-index: 2;">
    <p style="display: none" id="tenspctsp">${motctsp.sanPham.ten}</p>
    Màu sắc:
    <c:forEach items="${banhangonline.ListctspTheoidsp(motctsp.sanPham.id)}" var="ht1" varStatus="stt1">

        <c:if test="${stt1.index==0}">
            <c:if test="${banhangonline.soluongcon(ht1.id)>0}">
                <input type="radio" id="ms${stt1.index}" name="mauSac1"
                       value="${ht1.mauSac.ten}" ${ht1.mauSac.ten==motctsp.mauSac.ten ?"checked":""}
                       onchange="clickradio();">
                <label for="ms${stt1.index}" style="border: 1px solid #00A000">${ht1.mauSac.ten}</label>
            </c:if>
        </c:if>

        <c:if test="${stt1.index>0}">
            <c:if test="${banhangonline.soluongcon(ht1.id)>0}">
                <c:set var="checkck" scope="session" value="${-1}"/>
                <c:forEach items="${banhangonline.ListctspTheoidsp(motctsp.sanPham.id)}" var="checkht1" begin="0"
                           end="${stt1.index-1}">
                    <c:if test="${banhangonline.soluongcon(checkht1.id)>0}">
                        <c:if test="${ht1.mauSac.ten==checkht1.mauSac.ten}">
                            <c:set var="checkck" scope="session" value="${0}"/>
                        </c:if>
                    </c:if>
                </c:forEach>
                <c:if test="${checkck==-1}">
                    <input type="radio" id="ms${stt1.index}" name="mauSac1"
                           value="${ht1.mauSac.ten}" ${ht1.mauSac.ten==motctsp.mauSac.ten ?"checked":""}
                           onchange="clickradio();">
                    <label for="ms${stt1.index}" style="border: 1px solid #00A000">${ht1.mauSac.ten}</label>

                </c:if>
                <c:set var="checkck" scope="session" value="${-1}"/>
            </c:if>
        </c:if>

    </c:forEach>
    <br>
    <br>
    Rom:
    <c:forEach items="${banhangonline.ListctspTheoidsp(motctsp.sanPham.id)}" var="ht1" varStatus="stt1">

        <c:if test="${stt1.index==0}">
            <c:if test="${banhangonline.soluongcon(ht1.id)>0}">
                <input type="radio" id="rom${stt1.index}" name="rom1"
                       value="${ht1.rom.dungLuong}" ${ht1.rom.dungLuong==motctsp.rom.dungLuong ?"checked":""}
                       onchange="clickradio();">
                <label for="rom${stt1.index}" style="border: 1px solid #00A000">${ht1.rom.dungLuong}</label>
            </c:if>
        </c:if>

        <c:if test="${stt1.index>0}">
            <c:if test="${banhangonline.soluongcon(ht1.id)>0}">
                <c:set var="checkck" scope="session" value="${-1}"/>
                <c:forEach items="${banhangonline.ListctspTheoidsp(motctsp.sanPham.id)}" var="checkht1" begin="0"
                           end="${stt1.index-1}">
                    <c:if test="${banhangonline.soluongcon(checkht1.id)>0}">
                        <c:if test="${ht1.rom.dungLuong==checkht1.rom.dungLuong}">
                            <c:set var="checkck" scope="session" value="${0}"/>
                        </c:if>
                    </c:if>
                </c:forEach>
                <c:if test="${checkck==-1}">
                    <input type="radio" id="rom${stt1.index}" name="rom1"
                           value="${ht1.rom.dungLuong}" ${ht1.rom.dungLuong==motctsp.rom.dungLuong ?"checked":""}
                           onchange="clickradio();">
                    <label for="rom${stt1.index}" style="border: 1px solid #00A000">${ht1.rom.dungLuong}</label>
                </c:if>
                <c:set var="checkck" scope="session" value="${-1}"/>
            </c:if>
        </c:if>
    </c:forEach>

    <br>
    <br>
    Ram:
    <c:forEach items="${banhangonline.ListctspTheoidsp(motctsp.sanPham.id)}" var="ht1" varStatus="stt1">
        <c:if test="${stt1.index==0}">
            <c:if test="${banhangonline.soluongcon(ht1.id)>0}">
                <input type="radio" id="ram${stt1.index}" name="ram1"
                       value="${ht1.ram.dungLuong}" ${ht1.ram.dungLuong==motctsp.ram.dungLuong ?"checked":""}
                       onchange="clickradio();">
                <label for="ram${stt1.index}" style="border: 1px solid #00A000">${ht1.ram.dungLuong}</label>
            </c:if>
        </c:if>
        <c:if test="${stt1.index>0}">
            <c:if test="${banhangonline.soluongcon(ht1.id)>0}">
                <c:set var="checkck" scope="session" value="${-1}"/>
                <c:forEach items="${banhangonline.ListctspTheoidsp(motctsp.sanPham.id)}" var="checkht1" begin="0"
                           end="${stt1.index-1}">
                    <c:if test="${banhangonline.soluongcon(checkht1.id)>0}">
                        <c:if test="${ht1.ram.dungLuong==checkht1.ram.dungLuong}">
                            <c:set var="checkck" scope="session" value="${0}"/>
                        </c:if>
                    </c:if>
                </c:forEach>
                <c:if test="${checkck==-1}">
                    <input type="radio" id="ram${stt1.index}" name="ram1"
                           value="${ht1.ram.dungLuong}" ${ht1.ram.dungLuong==motctsp.ram.dungLuong ?"checked":""}
                           onchange="clickradio();">
                    <label for="ram${stt1.index}" style="border: 1px solid #00A000">${ht1.ram.dungLuong}</label>
                </c:if>
                <c:set var="checkck" scope="session" value="${-1}"/>
            </c:if>
        </c:if>

    </c:forEach>

    <br>
    <br>
    Chíp:
    <c:forEach items="${banhangonline.ListctspTheoidsp(motctsp.sanPham.id)}" var="ht1" varStatus="stt1">
        <c:if test="${stt1.index==0}">
            <c:if test="${banhangonline.soluongcon(ht1.id)>0}">
                <input type="radio" id="chip${stt1.index}" name="chip1"
                       value="${ht1.chip.ten}" ${ht1.chip.ten==motctsp.chip.ten ?"checked":""} onchange="clickradio();">
                <label for="chip${stt1.index}" style="border: 1px solid #00A000">${ht1.chip.ten}</label>
            </c:if>
        </c:if>
        <c:if test="${stt1.index>0}">
            <c:if test="${banhangonline.soluongcon(ht1.id)>0}">
                <c:set var="checkck" scope="session" value="${-1}"/>
                <c:forEach items="${banhangonline.ListctspTheoidsp(motctsp.sanPham.id)}" var="checkht1" begin="0"
                           end="${stt1.index-1}">
                    <c:if test="${banhangonline.soluongcon(checkht1.id)>0}">
                        <c:if test="${ht1.chip.ten==checkht1.chip.ten}">
                            <c:set var="checkck" scope="session" value="${0}"/>
                        </c:if>
                    </c:if>
                </c:forEach>
                <c:if test="${checkck==-1}">
                    <input type="radio" id="chip${stt1.index}" name="chip1"
                           value="${ht1.chip.ten}" ${ht1.chip.ten==motctsp.chip.ten ?"checked":""}
                           onchange="clickradio();">
                    <label for="chip${stt1.index}" style="border: 1px solid #00A000">${ht1.chip.ten}</label>
                </c:if>
                <c:set var="checkck" scope="session" value="${-1}"/>
            </c:if>
        </c:if>

    </c:forEach>

</div>

</body>
</html>



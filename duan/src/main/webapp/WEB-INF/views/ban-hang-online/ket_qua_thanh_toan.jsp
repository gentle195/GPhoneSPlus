<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>

</head>
<body>

<%--0; thất bại--%>
<c:if test="${ketquathanhtoan==0}">
Thanh toán thất bại
</c:if>



<%--1; thành công--%>
<c:if test="${ketquathanhtoan==1}">
Thanh toán thành công
</c:if>



</body>
</html>
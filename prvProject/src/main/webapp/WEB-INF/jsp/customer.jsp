<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Agilin Soft</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<style type="text/css">
p.text {
	position: relative;
	left: 150px;
}
</style>
</head>
<body>
	<div class="main_div">
		<jsp:include page="menu.jsp">
			<jsp:param name="btnNO" value="0"/>
		</jsp:include>
		
		<p class="text">CONTACT US</p><br><br>
		<p class="text">042-472-2904로 문의해 주세요.</p><br><br>
		
		<c:if test="${not empty name}">
			 <p align="center"><b>${name} 님 반갑습니다.</b></p>
		</c:if>
	</div>
</body>
</html>
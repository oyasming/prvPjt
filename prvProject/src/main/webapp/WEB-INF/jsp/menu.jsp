<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<div align="center">
		<a href="/index.do">HOME</a> | 
		<a href="/customer.do">CONTACT US</a> | 
		<a href="/login.do">AGILIN MEMBER</a>
		<c:if test="${not empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.authorities[0] and (sessionScope.SPRING_SECURITY_CONTEXT.authentication.authorities[0] == '0' or sessionScope.SPRING_SECURITY_CONTEXT.authentication.authorities[0] == '1')}">
			 | <a href="/admin.do">ADMIN PAGE</a>
		</c:if>
		<br><br><br>
	</div>
</body>
</html>
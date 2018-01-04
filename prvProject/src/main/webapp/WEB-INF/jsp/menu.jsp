<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Agilin Soft</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<script src="/webjars/jquery/2.2.4/jquery.js"></script>
</head>
<body>
	<div style="position: relative; left: 150px; width: 400px;">
		<br>
		¡¤<a href="/index.do">HOME</a>&nbsp; |&nbsp;
		<a href="/customer.do">CONTACT US</a>&nbsp; |&nbsp;
		<a href="/login.do">AGILIN MEMBER</a>
		<c:if test="${not empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.authorities[0] and (sessionScope.SPRING_SECURITY_CONTEXT.authentication.authorities[0] == '0' or sessionScope.SPRING_SECURITY_CONTEXT.authentication.authorities[0] == '1')}">
			&nbsp; |&nbsp; <a href="/admin.do">ADMIN PAGE</a>
		</c:if>
		<br><hr><br>
	</div>

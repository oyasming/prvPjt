<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Agilin Soft</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<!-- 링크 및 관리자 권한 확인하여 관리자 메뉴 출력 필요 -->
	<jsp:include page="menu.jsp">
		<jsp:param name="btnNO" value="0"/>
	</jsp:include>
	
	CONTACT US<br><br>
	042-472-2904로 문의해 주세요.<br><br>
	
	<c:if test="${not empty name}">
		 ${name} 님 반갑습니다.
	</c:if>
</body>
</html>
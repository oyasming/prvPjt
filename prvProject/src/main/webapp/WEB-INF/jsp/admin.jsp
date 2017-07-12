<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Agilin Soft</title>
</head>
<body>
	<!-- 링크 및 관리자 권한 확인하여 관리자 메뉴 출력 필요 -->
	<a href="/index.do">HOME</a> | <a href="/customer.do">CONTACT US</a> | <a href="/login.do">AGILIN MEMBER</a> | <a href="/admin.do">ADMIN PAGE</a><br><br><br>
	
	관리자 페이지입니다.<br><br>
	<table cellpadding="1">
		<tr>
			<th>이름</th>
			<th>회원아이디</th>
			<th>직책</th>
			<th>등급</th>
		</tr>
		<c:forEach var="data" items="${list}">
			<tr>
				<td>${data.name }</td>
				<td>${data.id }</td>
				<td>${data.position }</td>					
				<td>
					<c:choose>
						<c:when test="${data.authority == '0'}">최고관리자</c:when>
						<c:when test="${data.authority == '1'}">관리자</c:when>
						<c:otherwise>일반</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td><a href="/join.do">회원등록</a></td>
		</tr>
	</table>

	
	<!-- 로그인 시 사용자 이름 표시 필요 -->
</body>
</html>
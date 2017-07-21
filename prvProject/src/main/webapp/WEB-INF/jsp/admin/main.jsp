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
	<jsp:include page="../menu.jsp">
		<jsp:param name="btnNO" value="0"/>
	</jsp:include>
	
	관리자 페이지입니다.<br><br>
	<table cellpadding="1" border="1">
		<tr align="center" bordercolor="000000">
			<th>이름</th>
			<th>회원아이디</th>
			<th>직책</th>
			<th>등급</th>
		</tr>
		<c:forEach var="data" items="${list}">
			<c:if test="${(data.authority == '0' and sessionScope.SPRING_SECURITY_CONTEXT.authentication.authorities == '[0]') or data.authority != '0'}">
				<tr align="center">
					<td align="center">${data.name }</td>
					<td align="center">${data.username }</td>
					<td align="center">${data.position }</td>					
					<td align="center">
						<c:choose>
							<c:when test="${data.authority == '0'}">최고관리자</c:when>
							<c:when test="${data.authority == '1'}">관리자</c:when>
							<c:otherwise>일반</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
	<form action="/join.do">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" value="회원등록"></input>
	</form>

</body>
</html>
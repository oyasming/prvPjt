<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Agilin Soft</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<fmt:parseNumber var="pages" integerOnly="true" value="${list.number / 10}"/>
<fmt:parseNumber var="totalPages" integerOnly="true" value="${list.totalPages / 10}"/>
</head>
<body>
	<!-- 링크 및 관리자 권한 확인하여 관리자 메뉴 출력 필요 -->
	<jsp:include page="../menu.jsp">
		<jsp:param name="btnNO" value="0"/>
	</jsp:include>
	
	<div style="width: 410px;">
	<p align="left">관리자 페이지입니다.</p><br><br>
		<table align="center" cellpadding="1" border="1">
			<tr align="center" bordercolor="000000">
				<th align="center" width="100">이름</th>
				<th align="center" width="100">회원아이디</th>
				<th align="center" width="100">직책</th>
				<th align="center" width="100">등급</th>
			</tr>
			<c:forEach var="data" items="${list.content}">
				<c:if test="${(data.authority == '0' and sessionScope.SPRING_SECURITY_CONTEXT.authentication.authorities == '[0]') or data.authority != '0'}">
					<tr align="center">
						<td align="center"><a href="/edit.do/${data.seq}">${data.name }</a></td>
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
		<br>
		<div align="center">
			<c:forEach begin="0" end="${pages == totalPages ? list.totalPages % 10 - 1 : 9}" var="pageCnt">
				<a href="/admin.do?page=${pageCnt}">[${pageCnt + 1}]</a>
			</c:forEach>
		</div>
		<form action="/join.do" align="right">
			<input type="submit" value="회원등록"></input>
		</form>
		<!-- 
		<ul class="pager">
		    <c:if test="${!list.first}">
		    <li class="previous">
		        <a href="?page=${list.number-1}">&larr; 이전 목록</a>
		    </li>
		    </c:if>
		    <c:if test="${!list.last}">
		    <li class="next">
		        <a href="?page=${list.number+1}">다음 목록 &rarr;</a>
		    </li>
		    </c:if>
		</ul>
		 -->
<%-- 		total : ${list.totalPages}<br>
		${list.number / 10} : ${list.totalPages / 10}<br>
		${pages} : ${totalPages} :: ${list.totalPages % 10}<br> --%>
	</div>
</body>
</html>
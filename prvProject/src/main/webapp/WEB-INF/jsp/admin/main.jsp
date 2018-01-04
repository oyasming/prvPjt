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
<link rel="stylesheet" href="/css/main.css">
<fmt:parseNumber var="pages" integerOnly="true" value="${list.number / 10}"/>
<fmt:parseNumber var="totalPages" integerOnly="true" value="${list.totalPages / 10}"/>
</head>
<body>
	<div class="main_div">
		
		<p style="left: 150px;position: relative;">관리자 페이지입니다.</p><br><br>
		<table class="main_table" cellpadding="1" border="1">
			<tr align="center" bordercolor="000000">
				<th style="text-align: center;width: 100px;">이름</th>
				<th style="text-align: center;width: 100px;">회원아이디</th>
				<th style="text-align: center;width: 100px;">직책</th>
				<th style="text-align: center;width: 100px;">등급</th>
			</tr>
			<c:forEach var="data" items="${list.content}">
				<c:if test="${(data.authority == '0' and sessionScope.SPRING_SECURITY_CONTEXT.authentication.authorities == '[0]') or data.authority != '0'}">
					<tr align="center">
						<td align="left"><a href="/view.do/${data.seq}">&nbsp;${data.name}</a></td>
						<td align="left">&nbsp;${data.username}</td>
						<td align="left">&nbsp;${data.position}</td>					
						<td align="left">
							<c:choose>
								<c:when test="${data.authority == '0'}">&nbsp;최고관리자</c:when>
								<c:when test="${data.authority == '1'}">&nbsp;관리자</c:when>
								<c:otherwise>&nbsp;일반</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
		<br>
		<div align="center" style="position:relative; left: 150px; width: 400px">
			<c:forEach begin="0" end="${pages == totalPages ? list.totalPages % 10 - 1 : 9}" var="pageCnt">
				<a href="/admin.do?page=${pageCnt}">[${pageCnt + 1}]</a>
			</c:forEach>
			<form action="/join.do" align="right">
				<input type="submit" value="회원등록"></input>
			</form>
		</div>
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
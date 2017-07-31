<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Agilin Soft</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<script src="/webjars/jquery/2.2.4/jquery.js"></script>
<script type="text/javascript" src="/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="/js/additional-methods.min.js"></script>
<script type="text/javascript" src="/js/messages_ko.min.js"></script>
<style type="text/css">
p {
	position: relative;
	left: 150px;
	width: 50%;
}
</style>
</head>
<body>
	<div class="main_div">
		<jsp:include page="menu.jsp">
			<jsp:param name="btnNO" value="0"/>
		</jsp:include>
		
		<p><b>·회원등록</b></p><br><br>
		<table class="main_table">
			<tr>
				<td width="120px">회원아이디</td>
				<td width="278px">
					<label>${user.username}</label>
					<input type="hidden" id="seq" name="seq" value="${user.seq}"/>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><label>${user.name}</label></td>
			</tr>
			<tr>
				<td>직책</td>
				<td><label>${user.position}</label></td>
			</tr>
			<tr>
				<td colspan="2"><hr></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><label>${user.phone_no}</label></td>
			</tr>
			<tr>
				<td>휴대전화번호</td>
				<td><label>${user.mobile_no}</label></td>
			</tr>
			<tr>
				<td>E-mail</td>
				<td><label>${user.email}</label></td>
			</tr>
			<tr>
				<td colspan="2"><hr></td>
			</tr>
			<tr>
				<td colspan="2">주소</td>
			</tr>
			<tr>
				<td colspan="2">
					<label style="width: 40px">${user.post1}&nbsp;</label> - <label style="width: 40px">${user.post2}&nbsp;</label>
					<span style="LINE-HEIGHT: 10%"><br></span>
					<label style="width: 398px">${user.address1}&nbsp;</label><br>
					<span style="LINE-HEIGHT: 10%"><br></span>
					<label style="width: 398px">${user.address2}&nbsp;</label>
				</td>
			</tr>
			<tr>
				<td>등급</td>
				<td align="left">
					<c:if test="${user.authority == 0}">
						<label>최고관리자</label>
					</c:if>
					<c:if test="${user.authority == 1}">
						<label>관리자</label>
					</c:if>
					<c:if test="${user.authority == 2}">
						<label>일반</label>
					</c:if>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2"><hr></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button onclick="window.location.href='/edit.do/${seq}';">수정</button>
					<button onclick="window.location.href='/admin.do';">목록</button>
				</td>
			</tr>
		</table>
		<c:if test="${errorMessage != null }">${errorMessage}</c:if>
	</div>
</body>
</html>
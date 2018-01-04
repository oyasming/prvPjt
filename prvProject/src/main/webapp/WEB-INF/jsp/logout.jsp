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
<script src="/webjars/jquery/2.2.4/jquery.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
p {
	position: relative;
	left: 150px;
		
}
</style>
<body>
	<div class="main_div">
		<p>어질인소프트</p><br><br>
		<form action="/logoutProcess.do" method="post">
			<table class="main_table" cellpadding="1">
				<tr align="center">
					<td colspan="2" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>회원아이디 </td>
					<td colspan="2">${username} </td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="로그아웃" height="40px"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<!-- 
				<tr align="center">
					<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>비밀번호</td>
					<td colspan="2"><input id="password" name="password" type="password"/></td>
				</tr>
				 -->
			</table>
		</form>
		<br><br>
		<div style="position: relative;left: 150px; width: 400px;">
			<button id="editUser" name="editUser" onclick="window.location.href='/edit.do/${seq}';">회원정보 수정</button>
		</div>
	</div>
</body>
</html>
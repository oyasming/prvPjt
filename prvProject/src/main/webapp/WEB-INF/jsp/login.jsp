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
</head>
<body>
	<div class="main_div">
		<form action="/login.do" method="post">
			<table class="main_table" cellpadding="1">
				<tr align="left">
					<td colspan="6"><b>어질인소프트</b><br><br></td>
				</tr>
				<tr align="center">
					<td colspan="2" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>회원아이디 </td>
					<td colspan="2"><input id="username" name="username" type="text"/> </td>
					<td rowspan="2"> <input type="submit" value="로그인" height="40px"/></td>
				</tr>
				<tr align="center">
					<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>비밀번호 </td>
					<td colspan="2"><input id="password" name="password" type="password"/> </td>
				</tr>
				<tr>
					<td colspan="6"><br><b>회원로그인안내</b><br>편리한 서비스 이용을 위하여<br>아이디,패스워드 입력 하신 후 로그인 버튼을 눌러주세요.</td>
				</tr>
			</table>
		</form>
		<c:if test="${not empty param.error and param.error == 'bad'}">
			<div style="position: relative;left: 150px;"><br><br>&nbsp;&nbsp;&nbsp;&nbsp;<font color="FF0000" size="4">Id or Password invalid, please verify</font></div>
		</c:if>
		<c:if test="${not empty param.error and param.error == 'db'}">
			<div style="position: relative;left: 150px;"><br><br>&nbsp;&nbsp;&nbsp;&nbsp;<font color="FF0000" size="4">DB Connect Failed</font></div>
		</c:if>
		<c:if test="${not empty param.error and param.error == 'unknown'}">
			<div style="position: relative;left: 150px;"><br><br>&nbsp;&nbsp;&nbsp;&nbsp;<font color="FF0000" size="4">unknown error</font></div>
		</c:if>
	</div>
</body>
</html>
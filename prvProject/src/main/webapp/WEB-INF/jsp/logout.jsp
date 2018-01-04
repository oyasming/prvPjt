<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
p {
	position: relative;
	left: 150px;
		
}
</style>
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

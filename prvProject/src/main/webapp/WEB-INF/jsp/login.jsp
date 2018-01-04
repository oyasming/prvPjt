<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function(){
		 $("#username").focus();
	
	});
</script>
<div class="main_div">
	<form action="/login.do" method="post">
		<table class="main_table" cellpadding="1">
			<tr align="left">
				<td colspan="6"><b>어질인소프트</b><br><br></td>
			</tr>
			<tr align="center">
				<td colspan="2" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>회원아이디 </td>
				<td colspan="2"><input id="username" name="username" type="text" tabindex=1/> </td>
				<td rowspan="2"> <input type="submit" value="로그인" height="40px" tabindex=3/></td>
			</tr>
			<tr align="center">
				<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>비밀번호 </td>
				<td colspan="2"><input id="password" name="password" type="password" tabindex=2/> </td>
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

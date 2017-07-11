<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Agilin Soft</title>
</head>
<body>
	<!-- 링크 및 관리자 권한 확인하여 관리자 메뉴 출력 필요 -->
	<a href="/index.do">HOME</a> | <a href="/customer.do">CONTACT US</a> | <a href="/login.do">AGILIN MEMBER</a><br><br><br>
	
	어질인소프트<br><br>
	<form action="loginAction.do" name="loginAction">
		<table cellpadding="1">
			<tr align="center">
				<td colspan="2" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>회원아이디 </td>
				<td colspan="2"><input name="id" type="text"/> </td>
				<td rowspan="2"> <input type="submit" value="로그인" height="40px"/></td>
			</tr>
			<tr align="center">
				<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>비밀번호 </td>
				<td colspan="2"><input name="pw" type="password"/> </td>
			</tr>
			<tr>
				<td colspan="6"><br><b>회원로그인안내</b><br>편리한 서비스 이용을 위하여<br>아이디,패스워드 입력 하신 후 로그인 버튼을 눌러주세요.</td>
			</tr>
		</table>
	</form>
	
	<!-- 로그인 시 사용자 이름 표시 필요 -->
</body>
</html>
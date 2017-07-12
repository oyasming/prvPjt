<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Agilin Soft</title>
</head>
<body>
	<!-- 링크 및 관리자 권한 확인하여 관리자 메뉴 출력 필요 -->
	<a href="/index.do">HOME</a> | <a href="/customer.do">CONTACT US</a> | <a href="/login.do">AGILIN MEMBER</a> | <a href="/admin.do">ADMIN PAGE</a><br><br><br>
	
	<font size="10"><b>·회원등록</b></font><br><br>
	<form action="/joinUser.do" name="join_form">
		<table cellpadding="1">
			<tr align="right">
				<td>회원아이디</td>
				<td colspan="2"><input type="text" id="id" name="id"/></td>
				<td>중복확인</td>
			</tr>
			<tr align="right">
				<td>비밀번호</td>
				<td colspan="2"><input type="text" id="pw" name="pw"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr align="right">
				<td>비밀번호 재확인</td>
				<td colspan="2"><input type="text" name="pw_re"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr align="right">
				<td>이름</td>
				<td colspan="2"><input type="text" id="name" name="name"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr align="right">
				<td>직책</td>
				<td colspan="2"><input type="text" id="position" name="position"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr align="right">
				<td>등급</td>
				<td colspan="2" align="left">
					<select id="authority" name="authority">
						<option value="1" selected="selected">관리자</option>
						<option value="2">일반</option>
					</select>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4" align="center"><input type="submit" value="저장"/></td>
			</tr>
		</table>
	</form>
	
	<!-- 로그인 시 사용자 이름 표시 필요 -->
</body>
</html>
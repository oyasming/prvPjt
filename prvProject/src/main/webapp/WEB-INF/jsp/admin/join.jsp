<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Agilin Soft</title>
</head>
<body>
	<jsp:include page="../menu.jsp">
		<jsp:param name="btnNO" value="0"/>
	</jsp:include>
	
	<font size="8"><b>·회원등록</b></font><br><br>
	<form action="/joinUser.do" method="post" name="join_form">
		<table cellpadding="1">
			<tr align="right">
				<td>회원아이디</td>
				<td colspan="2"><input type="text" id="username" name="username"/></td>
				<td>중복확인</td>
			</tr>
			<tr align="right">
				<td>비밀번호</td>
				<td colspan="2"><input type="password" id="password" name="password"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr align="right">
				<td>비밀번호 재확인</td>
				<td colspan="2"><input type="password" name="pw_re"/></td>
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
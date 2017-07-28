<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Agilin Soft</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<!-- 링크 및 관리자 권한 확인하여 관리자 메뉴 출력 필요 -->
	<jsp:include page="menu.jsp">
		<jsp:param name="btnNO" value="0"/>
	</jsp:include>
		
	Agilin Soft Home에 오신걸 환영합니다.<br><br>
	
	<!-- 
	${sessionScope.SPRING_SECURITY_CONTEXT.authentication.name}<br>
	================================<br>
	${sessionScope.SPRING_SECURITY_CONTEXT.authentication.authorities}<br>
	================================<br>
	<%=session.getAttribute("username") %>
	<br>
	==============================================<br>
	<%=session.getAttribute("SPRING_SECURITY_CONTEXT")%>
<%
 java.util.Enumeration enum1 = request.getAttributeNames();
 for (; enum1.hasMoreElements(); ) {
  String name = (String)enum1.nextElement();
  out.println(name + " : " + request.getAttribute(name));
  out.println("<BR>");
 }
 out.println("모든 session 값 출력");
    out.println("<BR>");
    if (session != null) {
        enum1 = session.getAttributeNames();
        for (; enum1.hasMoreElements(); ) {
            // key값 얻기
            String name = (String)enum1.nextElement();
            // 해당 key의 value얻기
            out.println(name + " : " + session.getAttribute(name));
            out.println("<BR>");
        }
    }
 %>
	 -->


	<!-- 로그인 시 사용자 이름 표시 필요 -->
	<c:if test="${not empty name}">
		 ${name} 님 반갑습니다.
	</c:if>
</body>
</html>
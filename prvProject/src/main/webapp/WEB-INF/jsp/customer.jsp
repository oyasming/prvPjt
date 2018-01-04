<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
p.text {
	position: relative;
	left: 150px;
}
</style>
<div class="main_div">
	<p class="text">CONTACT US</p><br><br>
	<p class="text">042-472-2904로 문의해 주세요.</p><br><br>
	
	<c:if test="${not empty name}">
		 <p align="center"><b>${name} 님 반갑습니다.</b></p>
	</c:if>
</div>

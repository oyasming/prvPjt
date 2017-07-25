<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Agilin Soft</title>
</head>
<script src="/webjars/jquery/2.2.4/jquery.js"></script>
<script type="text/javascript" src="/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="/js/additional-methods.min.js"></script>
<script type="text/javascript" src="/js/messages_ko.min.js"></script>
<script>
$(document).ready(function(){
	$('#username').blur( function() {
        var username = $("#username").val();
        $.ajax({
            url:'/duplicateUsernameCheck.do',
        	dataType:"json",
            type:'POST',
            data:{'username':username},
            success:function(data){
                //alert("result : " + result.data.result);
            	if(data.length==0){
            		alert("조회 오류");
            	}else{
	            	if (data.result == "true") {
	            		//alert("이미 존재하는 ID 입니다.");
	            		$("font#duplicateCheck").css("color", "red");
	            		$("font#duplicateCheck").html("이미 존재하는 ID 입니다.");
	            	} else {
	            		//alert("사용 가능한 ID 입니다.");
	            		$("font#duplicateCheck").css("color", "blue");
	            		$("font#duplicateCheck").html("사용 가능한 ID 입니다.");
	            	}
            	}
            },
            error: function (request,status,error) {
            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });
    });


	$.validator.methods.passwordRule = function( value, element ) {
	  return this.optional( element ) || /^(?=.*\d)(?=.*[a-zA-Z])(?=.*[\d!@@#$%^&amp;+=]).*$/.test( value );
	}
    $("form").validate({
   		//validation이 끝난 이후의 submit 직전 추가 작업할 부분
		submitHandler: function() {
			var f = confirm("회원등록을 완료하겠습니까?");
            if(f){
                return true;
            } else {
                return false;
            }
        },
        //규칙
        rules: {
            username: {
                required : true
                //,minlength : 5,
                //,remote: "/duplicateUsernameCheck.do"
            },
            password: {
                required : true,
                minlength : 9,
                passwordRule : true
            },
            password_re: {
                required : true,
                minlength : 9,
                passwordRule : true,
                equalTo : password
            },
            name: {
                //required : true,
                minlength : 2
            },
            position: {
                required : true,
                minlength : 2
            }
        },
        //규칙체크 실패시 출력될 메시지
        messages : {
            username: {
                required : "필수로입력하세요",
                //minlength : "최소 {0}글자이상이어야 합니다",
                remote : "존재하는 아이디입니다" // TODO
            },
            password: {
                required : "필수로입력하세요",
                minlength : "최소 {0}글자이상이어야 합니다",
                passwordRule : "영문과 숫자를 조합하여 주십시오."
            },
            password_re: {
                required : "필수로입력하세요",
                minlength : "최소 {0}글자이상이어야 합니다",
                passwordRule : "영문과 숫자를 조합하여 주십시오.",
                equalTo : "비밀번호가 일치하지 않습니다."
            },
            name: {
                //required : "필수로입력하세요",
                minlength : "최소 {0}글자이상이어야 합니다"
            },
            position: {
                required : "필수로입력하세요",
                minlength : "최소 {0}글자이상이어야 합니다"
            }
        }    		
    });
});
</script>
<body>
	<jsp:include page="../menu.jsp">
		<jsp:param name="btnNO" value="0"/>
	</jsp:include>
	
	<font size="8"><b>·회원등록</b></font><br><br>
	<form action="/joinUser.do" method="post" name="join_form">
		<table cellpadding="1">
			<tr>
				<td>회원아이디</td>
				<td colspan="2">
					<input type="text" id="username" name="username" required="required"/>
					<input type="hidden" id="seq" name="seq"/>
					<font id="duplicateCheck" name="duplicateCheck" ></font>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td colspan="2"><input type="password" id="password" name="password" required="required"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>비밀번호 재확인</td>
				<td colspan="2"><input type="password" name="password_re" id="password_re" required="required"/></td>
				<td>&nbsp; </td>
			</tr>
			<tr>
				<td>이름</td>
				<td colspan="2"><input type="text" id="name" name="name"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>직책</td>
				<td colspan="2"><input type="text" id="position" name="position" required="required"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
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
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Agilin Soft</title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="/js/additional-methods.min.js"></script>
<script type="text/javascript" src="/js/messages_ko.min.js"></script>
<script>
$(function(){
	$('#nameCheck').click( function() {
        var username = $("#username").val();
    // 사용자가 getResult 버튼을 눌렀을 때 텍스트 노드에 있는 결과값을 지워준다.
        $.ajax({
            url:'/duplicateUsernameCheck.do',
            dataType:'String',
        // 서버가 리턴해주는 데이터 타입이 json이다.
            type:'POST',
            data:{'username':username},
        // data 속성 내부에 또다른 {}가 있다. 중괄호 내부는 객체이다.
            // data: 서버에 전송할 데이터로서 값은 key와 value로 이루어진 객체
            success:function(result){
    // 인자 result에는 서버에서 리턴해준 배열이 들어감
            // 배열이 들어온 이유는 dataType속성을 JSON으로 했기 때문에 리턴되는 데이터가 텍스트더라도 내부적으로 그 데이터를 
            // JSON으로 해석하여 배열로 변환
            // 그래서 배열에 있는 result값을 체크하면 result가 true라면 성공 이벤트 관련 로직을 출력한다.
            // 서버와의 통신이 성공하면 호출되는 이벤트 핸들러인 function(result)
            // result 인자에는 서버가 리턴해주는 데이터가 들어감
            	$('#feedback').html(result);
                alert("result : " + result);
    //result['result']는 연상 배열인가 확인하자
            },
            error: function (e) {

            	$('#feedback').html(e);

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
                //minlength : 5,
                //remote: "/check_id.jsp"
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
				</td>
				<td><button id="nameCheck" type="button">중복확인</button></td>
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
	<font id='feedback' color="blue">
	</font>
	<table>
		<c:forEach var="data" items="${bindingError}">
			<tr align="center">
				<td align="center">${data.objectName }</td>
				<td align="center">${data.defaultMessage }</td>
			</tr>
		</c:forEach>
	</table>
	<!-- 로그인 시 사용자 이름 표시 필요 -->
</body>
</html>
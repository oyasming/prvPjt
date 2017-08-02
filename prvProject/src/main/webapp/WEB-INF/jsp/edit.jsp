<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Agilin Soft</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<script src="/webjars/jquery/2.2.4/jquery.js"></script>
<script type="text/javascript" src="/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="/js/additional-methods.min.js"></script>
<script type="text/javascript" src="/js/messages_ko.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style type="text/css">
.edit_input {
	width: 248px;
}
</style>
<script>
$(document).ready(function(){
	$('#findAddress').click(function () {
	    var width = 500; //팝업창이 실행될때 위치지정
	    var height = 600; //팝업창이 실행될때 위치지정
	    new daum.Postcode({
	        width : width, //팝업창이 실행될때 위치지정
	        height : height, //팝업창이 실행될때 위치지정
	        oncomplete: function(data) {
	        	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('post').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('address2').focus();
	        }
	    }).open({
	        left : (window.screen.width / 2) - (width / 2), //팝업창이 실행될때 위치지정
	        top : (window.screen.height / 2) - (height / 2) //팝업창이 실행될때 위치지정
	    });
	});


	$.validator.methods.emailRule = function( value, element ) {
		return this.optional( element ) || /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/.test( value );
	}
	$.validator.methods.passwordRule = function( value, element ) {
		return this.optional( element ) || /^(?=.*\d)(?=.*[a-zA-Z])(?=.*[\d!@@#$%^&amp;+=]).*$/.test( value );
	}
	$.validator.methods.phoneRule = function( value, element ) {
		return this.optional( element ) || /^\d{2,3}-\d{3,4}-\d{4}$/.test( value );
	}
	$.validator.methods.mobileRule = function( value, element ) {
		return this.optional( element ) || /^01\d{1}-\d{3,4}-\d{4}$/.test( value );
	}
    $("form").validate({
   		//validation이 끝난 이후의 submit 직전 추가 작업할 부분
		submitHandler: function() {
			var f = confirm("회원정보 수정을 완료하겠습니까?");
            if(f){
                return true;
            } else {
                return false;
            }
        },
        errorPlacement: function(error, element) {
			error.insertAfter(element);
			$('#br').insertAfter(element);
       },
        //규칙
        rules: {
            password: {
                required : false,
                minlength : 9,
                passwordRule : true
            },
            password_re: {
                required : false,
                minlength : 9,
                passwordRule : true,
                equalTo : password
            },
            name: {
                required : true,
                minlength : 2
            },
            position: {
                required : true,
                minlength : 2
            },
            phone_no: {
                //required : true,
            	phoneRule : true
            },
            mobile_no: {
                required : true,
            	mobileRule : true
            },
            email: {
                required : true,
            	emailRule : true
            }
        },
        //규칙체크 실패시 출력될 메시지
        messages : {
            password: {
                required : "필수로 입력하세요",
                minlength : "최소 {0}글자이상이어야 합니다",
                passwordRule : "영문과 숫자를 조합하여 주십시오."
            },
            password_re: {
                required : "필수로 입력하세요",
                minlength : "최소 {0}글자이상이어야 합니다",
                passwordRule : "영문과 숫자를 조합하여 주십시오.",
                equalTo : "비밀번호가 일치하지 않습니다."
            },
            name: {
                required : "필수로 입력하세요",
                minlength : "최소 {0}글자이상이어야 합니다"
            },
            position: {
                required : "필수로 입력하세요",
                minlength : "최소 {0}글자이상이어야 합니다"
            },
            phone_no: {
                //required : "필수로 입력하세요",
            	phoneRule : "올바른 번호가 아닙니다."
            },
            mobile_no: {
                required : "필수로 입력하세요",
            	mobileRule : "올바른 번호가 아닙니다."
            },
            email: {
                required : "필수로 입력하세요",
            	emailRule : "올바른 email 주소가 아닙니다."
            }
        }	
    });
    
    var autoHypenPhone = function(str){
    	str = str.replace(/[^0-9]/g, '');
    	var tmp = '';
    	if( str.length < 4){
    		return str;
    	}else if(str.length < 7){
    		tmp += str.substr(0, 3);
    		tmp += '-';
    		tmp += str.substr(3);
    		return tmp;
    	}else if(str.length < 11 && str.substr(0,2) == "02"){
    		tmp += str.substr(0, 2);
    		tmp += '-';
    		tmp += str.substr(2, 4);
    		tmp += '-';
    		tmp += str.substr(6);
    		return tmp;
    	}else if(str.length < 11){
    		tmp += str.substr(0, 3);
    		tmp += '-';
    		tmp += str.substr(3, 3);
    		tmp += '-';
    		tmp += str.substr(6);
    		return tmp;
    	}else{
    		tmp += str.substr(0, 3);
    		tmp += '-';
    		tmp += str.substr(3, 4);
    		tmp += '-';
    		tmp += str.substr(7);
    		return tmp;
    	}
    	return str;
    };
    
    $('#phone_no').change(function (){
    	$(this).val(autoHypenPhone($(this).val()));
    });
    
    $('#mobile_no').change(function (){
    	$(this).val(autoHypenPhone($(this).val()));
    });
});
</script>
</head>
<body>
	<div class="main_div">
		<jsp:include page="menu.jsp">
			<jsp:param name="btnNO" value="0"/>
		</jsp:include>
		
		<form action="/edit.do/${user.seq}" method="post" name="edit_form">
			<table class="main_table" cellpadding="1">
				<tr>
					<td colspan="2" align="left"><p><b>·회원등록</b></p><br></td>
				</tr>
				<tr>
					<td width="150px">·회원아이디</td>
					<td width="248px">
						<label>${user.username}</label>
						<input type="hidden" id="username" name="username" readonly="readonly" value="${user.username}"/>
						<input type="hidden" id="seq" name="seq" value="${user.seq}"/>
						<br><font id="duplicateCheck" name="duplicateCheck" ></font>
					</td>
				</tr>
				<tr>
					<td>·비밀번호</td>
					<td><input type="password" class="edit_input" id="password" name="password"/></td>
				</tr>
				<tr>
					<td>·비밀번호 재확인</td>
					<td><input type="password" class="edit_input" name="password_re" id="password_re"/></td>
				</tr>
				<tr>
					<td>·이름</td>
					<td><input type="text" class="edit_input" id="name" name="name" value="${user.name}" required="required"/></td>
				</tr>
				<tr>
					<td>·직책</td>
					<td><input type="text" class="edit_input" id="position" name="position" required="required" value="${user.position}"/></td>
				</tr>
				<tr>
					<td colspan="2"><hr></td>
				</tr>
				<tr>
					<td>·전화번호</td>
					<td><input type="text" class="edit_input" id="phone_no" name="phone_no" value="${user.phone_no}"/></td>
				</tr>
				<tr>
					<td>·휴대전화번호</td>
					<td><input type="text" class="edit_input" id="mobile_no" name="mobile_no" value="${user.mobile_no}"  required="required"/></td>
				</tr>
				<tr>
					<td>·E-mail</td>
					<td><input type="text" class="edit_input" id="email" name="email" value="${user.email}"  required="required"/></td>
				</tr>
				<tr>
					<td colspan="2"><hr></td>
				</tr>
				<tr>
					<td colspan="2">·주소</td>
				</tr>
				<tr>
					<td colspan="2">
						<input id="post" readonly="" size="5" name="post" value="${user.post}">
						<input id="findAddress" type="button" value="우편번호찾기"><br>
						<span style="LINE-HEIGHT: 10%"><br></span>
						<input id="address1" readonly="" style="width: 398px" name="address1" placeholder="기본 주소" value="${user.address1}"><br>
						<span style="LINE-HEIGHT: 10%"><br></span>
						<input id="address2" style="width: 398px" name="address2" placeholder="상세 주소" value="${user.address2}">
					</td>
				</tr>
				<tr>
					<td>·등급</td>
					<td align="left">
						<c:choose>
							<c:when test="${user.authority == 0}">
								<input type="hidden" value="0" id="authority" name="authority"/>최고관리자
							</c:when>
							<c:when test="${user.authority == 1}">
								<select id="authority" name="authority">
									<c:if test="${user.authority == 1}">
										<option value="1" selected="selected">관리자</option>
										<option value="2">일반</option>
									</c:if>
									<c:if test="${user.authority == 2}">
										<option value="1">관리자</option>
										<option value="2" selected="selected">일반</option>
									</c:if>
								</select>
							</c:when>
							<c:otherwise>
								<input type="hidden" value="2" id="authority" name="authority"/>일반
							</c:otherwise>
						</c:choose>
					</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2"><hr></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="저장"/>
						<button type="button" onclick="window.location.href='/admin.do';">목록</button>
					</td>
				</tr>
			</table>
		</form>
		<c:if test="${errorMessage != null }">${errorMessage}</c:if>
	</div>
	<br id="br">
</body>
</html>
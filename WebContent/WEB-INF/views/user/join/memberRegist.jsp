<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="images/icons/favicon.ico">
<link rel="apple-touch-icon" href="images/icons/favicon.png">
<link rel="apple-touch-icon" sizes="72x72" href="images/icons/favicon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="images/icons/favicon-114x114.png">
<!--Loading bootstrap css-->
<link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,700">
<link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Oswald:400,700,300">
<link type="text/css" rel="stylesheet" href="styles/jquery-ui-1.10.4.custom.min.css">
<link type="text/css" rel="stylesheet" href="styles/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="styles/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="styles/animate.css">
<link type="text/css" rel="stylesheet" href="styles/all.css">
<link type="text/css" rel="stylesheet" href="styles/main.css">
<link type="text/css" rel="stylesheet" href="styles/style-responsive.css">
<link type="text/css" rel="stylesheet" href="styles/zabuto_calendar.min.css">
<link type="text/css" rel="stylesheet" href="styles/pace.css">
<link type="text/css" rel="stylesheet" href="styles/jquery.news-ticker.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/common/validation.js"></script>
<script type="text/javascript">
var isIdCheck = false;
$(function(){
	
	$('form[name=memberRegForm]').submit(function(){
		
		if(!isIdCheck){
			alert('ID 중복확인을 해 주세요.');
			return false;
		}
		
		var isReturn = false
		
		$('form[name=memberRegForm]').find('input').each(function(){
			if($(this).attr('type') != 'file'){
				if($(this).val() == '') {
					isReturn = true;
					alert('빈 항목이 존재합니다.');
					$(this).focus();
					return false;
				}
			}
		})
		
		if(eval(isReturn)){
			return false;
		}
		
		if(!$('#mem_id').val().validationID() ){
			alert('아이디 형식이 올바르지 않습니다. 영문 1자 + 숫자 3자로 조합하여야 합니다.');
			$('#mem_id').focus();
			return false;
		}
		
		if(!$('#mem_pass').val().validationPWD()) {
			alert('패스워드 형식이 올바르지 않습니다. 영/숫자 조합 4자리 이상 8자리 이하로 조합하여야 합니다.');
			$('#mem_pass').focus();
			return false;
		}
		
		if($('#mem_pass').val() != $('#mem_pass_confirm').val()){
			alert('비밀번호가 일치하지 않습니다.');
			$('#mem_pass').focus();
			return false;
		}
		
		if(!$('#mem_name').val().validationNM()) {
			alert('이름이 올바르지 않습니다.');
			$('#mem_name').focus();
			return false;
		}
		
		var regno = $('#mem_regno1').val() + '-' + $('#mem_regno2').val();
		
		if(!regno.validationREGNO()) {
			alert('주민등록번호가 유효하지 않습니다.');
			return false;
		}
		
		if(!$('#mem_bir').val().validationDATE()) {
			alert('생년월일 형식이 올바르지 않습니다.');
			$('#mem_bir').focus();
			return false;
		}
		
		if(!$('#mem_hometel').val().validationHOMETEL()){
			alert('집 전화번호 형식이 올바르지 않습니다.');
			$('#mem_hometel').focus();
			return false;
		}
		
		if(!$('#mem_hp').val().validationHP()) {
			alert('휴대폰 번호 형식이 올바르지 않습니다.');
			$('#mem_hp').focus();
			return false;
		}
		
		if(!$('#mem_mail').val().validationMAIL()){
			alert('이메일 형식이 올바르지 않습니다. 영문자 1자 + 숫자 3자로 조합하여야 합니다.');
			$('#mem_mail').focus();
			return false;
		}
		
		$(this).append($('<input type="hidden" name="mem_id" value="' + $('#mem_id').val() +'" />'));
		$(this).append($('<input type="hidden" name="mem_add1" value="' + $('#mem_add1').val() +'" />'));
		$(this).append($('<input type="hidden" name="mem_zipcode" value="' + $('#mem_zipcode').val() +'" />'));
		
		return true;
	});
	
	$('#checkMemId').click(function(){
		$.ajax({
			type		: 'post'
			, url		: '/user/join/idCheck.do'
			, data		: { 'mem_id':$('#mem_id').val() }
			, dataType	: 'json'
			, error		: function(result){
				console.log(result.status);
			}, success	: function(data){
				if(data.flag == 'ok'){
					isIdCheck = true;
					alert('사용 가능한 아이디입니다.');
					$('#mem_id').attr('disabled', 'disabled');
					$('#checkMemId').attr('disabled', 'disabled');
				} else {
					isIdCheck = false;
					alert('사용이 불가한 아이디입니다.');
				}
			}
			
		});
	});
	
	$('#zipcodeBTN').on('click', function(){
		var url = '/popup/zipcode/zipcodeSearchForm.do';
		var options = 'width=400px, height=400px, resizable=no, scrollbars=no, copyhistory=no';
		window.open(url, '우편번호검색', options);
	}); 
});
</script>
</head>
<body>
	<div class="panel panel-orange">
	    <div class="panel-heading">
	        Registration form</div>
	    <div class="panel-body pan">
	        <form name="memberRegForm" action="/user/member/insertMember.do" method="post" enctype="multipart/form-data">
	        <div class="form-body pal">
	        	<span>아이디</span>
<!-- 	            <div class="form-group"> -->
<!-- 	                <div class="input-icon right"> -->
<!-- 	                    <i class="fa fa-user"></i> -->
<!-- 	                    <input id="inputId" name="mem_id" type="text" placeholder="ID" class="form-control" /></div> -->
<!-- 	            </div> -->
	            <div class="row">
	                <div class="col-md-9">
	                    <div class="form-group">
	                    <input id="mem_id" name="mem_id" type="text" placeholder="ID" class="form-control" /></div>
	                </div>
	                <div class="col-md-3">
	                    <div class="form-group">
	                    <input type="button" id="checkMemId" value="아이디 중복검사" class="form-control"/>
	                </div>
	            </div>
	            
	            
	            <span>패스워드</span>
	            <div class="form-group">
	                <div class="input-icon right">
	                    <i class="fa fa-lock"></i>
	                    <input id="mem_pass" name="mem_pass" type="password" placeholder="Password" class="form-control" /></div>
	            </div>
	            <span>패스워드 확인</span>
	            <div class="form-group">
	                <div class="input-icon right">
	                    <i class="fa fa-lock"></i>
	                    <input id="mem_pass_confirm" type="password" placeholder="Confirm Password" class="form-control" /></div>
	            </div>
	            <hr />
	            <div class="row">
	                <div class="col-md-8" style="padding:0;">
	                    <div class="form-group" style="margin:0 0 0 15px;">
	                    <span>아이디</span></div>
	                </div>
	                <div class="col-md-4" style="padding:0;">
	                    <div class="form-group" style="margin:0 0 0 20px;">
	                    <span>프로필 사진</span></div>
	                </div>
	            </div>
	            <div class="row">
	                <div class="col-md-8">
	                    <div class="form-group">
	                        <input id="mem_name" name="mem_name" type="text" placeholder="이름" class="form-control" /></div>
	                </div>
	                <div class="col-md-4">
	                    <div class="form-group">
	                        <input id="inputFile" name="file" type="file" class="form-control" value="프로필사진"/></div>
	                </div>
	            </div>
	            
	            <span>주민등록번호</span>    
            	<div class="row">
	                <div class="col-md-6">
	                    <div class="form-group">
	                        <input id="mem_regno1" name="mem_regno1" type=text placeholder="주민번호 앞자리" class="form-control" /></div>
	                </div>
	                <div class="col-md-6">
	                    <div class="form-group">
	                        <input id="mem_regno2" name="mem_regno2" type="password" placeholder="주민번호 뒷자리" class="form-control" /></div>
	                </div>
	            </div>
	            
	            <span>생년월일</span>
	            <div class="form-group">
	                <div class="input-icon right">
	                	<i class="fa fa-calendar"></i>
	                    <input id="mem_bir" name="mem_bir" type="date" placeholder="your BirthDay" class="form-control" /></div>
	            </div>
	            
	            <div class="row">
	                <div class="col-md-2">
	                    <div class="form-group">
	                        <input id="zipcodeBTN" type=button class="form-control" value="우편번호찾기" /></div>
	                </div>
	                <div class="col-md-2">
	                    <div class="form-group">
	                        <input id="mem_zipcode" name="mem_zipcode" type="text" placeholder="우편번호" class="form-control" disabled="disabled"/></div>
	                </div>
	                <div class="col-md-4">
	                    <div class="form-group">
	                        <input id="mem_add1" name="mem_add1"type="text" placeholder="주소" class="form-control" disabled="disabled"/></div>
	                </div>
	                <div class="col-md-4">
	                    <div class="form-group">
	                        <input id="mem_add2" name="mem_add2" type="text" placeholder="상세주소" class="form-control" /></div>
	                </div>
	            </div>
	            
	            <span>집 전화번호</span>
	            <div class="form-group">
	                <div class="input-icon right">
	                	<i class="fa fa-phone"></i>
	                    <input id="mem_hometel" name="mem_hometel" type="text" placeholder="Home Telephone" class="form-control" /></div>
	            </div>
	            
	            <span>휴대폰 번호</span>
	            <div class="form-group">
	                <div class="input-icon right">
	                	<i class="fa fa-phone"></i>
	                    <input id="mem_hp" name="mem_hp" type="text" placeholder="your CellPhone" class="form-control" /></div>
	            </div>
	            
	            <span>이메일</span>
	            <div class="form-group">
	                <div class="input-icon right">
	                    <i class="fa fa-envelope"></i>
	                    <input id="mem_mail" name="mem_mail" type="email" placeholder="Email address" class="form-control" /></div>
	            </div>
	            
	        </div>
	        <div class="form-actions text-right pal">
	            <button type="submit" class="btn btn-primary">
	                Submit</button>
	        </div>
	        </form>
	    </div>
	</div>
</body>
</html>
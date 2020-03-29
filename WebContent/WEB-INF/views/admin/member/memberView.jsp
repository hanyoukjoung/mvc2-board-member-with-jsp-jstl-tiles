<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원상세정보</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/js/common/validation.js"></script>
<script type="text/javascript">
$(function(){
	setting();
	
	$('#updateMember').click(function(){
		if(!$('input[name=mem_pass]').val().validationPWD()){
			alert('비밀번호 형식이 맞지 않습니다.');
			return false;
		}
		
		if($('input[name=mem_pass]').val() != $('input[name=mem_pass_confirm]').val()){
			alert('비밀번호 확인이 올바르지 않습니다.');
			return false;
		}
		
		var mem_mail = $('input[name=mem_mail1]').val() + '@' + $('input[name=mem_mail2]').val();
		
		if(mem_mail.validationMAIL2()){
			alert('이메일 형식이 올바르지 않습니다.');
			return false;
		}
		
		var mem_hp = $('select[name=mem_hp1]').val() + '-' + $('input[name=mem_hp2]').val() + '-' + $('input[name=mem_hp3]').val();
		
		if(!mem_hp.validationHP()){
			alert('연락처 형식이 올바르지 않습니다.');
			return false;
		}
		
		if(!$('input[name=mem_bir]').val().validationDATE()){
			alert('생년월일 형식이 올바르지 않습니다.');
			return false;
		}
		
		$('form[name=updateMemberForm]').append($('<input type="hidden" name="mem_id" value="${memberInfo.mem_id}" />'));
		$('form[name=updateMemberForm]').append($('<input type="hidden" name="mem_mail" value="' + mem_mail + '" />'));
		$('form[name=updateMemberForm]').append($('<input type="hidden" name="mem_hp" value="' + mem_hp + '" />'));
		$('form[name=updateMemberForm]').append($('<input type="hidden" name="mem_zipcode" value="' + $('#mem_zipcode').val() + '" />'));
		$('form[name=updateMemberForm]').append($('<input type="hidden" name="mem_add1" value="' + $('#mem_add1').val() + '" />'));
		
		$('form[name=updateMemberForm]').submit();
		
	});
	
	$('#zipcodeBTN').on('click', function(){
		var url = '/popup/zipcode/zipcodeSearchForm.do';
		var options = 'width=400px, height=400px, resizable=no, scrollbars=no, copyhistory=no';
		window.open(url, '우편번호검색', options);
	}); 
});

function setting(){
	$('.mem_name').text('${memberInfo.mem_name}');
	$('.mem_id').text('${memberInfo.mem_id}');
	
	var mem_mail1 = '${memberInfo.mem_mail}'.split('@', 2)[0];
	var mem_mail2 = '${memberInfo.mem_mail}'.split('@', 2)[1];
	
	$('input[name=mem_mail1]').val(mem_mail1);
	$('input[name=mem_mail2]').val(mem_mail2);
	
	var mem_hp1 = '${memberInfo.mem_hp}'.split('-')[0];
	var mem_hp2 = '${memberInfo.mem_hp}'.split('-')[1];
	var mem_hp3 = '${memberInfo.mem_hp}'.split('-')[2];
	
	$('input[name=mem_hp1]').val(mem_hp1);
	$('input[name=mem_hp2]').val(mem_hp2);
	$('input[name=mem_hp3]').val(mem_hp3);
	
	$('input[name=mem_bir]').val('${memberInfo.mem_bir}'.split(' ')[0]);
	
	$('input[name=mem_zipcode]').val('${memberInfo.mem_zipcode}');
	$('input[name=mem_add1]').val('${memberInfo.mem_add1}');
	$('input[name=mem_add2]').val('${memberInfo.mem_add2}');
	
}
</script>
</head>
<!-- <body onload="setInitContents();"> -->
<body>
<div class="wrap">	
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="30">&nbsp;</td>
			<td width="790">
				<div id="container">
					<div class="title">회원정보</div>
					<form method="post" name="updateMemberForm" action="/admin/member/updateMember.do">
						<table border="0" cellspacing="1" cellpadding="1">
							<tr>
								<th><span class="r">*</span>이름</th>
								<td><label class="mem_name"></label></td>
							</tr>
							<tr>
								<th><span class="r">*</span>아이디</th>
								<td><label class="mem_id"></label></td>
							</tr>
							<tr>
								<th><span class="r">*</span>비밀번호</th>
								<td><input name="mem_pass" type="password" id="mem_pass" size="20" /></td>
							</tr>
							<tr>
								<th><span class="r">*</span>비밀번호 확인</th>
								<td><input name="mem_pass_confirm" type="password" id="mem_pass_confirm" size="20" /></td>
							</tr>
							<tr>
								<th>이메일 주소</th>
								<td>
									<input name="mem_mail1" type="text" id="mem_mail1" size="20" />@
									<input name="mem_mail2" type="text" id="mem_mail2" size="20" /> 
								</td>
							</tr>
							<tr>
								<th>거주지</th>
								<td>
									<button type="button" id="zipcodeBTN" >우편번호검색</button>
									<input type="text" id="mem_zipcode" name="mem_zipcode" disabled="disabled">
									<input type="text" id="mem_add1" name="mem_add1" disabled="disabled" />
									<input type="text" id="mem_add2" name="mem_add2" />
								</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td><select style="width: 100px;" name="mem_hp1">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select> - 
									<input name="mem_hp2" type="text" id="mem_hp2" size="20" /> - 
									<input name="mem_hp3" type="text" id="mem_hp3" size="20" />
								</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td>
									<input type="date" name="mem_bir" />
								</td>
							</tr>
						</table>
						<div style="float: right;">
							<input class="btn2" type="button" value="변경내용 저장" id="updateMember"/>
							<input class="btn2" type="button" value="취소" onclick="setting();"/>
						</div>
					</form>
				</div>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.fieldName {text-align: center; background-color: #f4f4f4;}
.tLine {background-color: #d2d2d2; height: 1px;}
.btnGroup { text-align: right; }
td {text-align: left; }
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/common/validation.js"></script>
<script type="text/javascript">
	$(function(){
		$.ajax({
			type		: 'post'
			, url		: '/user/member/loadMemberFile.do'
			, data		: { 'mem_id':'${LOGIN_MEMBERINFO.mem_id}' }
			, dataType	: 'json'
			, error		: function(result){
				console.log(result.status);
			}, success	: function(data){
				if(eval(data.flag)){
					$('#member-profile-img').attr('src', '/files/' + data.file_save_name);
				}
			}
		});
		
		var homeTel1 = '${memberInfo.mem_hometel}'.split('-', 3)[0];
		var homeTel2 = '${memberInfo.mem_hometel}'.split('-', 3)[1];
		var homeTel3 = '${memberInfo.mem_hometel}'.split('-', 3)[2];
		
		var hp1 = '${memberInfo.mem_hp}'.split('-', 3)[0];
		var hp2 = '${memberInfo.mem_hp}'.split('-', 3)[1];
		var hp3 = '${memberInfo.mem_hp}'.split('-', 3)[2];
		
		var mail1 = '${memberInfo.mem_mail}'.split('@', 2)[0];
		var mail2 = '${memberInfo.mem_mail}'.split('@', 2)[1];
		
		var bir = '${memberInfo.mem_bir}'.split(' ', 1);
		
		var zipcode1 = '${memberInfo.mem_zipcode}'.split('-', 2)[0]
		var zipcode2 = '${memberInfo.mem_zipcode}'.split('-', 2)[1]
		
		var regno2 = '${memberInfo.mem_regno2}'.substring(0, 1);
		
		$('input[name=mem_regno2]').val(regno2 + '******');
		
		$('select[name=mem_hometel1]').val(homeTel1);
		$('input[name=mem_hometel2]').val(homeTel2);
		$('input[name=mem_hometel3]').val(homeTel3);
		
		$('select[name=mem_hp1]').val(hp1);
		$('input[name=mem_hp2]').val(hp2);
		$('input[name=mem_hp3]').val(hp3);
		
		$('input[name=mem_mail1]').val(mail1);
		$('select[name=mem_mail2]').val(mail2);
		
		$('input[name=mem_bir_disable]').val(bir);	
		
		$('input[name=mem_zipcode]').val('${memberInfo.mem_zipcode}');
		$('input[name=mem_zipcode1]').val(zipcode1);
		$('input[name=mem_zipcode2]').val(zipcode2);
		
		
		// 수정하기
		$('form[name=memberForm]').submit(function(){
			if ($('input[name=mem_pass]').val() == "" || 
					$('input[name=mem_pass_confirm]').val() == ""){
				alert('비밀번호는 공백일 수 있습니다.');
				return false;
			}
			if($('input[name=mem_pass]').val() != $('input[name=mem_pass_confirm]').val()) {
				alert('비밀번호가 일치하지 않습니다.');
				return false;
			}
			var mem_id = $('input[name=mem_id]').val();
			var mem_comtel = '${memberInfo.mem_comtel}';
			
			var mem_hometel = $('select[name=mem_hometel1]').val() + '-' + 
								$('input[name=mem_hometel2]').val() + '-' + 
								$('input[name=mem_hometel3]').val();
			
			var mem_hp = $('select[name=mem_hp1]').val() + '-' +
							$('input[name=mem_hp2]').val() + '-' +
							$('input[name=mem_hp3]').val();
			
			var mem_mail = $('input[name=mem_mail1]').val() + '@' +
							$('select[name=mem_mail2]').val();
			
			var mem_add1 = $('input[name=mem_add1]').val();
			
			var $inputId = $('<input type="hidden" name="mem_id" value="' + mem_id + '"/>');
			var $inputComtel = $('<input type="hidden" name="mem_comtel" value="' + mem_comtel + '"/>');
			var $inputComtel = $('<input type="hidden" name="mem_add1" value="' + mem_add1 + '"/>');
			var $inputFile = $('#idForm')
			
			$('input[name=mem_hometel]').val(mem_hometel);
			$('input[name=mem_hp]').val(mem_hp);
			$('input[name=mem_mail]').val(mem_mail);
			
			$('form[name=memberForm]').append($inputId, $inputComtel);
			
			
		});
		
// 		삭제
		$('#btn3').click(function(){
			
			if(!($('#mem_pass').val() == '${LOGIN_MEMBERINFO.mem_pass}')
				|| !($('#mem_pass').val() == $('#mem_pass_confirm').val())){
				alert('비밀번호를 확인 해 주세요.'); 
				return false;
			} 
			
			BootstrapDialog.show({
			    message: '정말로 탈퇴 하시겠습니까?',
			    buttons: [
				             {
						        label: ' 예 ',
						        cssClass: 'btn-primary',
						        action: function(dialogItself){
						        			location.href = '/user/member/deleteMember.do'
						            		dialogItself.close();
						        		}
				   		 	}, {
						        label: '아니오',
						        cssClass: 'btn-warning',
						        action: function(dialogItself){
						            		dialogItself.close();
						    			}
		  		 			}
			   		 	]
			});
		});
		
		$('#btn2').click(function(){
			location.reload();
		});
		
		$('#btn4').click(function(){
			location.href = '/user/freeboard/freeboardList.do';
		});
		
		$('#zipcodeBTN').on('click', function(){
			var url = '/popup/zipcode/zipcodeSearchForm.do';
			var options = 'width=400px, height=400px, resizable=no, scrollbars=no, copyhistory=no';
			window.open(url, '우편번호검색', options);
		}); 
		
		$('#upload-IMG-BTN').click(function(){
			$('#file').click();
		});
	});
	
	function idFileUpload(fileInfo){
		var fileName = fileInfo.value;
		var fileNameArray = fileName.split('\\');
		
		fileName = fileNameArray[fileNameArray.length-1];
		
		if(!/\.(jpg|jpeg|gif|png)$/.test(fileName.toLowerCase())){
			alert('이미지 파일을 선택해 주세요.');
			return;
		}
		
		$('#fileName').val(fileName);
		
		var $frm = $('<form name="idPicForm" id="idPicForm" method="post" action="/user/member/idPicFileupload.do" enctype="multipart/form-data"></form>');
		
		if($frm.find('input[name=file]').length > 0) {
			$frm.find('input[name=file]').remove();
		}
		$(fileInfo).clone().appendTo($frm);
		$('body').append($frm);
		
		$frm.ajaxForm({
			type		: 'post'
			,dataType	: 'json'
			,error		: function(result){
							alert(result.status);	
			},success	: function(data){
							$('#member-profile-img').attr('src', '/files/' + data.file_save_name);
			}  
		});
		
		$frm.submit();
	}
</script>
<body>
<form name="memberForm" action="/user/member/updateMember.do" method="post" enctype="multipart/form-data">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<input type="file" accept=".jpg, .jepg, .png, .gif" id="file" name="file" style="display:none;" onchange="idFileUpload(this);">
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr><td rowspan="13" class="pic" colspan="2" style="vertical-align: bottom; width: 150px; text-align: center;">
			<div id="img-location"style="width: 100%" align="center">
				<img id="member-profile-img" src="/files/basicProfileIMG.jpg" width="150px" height="200px" />
			</div>
			<img src="${pageContext.request.contextPath }/image/btn_pic.gif" id="upload-IMG-BTN" alt="사진올리기" class="btn" title="인적사항에 올릴 증명	을 검색합니다." 
				style="cursor: pointer;"/>
			<br/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">성 명</td>
		<td>
			<input type="text" name="mem_name" value="${memberInfo.mem_name }" disabled="disabled"/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">주민등록번호</td>
		<td>
			<input type="text" name="mem_regno1" size="6" value="${memberInfo.mem_regno1 }" disabled="disabled"/> - 
  			<input type="text" name="mem_regno2" size="7" disabled="disabled"/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">생년월일</td>
		<td>
				<input type="hidden" name="mem_bir" value="${memberInfo.mem_bir }"/>
				<input type="text" name="mem_bir_disable" disabled="disabled" />
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">아이디</td>
		<td>
			<input type="text" name="mem_id" value="${memberInfo.mem_id }" disabled="disabled">
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">비밀번호</td>
		<td>
			<input type="password" name="mem_pass" id="mem_pass" value="" /> 8 ~ 20 자리 영문자 및 숫자 사용
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">비밀번호확인</td>
		<td>
			<input type="password" name="mem_pass_confirm" id="mem_pass_confirm" value="" /> 8 ~ 20 자리 영문자 및 숫자 사용
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
	<tr>
		<td class="fieldName" width="100px" height="25">전화번호</td>
		<td>
			<div>
			<input type="hidden" name="mem_hometel"/>
			<select name="mem_hometel1">
				<option value="02">02</option>
				<option value="031">031</option>
				<option value="032">032</option>								        	
				<option value="033">033</option>				        	
				<option value="041">041</option>
				<option value="042">042</option>				        	
				<option value="043">043</option>				        	
				<option value="051">051</option>				        	
				<option value="052">052</option>
				<option value="053">053</option>				        					        	
				<option value="061">061</option>
				<option value="062">062</option>
				<option value="063">063</option>				        					        					        	
				<option value="064">064</option>				        					        					        	
				<option value="070">070</option>				        					        					        	
			</select> - 
			<input type="text" name="mem_hometel2" style="width:80px;"/> - 
			<input type="text" name="mem_hometel3" style="width:80px;"/>	
			</div>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">핸드폰</td>
		<td>
			<input type="hidden" name="mem_hp""/>
			<select name="mem_hp1"">
				<option value="010">010</option>
				<option value="016">016</option>				        	
				<option value="017">017</option>				        	
				<option value="019">019</option>				        	
			</select> - 
			<input type="text" name="mem_hp2" style="width:80px;"/> - 
			<input type="text" name="mem_hp3" style="width:80px;"/> 
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">이메일</td>
		<td>
			<input type="hidden" name="mem_mail" />
			<input type="text" name="mem_mail1" /> @ 
			<select name="mem_mail2">
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="nate.com">nate.com</option>
				<option value="gmail.com">gmail.com</option>				
			</select>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
		
	<tr>
		<td class="fieldName" width="100px" height="25">주소</td>
		<td>
			<input type="hidden" name="mem_zipcode" id="mem_zipcode" />
			<button type=button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" id='zipcodeBTN'>우편번호검색</button>
			<input type="text" name="mem_zipcode1" id="mem_zipcode1" disabled="disabled" style="width:60px;"/> - 
			<input type="text" name="mem_zipcode2" id="mem_zipcode2" disabled="disabled" style="width:60px;"/><br>
			<input type="text" name="mem_add1" id="mem_add1" value="${memberInfo.mem_add1 }" disabled="disabled"/>
			<input type="text" name="mem_add2" id="mem_add2" value="${memberInfo.mem_add2 }" />
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr><td colspan="2" height="20"></td></tr>
	
	<tr>
		<td class="btnGroup" colspan="2" >
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn1" type="submit">수정하기</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn2" type="button">취소</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn3" type="button">회원탈퇴</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn4" type="button">목록</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>









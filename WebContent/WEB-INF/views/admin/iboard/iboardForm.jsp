<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항게시물 보기</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script type="text/javascript" src="/js/common/validation.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>
<script type="text/javascript">
$(function(){
	 $('#bo_cont').summernote({
		lang: 'ko-KR',
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
	});
	
	$('#goListBTN').click(function(){
		location.href='rboardList.do';
	});
	
	$('form[name=freeboardForm]').submit(function(){
		
		var isReturn = false;
		
		if($('#file').val() == '') {
			alert('썸네일을 선택 해 주세요.');
			$('#file').focus();
			return false;
		}
		
		if($('#bo_title').val() == '') {
			alert('제목을 입력하지 않았습니다.');
			$('#bo_title').focus();
			return false;
		}
		
		if($('#bo_pass').val() == '') {
			alert('패스워드를 입력하지 않았습니다.');
			$('#bo_pass').focus();
			return false;
		}
		
		if('${LOGIN_ADMININFO.admin_pass}' != $('#bo_pass').val()){
			alert('비밀번호가 회원정보랑 일치하지 않습니다.');
			$('#bo_pass').focus();
			return false;
		}
		
		var bo_cont = $('.panel-body').html();
		$(this).append('<input type="hidden" name="bo_cont" value="' + bo_cont + '"/>');
		$(this).append('<input type="hidden" name="bo_ip" value="${pageContext.request.remoteAddr}"/>');
		
		return true;
	});
	
	$('#listBTN').click(function(){
		location.href = '/admin/iboard/iboardList.do';
	});
});

function thumbnailChange(fileInfo){
	var fileName = fileInfo.value;
	var fileNameArray = fileName.split('\\');
	
	fileName = fileNameArray[fileNameArray.length-1];
	
	if(!/\.(jpg|jpeg|gif|png)$/.test(fileName.toLowerCase())){
		alert('이미지 파일을 선택해 주세요.');
		$(fileInfo).val('');
		return;
	}
	
	var $frm = $('<form name="thumbNaleForm" id="thumbNaleForm" method="post" action="/admin/iboard/thumbnailFileUpload.do" enctype="multipart/form-data"></form>');
	
	if($frm.find('input[name=file]').length > 0) {
		$frm.find('input[name=file]').remove();
	}
	
	$fileInput = $(fileInfo).clone(); 
	$($fileInput).attr('display', 'none');
	$fileInput.appendTo($frm);
	
	$(document.body).append($frm);
	
	$frm.ajaxForm({
		type		: 'post'
		,dataType	: 'json'
		,error		: function(result){
						alert(result.status);	
		},success	: function(data){
						$('#ThumbNail-img').attr('src', '/files/' + data.file_save_name);
		}  
	});
	
	$frm.submit();
	
	$frm.hide();
}
</script>
</head>
<body>
<form name="freeboardForm" class="form-horizontal" role="form" action="/admin/iboard/insertIboard.do" method="post" enctype="multipart/form-data">
<div class="wrap">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="30">&nbsp;</td>
			<td width="790"> 
				<div id="container">
					<div class="title">공지사항</div>
					<table border="0" cellspacing="1" cellpadding="1">
						<tr>
						  <th>제목</th>
						  <td><input type="text" id="bo_title" name="bo_title" id="bo_title" placeholder="제목 입력..."></td>
						</tr>
						<tr>
							<div>
							<th>썸네일</th>
							<td class="col-sm-10"> 
								<img id="ThumbNail-img" lt="ThumbnailBoard" src="/files/${!empty boardInfo.file_save_name ? boardInfo.file_save_name : "noImageFile.jpg"  }" style="width:200px; height:200px;"> 
								<input type="file" class="filestyle" id="file" name="file" data-buttonName="btn-primary" onchange="thumbnailChange(this);">
							</td>
						</div>
						</tr>
						<tr>
						  <th>패스워드</th>
						  <td><input type="password" class="bo_pass" name="bo_pass" id="bo_pass"></td>
						</tr>
						<tr>
							<div>
							<th>내용:</th>
							<td class="col-sm-10"> 
								<div id="bo_cont"></div>
							</td>
						</div>
						</tr>
					</table>
						</div>
						<div class="form-group">
						</div>
					<div style="text-align:right">
						<button type="submit">등록</button> 
						<input class="btn2" type="button" value="목록" id="listBTN"/>
					</div>
				</div>
			</td>
		</tr>
	</table>
	<input type="hidden" name="bo_nick" value="관리자" />
	<input type="hidden" name="bo_writer" value="${LOGIN_ADMININFO.admin_id }" />
</div>
</form>
</body>
</html>
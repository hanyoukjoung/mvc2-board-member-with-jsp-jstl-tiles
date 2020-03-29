<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 정보</title>
<!-- 이미지 슬라이드 사이즈 조정 -->
<style type="text/css">
.carousel{
	width:200px;
    height:150px;
    margin-left: 200px;
}
.carousel-inner > .item > img{
    width:200px;
    height:150px;
}       
</style>
<script>
var isFileChange = false;
$(function(){
	
	 $('#bo_content').summernote({
		lang: 'ko-KR',
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
	});
	 
	 
	$('.panel-body').html('${boardInfo.bo_cont}')
	
	$('#goListBTN').click(function(){
		location.href='rboardList.do';
	});
	
	$('#cancleBTN').click(function(){
		location.href='rboardList.do';
	});
	
	$('form[name=iboardForm]').submit(function(){
		var isReturn = false;
		
		if($('#bo_title').val() == '') {
			alert('제목을 입력하지 않았습니다.');
			$('#bo_title').focus();
			return false;
		}
		if($('#bo_nick').val() == '') {
			alert('대화명을 입력하지 않았습니다.');
			$('#bo_nick').focus();
			return false;
		}
		if($('#bo_pass').val() == '') {
			alert('패스워드를 입력하지 않았습니다.');
			$('#bo_pass').focus();
			return false;
		}
		
		if('${LOGIN_MEMBERINFO.mem_pass}' != $('#bo_pass').val()){
			alert('비밀번호가 회원정보랑 일치하지 않습니다.');
			$('#bo_pass').focus();
			return false;
		}
		var bo_cont = $('.panel-body').html();
		$(this).append('<input type="hidden" name="bo_no" value="${boardInfo.bo_no}"/>');
		$(this).append('<input type="hidden" name="bo_cont" value="' + bo_cont + '"/>');
		$(this).append('<input type="hidden" name="bo_writer" value="${LOGIN_MEMBERINFO.mem_id}"/>');
		$(this).append('<input type="hidden" name="bo_ip" value="${pageContext.request.remoteAddr}"/>');
		
		return true;
	});
	
	$('#deleteBTN').click(function(){
		if('${LOGIN_MEMBERINFO.mem_id}' != '${boardInfo.bo_writer}') {
			BootstrapDialog.show({
		 	    title: '권한이 없습니다.',
		 	    message: '삭제 권한이 없습니다.'
		 		});
			return false;
		}
	
		if('${boardInfo.bo_pass}' != $('input[name=bo_pass]').val() 
				&& '${LOGIN_MEMBERINFO.mem_pass}' != $('input[name=bo_pass]').val()) {
			BootstrapDialog.show({
		 	    title: '비밀번호 오류',
		 	    message: '비밀번호가 일치하지 않습니다.'
		 		});
			return false;
		}
		
		BootstrapDialog.show({
		    message: '정말 삭제하시겠습니까?',
		    buttons: [{
				        label: ' 예 ',
				        cssClass: 'btn-primary',
				        action: function(dialogItself){
				            location.href = '/user/iboard/deleteIboard.do?bo_no=${boardInfo.bo_no}';
				            dialogItself.close();
				        }
		   		 		}, {
				        label: '아니오',
				        cssClass: 'btn-warning',
				        action: function(dialogItself){
				            dialogItself.close();
				    			}
  		 		}]
		});
	});
	
	$('#listBTN').click(function(){
		location.href="/user/iboard/iboardList.do";
	});
	
	$('#ThumbNail-img').click(function(){
		var imgsource = $(this).attr('src');
		if(imgsource == '' && imgsource == '/files/noImageFile.jpg') {
			alert('이미지 파일이 없습니다.');
			return false;
		}
		location.href = '/user/iboard/iboardThumbDownload.do?bo_no=${boardInfo.bo_no}';
		
	});
});

function thumbnailChange(fileInfo){
	var fileName = fileInfo.value;
	var fileNameArray = fileName.split('\\');
	
	fileName = fileNameArray[fileNameArray.length-1];
	
	if(!/\.(jpg|jpeg|gif|png)$/.test(fileName.toLowerCase())){
		alert('이미지 파일을 선택해 주세요.');
		return;
	}
	
	var $frm = $('<form name="thumbNaleForm" id="thumbNaleForm" method="post" action="/user/iboard/thumbnailFileUpload.do" enctype="multipart/form-data"></form>');
	
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
						$('#ThumbNail-img').attr('src', '/files/' + data.file_save_name);
		}  
	});
	
	$frm.submit();
}
</script>
</head>
<body>
<form class="form-horizontal" name="iboardForm" role="form" action="/user/iboard/updateIboard.do" method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="bo_title" name="bo_title" placeholder="제목 입력..." value="${boardInfo.bo_title }">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_nick">작성자 대화명:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="bo_nick" name="bo_nick" placeholder="대화명 입력..." value="${boardInfo.bo_nick }">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_pwd">패스워드:</label>
		<div class="col-sm-10"> 
			<input type="password" class="form-control" id="bo_pass" name="bo_pass" placeholder="패스워드 입력..." value="${boardInfo.bo_pass }">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="file">썸네일:</label>
		<div class="col-sm-10">
			<img src="/files/${boardInfo.file_save_name }" alt="Thumbnail Image" id="ThumbNail-img" style="width:200px; height:200px;" > 
			 <input type="file" class="filestyle" id="file" name="file" data-buttonName="btn-primary" onchange="thumbnailChange(this);" value="${(boardInfo.items['0']).file_name }">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_content">내용:</label>
		<div class="col-sm-10"> 
			<div id="bo_content"><p>내용을 입력해주세요...</p></div>
		</div>
	</div>
	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">
			<button type="button" class="btn btn-danger" id="deleteBTN">삭제</button>
			<button type="button" class="btn btn-info" id="listBTN">목록</button>
			<button type="submit" class="btn btn-default" style="float: right">수정</button>
		</div>
	</div>
</form>
</body>
</html>
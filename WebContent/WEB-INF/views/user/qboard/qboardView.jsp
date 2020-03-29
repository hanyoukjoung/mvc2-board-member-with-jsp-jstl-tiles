<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 정보</title>
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
$(function(){
	// 섬머노트를 div를 활용한 textarea에 추가.
	// http://summernote.org 활용
    $('#bo_cont').summernote({
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    $('#bo_cont').summernote('code', '${qboardInfo.bo_cont}');
    
    $('input[name=bo_title]').val('${qboardInfo.bo_title}');
    $('input[name=bo_nick]').val('${qboardInfo.bo_nick}');
    $('input[name=bo_pass]').val('${qboardInfo.bo_pass}');
    
    // 수정
    $('form[name=updateQboardForm]').submit(function(){
    	if($('input[name=bo_title]').val()==""){
			alert('제목을 입력해주세요.');
			return false; 
		}
		
		if($('input[name=bo_nick]').val()==""){
			alert('닉네임을 입력해주세요.');
			return false;
		}
		
		if($('input[name=bo_pass]').val()==""){
			alert('비밀번호를 입력해주세요.');
			return false; 
		}
		
		
		
		if(eval('${!empty qboardInfo.bo_pass}')){
			if('${LOGIN_MEMBERINFO.mem_pass}'!= $('input[name=bo_pass]').val()){
				alert("비밀번호가 일치하지 않습니다."); 
				return false;
			}
		}
    	
    	var bo_cont = $('#bo_cont').summernote('code');
		$(this).attr('action', '/user/qboard/updateQboardForm.do');
		$(this).append('<input type="hidden" name="bo_write" value="${rboardInfo.bo_writer}"/>');
		$(this).append('<input type="hidden" name="bo_cont" value="' + bo_cont + '"/>');
		$(this).append('<input type="hidden" name="bo_no" value="${qboardInfo.bo_no}"/>');

	});
    
	// 삭제
	$('#deleteQboardBTN').click(function(){
		location.href = 'deleteQboard.do?bo_no=${qboardInfo.bo_no}';
	});
	// 목록
    $('#qboardListBTN').click(function(){
		location.href = 'qboardList.do';
	});
});
</script>
</head>
<body>
<form name="updateQboardForm" class="form-horizontal" role="form" action="" method="post">
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="bo_title" name="bo_title" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_nick">닉네임:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="bo_nick" name="bo_nick" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_pass">패스워드:</label>
		<div class="col-sm-10"> 
			<input type="password" class="form-control" id="bo_pass" name="bo_pass" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_cont">내용:</label>
		<div class="col-sm-10"> 
			<div id="bo_cont"><p></p></div>
		</div>
	</div>
	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">
			<c:if test="${LOGIN_MEMBERINFO.mem_id eq qboardInfo.bo_writer}">
				<button type="button" class="btn btn-danger" id="deleteQboardBTN">삭제</button>
			</c:if>
				<button type="button" class="btn btn-info" id="qboardListBTN">목록</button>
			<button type="submit" class="btn btn-default" style="float: right">수정</button>
		</div>
	</div>
</form>
</body>
</html>
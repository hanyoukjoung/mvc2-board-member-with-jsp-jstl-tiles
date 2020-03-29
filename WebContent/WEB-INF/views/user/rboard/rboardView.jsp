<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 게시판 </title>
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
    $('#bo_cont').summernote('code', '${rboardInfo.bo_cont}');
    
    $('input[name=bo_title]').val('${rboardInfo.bo_title}');
    $('input[name=bo_nick]').val('${rboardInfo.bo_nick}');
    $('input[name=bo_pass]').val('${rboardInfo.bo_pass}');
    
    // 수정
    $('form[name=updateRboardForm]').submit(function(){
    	if($('input[name=bo_title]').val()==""){
			alert('제목을 입력해주세요.');
		return; 
		}
		
		if($('input[name=bo_nick]').val()==""){
			alert('닉네임을 입력해주세요.');
			return;
		}
		
		if($('input[name=bo_pass]').val()==""){
			alert('비밀번호를 입력해주세요.');
			return; 
		}
		
		if(eval('${!empty rboardInfo.bo_pass}')){
			if('${LOGIN_MEMBERINFO.mem_pass}'!= $('input[name=bo_pass]').val()){
				alert("비밀번호가 일치하지 않습니다."); 
				return;
			}
		}
    	
    	var bo_cont = $('#bo_cont').summernote('code');
		$(this).attr('action', '/user/rboard/updateRboardForm.do');
		
		$(this).append('<input type="hidden" name="bo_write" value="${rboardInfo.bo_writer}"/>');
		$(this).append('<input type="hidden" name="bo_cont" value="' + bo_cont + '"/>');
		$(this).append('<input type="hidden" name="bo_no" value="${rboardInfo.bo_no}"/>');

	});
    
	// 삭제
	$('#deleteRboardBTN').click(function(){
		location.href = 'deleteRboard.do?bo_no=${rboardInfo.bo_no}';
	});
	// 목록
    $('#rboardListBTN').click(function(){
		location.href = 'rboardList.do';
	});
	// 댓글
	$('#replyRboardFormBTN').click(function(){
		var title = encodeURIComponent('${rboardInfo.bo_title}');
		var params ='rnum=${param.rnum}&bo_group=${rboardInfo.bo_group}&bo_seq=${rboardInfo.bo_seq}&bo_depth=${rboardInfo.bo_depth}&bo_title='+title;
		location.href ='/user/rboard/rboardReplyForm.do?'+params;
	});
});
</script>
</head>
<body>
<form name="updateRboardForm" class="form-horizontal" role="form" action="" method="post">
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
<!-- 	<div class="form-group"> -->
<!-- 		<label class="control-label col-sm-2" for="bo_cont">첨부파일:</label> -->
<%-- 			<intput type="button" value="/files/${fileitem.file_save_name }"> --%>
<%-- 				<a href="javascript:location.href='/user/rboard/rboardFileDownload.do?fileSEQ=${fileitem.file_no}';"></a> --%>
<!-- 			</intput> -->
<!-- 	</div> -->
	<c:forEach items="${rboardInfo.items}" var="fileitem">
         <div class="form-group">
            <label class="control-label col-sm-2" for="bo_cont">첨부파일1:</label>
            <div class="col-sm-10">
                <input type="button" class="filestyle" id="file01" name="files" value="/files/${fileitem.file_save_name}" 
                onclick="javascript:location.href='/user/rboard/rboardFileDownload.do?fileSEQ=${fileitem.file_no}';"/>
            </div>
         </div>
      </c:forEach>
	
	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">
			<c:if test="${LOGIN_MEMBERINFO.mem_id eq rboardInfo.bo_writer}">
				<button type="button" class="btn btn-danger" id="deleteRboardBTN">삭제</button>
				<button type="submit" class="btn btn-default" style="float: right">수정</button>
			</c:if>
			<button type="button" class="btn btn-primary" id="replyRboardFormBTN">댓글</button>
			<button type="button" class="btn btn-info" id="rboardListBTN">목록</button>
		</div>
	</div>
</form>
</body>
</html>
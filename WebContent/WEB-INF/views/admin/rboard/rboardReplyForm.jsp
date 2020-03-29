<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<title>자유게시글 댓글등록</title>
<style>
.col-sm-2 control-label{
	width:40px;
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
    $('form[name=refReplyForm]').submit(function(){
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
    	
    	
    	$(this).attr('action','/admin/rboard/insertRBoardReply.do');
    	
    	var bo_cont = $('#bo_cont').summernote('code');
    	$(this).append('<input type="hidden" name="bo_cont" value="'+bo_cont+'"/>');
    	$(this).append('<input type="hidden" name="bo_writer" value="${LOGIN_MEMBERINFO.mem_id}"/>');
    	$(this).append('<input type="hidden" name="bo_ip" value="${pageContext.request.remoteAddr}"/>');
    	$(this).append('<input type="hidden" name="bo_group" value="${rboardParent.bo_group}"/>');
    	$(this).append('<input type="hidden" name="bo_seq" value="${rboardParent.bo_seq}"/>');
    	$(this).append('<input type="hidden" name="bo_depth" value="${rboardParent.bo_depth}"/>');
    	
    	return true;
    });
    $('#btnList').click(function(){
    	location.href ='/admin/rboard/rboardList.do';
    });
});
</script>
</head>
<body>
<div class="row">
	 <div class="col-sm-3">
		 <label class="col-sm-2 control-label">No :</label>
  		 <p class="form-control-static">${rboardParent.rnum }</p>
	 </div>
	 <div class="col-sm-8">
	 	<label class="col-sm-2 control-label">제목 :</label>
    	<p class="form-control-static">${rboardParent.bo_title }</p>
	 </div>
	 <div class="col-sm-1">
	 	<p class="text-right text-danger bg-danger">${rboardParent.bo_nick}의 댓글</p>
	 </div>
</div>
<hr />
<form name="refReplyForm" class="form-horizontal" role="form" action="" method="post">
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="bo_title" name="bo_title" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_nick">작성자 대화명:</label>
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
			<button type="submit" class="btn btn-success" style="float: right;">댓글등록</button>
			<button type="button" class="btn btn-danger">취소</button>
			<button type="button" class="btn btn-info" id="btnList">목록</button>
		</div>
	</div>
</form>
</body>
</html>
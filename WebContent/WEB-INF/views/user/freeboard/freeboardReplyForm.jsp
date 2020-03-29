<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 댓글등록</title>
<script>
$(function(){
    $('#bo_cont').summernote({
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });

    $('form[name=freereplyForm]').submit(function(){
    	
    	if($('input[name=bo_pass]').val() != ""){
    		if('${LOGIN_MEMBERINFO.mem_pass}'!= $('input[name=bo_pass]').val()){
   		 	    return alert("비밀번호가 일치하지 않습니다.");
    		}
    	}
    	if( $('input[name=bo_nick]').val() == "" ){
    		return alert("대화명을 입력해주세요");
    	}
    	if( $('input[name=bo_title]').val() == "" ){
    		return alert("제목을 입력해주세요");
    	}
    	
    	
    	
    	
    	$(this).attr('action','/user/freeboard/freeboardReplyinsert.do');
    	
    	var bo_cont = $('#bo_cont').summernote('code');
    	$(this).append('<input type="hidden" name="bo_cont" value="'+bo_cont+'"/>');
    	$(this).append('<input type="hidden" name="bo_writer" value="${LOGIN_MEMBERINFO.mem_id}"/>');
    	$(this).append('<input type="hidden" name="bo_ip" value="${pageContext.request.remoteAddr}"/>');
    	$(this).append('<input type="hidden" name="bo_group" value="${param.bo_group}"/>');
    	$(this).append('<input type="hidden" name="bo_seq" value="${param.bo_seq}"/>');
    	$(this).append('<input type="hidden" name="bo_depth" value="${param.bo_depth}"/>');
    	return true;
    });
    
    $('#btnlist').click(function(){
    	location.href ='/user/freeboard/freeboardList.do';
    });
    
    
    
    
    
    
    
    
});
</script>
</head>
<body>
<div class="row">
	 <div class="col-sm-3">
		 <label class="col-sm-2 control-label">No :</label>
  		 <p class="form-control-static">${param.rnum }</p>
	 </div>
	 <div class="col-sm-8">
	 	<label class="col-sm-2 control-label">제목 :</label>
    	<p class="form-control-static">${param.title }</p>
	 </div>
	 <div class="col-sm-1">
	 	<p class="text-right text-danger bg-danger">${LOGIN_MEMBERINFO.mem_id}의 댓글</p>
	 </div>
</div>
<hr />
<form name="freereplyForm" class="form-horizontal" role="form" action="" method="post">
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="bo_title" name="bo_title" >
			<input type="hidden" name="bo_group" value="${param.bo_group}"/>
			<input type="hidden" name="bo_seq" value="${param.bo_seq}"/>
			<input type="hidden" name="bo_depth" value="${param.bo_depth}"/>
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
			<button type="submit" class="btn btn-success" style="float: right;" >답글등록</button>
			<button type="button" class="btn btn-danger">취소</button>
			<button type="button" class="btn btn-info" id="btnlist">목록</button>
		</div>
	</div>
</form>
</body>
</html>
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

    $('#bo_cont').summernote({
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    $('#bo_cont').summernote('code','${freeboardInfo.bo_cont}');
    $('form[name=updateFreeboardForm]').submit(function(){
    	if(eval('${!empty freeboardInfo.bo_pass}')){
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
    	
    	 var bo_content = $('#bo_cont').summernote('code');
    	$(this).append('<input type="hidden" name="bo_cont" value="'+bo_content+'"/>');
    	$(this).append('<input type="hidden" name="bo_no" value="${freeboardInfo.bo_no}"/>');
    	$(this).attr('action','/user/freeboard/updateFreeboard.do');
    	return true;
    });
    $('#btndel').click(function(){
    	location.href = '/user/freeboard/deleteFreeboard.do?bo_no='+${freeboardInfo.bo_no};
    });
    $('#btnback').click(function(){
    	location.href = '/user/freeboard/freeboardList.do';
    });
     $('#btnreply').click(function(){
 		var title = encodeURIComponent('${freeboardInfo.bo_title}');
 		var params = 'rnum=${param.rnum}&bo_group=${freeboardInfo.bo_group}&bo_seq=${freeboardInfo.bo_seq}&bo_depth=${freeboardInfo.bo_depth}&title=' + title;
 		location.href = '/user/freeboard/freeboardReplyForm.do?'+params; 
     });
    
});
</script>
</head>
<body>
<form name="updateFreeboardForm" class="form-horizontal" role="form" action="" method="post">
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="bo_title" name="bo_title" value="${freeboardInfo.bo_title}">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_nick">작성자 대화명:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="bo_nick" name="bo_nick" value="${freeboardInfo.bo_nick}">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_pass">패스워드:</label>
		<div class="col-sm-10"> 
		
			<input type="password" class="form-control" id="bo_pass" name="bo_pass" value="${freeboardInfo.bo_pass}">
		
		</div>
	
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_reg_date">등록일:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="bo_reg_date" name="bo_reg_date" value="${freeboardInfo.bo_reg_date}">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_content">내용:</label>
		<div class="col-sm-10"> 
			<div id="bo_cont" ></div>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_content">첨부파일:</label>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
			</ol>
	
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox" style="height: 200px;">
				<c:forEach items="${freeboardInfo.items}" var="fileitem" varStatus="stat">
				
				 <c:if test="${stat.first }">
				<div class="item active">
				</c:if>
				<c:if test="${stat.last }">
				<div class="item">
				</c:if>
					<img src="/files/${fileitem.file_save_name}" alt="pic1"
							onclick="javascript:location.href='/user/freeboard/freeboardDownload.do?fileSEQ=${fileitem.file_no}';">
				</div>
				</c:forEach>
			</div>
			<!-- Left and right controls -->
			<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
			<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
		</div>
	</div>
	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">
			<c:if test="${LOGIN_MEMBERINFO.mem_id eq freeboardInfo.bo_writer}">
			<button type="button" class="btn btn-danger" id="btndel">삭제</button>
			<button type="submit" class="btn btn-default" style="float: right">수정</button>
			</c:if>
			<button type="button" class="btn btn-primary" id="btnreply">답글</button>
			<button type="button" class="btn btn-info" id="btnback">목록</button>
		</div>
	</div>
</form>
</body>
</html>
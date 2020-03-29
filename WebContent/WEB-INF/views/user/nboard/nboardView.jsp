<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 정보</title>
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
$(function(){
	$('#btnback').click(function(){
    	location.href = '/user/nboard/nboardList.do';
    });


});
</script>
</head>
<body>
<form class="form-horizontal" role="form" action="" method="post">
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="bo_title" disabled="disabled" name="bo_title" value="${nboardInfo.bo_title }">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_nick">작성자 대화명:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="bo_nick" name="bo_nick" disabled="disabled" value="${nboardInfo.bo_nick }">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_reg_date">등록일:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="bo_reg_date" name="bo_reg_date" value="${nboardInfo.bo_reg_date }" disabled="disabled">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_bo_cont">내용:</label>
		<div class="col-sm-10"> 
		 <td><textarea rows="10" cols="110" class="bo_content" disabled="disabled" style="overflow: auto;">${nboardInfo.bo_bo_cont }</textarea></td>
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
				<c:forEach items="${nboardInfo.items}" var="fileitem" varStatus="stat">
				
				 <c:if test="${stat.first }">
				<div class="item active">
				</c:if>
				<c:if test="${stat.last }">
				<div class="item">
				</c:if>
					<img src="/files/${fileitem.file_save_name}" alt="pic1"
							onclick="javascript:location.href='/user/nboard/nboardDownload.do?fileSEQ=${fileitem.file_no}';">
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
			<c:if test="${empty LOGIN_MEMBERINFO.mem_id}">
			<button type="button" class="btn btn-success">글쓰기</button>
			<button type="button" class="btn btn-danger">삭제</button>
			<button type="button" class="btn btn-primary">답글</button>
			<button type="submit" class="btn btn-default" style="float: right">수정</button>
			</c:if>
			<button type="button" class="btn btn-info" id="btnback">목록</button>
		</div>
	</div>
</form>
</body>
</html>
<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 목록</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	
	$('#insertBTN').click(function(){
		location.href='/user/iboard/iboardForm.do';
	});
	
	$('form[name=searchForm]').submit(function(){
		
	});
	
	$('.board-list-tr').each(function(){
		$(this).click(function(){
			location.href = '/user/iboard/iboardView.do?bo_no=' + $(this).find('input[type=hidden]').val();
		});
	})
});

</script>
</head>
<body>
<div id="imgboardList_content">
	<div class="panel panel-blue">
    	<div class="panel-heading">썸네일게시판 목록</div>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th scope="col" width="5%">No</th>
					<th scope="col" width="20%">이미지</th>
					<th scope="col" width="45%">제목</th>
					<th scope="col" width="10%">작성자</th>
					<th scope="col" width="10%">작성일</th>
					<th scope="col" width="10%">조회수</th>
				</tr>
			</thead>
			<tbody id="iboard-tbody">
			<c:forEach items="${boardList }" var="boardInfo">
			<tr class="board-list-tr">
				<input type="hidden" id="bo_no" name="bo_no" value="${boardInfo.bo_no }" />
				<td>${boardInfo.rnum}</td>
				<td><img alt="ThumbnailBoard" src="/files/${!empty boardInfo.file_save_name ? boardInfo.file_save_name : "noImageFile.jpg"  }" style="width:50px; height:50px;"> </td>
				<td><span style="font-size:20pt;">${boardInfo.bo_title }</span></td>
				<td>${boardInfo.bo_writer }</td>
				<td>${boardInfo.bo_reg_date }</td>
				<td>${boardInfo.bo_hit }</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<div >
${pagination }
<form action="/user/iboard/iboardList.do" method="post" name="searchForm" class="form-inline pull-right">
		<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
		<select class="form-control" id="search_keycode" name="search_keycode" >
			<option>검색조건</option>
			<option value="TOTAL">전체</option>
			<option value="TITLE">제목</option>
			<option value="CONTENT">내용</option>
			<option value="WRITER">작성자</option>
		</select>
	    <button type="submit" class="btn btn-primary form-control" id="searchBTN">검색</button>
	    <button type="button" class="btn btn-info form-control" id="insertBTN">게시글 등록</button>
</form>
</div>	
<br/>
<br/>
<br/>
<br/>
<br/>
</body>
</html>
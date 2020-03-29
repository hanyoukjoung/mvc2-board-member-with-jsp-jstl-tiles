<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판 리스트</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	
	if(eval('${!empty search_keycode}')){
		$('#search_keycode').val('${search_keycode}');
	}
	
	if(eval('${!empty search_keycode}')){
		$('#search_keycode').val('${search_keycode}');
	}
	
	$('#insertBTN').click(function(){
		location.href='/user/iboard/iboardForm.do';
	});
	
	$('.board-list-tr').each(function(){
		$(this).click(function(){
			location.href = '/admin/iboard/iboardView.do?bo_no=' + $(this).find('input[type=hidden]').val();
		});
	})
	
	$('#searchBTN').click(function(){
		
		$frm = $('<form action="/admin/iboard/iboardList.do" method="post"></form>');
		$frm.append($('#search_keycode').clone());
		$frm.append($('#search_keyword').clone());
		
		$(document.body).append($frm);
		
		$frm.submit();
		
	});
	
	$('#insertBTN').click(function(){
		location.href = '/admin/iboard/iboardForm.do';
	});
});
</script>
</head>
<body>
<div class="wrap">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="30">&nbsp;</td>
			<td width="790"> 
				<div id="container">
					<div class="title">썸네일 게시판</div>
					<table border="0" cellspacing="1" cellpadding="1">
						<thead>
							<tr>
							  <th width="5%">번호</th>
							  <th width="30%">썸네일</th>
							  <th width="30%">제목</th>
							  <th>작성자</th>
							  <th>작성일</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${boardList }" var="boardInfo">
							<tr class="board-list-tr">
								<input type="hidden" id="bo_no" name="bo_no" value="${boardInfo.bo_no }" />
								<td>${boardInfo.rnum }</td>
								<td><img alt="ThumbnailBoard" src="/files/${!empty boardInfo.file_save_name ? boardInfo.file_save_name : "noImageFile.jpg"  }" style="width:200px; height:200px;"> </td>
								<td>${boardInfo.bo_title }</td>
								<td>${boardInfo.bo_writer }</td>
								<td>${boardInfo.bo_reg_date }</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
						${pagination }
					<div style="text-align:right;">
						<select style="width:100px;" name="search_keycode" id="search_keycode">
							<option value="" selected="selected">선택하세요</option>
							<option value="TITLE" selected="selected">제목</option>
							<option value="NICK">대화명</option>
							<option value="WRITER">아이디</option>
						</select> 
						<input name="search_keyword" type="text" id="search_keyword" size="20" /> 
						<input class="btn1" type="submit" value="검색" id="searchBTN"/>
					</div>
					<div style="text-align:right; margin-top: 5px;">
						<input class="btn2" type="button" id="insertBTN" value="등록" />
					</div>
				</div>
			</td>
		</tr>
	</table>
</div>
<br>
<br>
<br>
<br>
<br>
</body>
</html>
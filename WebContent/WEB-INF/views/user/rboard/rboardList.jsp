<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 목록</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	$('#rboardT tr').click(function(){
		var bo_no = $(this).find('td:eq(0) input').val();
		var rnum = $(this).find('td:eq(0)').text();
	
		location.href= '/user/rboard/rboardView.do?bo_no='+bo_no+'&rnum='+rnum;		
	});
	
	$('#insertBTN').click(function(){
		location.href='/user/rboard/rboardForm.do';
	});
});
</script>
</head>
<body>
<div id="freeboardList_content">
	<div class="panel panel-blue">
    	<div class="panel-heading">게시판 목록</div>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th scope="col" width="5%">No</th>
					<th scope="col" width="65%">제목</th>
					<th scope="col" width="10%">작성자</th>
					<th scope="col" width="10%">작성일</th>
					<th scope="col" width="10%">조회수</th>
				</tr>
			</thead>
			<tbody id="rboardT">
			<c:if test="${empty rboardList}">
				<tr>
					<td colspan="5" align="center"><font color="red">등록된 게시글이 없습니다.</font></td>
				</tr>
			</c:if>
			<c:forEach items="${rboardList}" var="rboardInfo">
				<tr>
					<td><input type="hidden" value="${rboardInfo.bo_no}"/>${rboardInfo.rnum }</td>
					<td align="left">
						<c:forEach begin="1" end="${rboardInfo.bo_depth }" varStatus="stat">
							&nbsp;&nbsp;&nbsp;
							<c:if test="${stat.last }">
								<i class="fa fa-angle-right"></i>
							</c:if>
						</c:forEach>
						 ${rboardInfo.bo_title }</td>
					<td> ${rboardInfo.bo_nick }</td>
					<td> ${rboardInfo.bo_reg_date }</td>
					<td> ${rboardInfo.bo_hit }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>
${paginationHtmls}
<div >
<form action="/user/rboard/rboardList.do" method="post" class="form-inline pull-right">
		<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
		<select class="form-control" name="search_keycode" >
			<option>검색조건</option>
			<option value="TOTAL">전체</option>
			<option value="TITLE">제목</option>
			<option value="CONT">내용</option>
			<option value="NICK">작성자</option>
		</select>
	    <button type="submit" class="btn btn-primary form-control">검색</button>
	    <button type="button" class="btn btn-info form-control" id="insertBTN">게시글 등록</button>
</form>
</div>	
</body>
</html>
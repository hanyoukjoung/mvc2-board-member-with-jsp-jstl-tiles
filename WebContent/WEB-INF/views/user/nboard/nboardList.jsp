<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latesr.js"></script>
<script type="text/javascript">
$(function(){
	$('#nboardListTBY tr').click(function(){
		var bo_no = $(this).find('td:eq(0) input').val();
		var rnum = $(this).find('td:eq(0)').text();
		location.href ='/user/nboard/nboardView.do?bo_no='+bo_no+'&rnum='+rnum;
	});
});

</script>
</head>
<body>
<div id="freeboardList_content">
	<div class="panel panel-blue">
    	<div class="panel-heading">공지사항 목록</div>
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
			<tbody id="nboardListTBY">
			<c:if test="${empty nboardList}">
				<tr>
					<td colspan="5" align="center"><font color="red">등록된 공지사항이 없습니다.</font></td>
				</tr>
			</c:if>
			<c:if test="${!empty nboardList}">
			<c:forEach items="${nboardList}" var="nboardList">
				<tr>
					<td><input type="hidden" value="${nboardList.bo_no}"/>${nboardList.rnum}</td>
					<td>${nboardList.bo_title}</td>
					<td>${nboardList.bo_nick}</td>
					<td>${fn:split(nboardList.bo_reg_date, ' ')[0]}</td>
					<td>${nboardList.bo_hit}</td>
				</tr>
		 </c:forEach>
		</c:if>
			</tbody>
		</table>
	</div>
</div>
${paginationHtmls}

<div >
<form action="/user/nboard/nboardList.do" method="post" class="form-inline pull-right">
		<input id="search_keyword"  name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
		<select class="form-control" name="search_keycode" >
			<option>검색조건</option>
			<option value="TOTAL">전체</option>
			<option value="TITLE">제목</option>
			<option value="CONTENT">내용</option>
			<option value="NICK">작성자</option>
		</select>
	    <button type="submit" class="btn btn-primary form-control">검색</button>
</form>
</div>	

</body>
</html>
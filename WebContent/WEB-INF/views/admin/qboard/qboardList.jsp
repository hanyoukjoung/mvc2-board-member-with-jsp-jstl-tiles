<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q&A 리스트</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	$('#qboardListTBY tr').click(function(){
		var bo_no = $(this).find('td:eq(0) input').val();
		var rnum = $(this).find('td:eq(0)').text();
		location.href ='/admin/qboard/qboardView.do?bo_no='+bo_no+'&rnum='+rnum;
	});
	
	$('#btnform').click(function(){
		$(location).attr('href','/admin/qboard/qboardForm.do');
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
					<div class="title">Q&A</div>
					<table border="0" cellspacing="1" cellpadding="1">
						<thead>
							<tr>
							  <th width="5%">번호</th>
							  <th width="60%">제목</th>
							  <th>작성자</th>
							  <th>작성일</th>
							</tr>
						</thead>
						<tbody id="qboardListTBY">
						<c:if test="${empty qboardList}">
							<tr>
							  <td colspan="5" align="center"><font color="red">등록된 공지사항이 없습니다.</font></td>
							</tr>
						</c:if>
						
						<c:if test="${!empty qboardList}">
						<c:forEach items="${qboardList}" var="qboardList">
							<tr>
								<td><input type="hidden" value="${qboardList.bo_no}"/>${qboardList.rnum}</td>
								<td align="left">
								<c:forEach begin="1" end="${qboardList.bo_seq }" varStatus="stat">
								&nbsp;&nbsp;&nbsp;
								<c:if test="${stat.last }">
									<i class="fa fa-angle-right">--></i>
								</c:if>
								</c:forEach>
								${qboardList.bo_title}</td>
								<td>${qboardList.bo_nick}</td>
								<td>${fn:split(qboardList.bo_reg_date, ' ')[0]}</td>
							</tr>
						 </c:forEach>
						</c:if>
					</tbody>
					</table>
					<div style="text-align:center;">${paginationHtmls}</div>
					
					<div >
					<form action="/admin/qboard/qboardList.do" method="post" class="form-inline pull-right">
							<input id="search_keyword"  name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
							<select class="form-control" name="search_keycode" >
								<option>검색조건</option>
								<option value="TOTAL">전체</option>
								<option value="TITLE">제목</option>
								<option value="CONT">내용</option>
								<option value="NICK">작성자</option>
							</select>
						    <button type="submit" class="btn btn-primary form-control">검색</button>    
					</form>
					</div>	
					<div style="text-align:right; margin-top: 5px;">
					
					</div>
				</div>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
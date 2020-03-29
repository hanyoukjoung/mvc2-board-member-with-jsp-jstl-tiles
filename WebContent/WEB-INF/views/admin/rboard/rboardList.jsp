<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판 목록</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	$('#rboardT tr').click(function(){
		var bo_no = $(this).find('td:eq(0) input').val();
		var rnum = $(this).find('td:eq(0)').text();
		
		location.href= '/admin/rboard/rboardView.do?bo_no='+bo_no+'&rnum='+rnum;		
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
					<div class="title">자유게시판</div>
					<table border="0" cellspacing="1" cellpadding="1">
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
							  <td colspan="5" align="center"><font color="red">등록된 공지사항이 없습니다.</font></td>
							</tr>
						</c:if>
						<c:forEach items="${rboardList}" var="rboardInfo">
							<tr>
								<td><input type="hidden" value="${rboardInfo.bo_no}"/>${rboardInfo.rnum}</td>
								<td align="left">
								<c:forEach begin="1" end="${rboardInfo.bo_depth }" varStatus="stat">
									&nbsp;&nbsp;&nbsp;
									<c:if test="${stat.last }">
										<i class="fa fa-angle-right"></i>
									</c:if>
								</c:forEach>
								${rboardInfo.bo_title}</td>
								<td>${rboardInfo.bo_nick}</td>
								<td> ${rboardInfo.bo_reg_date }</td>
								<td> ${rboardInfo.bo_hit }</td>
							</tr>
						 </c:forEach>
					</tbody>
					</table>
					<div style="text-align:center;">${paginationHtmls}</div>
					<div style="text-align:right;">
						<select style="width:100px;">
							<option value="TOTAL">전체</option>
							<option value="TITLE">제목</option>
							<option value="CONT">내용</option>
							<option value="NICK">작성자</option>
						</select> 
						<input name="unname" type="text" id="uname" size="20" /> 
						<input class="btn1" type="submit" value="검색"/>
					</div>
				</div>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
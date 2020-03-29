<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항게시물 보기</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script type="text/javascript">
$(function(){
	$('#bo_bo_cont').summernote({
		height: 150,
		codemirror: {
		theme: 'monokai'
	}
});
	
	 
	$('form[name=freeboardForm]').submit(function(){
		$(this).attr('action','/admin/nboard/insertnboard.do');
		var bo_bo_cont = $('#bo_bo_cont').summernote('code');
		$(this).append('<input type="hidden" name="bo_bo_cont" value="'+bo_bo_cont+'"/>');
		$(this).append('<input type="hidden" name="bo_writer" value="${LOGIN_ADMININFO.admin_id}"/>');
		$(this).append('<input type="hidden" name="bo_pass" value="${LOGIN_ADMININFO.admin_pass}"/>');
		$(this).append('<input type="hidden" name="bo_ip" value="${pageContext.request.remoteAddr}"/>');
		
	});
	
	
	
});
</script>
</head>
<body>
<form name="freeboardForm" class="form-horizontal" role="form" action="" method="post" enctype="multipart/form-data">
<div class="wrap">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="30">&nbsp;</td>
			<td width="790"> 
				<div id="container">
					<div class="title">공지사항</div>
					<table border="0" cellspacing="1" cellpadding="1">
						<tr>
						  <th>제목</th>
						  <td><input type="text" id="bo_title" name="bo_title" placeholder="제목 입력..."></td>
						</tr>
						<tr>
						  <th>작성자</th>
						  <td><input type="text" class="bo_nick" name="bo_nick" value="${LOGIN_ADMININFO.admin_id}"></td>
						</tr>
						<tr>
							<div>
							<th>내용:</th>
							<td class="col-sm-10"> 
								<div id="bo_bo_cont"></div>
							</td>
						</div>
						</tr>
					</table>
						<div class="form-group">
						<label class="control-label col-sm-2" for="files">첨부파일1:</label>
						<div class="col-sm-10">
						 <input type="file" class="filestyle" id="files" name="files" data-buttonName="btn-primary">
						</div>
						</div>
						<div class="form-group">
						<label class="control-label col-sm-2" for="files">첨부파일2:</label>
						<div class="col-sm-10">
						 <input type="file" class="filestyle" id="files" name="files" data-buttonName="btn-primary">
						</div>
						</div>
					<div style="text-align:right">
						<button type="submit">등록</button> 
						<input class="btn2" type="submit" value="목록"/>
					</div>
				</div>
			</td>
		</tr>
	</table>
</div>
</form>
</body>
</html>
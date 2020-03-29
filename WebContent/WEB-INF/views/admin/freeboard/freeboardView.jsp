<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판 보기</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script type="text/javascript">
$(function(){
		$('#bo_cont').summernote({
					height: 150,
					codemirror: {
					theme: 'monokai'
				}
			});
	
		 $('#bo_cont').summernote('code','${freeboardInfo.bo_cont}');
		$('form[name=updateFreeboardForm]').submit(function(){
			
			
	    	if( $('input[name=bo_nick]').val() == "" ){
	    		return alert("대화명을 입력해주세요");
	    	}
	    	if( $('input[name=bo_title]').val() == "" ){
	    		return alert("제목을 입력해주세요");
	    	}
			
			
	   	 var bo_content = $('#bo_cont').summernote('code');
	   	$(this).append('<input type="hidden" name="bo_cont" value="'+bo_content+'"/>');
	   	$(this).append('<input type="hidden" name="bo_no" value="${freeboardInfo.bo_no}"/>');
	   	$(this).attr('action','/admin/freeboard/updateFreeboard.do');
	   	
	    });
	 	$('#btndel').click(function(){
	    	location.href = '/admin/freeboard/deleteFreeboard.do?bo_no='+${freeboardInfo.bo_no};
	    });
	    $('#btnback').click(function(){
	    	location.href = '/admin/freeboard/freeBoardList.do';
	    });
});

</script>
</head>
<body>
<form name="updateFreeboardForm" role="form" action="" method="post">
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
						  <td><input type="text" class="form-control" id="bo_title" name="bo_title" value="${freeboardInfo.bo_title}"></td>
						</tr>
						<tr>
						  <th>작성자</th>
						  <td><input type="text" class="form-control" id="bo_nick" name="bo_nick" value="${freeboardInfo.bo_nick}"></td>
							<input type="hidden" class="form-control" id="bo_pass" name="bo_pass" value="${freeboardInfo.bo_pass}">
							<input type="hidden" class="form-control" id="bo_reg_date" name="bo_reg_date" value="${freeboardInfo.bo_reg_date}">
						</tr>
						<tr>
							<div>
							<th>내용:</th>
							<td class="col-sm-10"> 
								<div id="bo_cont"></div>
							</td>
						</div>
						</tr>
						  <input type="hidden" class="bo_ip" name="bo_ip" value="${freeboardInfo.bo_ip}">
						<tr>
						<th>첨부파일:</th>
						<td><c:forEach items="${freeboardInfo.items}" var="fileitem" varStatus="stat">
							<img src="/files/${fileitem.file_save_name}" alt="pic1" width="100px" height="100px">
						</c:forEach></td>
						</tr>
					</table>
					<div style="text-align:right">
						<input class="btn2" type="submit" value="수정"/> 
						<button id="btndel" type="button" >삭제</button>
						<button id="btnback" type="button">목록</button>
					</div>
				</div>
			</td>
		</tr>
	</table>
</div>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q&A 게시판</title>
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
	
	 $('#bo_cont').summernote('code','${qboardInfo.bo_cont}');
	$('form[name=updateFreeboardForm]').submit(function(){	
	var bo_cont = $('#bo_cont').summernote('code');
	if( $('input[name=bo_nick]').val() == "" ){
		return alert("대화명을 입력해주세요");
	}
	if( $('input[name=bo_title]').val() == "" ){
		return alert("제목을 입력해주세요");
	}
	
	$(this).append('<input type="hidden" name="bo_cont" value="'+bo_cont+'"/>');
   	$(this).append('<input type="hidden" name="bo_no" value="${qboardInfo.bo_no}"/>');
   	$(this).append('<input type="hidden" name="bo_pass" value="${qboardInfo.bo_pass}"/>');
   	$(this).attr('action','/admin/qboard/updateQboardForm.do');
   	return true;
   });
	$('#btndel').click(function(){
    	location.href = '/admin/qboard/deleteQboard.do?bo_no='+${qboardInfo.bo_no};
    });
    $('#btnback').click(function(){
    	location.href = '/admin/qboard/qboardList.do';
    });
    $('#btnreply').click(function(){
//    	 var title = encodeURIComponent('${freeboardInfo.bo_title}');
// 		var params = 'rnum=${param.rnum}&bo_group=${freeboardInfo.bo_group}&bo_seq=${freeboardInfo.bo_seq}&bo_depth=${freeboardInfo.bo_depth}&title=' + title;
// 		location.href = '${freeboardReplyForm}?' + params;
		var title = encodeURIComponent('${qboardInfo.bo_title}');
		var params = 'rnum=${param.rnum}&bo_group=${qboardInfo.bo_group}&bo_seq=${qboardInfo.bo_seq}&bo_depth=${qboardInfo.bo_depth}&title=' + title;
		location.href = '/admin/qboard/qboardReplyForm.do?'+params; 
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
						  <td><input type="text" class="bo_title" name="bo_title" value="${qboardInfo.bo_title}"></td>
						</tr>
						<tr>
						  <th>작성자</th>
						  <td><input type="text" class="bo_nick" name="bo_nick" value="${qboardInfo.bo_nick}"></td>
						</tr>
						<tr>
							<div>
							<th>내용:</th>
							<td class="col-sm-10"> 
								<div id="bo_cont"></div>
							</td>
						</div>
						</tr>
						  <input type="hidden" class="bo_ip" name="bo_ip" value="${qboardInfo.bo_ip}">
					</table>
					<div style="text-align:right">
						<c:if test="${qboardInfo.bo_seq gt 0}">
 						<button class="btn2" type="submit">수정</button>  
						<button id="btndel" type="button">삭제</button> 
						</c:if>
<%-- 						<c:if test="${qboardInfo.bo_seq lt 1}"> --%>
<!-- 						<button id="btnreply" type="button">답글</button> -->
<%-- 						</c:if> --%>
						   <c:if test="${groupCount lt 2}">
                  <button id="btnreply" type="button">답글</button>
                  </c:if>

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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 수정</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	
	$('#bo_title').val('${boardInfo.bo_title}');
	$('#bo_writer').val('${boardInfo.bo_writer}');
	$('#bo_cont').val('${boardInfo.bo_cont}');
	$('#bo_ip').val('${boardInfo.bo_ip}');
	
	$('#updateBTN').click(function(){
		
		$frm = $('<form name="updateForm" action="/admin/iboard/updateBoard.do" method="post" enctype="multipart/form-data"></form>');
		
		$inputCont = $('<input type="hidden" name="bo_cont" value="' + $('#bo_cont').val() + '"/>');
		
		$inputTitle = $('#bo_title').clone();
		
		$inputWriter = $('<input type="hidden" name="bo_writer" value="${boardInfo.bo_writer}" />');
		
		$inputIp = $('<input type="hidden" name="bo_ip" value="${pageContext.request.remoteAddr}"/>');
		
		$inputNo = $('<input type="hidden" name="bo_no" value="${boardInfo.bo_no}" />');
		
		$($frm).remove('input[type=file]');
		
		if($('#file').val() != '') {
			$frm.append($('#file').clone());
		}
		
		
		$frm.append($inputCont);
		$frm.append($inputTitle);
		$frm.append($inputWriter);
		$frm.append($inputIp);
		$frm.append($inputNo);
		
		$(document.body).append($frm);
		
		$frm.submit();
		
	});
	
	$('#cancelBTN').click(function(){
		if(confirm('정말 취소하시겠습니까? 작업 내용이 사라집니다.')){
			location.reload();
		}
	});
	
	$('#listBTN').click(function(){
		if(confirm('정말 돌아가시겠습니까? 작업 내용이 사라집니다.')){
			location.href = '/admin/iboard/iboardView.do?bo_no=${boardInfo.bo_no}';
		}
		
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
						<tr>
						  <th>제목</th>
						  <td><input type="text" class="bo_title" name="bo_title" id="bo_title"></td>
						</tr>
						<tr>
						  <th>작성자</th>
						  <td><img alt="ThumbnailBoard" src="/files/${!empty boardInfo.file_save_name ? boardInfo.file_save_name : "noImageFile.jpg"  }" style="width:200px; height:200px;"><br><input type="file" class="file" name="file" id="file"></td>
						</tr>
						<tr>
						  <th>작성자</th>
						  <td><input type="text" class="bo_writer" name="bo_writer" id="bo_writer" disabled="disabled"></td>
						</tr>
						<tr>
						  <th>내용</th>
						  <td><textarea rows="10" cols="110" class="bo_content" name="bo_cont" id="bo_cont" style="overflow: auto;"></textarea> </td>
						</tr>
						<tr>
						  <th>IP Addr.</th>
						  <td><input type="text" class="bo_ip" name="bo_ip" id="bo_ip" disabled="disabled"></td>
						</tr>
					</table>
					<table border="0" cellspacing="0" cellpadding="0">
					  <tr></tr>
					</table>
					<div style="text-align:right">
						<input class="btn2" type="button" id="updateBTN" value="등록"/> 
						<input class="btn2" type="button" id="cancelBTN" value="취소"/> 
						<input class="btn2" type="button" id="listBTN" value="목록"/>
					</div>
				</div>
			</td>
		</tr>
	</table>
</div>	
</body>
</html>
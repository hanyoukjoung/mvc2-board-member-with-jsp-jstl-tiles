<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 보기</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	
	$('.bo_title').text('${boardInfo.bo_title}');
	$('.bo_writer').text('${boardInfo.bo_writer}');
	$('.bo_content').val('${boardInfo.bo_cont}');
	$('.bo_ip').text('${boardInfo.bo_ip}');
	
	$('#updateBTN').click(function(){
		if('${boardInfo.bo_writer}' != '${LOGIN_ADMININFO.admin_id}') {
			alert('권한이 없습니다.');
			return false;
		}
		location.href = '/admin/iboard/iboardUpdate.do?bo_no=${boardInfo.bo_no}';
	});
	
	$('#deleteBTN').click(function(){
// 		if('${boardInfo.bo_writer}' != '${LOGIN_ADMININFO.admin_id}') {
// 			alert('권한이 없습니다.');
// 			return false;
// 		} 
		
		if(confirm('정말 삭제하시겠습니까?')){
			location.href = '/admin/iboard/deleteboard.do?bo_no=${boardInfo.bo_no}';
		}
	});
	
	$('#listBTN').click(function(){
		location.href = '/admin/iboard/iboardList.do';
	});
	
	
	$('#ThumbNail-img').click(function(){
		var imgsource = $(this).attr('src');
		if(imgsource == '' && imgsource == '/files/noImageFile.jpg') {
			alert('이미지 파일이 없습니다.');
			return false;
		}
		location.href = '/user/iboard/iboardThumbDownload.do?bo_no=${boardInfo.bo_no}';
		
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
						<tr>
						  <th>제목</th>
						  <td><label class="bo_title"></label></td>
						</tr>
						<tr>
						  <th>썸네일</th>
						  <td><img id="ThumbNail-img" alt="ThumbnailBoard" src="/files/${!empty boardInfo.file_save_name ? boardInfo.file_save_name : "noImageFile.jpg"  }" style="width:200px; height:200px;"> </td>
						</tr>
						<tr>
						  <th>작성자</th>
						  <td><label class="bo_writer"></label></td>
						</tr>
						<tr>
						  <th>내용</th>
						  <td><textarea rows="10" cols="110" class="bo_content" disabled="disabled" style="overflow: auto;"></textarea> </td>
						</tr>
						<tr>
						  <th>IP Addr.</th>
						  <td><label class="bo_ip"></label></td>
						</tr>
					</table>
					<div style="text-align:right">
						<input class="btn2" type="button" id="updateBTN" value="수정"/> 
						<input class="btn2" type="button" id="deleteBTN"value="삭제"/> 
						<input class="btn2" type="button" id="listBTN" value="목록"/>
					</div>
				</div>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
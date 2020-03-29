<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(function(){
	var 2depth = location.href.split("?", 1).split("/")[3];	// /user/ ~ /
	var 3depth = location.href.split("?", 1).split("/")[4]; // / ~.do
		
	switch(2depth){
	case('member') :
		2depth = '회원';
		break;
	case('nboard') :
		2depth = '공지사항';
		break;
	case('freeboard') :
		2depth = '자유게시판';
		break;
	case('rboard') :
		2depth = '자료실';
		break;
	case('qboard') :
		2depth = '회원';
		break;
	case('iboard') :
		2depth = '썸네일게시판';
		break;
	}
	
	if(3depth.includes('Form')){
		3depth = '등록'
	} else if(3depth.includes('List')){
		3depth = '목록'
	} else if(3depth.includes('View')){
		3depth = '상세보기'
	}
	
	$('#2depth').text(2depth);
	$('#3depth').text(3depth);
	
});
</script>
<body>
<div class="page-title-breadcrumb">
	<ol class="breadcrumb">
		<li><i class="fa fa-home"></i>&nbsp;<a href="index.html">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
		<li><a href="#" id="2depth">자유게시판</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
		<li class="active" id="3depth">목록</li>
	</ol>
	<div class="clearfix"></div>
</div>
</body>
</html>
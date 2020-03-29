<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css" type="text/css">
<!-- summernote 에디터 스타일 파일 시작 -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.7.1/summernote.css" rel="stylesheet">
<!-- summernote 에디터 스타일 파일 끝 -->
<!-- 부트스트랩 다이얼로그 스타일 파일 시작 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
<!-- 부트스트랩 다이얼로그 스타일 파일 끝 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<title>회원관리 관리자</title>
</head>
<body>
	<div class="wrap">
		<div id="header">
			<div class="top_bn">
				<ul>
					<li><a href="http://www.twitter.com"><img src="${pageContext.request.contextPath}/image/admin_t.jpg" /></a></li>
					<li><a href="http://www.facebook.com"><img src="${pageContext.request.contextPath}/image/admin_f.jpg" /></a></li>
					<li><a href="http://cafe.naver.com/dditorkr"><img src="${pageContext.request.contextPath}/image/admin_homelink.jpg" /></a></li>
					<li><a href="/admin/join/logout.do"><img src="${pageContext.request.contextPath}/image/admin_logout.jpg" /></a></li>
				</ul>
			</div>
			<div class="logo">
				<img src="${pageContext.request.contextPath }/image/logo.jpg" />
			</div>
			<div class="gnb">
				<ul>
					<li><a href="/admin/member/memberMgr.do">회원 관리</a></li>
					<li><a href="/admin/nboard/nboardList.do">공지사항</a></li>
					<li><a href="/admin/freeboard/freeBoardList.do">자유 게시판</a></li>
					<li><a href="/admin/iboard/iboardList.do">썸네일 게시판</a></li>
					<li><a href="/admin/rboard/rboardList.do">자료실</a></li>
					<li><a href="/admin/qboard/qboardList.do">Q&A</a></li>
					<li><a href="/admin/chart/chartMain.do">통계 분석</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
<!-- summernote 에디터 js 파일 시작 -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.7.1/summernote.js"></script>
<!-- summernote 에디터 js 파일 끝 -->
<!-- 부트스트랩 다이얼로그 js 파일 시작 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>
<!-- 부트스트랩 다이얼로그 js 파일 끝 -->
</html>
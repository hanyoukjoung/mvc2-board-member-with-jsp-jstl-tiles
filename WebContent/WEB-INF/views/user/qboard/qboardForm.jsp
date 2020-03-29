 <%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 등록</title>
<script type="text/javascript">
$(function(){
    $('#bo_cont').summernote({
       lang: 'ko-KR', 
         height: 150,
         codemirror: {
         theme: 'monokai'
      }
   });
   $('form[name=qboardForm]').submit(function(){
	   if($('input[name=bo_title]').val()==""){
			alert('제목을 입력해주세요.');
		return; 
		}
		
		if($('input[name=bo_nick]').val()==""){
			alert('닉네임을 입력해주세요.');
			return;
		}
		
		if($('input[name=bo_pass]').val()==""){
			alert('비밀번호를 입력해주세요.');
			return; 
		}
		
		if(eval('${!empty qboardInfo.bo_pass}')){
			if('${LOGIN_MEMBERINFO.mem_pass}'!= $('input[name=bo_pass]').val()){
				alert("비밀번호가 일치하지 않습니다."); 
				return;
			}
		}
	   
	   $(this).attr('action', 'insertQBoard.do');
      
      var bo_cont = $('#bo_cont').summernote('code');
      $(this).append('<input type="hidden" name="bo_cont" value="' + bo_cont + '"/>');
      $(this).append('<input type="hidden" name="bo_writer" value="${LOGIN_MEMBERINFO.mem_id}"/>');
      $(this).append('<input type="hidden" name="bo_ip" value="${pageContext.request.remoteAddr}"/>');
      
      return true;
   });
   
   $('#goListBTN').click(function(){
      location.href='qboardList.do';
   });
   
   $('#cancleBTN').click(function(){
      location.href='qboardList.do';
   });
});

</script>
</head>
<body>
<form class="form-horizontal" name="qboardForm" action="" method="post" enctype="multipart/form-data">
   <div class="form-group">
      <label class="control-label col-sm-2" for="bo_title">제목:</label>
      <div class="col-sm-10">
         <input type="text" class="form-control" id="bo_title" name="bo_title" placeholder="제목 입력...">
      </div>
   </div>
   <div class="form-group">
      <label class="control-label col-sm-2" for="bo_nick">작성자 대화명:</label>
      <div class="col-sm-10"> 
         <input type="text" class="form-control" id="bo_nick" name="bo_nick" placeholder="대화명 입력...">
      </div>
   </div>
   <div class="form-group">
      <label class="control-label col-sm-2" for="bo_pass">패스워드:</label>
      <div class="col-sm-10"> 
         <input type="password" class="form-control" id="bo_pass" name="bo_pass" placeholder="패스워드 입력...">
      </div>
   </div>
   <div class="form-group">
      <label class="control-label col-sm-2" for="bo_cont">내용:</label>
      <div class="col-sm-10"> 
         <div id="bo_cont"><p>내용을 입력해주세요...</p></div>
      </div>
   </div>
   <div class="form-group"> 
      <div class="col-sm-offset-2 col-sm-10">
         <button type="submit" class="btn btn-info" style="float: right">등록</button>
         <button type="button" class="btn btn-danger" style="float: right" id="cancleBTN">취소</button>
         <button type="button" class="btn btn-primary" style="float: right" id="goListBTN">목록</button>
      </div>
   </div>
</form>
</body>
</html>
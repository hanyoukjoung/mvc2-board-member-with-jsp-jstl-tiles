<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원리스트</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/js/common/validation.js"></script>
<script type="text/javascript">
$(function(){
// 	if(eval('${!empty param.message}')){
// 		alert('${param.message}');
// 	}
	
	$('#searchBTN').click(function(){
		//validation
		
		// 휴대폰번호
		if($('#mem_hp2').val() != ''){
			if(!(/^\d{0, 4}$/.test($('#mem_hp2').val()))){
				alert('연락처는 숫자만, 자리당 최대 4자만 입력 가능합니다.');
				$('#mem_hp2').focus();
				return false;
			}
		}
		if($('#mem_hp3').val() != ''){
			if(!(/^\d{0, 4}$/.test($('#mem_hp3').val()))){
				alert('연락처는 숫자만, 자리당 최대 4자만 입력 가능합니다.');
				$('#mem_hp3').focus();
				return false;
			}
		}
		if($('#mem_bir').val() != '') {
			if(!($('#mem_bir').val().validationDATE())){
				alert('날짜 형식이 올바르지 않습니다. ex)1900-01-01');
				$('#mem_bir').focus();
				return false;
			}
		}
		
		$('form[name=search_form]').submit()
	});
});

function gugunList(sido){
	$.ajax({
		type		: 'post'
		, url		: '/admin/member/gugunList.do'
		, data		: { "sido":sido }
		, dataType	: 'json'
		, error		: function(result){
			console.log(result.status);
		}, success	: function(data){
			for(var i=0; i<data.length; i++) {
				var $option = $('<option value="' + data[i] + '">' + data[i] + '</option>');
				$('select[name=search_gugun]').append($option);
			}
		}
	});
}

function memberClick(clickedTr){
	var mem_id = $(clickedTr).find('td').eq(1).text();
	
	location.href = '/admin/member/memberView.do?mem_id=' + mem_id;
}
</script>
</head>
<body>
<div class="wrap">	
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="30">&nbsp;</td>
			<td width="790">
				<div id="container">
					<div class="title">회원관리</div>
					<form name="search_form" action="/admin/member/memberMgr.do" method="post">
						<table border="0" cellspacing="1" cellpadding="1">
							<tr>
								<th width="120">기본검색</th>
								<td>
									<select style="width: 130px;" name="search_base_keycode">
											<option value="" selected="selected">선택하세요</option>
											<option value="NAME">이름</option>
											<option value="ID">아이디</option>
									</select>
								<input name="search_base_keyword" type="text" size="20" /></td>
							</tr>
							<tr>
								<th>거주지</th>
								<td>	
									<select style="width: 130px;" name="search_sido" onchange="gugunList(this.value);">
											<option value="" selected="selected">선택하세요</option>
											<c:forEach items="${sidoList }" var="sido">
											<option value="${sido }">${sido }</option>
											</c:forEach>
									</select> 
									<select style="width: 130px;" name="search_gugun">
										<option value="" selected="selected">선택하세요</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>
									<select style="width: 100px;" id="mem_hp1" name="mem_hp1">
										<option value="" selected="selected">선택하세요</option>
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select> - 
									<input name="mem_hp2" type="text" id="mem_hp2" size="20" /> - 
									<input name="mem_hp3" type="text" id="mem_hp3" size="20" />
								</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td>
									<input type="date" id="mem_bir" name="mem_bir" /> 
								</td>
							</tr>
						</table>
						<div style="padding-top: 5px; text-align: right;">
							<input class="btn1" type="reset" value="초기화"/>
							<input class="btn1" type="button" id="searchBTN"value="검색하기" />
						</div>
					</form>
					<div style="padding-top: 5px;" id="search_totalMembers">
						<label class="totalmembers"></label>
					</div>
					<div style="height: 15px;"></div>
					<table border="0" cellspacing="1" cellpadding="1">
						<thead>
							<tr>
								<th width="10%">
								    <input type="checkbox" name="selectTotal" class="checkbox_align"/>&nbsp;선택
								</th>
								<th width="20%">아이디</th>
								<th>이름</th>
								<th>생일</th>
								<th>메일</th>
							</tr>
						</thead>
						<tbody class="memberList">
							<c:forEach items="${memberList }" var="memberInfo">
							<tr onclick="memberClick(this);">
								<td style="text-align:center;">
									<input type="checkbox" name="select" class="checkbox_align" value="${memberInfo.mem_id }"/>
								</td>
								<td>${memberInfo.mem_id }</td>
								<td>${memberInfo.mem_name }</td>
								<td>${memberInfo.mem_bir }</td>
								<td>${memberInfo.mem_mail }</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<div align="center">
						<input class="publishingCoupon" type="submit" value="선택회원 메일발송" style="float: left;"/>
						<span class="pagingHtml"></span>
						<input class="btn2" type="button" value="Excel작성" style="float: right;"/>
						<input class="btn2" type="button" value="PDF작성" style="float: right; margin-right: 5px;"/>
					</div>
				</div>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
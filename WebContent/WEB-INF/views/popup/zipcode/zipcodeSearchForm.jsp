<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
td {f on t-family:"돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
}

td a {
	font-family: "돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
	text-decoration: none;
}

td a:hover {
	font-family: "돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
	text-decoration: underline;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/validation.js"></script>
<script type="text/javascript">
$(function(){
	$('input[type=image]').click(function(){
		if(!$('#dong').val().validationADDR()){
			alert('동 이름을 2 ~ 5자로 입력 해 주세요.');
			return;
		}
		$.ajax({
			type		: 'post'
			, url		: '/popup/zipcode/zipcodeList.do'
			, dataType	: 'json'
			, data		: { dong : $('#dong').val() }
			, error		: function(result) {
							alert(result.status);
						} 
			, success	: function(result) {
							var tblHtmls = '<table width="100%" height="200px" border="0" cellspacing="0" cellpadding="0" ' +
												'stype="overflow:scroll;" id="zipcodeTBL">' +
												'<thead>' +
													'<tr>' +
														'<th>우편번호</th>' +
														'<th>시도</th>' +
														'<th>구군</th>' +
														'<th>동</th>' +
													'</tr>' +
												'</thead>' +
												'<tbody>';
							for(var i=0; i<result.length; i++) {
								tblHtmls += '<tr>' +
												'<td>' + result[i].zipcode + '</td>' +
												'<td>' + result[i].sido + '</td>' +
												'<td>' + result[i].gugun + '</td>' +
												'<td>' + result[i].dong + '</td>' +
											'</tr>';
							}
							tblHtmls += '</tbody>' +
									'</table>';
							
							$('#viewTable').empty().html(tblHtmls);
		                     
		                     $('#zipcodeTBL tr:gt(0)').click(function(){
		                        var zipcode = $(this).find('td:eq(0)').text();
		                        var addr = $(this).find('td:eq(1)').text() + ' '+
		                                 $(this).find('td:eq(2)').text()+ ' '+
		                                 $(this).find('td:eq(3)').text();
		                     $(opener.document).find('#mem_zipcode1').val(zipcode.split('-')[0]);
		                     $(opener.document).find('#mem_zipcode2').val(zipcode.split('-')[1]);
		                     $(opener.document).find('#mem_zipcode').val(zipcode);
		                     
		                     $('#mem_add1', opener.document).val(addr);
		                     $('#mem_add2', opener.document).val('');
		                     
		                     self.close();
		                     });
						}
		});
	});
});
</script>
</head>
<body>
	<table width="354" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="30"><img src="${pageContext.request.contextPath }/image/open_post.gif" width="136"
				height="22"></td>
		</tr>
		<tr>
			<td><img src="${pageContext.request.contextPath }/image/open_table01.gif" width="354" height="10"></td>
		</tr>
		<tr>
			<td height="10" background="${pageContext.request.contextPath }/image/open_table02.gif" align="center">&nbsp;</td>
		</tr>
		<tr>
			<td height="300" align="center" valign="top"
				background="${pageContext.request.contextPath }/image/open_table02.gif">
				<table width="300" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="25"><div align="center">찾고자 하는 지역의 동이름을
								입력해주십시오.</div></td>
					</tr>
					<tr>
						<td height="38" background="${pageContext.request.contextPath }/image/open_tt.gif" align="center">
							<input type="text" id="dong">&nbsp;동(읍/면)&nbsp;
							<input type="image" src="${pageContext.request.contextPath }/image/bt_search.gif" border='0'
							align="middle">
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
							<div style="overflow: auto; white-space: nowrap; overflow-X: hidden; height: 200px;" id="viewTable">
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><img src="${pageContext.request.contextPath }/image/open_table03.gif" width="354" height="10"></td>
		</tr>
	</table>
</body>
</html>
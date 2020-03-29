<%@page import="kr.or.ddit.free.board.service.IFreeBoardServiceImpl"%>
<%@page import="kr.or.ddit.free.board.service.IFreeBoardService"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="kr.or.ddit.vo.FBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="/WEB-INF/views/user/freeboard/freeboardList.jsp"></c:import>
<%
 
 FBoardVO freeboardInfo = new FBoardVO();

 BeanUtils.populate(freeboardInfo, request.getParameterMap());
 
 IFreeBoardService service = IFreeBoardServiceImpl.getInstance();
 service.updatefreeboard(freeboardInfo);

 
%>


</body>
<c:import url="/user/freeboard/updateFreeboard.do"></c:import>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/user/main.tiles");
	dispatcher.forward(request, response);
%>

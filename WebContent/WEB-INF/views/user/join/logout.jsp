<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("LOGIN_MEMBERINFO");
	
	Map<String, String> returnFlagMap = new HashMap<String, String>();
	returnFlagMap.put("Flag", "success");
	
	ObjectMapper mapper = new ObjectMapper();
	
	String JSONData = mapper.writeValueAsString(returnFlagMap);
	
	out.println(JSONData);
%>
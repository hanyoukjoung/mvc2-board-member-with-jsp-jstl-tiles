<%@page import="kr.or.ddit.vo.ZiptbVO"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.zipcode.service.IZipcodeServiceImpl"%>
<%@page import="kr.or.ddit.zipcode.service.IZipcodeService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// /ddit/06/zipcodeList.jsp
	//	POST dong = 입력값 형식으로 전송됨
	request.setCharacterEncoding("UTF-8");
	
	String dong = request.getParameter("dong");
	
	Map<String, String> params = new HashMap<String, String>();
	params.put("dong", dong);
	
	IZipcodeService service = IZipcodeServiceImpl.getInstance();
	List<ZiptbVO> zipcodeList = service.zipcodeList(params);
	
	ObjectMapper mapper = new ObjectMapper();
	
	String jsonData = mapper.writeValueAsString(zipcodeList);
	
	System.out.println(jsonData);
	out.println(jsonData);
%>
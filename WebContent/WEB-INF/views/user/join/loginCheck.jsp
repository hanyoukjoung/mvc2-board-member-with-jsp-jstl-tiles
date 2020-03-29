<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// ajax통신으로 로그인	
	String mem_id = request.getParameter("mem_id");
	String mem_pass = request.getParameter("mem_pass");
	
	Map<String, String> params = new HashMap<String, String>(); 
	params.put("mem_id", mem_id);
	params.put("mem_pass", mem_pass); 
	
	IMemberService service = IMemberServiceImpl.getInstance();
	
	
	MemberVO memberInfo = service.memberInfo(params);
	
	
	Map<String, String> temp = new HashMap<String, String>();
	
	
	if( memberInfo == null ) {
		temp.put("message", "회원 정보가 없습니다.");
	} else {
		session.setAttribute("LOGIN_MEMBERINFO", memberInfo);
		temp.put("message", memberInfo.getMem_name() + "님 환영합니다 !");
	}
	
	ObjectMapper mapper = new ObjectMapper();
	
	String jsonData = mapper.writeValueAsString(temp);
	
	out.println(jsonData);
%>











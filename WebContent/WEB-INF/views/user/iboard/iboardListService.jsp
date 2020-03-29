<%-- <%@page import="org.codehaus.jackson.map.ObjectMapper"%> --%>
<%-- <%@page import="kr.or.ddit.vo.RBoardVO"%> --%>
<%-- <%@page import="java.util.List"%> --%>
<%-- <%@page import="kr.or.ddit.utiles.RolePageingUtile"%> --%>
<%-- <%@page import="kr.or.ddit.image.board.service.IIMGBoardServiceImpl"%> --%>
<%-- <%@page import="java.util.HashMap"%> --%>
<%-- <%@page import="java.util.Map"%> --%>
<%-- <%@page import="kr.or.ddit.image.board.service.IIMGBoardService"%> --%>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%-- 	pageEncoding="UTF-8"%> --%>
<%-- <% --%>
// 	String currentPage = request.getParameter("currentPage");
// 	if (currentPage == null) {
// 		currentPage = "1";
// 	}
// 	String search_keyword = request.getParameter("search_keyword");
// 	String search_keycode = request.getParameter("search_keycode");

// 	Map<String, String> params = new HashMap<String, String>();
// 	params.put("search_keyword", search_keyword);
// 	params.put("search_keycode", search_keycode);

// 	IIMGBoardService service = IIMGBoardServiceImpl.getInstance();
// 	String totalCount = service.totalCount(params);

// 	RolePageingUtile pagUtil = new RolePageingUtile(request,Integer.parseInt(totalCount), Integer.parseInt(currentPage));

// 	String startCount = String.valueOf(pagUtil.getStartCount());
// 	String endCount = String.valueOf(pagUtil.getEndCount());

// 	params.put("startCount", startCount);
// 	params.put("endCount", endCount);

// 	List<RBoardVO> rboardList = service.iboardList(params);
	
// 	ObjectMapper mapper = new ObjectMapper();
	
// 	String JsonData = mapper.writeValueAsString(rboardList);
	
// 	out.println(JsonData);
	
<%-- %> --%>
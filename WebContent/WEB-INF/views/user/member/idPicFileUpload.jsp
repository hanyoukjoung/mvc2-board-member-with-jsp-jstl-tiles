<%@page import="java.io.File"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.or.ddit.global.GlobalConstant"%>
<%@page import="java.util.UUID"%>
<%@page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="kr.or.ddit.utiles.FileUploadRequestWrapper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	FileUploadRequestWrapper wrapper = (FileUploadRequestWrapper) request;
	
	FileItem item = wrapper.getFileItem("idPic");
	
	String fileName = item.getName();
	String baseName = FilenameUtils.getBaseName(fileName);
	String extension = FilenameUtils.getExtension(fileName);
	
	String fileSaveName = baseName + UUID.randomUUID().toString().replace("-", "") + "." + extension;
	File saveFile = new File(GlobalConstant.FILE_PATH, fileSaveName);
	
	Map<String, String> jsonMap = new HashMap<String, String>();
	jsonMap.put("file_name", fileName);
	jsonMap.put("file_save_name", fileSaveName);
	
	item.write(saveFile);
	ObjectMapper mapper = new ObjectMapper();
	String jsonData = mapper.writeValueAsString(jsonMap);
	
	out.println(jsonData);
	
%>
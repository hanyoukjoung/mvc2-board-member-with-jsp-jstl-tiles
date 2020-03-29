<%@page import="kr.or.ddit.utiles.FileUploadRequestWrapper"%>
<%@page import="kr.or.ddit.ref.board.service.REFBoardServiceImpl"%>
<%@page import="kr.or.ddit.ref.board.service.REFBoardService"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="kr.or.ddit.vo.RBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	FileUploadRequestWrapper wrapper = (FileUploadRequestWrapper) request;

	RBoardVO boardInfo = new RBoardVO();

	BeanUtils.populate(boardInfo, wrapper.getParameterMap());

	REFBoardService service = REFBoardServiceImpl.getInstance();
	service.insertBoardInfo(boardInfo, wrapper.getFileItemValues("files"));
%>

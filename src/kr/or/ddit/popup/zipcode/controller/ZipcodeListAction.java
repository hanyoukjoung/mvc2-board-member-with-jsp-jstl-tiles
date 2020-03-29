package kr.or.ddit.popup.zipcode.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.base.action.IAction;

public class ZipcodeListAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {
		return "/WEB-INF/views/popup/zipcode/zipcodeList.jsp";
	}
 
}
